/**
 * Created by Ivan Herceg on 09-Apr-15.
 */

(function() {
    angular.module('hyperoptic.site', ['template/hyperProduct/hyperProduct.html'])
        .constant('hyperoptic.site.config', {
            oneG: {
                title: '1Gb Fibre Broadband',
                imageHasPromotion: baseURL+'/images/products/1.png',
                image: baseURL+'/images/products/1-center.png',
                imageForUse: baseURL+'/images/products/1usewith.png',
                imageForUseBusiness: baseURL+'/images/products/1-business-usewith.png'
            },
            hundredM: {
                title: '100Mb Fibre Broadband',
                imageHasPromotion: baseURL+'/images/products/100.png',
                image: baseURL+'/images/products/100-center.png',
                imageForUse: baseURL+'/images/products/100usewith.png',
                imageForUseBusiness: baseURL+'/images/products/100-business-usewith.png'
            },
            twentyM: {
                title: '20Mb Fibre Broadband',
                imageHasPromotion: baseURL+'/images/products/20.png',
                image: baseURL+'/images/products/20-center.png',
                imageForUse: baseURL+'/images/products/20usewith.png',
                imageForUseBusiness: baseURL+'/images/products/20-business-usewith.png'
            }

        })

        .controller('hyperProductController', ['$scope', '$attrs', 'hyperoptic.site.config', function ($scope, $attrs, config) {
            $scope.productData = config[$scope.product.typeId];
            $scope.getImageClass = function (){
                if ($scope.product.isDisabled){
                    return 'f-d-grayscale-op';
                } else {
                    return $scope.product.active ? 'pack-i-s-op' : 'pack-i-uns-op'
                }
            }

            this.scope = $scope;
        }])

        .directive('hyperProduct', function () {
            return {
                restrict:'E',
                controller:'hyperProductController',
                transclude: true,
                replace: true,
                templateUrl: 'template/hyperProduct/hyperProduct.html',
                scope: {
                    product: '=',
                    onProductActivate: '&onProductActivate',
                    contractStatus: '=',
                    last: '='
                },
                link: function(scope, element, attrs, hyperProductController) {
                    scope.showDecsription = false;

                    scope.selectThisProduct = function() {
                        if (scope.product.isDisabled) return;
                        scope.product.active = true;
                        scope.onProductActivate({id: scope.product.id});
                    }
                }
            };
        })

        .directive('hyperProductDescription', ['$compile', '$http', '$templateCache', function($compile, $http, $templateCache) {

            var getTemplate = function(contentType) {
                var templateLoader,
                    baseUrl = 'template/hyperProduct/',
                    templateMap = {
                        oneG: 'oneGDescription.html',
                        hundredM: 'hundredMDescription.html',
                        twentyM: 'twentyMDescription.html'
                    };

                var templateUrl = baseUrl + templateMap[contentType];
                templateLoader = $http.get(templateUrl, {cache: $templateCache});

                return templateLoader;

            }

            var linker = function(scope, element, attrs, hyperProductCtrl) {

                scope.business = hyperProductCtrl.scope.product.business;
                scope.havePhone = hyperProductCtrl.scope.product.havePhone;
                var loader = getTemplate(hyperProductCtrl.scope.product.typeId);

                loader.success(function(html) {
                    element.html(html);
                }).then(function (response) {
                    element.replaceWith($compile(element.html())(scope));
                });
            }

            return {
                require:'^hyperProduct',
                restrict: 'E',
                replace: true,
                link: linker
            };
        }])

        .directive('hyperDropDown', function () {
            return {
                restrict:'E',
                replace: true,
                templateUrl: 'template/hyperDropDown.html',
                scope: {
                    title: '@',
                    options: '=',
                    placeholder: '@',
                    value: '=',
                    isRequired: '@',
                    onValueChanged: '&',
                    initClassesContainer: '@',
                    initTitleClasses: '@',
                    size: '@',
                    validateTriggerVar: '=',
                    validateTriggerNeeded: '@'
                },
                link: function(scope) {
                    scope.pick = function(option) {
                        scope.value = option;
                        scope.onValueChanged({option: option});
                    }
                    scope.triggeringDone = function () {
                        if (scope.validateTriggerNeeded === "true"){
                            return scope.validateTriggerVar === true;
                        }
                        return true;
                    }
                }
            };
        })

        .directive('hyperDatePicker', function () {
            return {
                restrict:'A',
                link: function(scope, element, attr) {
                    element.datepicker({startView: 'decade', endDate: '-18y', format: 'dd M yyyy'});
                }
            }
        });


    angular.module('template/hyperProduct/hyperProduct.html', []).run(["$templateCache", function($templateCache) {
        $templateCache.put('template/hyperProduct/hyperProduct.html',
            "<div>Provide template for hyperProduct</div>");
    }]);
    angular.module('template/hyperProduct/oneGDescription.html', []).run(["$templateCache", function($templateCache) {
        $templateCache.put('template/hyperProduct/oneGDescription.html',
            "<div>Provide template for oneGDescription</div>");
    }]);
    angular.module('template/hyperProduct/hundredMDescription.html', []).run(["$templateCache", function($templateCache) {
        $templateCache.put('template/hyperProduct/hundredMDescription.html',
            "<div>Provide template for hundredMDescription</div>");
    }]);
    angular.module('template/hyperProduct/twentyMDescription.html', []).run(["$templateCache", function($templateCache) {
        $templateCache.put('template/hyperProduct/twentyMDescription.html',
            "<div>Provide template for twentyMDescription</div>");
    }]);
    angular.module('template/hyperDropDown.html', []).run(["$templateCache", function($templateCache) {
        $templateCache.put('template/hyperDropDown.html',
            "<div>Provide template for hyperDropDown</div>");
    }]);
})();