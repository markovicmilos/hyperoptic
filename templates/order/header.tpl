<!DOCTYPE html>
<html ng-app="hyperOrder">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{header-title}</title>
    <meta name="description" content="{header-description}">
    <meta name="robots" content="index,follow" /> <meta name="googlebot" content="index,follow" />
    <!-- Bootstrap recomended setup  -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="{base-url}/css/allfonts.css" rel="stylesheet" type="text/css">

    <script type="text/javascript">
        var homeURL = '{home-url}';
        var baseURL = '{base-url}';
        var business = {is-business};
        var userip = '{user-ip}';
        var pafid = {pafid};
        var postcode = '{postcode}';
        var city = '{city}';
        var premiseHaveActiveService = {premise-have-active-service};
        var siteId = '{siteId}';
        var csfId = '{csfId}';
    </script>

    <script src="{base-url}/js/jquery.min.js"></script>
    <script src="{base-url}/js/bootstrap-datepicker.js"></script>
    <script src="{base-url}/js/md5.js"></script>
    <script src="{base-url}/js/order/angular.min.js"></script>
    <script src="{base-url}/js/order/ui.bootstrap.tpls.min.js"></script>
    <script src="{base-url}/js/order/angular.directives.js?v=1"></script>
    <script src="{base-url}/js/order/angular.app.js?v=6"></script>
    <script src="{base-url}/js/jquery.validate.js"></script>
    <script src="{base-url}/js/validating.js"></script>
    <script src="{base-url}/js/order/angular-validator.min.js"></script>
    <script src="{base-url}/js/facebook-login.js"></script>

	<!-- BOOTSTRAP Latest compiled and minified CSS -->
    <link href="{base-url}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="{base-url}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="{header-css}?v=1" />
    <style>
        body {
            height: auto;
        }
        .modal-open-hyper {
            overflow: hidden;
            height: 100%;
        }

        .tooltip {
            text-align: justify;
            background-color: #e5e5e5;
        }
    </style>
    <script src="{base-url}/js/global.js?v=1"></script>

	{header-jscript}

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-23479045-1', 'auto');
        ga('send', 'pageview');
    </script>

    <script type="text/javascript" src="https://track.adform.net/serving/scripts/trackpoint/"></script>
    <script type="text/javascript">
        try {
            var sttAdfPagename = "Hyperoptic.com (New)";
            (function(){
                var sttAdfPathname = "";
                sttAdfPathname = window.location.pathname.replace(/^\//,"").replace(/\/+/g,"/").replace(/\//g,"|").replace(/\|$/,"").replace(/\.[^\.\/]+$/,"");
                if(sttAdfPathname === "" || sttAdfPathname === "index"){ sttAdfPathname = "Home"; }
                if(sttAdfPathname != "") sttAdfPagename += "|"+sttAdfPathname;
            })();
            adf.Params.PageName = encodeURIComponent(sttAdfPagename);
            adf.Params.Divider = encodeURIComponent('|');
            adf.track(189202);
        } catch (e){}
    </script>

    <script id="template/accordion/accordion-group.html" type="text/ng-template">
        <div class="panel panel-default">
            <div class="panel-heading" ng-click="toggleOpen()" ng-class="!isOpen ? 'collapsed' : ''" accordion-transclude="heading">
                <div ng-class="done ? ('numbe-done-' + index) : ('numbe-undone-' + index)"></div>
                <p class="panel-title font-f-bariol-regular font-w-600 font-22"><a>{{heading}}</a></p>
                <div class="marg-right-fixed-20 pull-right op-progress-error" ng-show="notValid && !isDisabled"></div>
                <div class="marg-right-fixed-20 pull-right" ng-class="done ? 'op-progress-done' : 'op-progress-udone'" ng-hide="notValid || isDisabled"></div>
                <p class="pad-top-fixed-10 pad-right-fixed-20 pull-right font-12" ng-class="done ? 'op-fc-d' : 'op-fc-ud'" ng-hide="isDisabled"> {{done ? 'COMPLETED' : 'TO BE COMPLETED'}} </p>
            </div>
            <div class="panel-collapse" collapse="!isOpen">
                <div class="panel-body" ng-transclude></div>
            </div>
        </div>
    </script>

    <script id="template/tabs/tabset.html" type="text/ng-template">
        <div>
            <ul class="nav nav-{{type || 'tabs-op'}}" ng-class="{'nav-stacked': vertical, 'nav-justified': justified}" ng-transclude></ul>
            <div class="tab-content">
                <div class="tab-pane"
                     ng-repeat="tab in tabs"
                     ng-class="{active: tab.active}"
                     tab-content-transclude="tab">
                </div>
            </div>
        </div>
    </script>



    <!-- START BLOCK : Residential-templates -->
    <script id="template/hyperProduct/hyperProduct.html" type="text/ng-template">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 pad-right-percent-0 marg-bottom-fixed-30 pad-left-percent-0 b-r-0-l-768 product-panel" ng-class="last ? '' : 'b-r-1px-l-gray';">
            <div class="p-d-op1" ng-click="selectThisProduct()">
                <img class="pad-right-fixed-15 pad-left-fixed-15 pack-i-op" ng-class="getImageClass()" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/products/1-center.png" ng-src="{{product.havePromotion ? productData.imageHasPromotion : productData.image}}" alt="Hyperoptic bb">
                <div class="pd-p-co-op" ng-hide="product.isDisabled">
                    <p ng-show="product.havePromotion" class="d-p-op marg-left-fixed-m5 gray-f-2 font-w-500">per month<br>for <span class="promotion-months">{{product.promotionDuration}}</span> months</p>
                    <p class="font-f-bariol-light font-30 font-w-600 blue-navy-f-2" ng-class="product.havePromotion ? 'p-p-op' : 'p-price-only-op'">£{{(product.business ? product.price/ 1.2 : product.price) | number:2}}</p>
                    <p class="font-f-bariol-light font-10 font-w-500 gray-f-2" ng-class="product.havePromotion ? 'p-below-dp-op' : 'dis-none'"> Normally £{{product.afterPromotionPrice}} per month </p>
                </div>
                <img ng-show="product.havePromotion && !product.isDisabled" class="offer-i-op" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/offer-sticker.png" alt="Hyperoptic bb">
            </div>
            <div class="pad-top-percent-2 pad-left-fixed-15 product-title" ng-mouseenter="showDescription = true" ng-mouseleave="showDescription = false">
                <div class="blue-navy-f-2 font-16 font-w-600 txt-a-c let-space-minus-05 word-space-minus-01 cursor-p">{{productData.title}}
                    <img class="pad-left-fixed-5 cursor-p"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm" />
                </div>
                <p class="pad-left-fixed-5 font-10 gray-f-2 txt-a-c cursor-p">({{contractStatus}})</p>
            </div>
            <div class="package-descrption-op" ng-show="showDescription">
                <div ng-transclude style="height: 140px">

                </div>
                <p class="pad-left-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> Ideal for use with: </p>
                <img class="marg-top-fixed-30 ideal-u-i-op" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/products/1usewith.png" ng-src="{{product.business ? productData.imageForUseBusiness : productData.imageForUse}}" alt="Hyperoptic bb">
            </div>
        </div>
    </script>
    <script id="template/hyperProduct/oneGDescription.html" type="text/ng-template">
        <p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13"> The UK's most powerful service for limitless online freedom. </p>
        <ul class="pad-left-fixed-30 gray-f-2 font-13">
            <li>Up to 1,000Mb for downloads AND uploads</li>
            <li>Always fast, even at peak times</li>
            <li>FREE Hyperhub router</li>
            <li ng-show="havePhone">FREE evening and weekend landline calls</li>
            <li ng-show="havePhone">Phone Includes voicemail and call waiting</li>
        </ul>
    </script>

    <script id="template/hyperProduct/hundredMDescription.html" type="text/ng-template">
        <p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> The ideal package to power your household's online experience. </p>
        <ul class=" pad-left-fixed-30 gray-f-2 font-13">
            <li>Up to 100Mb for downloads AND uploads</li>
            <li>No slow downs, no limits</li>
            <li>FREE Hyperhub router</li>
            <li ng-show="havePhone">FREE evening and weekend landline calls</li>
            <li ng-show="havePhone">Phone Includes voicemail and call waiting</li>
        </ul>
    </script>

    <script id="template/hyperProduct/twentyMDescription.html" type="text/ng-template">
        <p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> A fast and dependable service for general internet use. </p>
        <ul class=" pad-left-fixed-30 gray-f-2 font-13">
            <li>Up to 20Mb downloads, 1Mb uploads</li>
            <li>No slow downs, no limits</li>
            <li>FREE Hyperhub router</li>
            <li ng-show="havePhone">FREE evening and weekend landline calls</li>
            <li ng-show="havePhone">Phone Includes voicemail and call waiting</li>
        </ul>
    </script>
    <!-- END BLOCK : Residential-templates -->

    <!-- START BLOCK : Business-templates -->
    <script id="template/hyperProduct/hyperProduct.html" type="text/ng-template">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 pad-right-percent-0 marg-bottom-fixed-30 pad-left-percent-0 b-r-1px-l-gray b-r-0-l-768 product-panel">
            <div class="p-d-op1" ng-click="selectThisProduct()">
                <img class="pad-right-fixed-15 pad-left-fixed-15 pack-i-op" ng-class="getImageClass()" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/products/1.png" ng-src="{{productData.image}}" alt="Hyperoptic bb">
                <div class="pd-p-co-op" ng-hide="product.isDisabled">
                    <p ng-show="product.havePromotion" class="d-p-op marg-left-fixed-m5 gray-f-2 font-w-500">per month<br>for <span class="promotion-months">{{product.promotionDuration}}</span> months</p>
                    <p class="font-f-bariol-light font-30 font-w-600 blue-navy-f-2" ng-class="product.havePromotion ? 'p-p-op' : 'p-price-only-op'">£{{(product.business ? product.price/ 1.2 : product.price) | number:2}}</p>
                </div>
                <img ng-show="product.havePromotion && !product.isDisabled" class="offer-i-op" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/offer-sticker.png" alt="Hyperoptic bb">
            </div>
            <div class="pad-top-percent-2 pad-left-fixed-15  blue-navy-f-2 font-18 font-w-600 product-title let-space-minus-05">{{productData.title}}</div>
            <div ng-transclude style="height: 180px">

            </div>
            <p class="pad-left-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> Ideal for use with: </p>
            <img class="marg-top-fixed-30 ideal-u-i-op" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/products/1usewith.png" ng-src="{{product.business ? productData.imageForUseBusiness : productData.imageForUse}}" alt="Hyperoptic bb">
        </div>
    </script>
    <script id="template/hyperProduct/oneGDescription.html" type="text/ng-template">
        <p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13"> The UK’s most powerful service ideal for data hungry businesses with more than 20 users. </p>
        <ul class="pad-left-fixed-30 gray-f-2 font-13">
            <li>1Gb download and upload speeds</li>
            <li>Always fast, even at peak times</li>
            <li>Unlimited data usage</li>
            <li>Access to 24/7 business support</li>
            <li>Free installation and set-up worth £300*</li>
            <li>Prices exclude VAT </li>
            <li class="font-8">Only for customers eligible for the Connected Voucher Scheme</li>
        </ul>
    </script>

    <script id="template/hyperProduct/hundredMDescription.html" type="text/ng-template">
        <p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> The ideal package to power your business with up to 20 users. </p>
        <ul class=" pad-left-fixed-30 gray-f-2 font-13">
            <li>100Mb download and upload speeds</li>
            <li>Always fast, even at peak times</li>
            <li>Unlimited data usage</li>
            <li>Access to 24/7 business support</li>
            <li>Free installation and set-up worth £300*</li>
            <li>Prices exclude VAT</li>
            <li class="font-8">Only for customers eligible for the Connected Voucher Scheme</li>
        </ul>
    </script>

    <script id="template/hyperProduct/twentyMDescription.html" type="text/ng-template">
        <p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> A fast and dependable service, perfect for businesses with less than 5 users </p>
        <ul class=" pad-left-fixed-30 gray-f-2 font-13 ">
            <li>20Mb download and 1Mb upload speeds</li>
            <li>Unlimited data usage</li>
            <li>Access to 24/7 business support</li>
            <li>Free installation and set-up worth £300*</li>
            <li>Prices exclude VAT</li>
            <li class="font-8">Only for customers eligible for the Connected Voucher Scheme</li>
        </ul>
    </script>
    <!-- END BLOCK : Business-templates -->

    <script id="template/hyperDropDown.html" type="text/ng-template">
        <div class="{{initClassesContainer}}" ng-class="isRequired && !value && triggeringDone() ? 'has-error' : ''">
            <p class="{{initTitleClasses}}"> {{title}} </p>
            <ul class="nav navbar-nav opa-dropdown-{{size}}">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                        <span id="youNeedOnlySocket">{{ value != null ? value : placeholder }}</span>
                        <span class="caret arow-down-ri-{{size}}"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li ng-repeat="option in options"><a href ng-click="pick(option)">{{option}}</a></li>
                    </ul>
                </li>
            </ul>
            <span ng-show="isRequired && !value && triggeringDone()" class="help-block" id="email-error">This field is required.</span>
        </div>
    </script>

    <script id="template/hyperPhoneConditions.html" type="text/ng-template">
        <div class="modal-header">
            <button type="button" class="close" ng-click="close(false)"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h2 class="modal-title" id="myModalLabel">Please read</h2>
        </div>

        <div class="modal-body pad-top-percent-0">
            <p class="font-10 black-f-1 font-w-600"> Important points you should know before you sign up to Hyperoptic's Telephone Service   </p>
            <p class="font-11 gray-f-2 let-space-minus-05">
                Please note the following important points about your Telephone Service. Your Telephone Service is dependent on your connection to Hyperoptic's Network and the availability of Hyperoptic's Network. In the unlikely event that your Internet Service fails, your Telephone Service will also fail. If your Internet Service or your Telephone Service is terminated, your Telephone Service will fail. Your Telephone Service will also cease to function if there is a power cut or failure. These failures may be caused by reasons outside of our control.
            </p>
            <p class="font-11 gray-f-2 let-space-minus-05">
                I understand that this Telephone Service allows calls to the Emergency Services numbers 999 and 112. However I understand that calls will fail if there is a power cut or failure and will also fail in the unlikely event that my Internet Service fails or if my Internet Service or Telephone Service is terminated.
            </p>
            <p class="font-11 gray-f-2 let-space-minus-05">
                I also understand that I need to provide Hyperoptic with the address from which I use the Telephone Service if this is in England, Scotland, Wales or Northern Ireland (excluding the Isle of Man or Channel Islands) and that Hyperoptic will pass the address to the UK Emergency Services call centre. If I or anyone else uses my Hyperoptic telephone line to call Emergency Services on 999 or 112 then the Emergency Services will know this address and direct their response to it. I agree that it is my responsibility to keep the address details up to date at all times in my online Hyperoptic account and that this will allow Hyperoptic to provide information about any changes in my address to the Emergency Services. If I do not do so, then the Emergency Services may not know the address from which a 999 or 112 call is made to them.
            </p>
            <p class="font-11 gray-f-2 let-space-minus-05">
                If I or anyone else uses the Telephone Service from an address which is outside of England, Scotland, Wales or Northern Ireland then Hyperoptic will not pass my address details to the UK Emergency Services.
            </p>
            <p class="font-11 gray-f-2 let-space-minus-05">
                The address information I provide will take a minimum of 2 working days to be available to the 999/112 emergency call centre operators. That means if I need to dial 999 or 112 from my Hyperoptic line in the meantime, I will need to tell the operator my address.
            </p>
            <p class="font-11 gray-f-2 let-space-minus-05" ng-click="toggleIReadAndAgreeTermsAndConditions()">
                By clicking "I Accept" you confirm that you have read and understand how Hyperoptic's Telephone Service connects you to the Emergency Services, how that connection may fail and how our 999/112 Dialling works.
            </p>
        </div>
        <div class="modal-footer">
            <div class="checkbox checkbox-success font-12" >
                <input id="cbIReadAndAgree" name="cbiReadAndAgree" type="checkbox" ng-model="iReadAndAgreeTermsAndConditions" ng-click="toggleIReadAndAgreeTermsAndConditions()" />
                <label for="cbIReadAndAgree" ng-click="toggleIReadAndAgreeTermsAndConditions()">
                    I have read and agree to the telephone Terms and Conditions
                </label>
                <button id="bntIReadAndAgree" type="submit" class="btn btn-primary " style="float:right" ng-disabled="!iReadAndAgreeTermsAndConditions" ng-click="close(true)">SUBMIT</button>
            </div>
        </div>
    </script>

    <script id="template/hyperThankYouSocketOrder.html" type="text/ng-template">
        <div class="modal-header">
            <button type="button" class="close" onclick="window.location.href='{home-url}'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h2 class="modal-title">Thank you for placing the order</h2>
        </div>
        <div class="modal-body pad-top-percent-0">
            <p class="font-15 font-w-500 gray-f-1">Your Hyperoptic Socket order has been successfully placed.</p>
            <p class="pad-bottom-fixed-30 font-12 gray-f-3">You'll receive an email confirming your Hyperoptic Socket order, and we'll be in touch with you soon to arrange an installation date.</p>
        </div>
    </script>

    <script id="template/hyperProblemWithOrder.html" type="text/ng-template">
        <div class="modal-header">
            <button type="button" class="close" onclick="window.location.href='{home-url}'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h2 class="modal-title">There was a problem with your order</h2>
        </div>
        <div class="modal-body pad-top-percent-0">
            <p class="font-15 font-w-500 gray-f-1">An error has occurred.</p>
            <p class="pad-bottom-fixed-30 font-12 gray-f-3">Please contact our Customer Service 0333 332 1111.</p>
        </div>
    </script>

    <script id="template/hyperPremiseHaveActiveServiceOrder.html" type="text/ng-template">
        <div class="modal-header">
            <button type="button" class="close" onclick="window.location.href='{home-url}{business}'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h2 class="modal-title">Have you selected the right address?</h2>
        </div>
        <div class="modal-body pad-top-percent-0">
            <p class="font-15 font-w-500 gray-f-1">We have previously received a request for service for this address.</p>
            <p class="pad-bottom-fixed-30 font-12 gray-f-3">If this is your address, please contact Customer Support on 0333 332 1120 for further assistance.</p>
        </div>
    </script>

    <link rel="icon" href="{base-url}/images/favicon.ico" />
    <meta name="google-site-verification" content="QfN-ZU84czT2R7C1PkP4S3mzA--8X-lBnTxByLPGd98" />
</head>

<body class="{header-body-class}">
	<input type="hidden" id="baseURL" value="{base-url}" />
	<div class="pad-top-fixed-15" >
		<!-- BEGIN OF HEADER -->
		<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 ">
			<nav class="navbar navbar-default" role="navigation">
				<div>
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<!-- tost icon-->
                            <span class="sr-only">Toggle navigation</span> <!-- tost icon-->
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
						</button>
						<a href="{home-url}"><img id="Hyperoptic Logo" class="marg-right-fixed-20" src="{base-url}/images/logo-top-left.png" alt="Hyperoptic Logo" title="Hyperoptic" /></a>
					</div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"id="bs-example-navbar-collapse-1" style="overflow-x: hidden;">
                        <!-- START BLOCK : Residential-header -->
                        <a href="{home-url}"><p class="pad-right-fixed-15 font-f-bariol-regular font-21 font-w-600 black-f-1 header-rbp-links header-rbp-links-l-768">Residential</p></a>
                        <a href="{home-url}business-package"><p class="marg-top-fixed-m5 pad-right-fixed-15 font-f-bariol-regular font-21 gray-f-4 header-rbp-links header-rbp-links-l-768">Business</p></a>
                        <a href="{home-url}property"><p class="marg-top-fixed-m5 pad-right-fixed-15 font-f-bariol-regular font-21 gray-f-4 header-rbp-links header-rbp-links-l-768">Property</p></a>
                        <!-- END BLOCK : Residential-header -->
                        <!-- START BLOCK : Business-header -->
					    <a href="{home-url}"><p class="pad-right-fixed-15 font-f-bariol-regular font-21 gray-f-4 header-rbp-links header-rbp-links-l-768">Residential</p></a>
                        <a href="{home-url}business-package"><p class="marg-top-fixed-m5 pad-right-fixed-15 font-f-bariol-regular font-21 font-w-600 black-f-1 header-rbp-links header-rbp-links-l-768">Business</p></a>
                        <a href="{home-url}property"><p class="marg-top-fixed-m5 pad-right-fixed-15 font-f-bariol-regular font-21 gray-f-4 header-rbp-links header-rbp-links-l-768" >Property</p></a>
                        <!-- END BLOCK : Business-header -->
						<!-- START BLOCK : sign-out -->
						<a href="{home-url}logout"> <p class="font-15 blue-navy-f-1 pad-left-fixed-20 pad-top-fixed-5 pull-right">  Sign out </p>  </a>
						<!-- END BLOCK : sign-out -->
						<a href="{home-url}myaccount"><img id="user-avatar-icon" class="pull-right pad-bottom-fixed-5 pad-left-fixed-30" src="{base-url}/images/user-avatar{blue}-icon.png" alt="Hyperoptic Residential info"  />  </a>
						<a href="{home-url}help-and-advice/"><img id="chat-icon" class="pull-right pad-left-fixed-30" src="{base-url}/images/chat-icon.png" alt="Hyperoptic Residential info"  />  </a>
						<a href="javascript:openSearch()"><img id="search-icon" class="pull-right pad-left-fixed-30" src="{base-url}/images/search-icon.png" alt="Hyperoptic Residential info"  />  </a>
					</div>
					<!-- /.navbar-collapse -->
				</div>
			</nav>
		</div>
		<div id="search-bar-top" class="row container-fluid pad-left-percent-19 pad-right-percent-19 b-t-1px-l-gray register-popup-d-n"> <!-- Search document colum -->
            <form role="search" method="get" class="search-form" action="{home-url}">
	            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
	                <p class=" pad-top-fixed-15 font-12 pad-top-fixed-10 gray-f-4 l-h-small"> SEARCH SITE </p>
	                <input type="text" class="form-control font-f-bariol-light input-h-search b-l-3px-l-gray" placeholder="Search" name="s" autofocus="autofocus" />
	                <p class="pad-top-fixed-15 font-12 pad-bottom-fixed-10 gray-f-4 l-h-small">Please enter to begin search</p>
	            </div>
            </form>
        </div><!-- End of Search document colum -->   
		<!-- /.container-fluid -->
		<!-- END OF HEADER -->

    
