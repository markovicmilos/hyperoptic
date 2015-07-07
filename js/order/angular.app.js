/**
 * Created by Ivan Herceg on 09-Apr-15.
 * console.log(JSON.parse(JSON.stringify(obj)));
 */

(function(){
    var app = angular.module("hyperOrder", ['ui.bootstrap', 'angularValidator', 'hyperoptic.site']);

    app.config(['$provide', function ($provide){

        $provide.decorator('accordionGroupDirective', function($delegate) {
            var directive = $delegate[0];
            directive.$$isolateBindings.done = {
                attrName: 'done',
                mode: '=',
                optional: true
            };
            directive.$$isolateBindings.index = {
                attrName: 'index',
                mode: '=',
                optional: true
            };
            directive.$$isolateBindings.notValid = {
                attrName: 'notValid',
                mode: '=',
                optional: true
            };
            var link = function myLinkFnOverride(scope, element, attrs, accordionCtrl) {
                accordionCtrl.addGroup(scope);

                scope.initRun = true;

                scope.$watch('isOpen', function(value) {
                    if ( !value && !scope.notValid && !scope.initRun ) {
                        scope.done = true;
                    }
                    if ( value ) {
                        accordionCtrl.closeOthers(scope);
                    }
                    if (scope.initRun){
                        scope.initRun = false;
                    }
                });

                scope.toggleOpen = function() {
                    if ( !scope.isDisabled ) {
                        scope.isOpen = !scope.isOpen;
                        angular.element(document.getElementById('mainCtrl')).scope().scrollToMovingElement( 'acc' + scope.index );
                    }
                };
            }
            directive.compile = function() {
                return function(scope, element, attrs) {
                    link.apply(this, arguments);
                };
            };
            return $delegate;
        });
    }]);

    app.constant('hyperoptic.site.mainConfig', {
        whyYouTakeJustHyperSocketOptions: [
            'In a contract & not ready to order',
            'Leaseholder/Landlord',
            'Not currently at the property',
            'Other'
        ],
        currentContractExpire: [
            '< 3 months',
            '3 - 6 months',
            '6 - 12 months',
            '12 - 24 months'
        ],
        titles: [
            'Mr',
            'Mrs',
            'Miss',
            'Ms',
            'Dr'
        ],
        hearAboutUs: [
            'Radio advert',
            'Letter from Hyperoptic',
            'Letter from Building Manager',
            'Concierge',
            'Residents Association',
            'Poster or Flyer',
            'A friend or neighbour',
            'A Hyperoptic Engineer',
            'Building Champion',
            'Leaflet through my door',
            'Comparison website',
            'Online advert',
            'Social Media',
            'Search Engine',
            'Voucher app or website',
            'Billboard advert',
            'Press article',
            'Other'
        ]

    });

    app.controller('hyperOrderMainCtrl', ['$scope', '$http', '$modal', 'hyperoptic.site.mainConfig', function ($scope, $http, $modal, config) {

        $scope.constants = config;

        $scope.openAccordions = {
            one: true
        };

        $scope.activeTab = {
            one: true,
            two: false,
            three: false
        };

        $scope.disableTab = {
            one: false,
            two: false,
            three: false
        }

        $scope.doneAccordions = {};

        $scope.validAccordions = {};

        $scope.accountDetails = {
            title: 'Mr',
            userIP: userip,
            pafid: pafid,
            userAgent: navigator.userAgent,
            postcode: postcode,
            city: city
        };

        $scope.paymentInfo = {};

        $scope.showSummaryTable = true;

        $scope.enableBankDetails = true;

        $scope.showButtonsOnBottom = true;

        $scope.disableAllAccordions = false;

        $scope.selectedProduct = {};

        $scope.executeTracking = false;

        $scope.contractLength = 12;

        $scope.lastContractLength = 12;

        $scope.orderMade = false;

        $scope.fullData = [];

        if (premiseHaveActiveService) {
            $('body').addClass('modal-open-hyper');
            $modal.open({
                templateUrl: 'template/hyperPremiseHaveActiveServiceOrder.html',
                backdrop: 'static',
                backdropClass: 'fullheight',
                keyboard: false
            });
        }

        $http.get(homeURL + 'process-api/?pafid=' + pafid).success(function (data, status, headers, config) {
            if (data) {
                $scope.fullData = data;
                fillPriceData($scope.contractLength, false);
            }
        });

        function fillPriceData(contractType, promoCodeApply){
            if(contractType == 12){
                $scope.serviceData = angular.copy( $scope.fullData.twelveMonth );
            }
            if(contractType == 1){
                $scope.serviceData = angular.copy( $scope.fullData.oneMonth );
            }
            $scope.productsBAndPhone = getProductsBAndPhone($scope.serviceData);
            $scope.productsB = getProductsB($scope.serviceData);
            if(promoCodeApply == true){
                if ($scope.selectedProduct != null) {
                    var oldProduct = $scope.selectedProduct;
                }
                if (oldProduct != null) {
                    $scope.productActivated(oldProduct.id);
                    copyAllStateVariables(oldProduct);
                }
                promoCodeHasBeenApplied()
            }else{
                $scope.disableEmptyTabs();
                $scope.selectFirstValidProduct();
            }

        }

        function recalcTotalAmount() {
            if ($scope.selectedProduct.havePhone) {
                $scope.selectedProduct.mountlyPrice = $scope.selectedProduct.price
                + $scope.selectedProduct.lineRentalPrice
                + ($scope.selectedProduct.takeAnytimeUK === true ? $scope.selectedProduct.anytimeUKPrice : 0 )
                + ($scope.selectedProduct.takeInternationalCalls === true ? $scope.selectedProduct.internationalCallsPrice : 0);

                $scope.selectedProduct.mountlyPriceAfterPromotion = $scope.selectedProduct.afterPromotionPrice
                + $scope.selectedProduct.lineRentalPriceAfterPromotion
                + ($scope.selectedProduct.takeAnytimeUK === true ? $scope.selectedProduct.anytimeUKPriceAfterPromotion : 0)
                + ($scope.selectedProduct.takeInternationalCalls === true ? $scope.selectedProduct.internationalCallsPriceAfterPromotion : 0);
            } else {
                $scope.selectedProduct.mountlyPrice = $scope.selectedProduct.price;
                $scope.selectedProduct.mountlyPriceAfterPromotion = $scope.selectedProduct.afterPromotionPrice;
            }

            $scope.selectedProduct.totalInitialCharges = $scope.selectedProduct.connectionFeePrice + ( $scope.selectedProduct.hyperSocketPrice != null ? $scope.selectedProduct.hyperSocketPrice : 0 );
        }

        function selectThisProduct(product) {
            $scope.selectedProduct = product;
            $scope.selectedProduct.active = true;
            $scope.selectedProduct.broadBandProductId = product.id;
            if ($scope.selectedProduct.havePhone){
                var allBandles = $scope.serviceData.bbpProducts.filter(function (fproduct) { return fproduct.bundleId == product.bundleId || fproduct.bundleId == '*' });
                $scope.selectedProduct.addIns = {};
                angular.forEach(allBandles, function(bandle, key) {
                    switch (bandle.categoryId){
                        case 'C-00002':
                            $scope.selectedProduct.addIns.connectionFee = bandle;
                            break;
                        case 'C-00003':
                            $scope.selectedProduct.addIns.anytimeUK = bandle;
                            break;
                        case 'C-00004':
                            $scope.selectedProduct.addIns.internationalCalls = bandle;
                            break;
                        case 'C-00005':
                            $scope.selectedProduct.addIns.lineRental = bandle;
                            break;
                        case 'C-00006':
                            $scope.selectedProduct.addIns.connectionCharge = bandle;
                            break;
                        case 'C-00012':
                        case 'C-00014':
                            $scope.selectedProduct.addIns.hyperSocket = bandle;
                            break;
                    }
                });

                if ($scope.selectedProduct.addIns.connectionFee != null){
                    $scope.selectedProduct.haveConnectionFee = true;
                    $scope.selectedProduct.connectionFeePrice = ($scope.selectedProduct.addIns.connectionFee.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.connectionFee.discountedPrice : $scope.selectedProduct.addIns.connectionFee.price;
                }

                if ($scope.selectedProduct.addIns.anytimeUK != null){
                    $scope.selectedProduct.haveAnytimeUK = true;
                    $scope.selectedProduct.anytimeUKPrice = ($scope.selectedProduct.addIns.anytimeUK.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.anytimeUK.discountedPrice : $scope.selectedProduct.addIns.anytimeUK.price;
                    $scope.selectedProduct.anytimeUKPriceAfterPromotion = $scope.selectedProduct.addIns.anytimeUK.price;
                }

                if ($scope.selectedProduct.addIns.internationalCalls != null){
                    $scope.selectedProduct.haveInternationalCalls = true;
                    $scope.selectedProduct.internationalCallsPrice = ($scope.selectedProduct.addIns.internationalCalls.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.internationalCalls.discountedPrice : $scope.selectedProduct.addIns.internationalCalls.price;
                    $scope.selectedProduct.internationalCallsPriceAfterPromotion = $scope.selectedProduct.addIns.internationalCalls.price;
                }

                if ($scope.selectedProduct.addIns.lineRental != null){
                    $scope.selectedProduct.haveLineRental = true;
                    $scope.selectedProduct.lineRentalPrice = ($scope.selectedProduct.addIns.lineRental.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.lineRental.discountedPrice : $scope.selectedProduct.addIns.lineRental.price;
                    $scope.selectedProduct.lineRentalPriceAfterPromotion = $scope.selectedProduct.addIns.lineRental.price;
                }

                if ($scope.selectedProduct.addIns.connectionCharge != null){
                    $scope.selectedProduct.haveConnectionCharge = true;
                    $scope.selectedProduct.connectionChargePrice = ($scope.selectedProduct.addIns.connectionCharge.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.connectionCharge.discountedPrice : $scope.selectedProduct.addIns.connectionCharge.price;
                    $scope.selectedProduct.connectionChargePriceAfterPromotion = $scope.selectedProduct.addIns.connectionCharge.price;
                }

                if ($scope.selectedProduct.addIns.hyperSocket != null){
                    $scope.selectedProduct.haveHyperSocket = true;
                    $scope.selectedProduct.hyperSocketPrice = ($scope.selectedProduct.addIns.hyperSocket.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.hyperSocket.discountedPrice : $scope.selectedProduct.addIns.hyperSocket.price;
                } else {
                    $scope.selectedProduct.haveHyperSocket = false;
                    $scope.selectedProduct.hyperSocketPrice = 0;
                }

                if ($scope.selectedProduct.haveAnytimeUK || $scope.selectedProduct.haveInternationalCalls){
                    $scope.selectedProduct.addIns.phoneAddIns = [];
                    if ($scope.selectedProduct.haveAnytimeUK) {
                        $scope.selectedProduct.addIns.phoneAddIns.push($scope.selectedProduct.addIns.anytimeUK.id);
                    }
                    if ($scope.selectedProduct.haveInternationalCalls) {
                        $scope.selectedProduct.addIns.phoneAddIns.push($scope.selectedProduct.addIns.internationalCalls.id);
                    }
                } else {
                    $scope.selectedProduct.addIns.phoneAddIns = null;
                }

            } else {
                var allBandles = $scope.serviceData.bbProducts.filter(function (fproduct) { return fproduct.bundleId == product.bundleId || fproduct.bundleId == '*' });
                $scope.selectedProduct.addIns = {};
                angular.forEach(allBandles, function(bandle, key) {
                    switch (bandle.categoryId){
                        case 'C-00002':
                            $scope.selectedProduct.addIns.connectionFee = bandle;
                            break;
                        case 'C-00012':
                        case 'C-00014':
                            $scope.selectedProduct.addIns.hyperSocket = bandle;
                            break;
                    }
                });

                if ($scope.selectedProduct.addIns.connectionFee != null){
                    $scope.selectedProduct.haveConnectionFee = true;
                    $scope.selectedProduct.connectionFeePrice = ($scope.selectedProduct.addIns.connectionFee.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.connectionFee.discountedPrice : $scope.selectedProduct.addIns.connectionFee.price;
                }

                if ($scope.selectedProduct.addIns.hyperSocket != null){
                    $scope.selectedProduct.haveHyperSocket = true;
                    $scope.selectedProduct.hyperSocketPrice = ($scope.selectedProduct.addIns.hyperSocket.discountedPrice != null) ?
                        $scope.selectedProduct.addIns.hyperSocket.discountedPrice : $scope.selectedProduct.addIns.hyperSocket.price;
                } else {
                    $scope.selectedProduct.haveHyperSocket = false;
                    $scope.selectedProduct.hyperSocketPrice = 0;
                }
            }
            recalcTotalAmount();
        }

        function copyAllStateVariables (oldProduct) {
            $scope.selectedProduct.takeAnytimeUK = oldProduct.takeAnytimeUK;
            $scope.selectedProduct.takeInternationalCalls = oldProduct.takeInternationalCalls;
            $scope.selectedProduct.useExistingPhone = oldProduct.useExistingPhone;
            $scope.selectedProduct.existingPhone = oldProduct.existingPhone;
            $scope.selectedProduct.whyYouOnlyNeedHyperSocket = oldProduct.whyYouOnlyNeedHyperSocket;
            $scope.selectedProduct.whyYouOnlyNeedHyperSocketContractExpire = oldProduct.whyYouOnlyNeedHyperSocketContractExpire;
            $scope.selectedProduct.whyYouOnlyNeedHyperSocketOther = oldProduct.whyYouOnlyNeedHyperSocketOther;
            recalcTotalAmount();
        }

        function sortingByBundleId(productA, productB) {
            if (productA.bundleId < productB.bundleId)
                return 1;
            if (productA.bundleId > productB.bundleId)
                return -1;
            return 0;
        }

        function getProductsBAndPhone (data) {
            return data.bbpProducts.filter(function(product){
                if (product.categoryId == 'C-00001') {
                    switch (product.bundleId) {
                        case 'B-01000':
                            product.typeId = 'oneG';
                            break;
                        case 'B-00100':
                            product.typeId = 'hundredM';
                            break;
                        case 'B-00020':
                            product.typeId = 'twentyM';
                            break;
                    }
                    product.afterPromotionPrice = product.price;
                    if (product.discountedPrice != null) {
                        product.price = product.discountedPrice;
                        product.havePromotion = true;
                    }
                    if (data.promotion != null && data.promotion.duration != null){
                        product.promotionDuration = data.promotion.duration;
                        product.promotionId = data.promotion.id;
                        product.promoCodeId = data.promotion.promoCodeId;
                    }
                }
                product.havePhone = true;
                if(typeof product.havePromotion == 'undefined'){
                    product.havePromotion = false;
                }
                product.business = business;
                return product.categoryId == 'C-00001';
            }).sort(sortingByBundleId);
        }

        function getProductsB (data) {
            return data.bbProducts.filter(function(product){
                if (product.categoryId == 'C-00001') {
                    switch (product.bundleId) {
                        case 'B-01000':
                            product.typeId = 'oneG';
                            break;
                        case 'B-00100':
                            product.typeId = 'hundredM';
                            break;
                        case 'B-00020':
                            product.typeId = 'twentyM';
                            break;
                    }
                    product.afterPromotionPrice = product.price;
                    if (product.discountedPrice != null) {
                        product.price = product.discountedPrice;
                        product.havePromotion = true;
                    }
                    if (data.promotion != null && data.promotion.duration != null){
                        product.promotionDuration = data.promotion.duration;
                        product.promotionId = data.promotion.id;
                        product.promoCodeId = data.promotion.promoCodeId;
                    }
                }
                product.havePhone = false;
                if(typeof product.havePromotion == 'undefined'){
                    product.havePromotion = false;
                }
                product.business = business;
                return product.categoryId == 'C-00001';
            }).sort(sortingByBundleId);
        }

        function getProductHyperSocket(){
            var socketInfo = $scope.serviceData.fpProducts[0];
            socketInfo.afterPromotionPrice = socketInfo.price;
            if (socketInfo.discountedPrice != null) {
                socketInfo.price = socketInfo.discountedPrice;
                socketInfo.havePromotion = true;
            }
            if ($scope.serviceData.promotion != null && $scope.serviceData.promotion.duration != null){
                socketInfo.promotionDuration = $scope.serviceData.promotion.duration;
                socketInfo.promotionId = $scope.serviceData.promotion.id;
                socketInfo.promoCodeId = $scope.serviceData.promotion.promoCodeId;
            }
            if(typeof socketInfo.havePromotion == 'undefined'){
                socketInfo.havePromotion = false;
            }
            return socketInfo;
        }

        function deselectAllProducts() {
            for (var i = 0; i < $scope.productsBAndPhone.length; i++) {
                $scope.productsBAndPhone[i].active = false;
            }
            for (var i = 0; i < $scope.productsB.length; i++) {
                $scope.productsB[i].active = false;
            }
        }

        function isSelectedProductHyperSocket(product) {
            if (product.categoryId == 'C-00011' ||
                product.categoryId == 'C-00012' ||
                product.categoryId == 'C-00013' ||
                product.categoryId == 'C-00014') return true;
            return false;
        }

        function elmYPosition(eID) {
            var elm = document.getElementById(eID);
            var y = elm.offsetTop;
            var node = elm;
            while (node.offsetParent && node.offsetParent != document.body) {
                node = node.offsetParent;
                y += node.offsetTop;
            } return y;
        }

        function scrollToElement (eID) {
            $( 'html, body').animate({
                scrollTop: elmYPosition(eID)
            }, 400);
        }

        function isAccountDetailsValid (account) {
            if ( account.firstName == null ) return true;
            if ( $scope.nameValidator(account.firstName) !== true ) return false;
            if ( $scope.nameValidator(account.lastName) !== true ) return false;
            if ( $scope.ukPhoneValidator(account.phone) !== true ) return false;
            if ( $scope.phoneValidator(account.mobile) !== true ) return false;
            if ( !$scope.accountDetails.validMail ) return false;
            if ( $scope.passwordValidator(account.password) !== true ) return false;
            if ( $scope.passwordReValidator(account.passwordAgain) !== true ) return false;
            if ( account.howDidYouHearAboutUs == null ) return false;
            return true;
        }

        function isBusinessAccountDetailsValid (account) {
            if ( account.firstName == null ) return true;
            if ( $scope.nameValidator(account.firstName) !== true ) return false;
            if ( $scope.businessNumberValidator(account.lastName) !== true ) return false;
            if ( $scope.ukPhoneValidator(account.phone) !== true ) return false;
            if ( $scope.phoneValidator(account.mobile) !== true ) return false;
            if ( !$scope.accountDetails.validMail ) return false;
            if ( $scope.passwordValidator(account.password) !== true ) return false;
            if ( $scope.passwordReValidator(account.passwordAgain) !== true ) return false;
            return true;
        }

        function promoCodeHasBeenApplied() {
            $scope.showPromoCodeHasBeenApplied = true;
            console.log($scope.showPromoCodeHasBeenApplied);
            setTimeout(function () {
                $scope.showPromoCodeHasBeenApplied = false;
            }, 2000);
        }

        function invalidPromoCode() {
            $scope.showInvalidPromoCode = true;
            setTimeout(function () {
                $scope.showInvalidPromoCode = false;
            }, 2000);
        }

        function getWhyNeedOnlySocet () {
            var value = $scope.selectedProduct.whyYouOnlyNeedHyperSocket;
            if (value == 'In a contract & not ready to order'){
                value = value + ": " + $scope.selectedProduct.whyYouOnlyNeedHyperSocketContractExpire;
            } else if (value== 'Other') {
                value = value + ": " + $scope.selectedProduct.whyYouOnlyNeedHyperSocketOther;
            }
            return value;
        }

        function getHowDidYouHearAboutUs() {
            if ($scope.accountDetails.howDidYouHearAboutUs == null) return null;
            var value = $scope.accountDetails.howDidYouHearAboutUs;
            if ($scope.showHowDidYouHearAboutUsExtra()){
                value = value + ": " + $scope.accountDetails.howDidYouHearAboutUsExtra;
            }
            return value;
        }

        function getPhoneAddIns() {
            if (!$scope.selectedProduct.havePhone) return null;
            var addins = [];
            if ($scope.selectedProduct.takeAnytimeUK){
                addins.push($scope.selectedProduct.addIns.anytimeUK.id)
            }
            if ($scope.selectedProduct.takeInternationalCalls){
                addins.push($scope.selectedProduct.addIns.internationalCalls.id);
            }
            return addins;
        }

        /**
         * The workhorse; converts an object to x-www-form-urlencoded serialization.
         * @param {Object} obj
         * @return {String}
         */
        function param(obj) {
            var query = '', name, value, fullSubName, subName, subValue, innerObj, i;

            for(name in obj) {
                value = obj[name];

                if(value instanceof Array) {
                    for(i=0; i<value.length; ++i) {
                        subValue = value[i];
                        fullSubName = name + '[' + i + ']';
                        innerObj = {};
                        innerObj[fullSubName] = subValue;
                        query += param(innerObj) + '&';
                    }
                }
                else if(value instanceof Object) {
                    for(subName in value) {
                        subValue = value[subName];
                        fullSubName = name + '[' + subName + ']';
                        innerObj = {};
                        innerObj[fullSubName] = subValue;
                        query += param(innerObj) + '&';
                    }
                }
                else if(value !== undefined && value !== null)
                    query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
            }

            return query.length ? query.substr(0, query.length - 1) : query;
        }

        function makeOrder() {
            if($scope.orderMade == true){
                $scope.orderMade = false;
                return;
            }else{
                // Mapping
                $scope.orderMade = true;
                var dataForOrder = {
                    order: 'product',
                    isBusiness: business,
                    title: $scope.accountDetails.title,
                    firstName: $scope.accountDetails.firstName,
                    lastName: ($scope.accountDetails.lastName != null) ? $scope.accountDetails.lastName : "",
                    phone: $scope.accountDetails.phone,
                    mobile: ($scope.accountDetails.mobile != null) ? $scope.accountDetails.mobile : "",
                    email: $scope.accountDetails.email,
                    pafid: $scope.accountDetails.pafid,
                    password: md5($scope.accountDetails.password),
                    dateOfBirth: $scope.accountDetails.dateOfBirth,
                    userIP: $scope.accountDetails.userIP,
                    userAgent: $scope.accountDetails.userAgent,
                    isPortPhoneNumber: ($scope.selectedProduct.havePhone && $scope.selectedProduct.useExistingPhone != null) ? $scope.selectedProduct.useExistingPhone : false,
                    portPhoneNumber: ($scope.selectedProduct.havePhone && $scope.selectedProduct.existingPhone != null) ? $scope.selectedProduct.existingPhone : "",
                    receiveNewsletter: ($scope.agreeToReceiveNewsletter != null) ? $scope.agreeToReceiveNewsletter : false,
                    howDidYouHearAboutUs: getHowDidYouHearAboutUs(),
                    cvs: ($scope.accountDetails.cvs != null) ? $scope.accountDetails.cvs : false,
                    readyToActivate: ($scope.accountDetails.readyToActivate != null) ? $scope.accountDetails.readyToActivate : false,
                    monthlyPrice: $scope.selectedProduct.mountlyPrice,
                    contractLength: $scope.contractLength,
                    csfId: csfId
                }

                if ( $scope.socketOnly ) {
                    dataForOrder.order = 'faceplate';
                    dataForOrder.faceplateProductId = $scope.selectedProduct.id;
                    dataForOrder.faceplatePrice = $scope.selectedProduct.price;
                    dataForOrder.promotionId = $scope.selectedProduct.promotionId;
                    dataForOrder.whyNeedOnlySocet = getWhyNeedOnlySocet();
                } else {
                    dataForOrder.holdername = $scope.paymentInfo.submitedInfo.holderName;
                    dataForOrder.accountNumber = $scope.paymentInfo.submitedInfo.accountNumber;
                    dataForOrder.sortcode = $scope.paymentInfo.submitedInfo.sortCode;

                    dataForOrder.broadBandProductId = $scope.selectedProduct.broadBandProductId;
                    dataForOrder.faceplateProductId = $scope.selectedProduct.addIns.hyperSocket != null ? $scope.selectedProduct.addIns.hyperSocket.id : null;
                    dataForOrder.faceplatePrice = $scope.selectedProduct.addIns.hyperSocket != null ? $scope.selectedProduct.hyperSocketPrice : 0;
                    dataForOrder.phoneProductId = $scope.selectedProduct.haveLineRental ? $scope.selectedProduct.addIns.lineRental.id : "";
                    dataForOrder.connectionFeeProductId = $scope.selectedProduct.haveConnectionFee ? $scope.selectedProduct.addIns.connectionFee.id : "";
                    dataForOrder.additionalProducts = getPhoneAddIns();
                    dataForOrder.promotionId = ($scope.selectedProduct.promotionId != null) ? $scope.selectedProduct.promotionId : "";
                    dataForOrder.promoCodeId = ($scope.selectedProduct.promoCodeId != null) ? $scope.selectedProduct.promoCodeId : "";
                    dataForOrder.promoCode = ($scope.appliedPromoCode != null) ? $scope.appliedPromoCode : "";
                }

                $http({
                    method: 'POST',
                    url: homeURL + "process-api/",
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    transformRequest: function(data) {
                        return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
                    },
                    data: dataForOrder
                }).success(function(data, status, headers, config) {
                    if (data != null && data.redirect) {
                        var url = homeURL + "myaccount/?mode=ThankYou";
                        if (data.eastVillageCustomer != null && data.eastVillageCustomer) {
                            url += "&eastVillageSsid=" + data.eastVillageSsid + "&eastVillagePassword=" + data.eastVillagePassword;
                        }
                        window.location.replace(url);
                    } else if(data.redirect == false){
                        $('body').addClass('modal-open-hyper');
                        $modal.open({
                            templateUrl: 'template/hyperThankYouSocketOrder.html',
                            backdrop: 'static',
                            backdropClass: 'fullheight'
                        });
                    } else{
                        $('body').addClass('modal-open-hyper');
                        $modal.open({
                            templateUrl: 'template/hyperProblemWithOrder.html',
                            backdrop: 'static',
                            backdropClass: 'fullheight'
                        });
                    }
                }).error(function(data, status, headers, config) {

                });
            }


        }

        $scope.scrollTo = function(eID) {
            scrollToElement(eID);
        }

        $scope.scrollToMovingElement = function (eID) {
            setTimeout(function () {
                scrollToElement(eID);
            }, 380);
        }

        $scope.disableEmptyTabs = function () {
            if (business) return;
            // tab one
            if ($scope.productsBAndPhone == null || $scope.productsBAndPhone.length == 0) {
                $scope.disableTab.one = true;
            } else {
                var allDisabled = true;
                for (var i = 0; i < $scope.productsBAndPhone.length; i++) {
                    if (!$scope.productsBAndPhone[i].isDisabled) {
                        allDisabled = false;
                        break;
                    }
                }
                if (allDisabled){
                    $scope.disableTab.one = true;
                }
            }
            // tab two
            if ($scope.productsB == null || $scope.productsB.length == 0) {
                $scope.disableTab.two = true;
            } else {
                var allDisabled = true;
                for (var i = 0; i < $scope.productsB.length; i++) {
                    if (!$scope.productsB[i].isDisabled) {
                        allDisabled = false;
                        break;
                    }
                }
                if (allDisabled){
                    $scope.disableTab.two = true;
                }
            }
            // tab three
            if ($scope.serviceData.fpProducts == null || $scope.serviceData.fpProducts.length == 0){
                $scope.disableTab.three = true;
            }
        }

        $scope.selectFirstValidProduct = function () {
            if (business){
                $scope.tabBSelected();
            }
            else {
                if ($scope.tabBAndPSelected()){
                    $scope.activeTab.one = true;
                } else if ($scope.tabBSelected()) {
                    $scope.activeTab.two = true;
                } else {
                    $scope.activeTab.three = true;
                }

            }
        }

        $scope.tabBAndPSelected = function () {
            var returnValue = false;
            if ($scope.productsBAndPhone == null) return;
            deselectAllProducts();
            $scope.selectedProduct = null;
            for (var i = 0; i < $scope.productsBAndPhone.length; i++) {
                if(!$scope.productsBAndPhone[i].isDisabled){
                    $scope.productsBAndPhone[i].active = true;
                    selectThisProduct ( $scope.productsBAndPhone[i] );
                    returnValue = true;
                    break;
                }
            }
            $scope.socketOnly = false;
            $scope.showSummaryTable = true;
            $scope.enableBankDetails = true;
            $scope.showButtonsOnBottom = true;
            $scope.disableAllAccordions = false;
            if($scope.contractLength == 0){
                $scope.contractLength = $scope.lastContractLength;
            }
            return returnValue;
        }

        $scope.tabBSelected = function () {
            var returnValue = false;
            if ($scope.productsB == null) return;
            deselectAllProducts();
            $scope.selectedProduct = null;
            for (var i = 0; i < $scope.productsB.length; i++) {
                if(!$scope.productsB[i].isDisabled){
                    $scope.productsB[i].active = true;
                    selectThisProduct ( $scope.productsB[i] );
                    returnValue = true;
                    break;
                }
            }
            $scope.socketOnly = false;
            $scope.showSummaryTable = true;
            $scope.enableBankDetails = true;
            $scope.showButtonsOnBottom = true;
            $scope.disableAllAccordions = false;
            if($scope.contractLength == 0){
                $scope.contractLength = $scope.lastContractLength;
            }
            return returnValue;
        }

        $scope.tabHyperSocketSelected = function() {
            $scope.selectedProduct = getProductHyperSocket();

            $scope.socketOnly = true;
            $scope.showSummaryTable = false;
            $scope.enableBankDetails = false;
            $scope.lastContractLength = $scope.contractLength;
            $scope.contractLength = 0;
            if ($scope.selectedProduct.price != 0){
                $scope.showButtonsOnBottom = false;
                $scope.disableAllAccordions = true;
            }
        }

        $scope.productActivated = function (id){
            var oldActiveProduct = $scope.selectedProduct;

            for (var i = 0; i < $scope.productsBAndPhone.length; i++) {
                if ($scope.productsBAndPhone[i].id != id) $scope.productsBAndPhone[i].active = false;
                else selectThisProduct ( $scope.productsBAndPhone[i] );
            }
            for (var i = 0; i < $scope.productsB.length; i++) {
                if ($scope.productsB[i].id != id) $scope.productsB[i].active = false;
                else selectThisProduct( $scope.productsB[i] );
            }
            if (oldActiveProduct != null){
                copyAllStateVariables(oldActiveProduct);
            }
        }

        $scope.isValidUKPhone = function (text) {
            if(typeof text === 'undefined' || text == '') return true;
            return isUKPhoneNumber(text);
        }

        $scope.isFirstAccordionValid = function () {
            //console.log(JSON.parse(JSON.stringify($scope.selectedProduct)));
            if ($scope.selectedProduct === null) return false;
            if ($scope.selectedProduct.useExistingPhone === true){
                if (typeof $scope.selectedProduct.existingPhone === 'undefined' ||
                    $scope.selectedProduct.existingPhone == '') return false;
                else if (! $scope.isValidUKPhone($scope.selectedProduct.existingPhone)) return false;
            }
            if (isSelectedProductHyperSocket($scope.selectedProduct)){
                if (typeof $scope.selectedProduct.whyYouOnlyNeedHyperSocket === 'undefined') return false;
                else {
                    if ($scope.selectedProduct.whyYouOnlyNeedHyperSocket == 'Other' &&
                        typeof $scope.selectedProduct.whyYouOnlyNeedHyperSocketOther === 'undefined') return false;
                    if ($scope.selectedProduct.whyYouOnlyNeedHyperSocket == 'In a contract & not ready to order' &&
                        typeof $scope.selectedProduct.whyYouOnlyNeedHyperSocketContractExpire === 'undefined') return false;
                }
            }
            return true;
        }

        $scope.isSecondAccordionValid = function () {
            if (isAccountDetailsValid($scope.accountDetails)) return true;
            return false;
        }

        $scope.isSecondBusinessAccordionValid = function () {
            if (isBusinessAccountDetailsValid($scope.accountDetails)) return true;
            return false;
        }

        $scope.isThirdAccordionValid = function () {
            if ($scope.paymentInfo.holderName == null) return true;
            if ($scope.paymentInfo.valid === true  && $scope.paymentInfo.authorisedDirectDebit === true) return true;
            return false;
        }

        $scope.isFourthAccordionValid = function () {
            if ($scope.isFirstAccordionValid() && $scope.isSecondAccordionValid() && $scope.isThirdAccordionValid()) return true;
            return false;
        }

        $scope.isFourthBusinessAccordionValid = function () {
            if ($scope.isFirstAccordionValid() && $scope.isSecondBusinessAccordionValid() && $scope.isThirdAccordionValid()) return true;
            return false;
        }

        $scope.nameValidator = function (text){
            if (text == null || text.length < 2){
                return "Please provide valid name";
            }
            if (!isLettersOnly(text)){
                return "Please use letters only";
            }
            return true;
        }

        $scope.phoneValidator = function (text){
            if (text == null || text.length < 1){
                return true;
            }
            if (!isPhoneNumber(text)){
                return "Please specify a valid phone number";
            }
            return true;
        }

        $scope.ukPhoneValidator = function (text){
            if (text == null || text.length < 1){
                return "Please provide your phone number";
            }
            if (!isUKPhoneNumber(text)){
                return "Please specify a valid UK phone number";
            }
            return true;
        }

        $scope.accountMailValidator = function (text){
            if ($scope.accountDetails.testedMail == text && text != null) return $scope.accountDetails.validMail;
            if (text == null || text.length < 1){
                return "Please provide your email";
            }
            if (!isEmail(text)){
                return "Please specify a valid email";
            }
            if (!isUniqueEmail(text)){
                $scope.accountDetails.validMail = "Email is already in use";
                $scope.accountDetails.testedMail = text;
                return "Email is already in use";
            } else {
                $scope.accountDetails.validMail = true;
                $scope.accountDetails.testedMail = text;
            }
            return true;
        }

        $scope.passwordValidator = function (text){
            if (text == null || text.length < 1){
                return "Please provide your password";
            }
            if (text.length < 8){
                return "Password must be at least 8 characters long";
            }
            return true;
        }

        $scope.passwordReValidator = function (text){
            if (text == null || text !== $scope.accountDetails.password){
                return "Please provide same password again";
            }
            return true;
        }

        $scope.dateValidator = function (text) {
            if (text ==  null || !isDate(text)) {
                return "Please specify a valid date (dd/mm/yyyy)";
            }
            return true;
        }

        $scope.sortCodeValidator = function (text){
            if (text == null || text.length < 1){
                return "Please provide your sortcode";
            }
            if (text.length != 6){
                return "Sortcode must be exactly 6 characters long";
            }
            return true;
        }

        $scope.accountNumberValidator = function (text){
            if (text == null || text.length < 1){
                return "Please provide your account number";
            }
            if (text.length != 8){
                return "Account number must be exactly 8 characters long";
            }
            return true;
        }

        $scope.businessNumberValidator = function (text){
            if (text == null || text.length < 1){
                return true;
            }
            if (text.length != 8){
                return "Registration number must be exactly 8 characters long";
            }
            return true;
        }

        $scope.showHowDidYouHearAboutUsExtra = function () {
            if ($scope.accountDetails.howDidYouHearAboutUs == 'A Hyperoptic Engineer' ||
                $scope.accountDetails.howDidYouHearAboutUs == 'Building Champion' ||
                $scope.accountDetails.howDidYouHearAboutUs == 'A friend or neighbour' ||
                $scope.accountDetails.howDidYouHearAboutUs == 'Other'){
                return true;
            }
            return false;
        }
        
        $scope.onSubmitAccountDetailsForm = function () {
            if ($scope.accountDetails.firstName == null) {
                $scope.accountDetails.firstName = "";
            }
        }

        $scope.onSubmittedAccountDetailsForm = function() {
            if ($scope.accountDetails.howDidYouHearAboutUs == null) return;
            if ($scope.enableBankDetails) {
                $scope.openAccordions.three = true;
                $scope.scrollToMovingElement('acc3');
            } else {
                $scope.openAccordions.four = true;
                $scope.scrollToMovingElement('acc4');
            }
        }

        $scope.onSubmittedBusinessAccountDetailsForm = function() {
            $scope.openAccordions.three = true;
            $scope.scrollToMovingElement('acc3');
        }

        $scope.$watch('openAccordions.two', function() {
            if ($scope.openAccordions.two){
                $scope.onSubmitAccountDetailsForm();
            }
        });

        $scope.$watch('openAccordions.three', function() {
            if ($scope.openAccordions.three){
                if ($scope.paymentInfo.holderName == null) {
                    $scope.paymentInfo.holderName = "";
                }
            }
        });

        $scope.$watch('openAccordions', function() {
            var msg = '';
            var step = "";
            var havePhone = false;
            if(!$scope.executeTracking){
                $scope.executeTracking = true;
                return;
            }
            if ($scope.openAccordions.one){
                step = 1;
                if ($scope.selectedProduct.havePhone){
                    havePhone = true;

                    msg = "Hyperoptic.com (New)|BB and Phone order|Step 1: Select Package";
                } else {
                    msg = "Hyperoptic.com (New)|BB only order|Step 1: Select Package";
                }
            } if ($scope.openAccordions.two){
                step = 2;
                if ($scope.selectedProduct.havePhone){
                    msg = "Hyperoptic.com (New)|BB and Phone order|Step 2: Account Details";
                    havePhone = true;
                } else {
                    msg = "Hyperoptic.com (New)|BB only order|Step 2: Account Details";
                }
            } if ($scope.openAccordions.three){
                step = 3;
                if ($scope.selectedProduct.havePhone){
                    msg = "Hyperoptic.com (New)|BB and Phone order|Step 3: Payment Details";
                    havePhone = true;
                } else {
                    msg = "Hyperoptic.com (New)|BB only order|Step 3: Payment Details";
                }
            } if ($scope.openAccordions.four){
                step = 4;
                if ($scope.selectedProduct.havePhone){
                    msg = "Hyperoptic.com (New)|BB and Phone order|Step 4: Confirmation";
                    havePhone = true;
                } else {
                    msg = "Hyperoptic.com (New)|BB only order|Step 4: Confirmation";
                }
            }

            var formDataArray = [];
                formDataArray['title'] = $scope.accountDetails.title;
                formDataArray['firstname'] = $scope.accountDetails.firstName;
                formDataArray['lastname'] = $scope.accountDetails.lastName;
                formDataArray['phone'] = $scope.accountDetails.phone;
                formDataArray['mobile'] = $scope.accountDetails.mobile;
                formDataArray['email'] = $scope.accountDetails.email;
                formDataArray['dateOfBirth'] = $scope.accountDetails.dateOfBirth;
                formDataArray['howDidYouHearAboutUs'] = $scope.accountDetails.howDidYouHearAboutUs;
                formDataArray['holderName'] = $scope.paymentInfo.holderName;
                formDataArray['sortCode'] = $scope.paymentInfo.sortCode;
                formDataArray['accountNumber'] = $scope.paymentInfo.accountNumber;
            var formData = $scope.makeStringFromVariables(formDataArray);
            var userAgent = $scope.accountDetails.userAgent;
            var postAddressId = $scope.accountDetails.pafid;
            var ip = userip;
            var broadband = $scope.selectedProduct.bundleId;
            var price = $scope.selectedProduct.mountlyPrice;
            var trackingData = [];
            trackingData.step = step;
            trackingData.formData = formData;
            trackingData.userAgent = userAgent;
            trackingData.postAddressId = postAddressId;
            trackingData.siteId = siteId;
            trackingData.ip = ip;
            trackingData.broadband = broadband;
            trackingData.havePhone = havePhone;
            trackingData.price = price;
            $scope.executeTracking = false;
            $scope.showPhoneDescription = false;
            if(trackingData.broadband != null){
            $http({
                method: 'POST',
                url: homeURL + "process-api/",
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                transformRequest: function(data) {
                    return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
                },
                data: trackingData
            }).success(function(data, status, headers, config) {

            }).error(function(data, status, headers, config) {

            });
            }
            try {
                if (typeof adf !== 'undefined') return;
                adf.Params.PageName = encodeURIComponent(msg);
                adf.Params.Divider = encodeURIComponent('|');
                adf.track(189202);
            } catch (e) {

            }
        }, true);

        $scope.$watch('selectedProduct.takeAnytimeUK', function() {
            recalcTotalAmount();
        });

        $scope.$watch('selectedProduct.takeInternationalCalls', function() {
            recalcTotalAmount();
        });

        $scope.onSubmittedPaymentInfoForm = function () {

            $http({
                method: 'POST',
                url: homeURL + 'check-api/',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                transformRequest: function(obj) {
                    var str = [];
                    for(var p in obj)
                        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                    return str.join("&");
                },
                data: {mode: 'bank', holderName: $scope.paymentInfo.holderName, accountNo: $scope.paymentInfo.accountNumber, sortCode: $scope.paymentInfo.sortCode}
            }).success(function(data, status, headers, config) {
                if (data.isOK) {
                    $scope.paymentInfo.valid = true;
                    $scope.paymentInfo.bank = data.bank;
                    $scope.paymentInfo.submitedInfo = {
                        holderName: $scope.paymentInfo.holderName,
                        accountNumber: $scope.paymentInfo.accountNumber,
                        sortCode: $scope.paymentInfo.sortCode
                    };
                } else {
                    $scope.paymentInfo.valid = false;
                    $scope.paymentInfo.error = data.message;
                }
            }).
                error(function(data, status, headers, config) {
                    $scope.paymentInfo.valid = false;
                    $scope.paymentInfo.error = 'Some connection error. Please contact customer support.';
                });
        }

        $scope.onPromoCodeApplied = function () {

            $http.get(homeURL + 'process-api/?pafid=' + pafid + "&promocode=" + $scope.promocode).success(function (data, status, headers, config) {
                if (data != null && data.oneMonth.promoCodeValid === true && data.twelveMonth.promoCodeValid === true) {
                    $scope.appliedPromoCode = $scope.promocode;
                    $scope.fullData = data;
                    $scope.showPromoCodeHasBeenApplied = true;
                    fillPriceData($scope.contractLength, true);
                } else {
                    invalidPromoCode();
                }
            });
        }

        $scope.canOrder = function () {
            if ($scope.agreeTermsAndConditions && $scope.agreePrivacyAndCookies && $scope.accountDetails.firstName != null && $scope.isFourthAccordionValid()){
                return true;
            }
            return false;
        }

        $scope.canBusinessOrder = function () {
            if ($scope.agreeTermsAndConditions && $scope.agreePrivacyAndCookies && $scope.accountDetails.firstName != null && $scope.isFourthBusinessAccordionValid()){
                return true;
            }
            return false;
        }

        $scope.excludeVAT = function (value) {
            return value / 1.2;
        }

        $scope.calculateVAT = function (value) {
            return value - $scope.excludeVAT(value);
        }

        $scope.onOrderButtonPress = function () {
            if ($scope.selectedProduct.havePhone){
                var modalInstance = $modal.open({
                    templateUrl: 'template/hyperPhoneConditions.html',
                    controller: 'ModalInstanceCtrl',
                    backdrop: true,
                    backdropClass: 'fullheight',
                    resolve: {
                        mainScope: function () {
                            return $scope;
                        }
                    }
                });
                modalInstance.result.then(function (info) {
                    if (info === true){
                        makeOrder();
                    } else {
                        $('body').removeClass('modal-open-hyper');
                    }
                }, function () {
                    $('body').removeClass('modal-open-hyper');
                });
            } else {
                makeOrder();
            }
        }

        $scope.makeStringFromVariables = function(params){
            var result = "";
            for(var value in params){
                result += value + ":" + params[value] + "|";
            }
            result.substring(0, result.length - 1);
            return result;
        }

        $scope.contractStatus = function(){
            if($scope.contractLength == 12){
                return "12 month Contract";
            }else{
                return "No Contract";
            }
        }

        $scope.changeContractType = function(data){
            $scope.contractLength = data;
            document.getElementById('checkboxContract-'+$scope.contractLength).checked = true;
            fillPriceData($scope.contractLength, $scope.showPromoCodeHasBeenApplied);
        }

    }]);

    app.controller('ModalInstanceCtrl', function ($scope, $modalInstance, mainScope, $log) {
        $('body').addClass('modal-open-hyper');
        $scope.iReadAndAgreeTermsAndConditions = false;
        $scope.toggleIReadAndAgreeTermsAndConditions = function () {
            if ($scope.iReadAndAgreeTermsAndConditions === true) $scope.iReadAndAgreeTermsAndConditions = false;
            else  $scope.iReadAndAgreeTermsAndConditions = true;
        }
        $scope.close = function (isSubmit) {
            $modalInstance.close($scope.iReadAndAgreeTermsAndConditions && isSubmit);
        }
    });

    app.controller('ModalThankYouInstanceCtrl', function ($scope, $modalInstance, data, $log) {
        $scope.close = function () {
            $modalInstance.close();
        }
    });

})();