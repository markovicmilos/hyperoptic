<!-- INCLUDE BLOCK : header -->

<div id="mainCtrl" class="pad-top-percent-05" ng-controller="hyperOrderMainCtrl">

    <div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">
        <div>
            <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                <div class=" marg-top-fixed-15" id="top-indicator-op">
                    <ul>
                        <li><a href id="t-i-op1" class="t-i-op" ng-class="openAccordions.one ? 't-i-op-active' : ''" ng-click="openAccordions.one = true; scrollToMovingElement( 'acc1' );">Select Package</a></li>
                        /
                        <li><a href id="t-i-op2" class="t-i-op" ng-class="openAccordions.two ? 't-i-op-active' : ''" ng-click="openAccordions.two = true; scrollToMovingElement( 'acc2' );">Account Details</a></li>
                        /
                        <li><a href id="t-i-op3" class="t-i-op" ng-class="openAccordions.three ? 't-i-op-active' : ''" ng-click="openAccordions.three = true; scrollToMovingElement( 'acc3' );">Payment Details</a></li>
                        /
                        <li><a href id="t-i-op4" class="t-i-op" ng-class="openAccordions.four ? 't-i-op-active' : ''" ng-click="openAccordions.four = true; scrollToMovingElement( 'acc4' );">Confirmation</a></li>
                    </ul>
                </div>
                <a href="#"><p class=" font-f-bariol-light font-42 font-w-100 gray-f-4 l-h-130"> Join the digital revolution </p></a>
            </div>
        </div>
    </div>

    <div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">
        <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
            <div class="row container-fluid ">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 pad-right-percent-0 pad-left-percent-0 gray-bg-1">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                        <div class=" marg-top-fixed-30 marg-bottom-fixed-15 gray-f-2 font-12"> SELECT CONTRACT LENGTH </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0" ng-class="socketOnly? 'f-d-grayscale-op' : ''">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0"  ng-class="socketOnly? 'f-d-grayscale-op' : ''">
                            <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2" ng-class="socketOnly? 'f-d-grayscale-op' : ''">
                                <input id="checkboxContract-12" type="checkbox" ng-checked="contractLength == 12" ng-click="changeContractType(12)" ng-disabled="socketOnly? 'true' : ''">
                                <label for="checkboxContract-12" ng-class="socketOnly? 'f-d-grayscale-op' : ''">
                                    <span class="blue-navy-f-2"> 12 MONTH CONTRACT</span>
                                    <p class="l-h-small"> Minimum 12 month term applies. </p>
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 " ng-class="socketOnly? 'socketOnly' : ''">
                                <input id="checkboxContract-1" type="checkbox" ng-checked="contractLength == 1" ng-click="changeContractType(1)" ng-disabled="socketOnly? 'true' : ''">
                                <label for="checkboxContract-1" ng-class="socketOnly? 'f-d-grayscale-op' : ''">
                                    <span class="blue-navy-f-2"> NO CONTRACT </span>
                                    <p class="l-h-small"> No commitment, just 30 days notice.  </p>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div id="promoCodeForm" class="col-xs-12 col-sm-9 col-md-9 col-lg-9 pad-all-0 pad-top-fixed-30 pad-bottom-fixed-30">
                        <input class="form-control input-pc-op dis-inline-b promo-code" placeholder="Promo code" type="text" ng-model="promocode" />
                        <button type="submit" class="btn btn-primary btn-apply marg-left-fixed-10 dis-inline-b promo-code-submit" ng-click="onPromoCodeApplied()">APPLY</button>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                            <div class="col-xs-8 col-sm-9 col-md-9 col-lg-9 pad-all-0">
                                <div id="promocodemsg">
                                    <p ng-show="showInvalidPromoCode" class="pc-p-op font-13" style="color: red;">Invalid promo code!</p>
                                    <p ng-show="showPromoCodeHasBeenApplied" class="pc-p-op font-13">Thank you, your promo code has been applied.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-md-12">
                    <div class="row">
                        <div id="border-right-1" class="col-xs-12 col-sm-12 col-md-12 col-lg-10 pad-all-0 marg-bottom-fixed-10 b-r-1px-l-gray">
                            <div class="row container-fluid">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-15 pad-right-0-l-768 pad-left-percent-0">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-0-l-768 pad-left-percent-0">
                                        <accordion close-others="true">
                                            <accordion-group id="acc1" index="1" heading="Select Package" is-open="openAccordions.one" not-valid="!isFirstAccordionValid()" done="doneAccordions.one">
                                                <div class="panel-body pad-all-0 pad-top-fixed-30">
                                                    <tabset>
                                                        <tab heading="Broadband and Phone" select="tabBAndPSelected()" active="activeTab.one" disabled="disableTab.one">
                                                            <div class="marg-top-fixed-15 marg-bottom-fixed-30 gray-f-2 font-12"> SELECT BROADBAND PACKAGE </div>
                                                            <hyper-product product="productBAndPhone" last="$last" contract-status="contractStatus()" on-product-activate="productActivated(id)" ng-repeat="productBAndPhone in productsBAndPhone">
                                                                <hyper-product-description>
                                                                </hyper-product-description>
                                                            </hyper-product>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 marg-bottom-fixed-15  pad-left-percent-0 b-b-1px-l-gray">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                    <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0">
                                                                        <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2">
                                                                            <input id="checkbox-4" type="checkbox" ng-model="accountDetails.readyToActivate">
                                                                            <label for="checkbox-4">
                                                                                <span class="blue-navy-f-2">I HAVE A HYPERHUB ROUTER</span>
                                                                                <p class="l-h-small"> I confirm that I have received my HyperHub Router. If you haven’t, we will send you one with our engineer or in the mail. </p>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row container-fluid" ng-show="selectedProduct.haveLineRental">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-10 pad-right-percent-0 pad-left-percent-0">
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                                        <div class="pad-left-fixed-15 phone-descrption-op" ng-show="showPhoneDescription">
                                                                            <p class="marg-top-fixed-15 gray-f-2 font-13"> Chat longer for less, with free evening and weekend calls on our Hyperoptic phone. </p>
                                                                            <ul class=" pad-left-fixed-15 gray-f-2 font-13">
                                                                                <li>Unlimited evening and weekend UK landline calls, including 0870 and 0845 numbers</li>
                                                                                <li>Competitive UK landline calls for 7p per minute with 10p set up fee</li>
                                                                                <li>Calling features include personalised voicemail, call waiting and caller display</li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 pad-left-percent-0">
                                                                        <div class="blue-navy-f-2 font-18 font-w-600 b-r-1px-l-gray b-r-0-l-768" ng-mouseenter="showPhoneDescription = true" ng-mouseleave="showPhoneDescription = false"> Phone
                                                                            <img class="pad-left-fixed-5 cursor-p" src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm" />
                                                                        </div>
                                                                        <p class="pad-bottom-fixed-60 font-f-bariol-light font-38 gray-f-2 product-line-rental-price b-r-1px-l-gray pad-bottom-15-l-768 b-r-0-l-768">£{{selectedProduct.lineRentalPrice | number:2}}</p>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10">
                                                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
                                                                            <div class="pad-top-fixed-5 gray-f-2 font-12"> ADD-ONS </div>
                                                                        </div>
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 pad-bottom-fixed-5 pad-left-percent-0 b-b-1px-l-gray item-anytime-uk"
                                                                             ng-show="selectedProduct.haveAnytimeUK">
                                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
                                                                                <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-1 ">
                                                                                    <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                                                                                        <input id="checkbox-1" type="checkbox" ng-model="selectedProduct.takeAnytimeUK">
                                                                                        <label for="checkbox-1">
                                                                                            <span class="blue-navy-f-2"> ANYTIME UK</span>
                                                                                            <p class="l-h-small"> Includes all calls to UK landline anytime. </p>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
                                                                                <p class="marg-top-fixed-10 font-f-bariol-regular font-22 font-w-500 gray-f-2 pull-right ">£{{selectedProduct.anytimeUKPrice | number:2}}
                                                                                    <span class="font-f-open-sans" style="font-size:13px;">per month</span>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 pad-bottom-fixed-5 pad-left-percent-0 item-international-calls"
                                                                             ng-show="selectedProduct.haveInternationalCalls">
                                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
                                                                                <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-1 ">
                                                                                    <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                                                                                        <input id="checkbox-2" type="checkbox" ng-model="selectedProduct.takeInternationalCalls">
                                                                                        <label for="checkbox-2">
                                                                                            <span class="blue-navy-f-2"> INTERNATIONAL CALLS</span>
                                                                                            <p class="l-h-small"> Discounted international calls to over 50 destinations </p>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
                                                                                <p class="marg-top-fixed-10 font-f-bariol-regular font-22 font-w-500 gray-f-2 pull-right ">£{{selectedProduct.internationalCallsPrice | number:2}}
                                                                                    <span class="font-f-open-sans" style="font-size:13px;">per month</span>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <div class="row container-fluid">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0"
                                                                     ng-show="selectedProduct.havePhone">

                                                                </div>
                                                                <form name="keepPhone">
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 marg-top-fixed-15 pad-right-percent-0 marg-bottom-fixed-15  pad-left-percent-0 gray-bg-3"
                                                                         ng-show="selectedProduct.havePhone">
                                                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                                            <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-left-percent-0">
                                                                                <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                                                                                    <input id="checkbox-3" type="checkbox" ng-model="selectedProduct.useExistingPhone">
                                                                                    <label for="checkbox-3">
                                                                                        <p> KEEP EXISTING PHONE NUMBER</p>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="input-group-h col-xs-6 col-sm-6 col-md-6 col-lg-6 marg-top-fixed-5 marg-bottom-fixed-10 pad-left-percent-0"
                                                                                ng-class="(selectedProduct.useExistingPhone && ( selectedProduct.existingPhone == null || selectedProduct.existingPhone == '' )) || !isValidUKPhone(selectedProduct.existingPhone) ? 'has-error' : ''">
                                                                            <input ng-disabled="!selectedProduct.useExistingPhone" class="form-control input-ri port-phone-number"
                                                                                   placeholder="Phone number (optional)" type="text"
                                                                                   ng-model="selectedProduct.existingPhone" name="existingPhone"/>
                                                                            <span ng-show="selectedProduct.useExistingPhone && ( selectedProduct.existingPhone == null || selectedProduct.existingPhone == '' )"
                                                                                  class="help-block">This field is required.</span>
                                                                            <span ng-show="!isValidUKPhone(selectedProduct.existingPhone)" class="help-block">You must enter valid UK phone number</span>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </tab>
                                                        <tab heading="Broadband Only" select="tabBSelected()" active="activeTab.two" disabled="disableTab.two">
                                                            <div class="marg-top-fixed-15 marg-bottom-fixed-30 gray-f-2 font-12"> SELECT BROADBAND PACKAGE </div>
                                                            <hyper-product product="productB" on-product-activate="productActivated(id)" ng-repeat="productB in productsB" contract-status="contractStatus()">
                                                                <hyper-product-description>
                                                                </hyper-product-description>
                                                            </hyper-product>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 marg-bottom-fixed-15  pad-left-percent-0 b-b-1px-l-gray">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                    <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0">
                                                                        <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2">
                                                                            <input id="checkbox-4" type="checkbox" ng-model="accountDetails.readyToActivate">
                                                                            <label for="checkbox-4">
                                                                                <span class="blue-navy-f-2">I HAVE A HYPERHUB ROUTER</span>
                                                                                <p class="l-h-small"> I confirm that I have received my HyperHub Router. If you haven’t, we will send you one with our engineer or in the mail. </p>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </tab>
                                                        <tab heading="Hyperoptic Socket Only" select="tabHyperSocketSelected()" active="activeTab.three" disabled="disableTab.three">
                                                            <div class="row container-fluid">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0">
                                                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                                                                        <div class="marg-top-fixed-15 marg-bottom-fixed-30 gray-f-2 font-12"></div>
                                                                        <div class="blue-navy-f-2 font-18 font-w-600"> Hyperoptic Socket Only</div>
                                                                        <p class="font-f-bariol-light font-38 gray-f-2">£<span class="prod-faceplate-price">{{selectedProduct.price | number:2}}</span></p>
                                                                        <p class="marg-top-fixed-15 gray-f-2 font-13"> Prepare to experience the UK's fastest broaband - order
                                                                            your Hyperoptic socket </p>
                                                                        <ul class=" pad-left-fixed-15 gray-f-2 font-13">
                                                                            <li>Increase the attractive of your property to renters or buyers.</li>
                                                                            <li>Increase the choice of broadband providers for your property</li>
                                                                            <li>No obligation to subscribe to broadband</li>
                                                                            <li>No ongoing charges</li>
                                                                        </ul>
                                                                        <p class="marg-top-fixed-15 gray-f-2 font-13"> You do not need to order a Hyperoptic socket if you are
                                                                            ordering broadband. </p>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                                                                        <img class="pull-right marg-top-fixed-50 marg-right-fixed-30" src="https://hyperoptic.com/wp-content/themes/hyperoptic/images/hyperoptic-port-op.png" alt="Hyperoptic bb">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <form name="whyTakeHyperSocket" novalidate angular-validator>
                                                            <div class="row container-fluid">
                                                                <hyper-drop-down init-classes-container="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 marg-all-percent-0"
                                                                                 init-title-classes="marg-top-fixed-10 font-12 gray-f-2 let-space-minus-05 font-13-1600-1700"
                                                                                 title="To help us serve you better, please tell us why you only need a socket at this time?"
                                                                                 placeholder="-Please tell us-" value="selectedProduct.whyYouOnlyNeedHyperSocket" size="big"
                                                                                 options="constants.whyYouTakeJustHyperSocketOptions" is-required="true"></hyper-drop-down>
                                                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 marg-all-percent-0" ng-show="selectedProduct.whyYouOnlyNeedHyperSocket == 'Other'">
                                                                    <p class="marg-top-fixed-10 font-13 gray-f-2"> Other </p>
                                                                    <input class="form-control input-ri" placeholder="Please tell us why" name="other" type="text" ng-model="selectedProduct.whyYouOnlyNeedHyperSocketOther"
                                                                            ng-required="selectedProduct.whyYouOnlyNeedHyperSocket == 'Other'" validate-on="dirty" required-message="'This field is required'" />
                                                                </div>
                                                                <hyper-drop-down init-classes-container="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 marg-all-percent-0"
                                                                                 init-title-classes="marg-top-fixed-10 font-12 gray-f-2 let-space-minus-05 font-13-1600-1700"
                                                                                 title="When does your current contract expire?" size="big"
                                                                                 placeholder="-Select-" value="selectedProduct.whyYouOnlyNeedHyperSocketContractExpire"
                                                                                 options="constants.currentContractExpire"
                                                                                 ng-show="selectedProduct.whyYouOnlyNeedHyperSocket == 'In a contract & not ready to order'"
                                                                                 is-required="true"></hyper-drop-down>
                                                            </div>
                                                            </form>
                                                        </tab>
                                                    </tabset>
                                                    <div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0">
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-1">

                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 pad-right-fixed-15">
                                                                <button type="submit" class="btn btn-primary btn-l-768 pull-right"
                                                                        ng-click="openAccordions.two = true; scrollToMovingElement( 'acc2' )"
                                                                        ng-hide="socketOnly && selectedProduct.price != 0">CONTINUE</button>
                                                                <p class="gray-f-1 font-14 font-w-600 txt-a-j" ng-show="socketOnly && selectedProduct.price != 0">Please contact Customer Support (0333 332 1111) to purchase a Hyperoptic socket.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </accordion-group>
                                            <accordion-group id="acc2" index="2" heading="Account Details" is-open="openAccordions.two" not-valid="!isSecondAccordionValid()" done="doneAccordions.two" is-disabled="disableAllAccordions">
                                                <form id="accountDetailsForm" name="accountDetailsForm"
                                                      onsubmit="angular.element(document.getElementById('mainCtrl')).scope().onSubmitAccountDetailsForm()"
                                                      angular-validator-submit="onSubmittedAccountDetailsForm()"
                                                      novalidate angular-validator>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                        <p class="marg-left-fixed-15 font-12 gray-f-2 "> ACCOUNT DETAILS
                                                            <span id="fb-button-holder" class="pad-left-fixed-30 pull-right">
                                                                <fb:login-button id="facebook-button" scope="public_profile,email" onlogin="checkLoginState();" size="large">
                                                                    Register with Facebook
                                                                </fb:login-button>
                                                            </span>
                                                        </p>

                                                        <hyper-drop-down init-classes-container="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-left-fixed-15"
                                                                         init-title-classes="marg-top-fixed-10 font-13 gray-f-2 font-w-700"
                                                                         title="Title" size="small"
                                                                         placeholder="Mr" value="accountDetails.title"
                                                                         options="constants.titles"></hyper-drop-down>

                                                        <div class="input-group-h first-name-bu col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0">
                                                            <p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> First Name </p>
                                                            <input id="firstname" name="firstName" class="form-control input-ri" placeholder="First name" type="text"
                                                                   ng-model = "accountDetails.firstName"
                                                                   validator = "nameValidator(accountDetails.firstName) === true"
                                                                   invalid-message = "nameValidator(accountDetails.firstName)"
                                                                   validate-on="dirty" />
                                                        </div>
                                                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                            <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Last Name </p>
                                                            <input id="lastname" name="lastName" class="form-control input-ri" placeholder="Last name" type="text"
                                                                   ng-model = "accountDetails.lastName"
                                                                   validator = "nameValidator(accountDetails.lastName) === true"
                                                                   invalid-message = "nameValidator(accountDetails.lastName)"
                                                                   validate-on="dirty" />
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 ">
                                                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Phone number </p>
                                                                <input name="mobile" class="form-control input-ri" placeholder="Phone number" type="text"
                                                                       ng-model = "accountDetails.phone"
                                                                       validator = "ukPhoneValidator(accountDetails.phone) === true"
                                                                       invalid-message = "ukPhoneValidator(accountDetails.phone)"
                                                                       validate-on="dirty" />
                                                            </div>
                                                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                <p class="marg-top-fixed-10 font-13 gray-f-2"> Mobile </p>
                                                                <input name="phone" class="form-control input-ri" placeholder="Mobile" type="text"
                                                                       ng-model = "accountDetails.mobile"
                                                                       validator = "phoneValidator(accountDetails.mobile) === true"
                                                                       invalid-message = "phoneValidator(accountDetails.mobile)"
                                                                       validate-on="dirty" />
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 ">
                                                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 ">
                                                                <p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Email address </p>
                                                                <input id="email" name="email" class="form-control input-ri" placeholder="Email address" type="text"
                                                                       ng-model = "accountDetails.email"
                                                                       validator = "accountMailValidator(accountDetails.email) === true"
                                                                       invalid-message = "accountMailValidator(accountDetails.email)"
                                                                       validate-on="dirty" />
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 ">
                                                            <p class=" marg-top-fixed-15 marg-left-fixed-15 font-12 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray"> BILLING ADDRESS </p>
                                                            <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0  ">
                                                                <p class=" marg-top-fixed-10 font-13 gray-f-2"> Address </p>
                                                                <input name="address" id="address" class="form-control input-ri" placeholder="" disabled="disabled" type="text" value="{address}" />
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 ">
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> City </p>
                                                                    <input name="city" id="city" class="form-control input-ri" placeholder="" disabled="disabled" type="text"
                                                                           ng-model="accountDetails.city" />
                                                                </div>
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Postcode </p>
                                                                    <input name="postcode" id="postcode" class="form-control input-ri" placeholder="" disabled="disabled" type="text"
                                                                           ng-model="accountDetails.postcode" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 ">
                                                            <p class=" marg-top-fixed-15 marg-left-fixed-15 font-13 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray  ">
                                                                Please note that we use your email address provided above together with the password you need to enter below
                                                            </p>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 "><!-- Column 11 -->
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                    <p class="font-13 gray-f-2 font-w-700">Password (min 8 characters)</p>
                                                                    <input name="password" class="form-control input-ri" type="password"
                                                                           ng-model = "accountDetails.password"
                                                                           validator = "passwordValidator(accountDetails.password) === true"
                                                                           invalid-message = "passwordValidator(accountDetails.password)"
                                                                           validate-on="dirty" />
                                                                </div>
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 ">
                                                                    <p class="font-13 gray-f-2 font-w-700">Confirm password</p>
                                                                    <input name="password2" class="form-control input-ri" type="password"
                                                                           ng-model = "accountDetails.passwordAgain"
                                                                           validator = "passwordReValidator(accountDetails.passwordAgain) === true"
                                                                           invalid-message = "passwordReValidator(accountDetails.passwordAgain)"
                                                                           validate-on="blur" />
                                                                </div>
                                                            </div>
                                                            <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 ">
                                                                <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Date of birth </p>
                                                                <input type="text" name="dateOfBirth" class="form-control input-ri" placeholder=" dd/mm/yyyy" hyper-date-picker
                                                                       ng-model="accountDetails.dateOfBirth"
                                                                       validator = "dateValidator(accountDetails.dateOfBirth) === true"
                                                                       invalid-message = "dateValidator(accountDetails.dateOfBirth)"
                                                                       validate-on="blur"/>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 ">
                                                                <hyper-drop-down init-classes-container="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0"
                                                                                 init-title-classes="marg-top-fixed-10 font-13 gray-f-2 font-w-700"
                                                                                 title="How did you hear about us?"
                                                                                 placeholder="-Please tell us-" value="accountDetails.howDidYouHearAboutUs" size="big"
                                                                                 options="constants.hearAboutUs" is-required="true"
                                                                                 validate-trigger-needed="true" validate-trigger-var="accountDetails.submitted"></hyper-drop-down>
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0"
                                                                        ng-show="showHowDidYouHearAboutUsExtra()">
                                                                    <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700" ng-show="accountDetails.howDidYouHearAboutUs == 'A Hyperoptic Engineer'">Name of Engineer</p>
                                                                    <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700" ng-show="accountDetails.howDidYouHearAboutUs == 'Building Champion'">Name of Champion</p>
                                                                    <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700" ng-show="accountDetails.howDidYouHearAboutUs == 'A friend or neighbour'">Name of Friend or Neighbour</p>
                                                                    <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700" ng-show="accountDetails.howDidYouHearAboutUs == 'Other'">How did you hear about us?</p>
                                                                    <input name="howDidYouHearAboutUsExtra" class="form-control input-ri" type="text"
                                                                           ng-model="accountDetails.howDidYouHearAboutUsExtra" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="check-box-container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-top-fixed-15 pad-bottom-fixed-60 gray-bg-1 ">
                                                            <button id="accountDetailsButton" type="submit" class="btn btn-primary btn-l-768 pull-right"
                                                                    ng-click="accountDetails.submitted = true">CONTINUE</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </accordion-group>
                                            <accordion-group id="acc3" index="3" heading="Payment Details" is-open="openAccordions.three" done="doneAccordions.three" not-valid="!isThirdAccordionValid()" is-disabled="!enableBankDetails">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0">
                                                        <p class=" font-f-bariol-regular black-f-1 font-22 font-w-600"> Direct Debit </p>
                                                        <p class="pad-top-fixed-15 font-12 gray-f-1"> SETTING UP A DIRECT DEBIT FOR YOUR HYPEROPTIC SERVICES </p>
                                                        <p class="font-13 gray-f-1 ">
                                                            To set up your Direct Debit Instruction you will need to provide the name of the account holder, the bank or building society account number and sort code. If the amounts to be paid or the payment dates change Hyperoptic Limited will notify you 10 working days in advance of your account being debited or as otherwise agreed.
                                                        </p>
                                                        <p>
                                                            Your payments are protected by the Direct Debit Guarantee. You can read more about this guarantee below.
                                                        </p>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0">
                                                                <p class="pad-top-fixed-15 font-12 gray-f-1"> COMPANY NAME <br>
                                                                    Hyperoptic Ltd
                                                                </p>
                                                                <p class="font-12 gray-f-1">
                                                                    COMPANY ADDRESS  <br>
                                                                </p>
                                                                <p class="font-12 gray-f-1">
                                                                    Unit C401, Westfield London  <br>
                                                                    Ariel Way <br>
                                                                    London, W12 7FD  <br>
                                                                    United Kingdom
                                                                </p>
                                                            </div>
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0">
                                                                <p class="pad-top-fixed-15 font-12 gray-f-1"> SERVICE USER NUMBER <br>
                                                                    437378
                                                                </p>
                                                            </div>
                                                        </div>

                                                        <form id="paymentInfoForm" name="paymentInfoForm"
                                                              angular-validator-submit="onSubmittedPaymentInfoForm()"
                                                              novalidate angular-validator>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " >
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0 pad-right-percent-0 " >
                                                                    <p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Account holder full name </p>
                                                                    <input type="text" id="holdername" name="holdername" class="acceptLettersOnly form-control input-ri" placeholder="Account holder full name"
                                                                           ng-model = "paymentInfo.holderName"
                                                                           validator = "nameValidator(paymentInfo.holderName) === true"
                                                                           invalid-message = "nameValidator(paymentInfo.holderName)"
                                                                           validate-on="dirty" />
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
                                                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0 pad-right-percent-0 " >
                                                                    <div class="input-group-h col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0">
                                                                        <p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Sortcode </p>
                                                                        <input type="text" id="sortcode" name="sortcode" class="form-control input-ri" placeholder="Sortcode"
                                                                               ng-model = "paymentInfo.sortCode"
                                                                               validator = "sortCodeValidator(paymentInfo.sortCode) === true"
                                                                               invalid-message = "sortCodeValidator(paymentInfo.sortCode)"
                                                                               validate-on="dirty" />
                                                                    </div>
                                                                </div>
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-0-l-768 pad-left-0-l-992">
                                                                    <p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Account number </p>
                                                                    <input type="text" id="accountNumber" name="accountNumber" class="form-control input-ri" placeholder="Account number"
                                                                           ng-model = "paymentInfo.accountNumber"
                                                                           validator = "accountNumberValidator(paymentInfo.accountNumber) === true"
                                                                           invalid-message = "accountNumberValidator(paymentInfo.accountNumber)"
                                                                           validate-on="dirty" />
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-20 pad-left-percent-0" >
                                                                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 pad-right-percent-0 pad-left-percent-0" >
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-1" >
                                                                        <p ng-show="paymentInfo.valid !== true && paymentInfo.valid != null" id="paymentInfoError" class="font-12 pad-top-fixed-20 pull-right" style="color: red;">
                                                                            {{paymentInfo.error}}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0" >
                                                                    <button id="paymentInfoButton" type="submit" class="btn btn-primary btn-l-768" style="float:right" {disable-post-buttom}>CHECK</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <form id="paymentInfoContinueForm">
                                                            <div id="authorisedDirectDebit" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 b-all-1px-gray" ng-show="paymentInfo.valid === true" >
                                                                <p class="pad-top-fixed-15 font-14 gray-f-1"> To the manager of your bank: </p>
                                                                <p id="bankName" class="font-13 gray-f-1 "> <b>{{paymentInfo.bank}}</b>  </p>
                                                                <p class="pad-top-fixed-15 font-14 gray-f-1"> Please pay Hyperoptic Limited Direct Debits from this account detailed in this instruction
                                                                    subject to the safeguards assured by the Direct Debit Guarantee. I understand that this instruction may remain with Hyperoptic 																	Limited and, if so, details will be passed electronically to my Bank/Building Society.                                                        </p>
                                                                <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-left-percent-0 gray-bg-1" >
                                                                    <div class="checkbox checkbox-success pad-left-fixed-5 font-14 gray-f-1">
                                                                        <input id="cbAuthorisedDirectDebit" type="checkbox" name="cbAuthorisedDirectDebit" ng-model="paymentInfo.authorisedDirectDebit" />
                                                                        <label for="cbAuthorisedDirectDebit">
                                                                            I am authorised to set up a Direct Debit instruction from the account.
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <p class="font-14 gray-f-1 "> <b>Note:</b> Some Banks and Building Societies may not accept Direct Debit instructions from some types of accounts.

                                                                </p>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-15 marg-bottom-fixed-20 gray-bg-3" >
                                                                <p class="pad-top-fixed-15 font-14 gray-f-1"> THE DIRECT DEBIT GUARANTEE </p>
                                                                <img class=" pad-top-fixed-5 vertical-baseline pull-right" id="live-location-icon"  src="{base-url}/images/direct-debit-logo-op.png" /><p class="marg-top-fixed-15 font-14 gray-f-1">
                                                                </p>
                                                                <ul class="pad-left-fixed-15 font-14 gray-f-1">
                                                                    <li>This Guarantee is offered by all banks and building societies that accept instructions to pay Direct Debits </li>
                                                                    <li>If there are any changes to the amount, date or frequency of your Direct Debit Hyperoptic Limited will notify you 10 working days in advance of your account being debited or as otherwise agreed. If you request Hyperoptic Limited to collect a payment, confirmation of the amount and date will be given to you at the time of the request</li>
                                                                    <li>If an error is made in the payment of your Direct Debit by Hyperoptic Limited or your bank or building society you are entitled to a full and immediate refund of the amount paid from your bank or building society</li>
                                                                    <li>If you receive a refund you are not entitled to, you must pay it back when Hyperoptic Limited asks you to</li>
                                                                    <li>You can cancel a Direct Debit at any time by simply contacting your bank or building society. Written confirmation may be required.</li>
                                                                </ul>
                                                            </div><!-- Direct Debit dethails column -->

                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 " >
                                                                <button id="paymentInfoContinue" type="submit" class="btn btn-primary btn-l-768" style="float:right"
                                                                        ng-disabled="paymentInfo.valid !== true || paymentInfo.authorisedDirectDebit !== true"
                                                                        ng-click="openAccordions.four = true; scrollToMovingElement( 'acc4' )">CONTINUE</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </accordion-group>
                                            <accordion-group id="acc4" index="4" heading="Confirmation" is-open="openAccordions.four" done="doneAccordions.four" not-valid="!isFourthAccordionValid()" is-disabled="disableAllAccordions">
                                                <div class="row container-fluid pad-right-percent-0 pad-left-percent-0">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                        <div class="marg-top-fixed-15 pad-bottom-fixed-15 pad-left-fixed-15 gray-f-2 font-13">
                                                            Please check the following details before placing your order
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                        <div id="ac-d-op" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-15 gray-bg-3">
                                                                <div class="marg-top-fixed-15 gray-f-2 font-12"> ACCOUNT DETAILS </div>
                                                                <div class="marg-top-fixed-10">
                                                                    <p id="confirmAccountDetails" class="black-f-1 font-18 font-w-600">
                                                                        {{accountDetails.title}} {{accountDetails.firstName}} {{accountDetails.lastName}}<br />
                                                                        {address}<br />
                                                                        {{accountDetails.city}} {{accountDetails.postcode}}
                                                                    </p>
                                                                    <p id="confirmDateOfBirth" class="black-f-1 font-18 font-w-600">D.O.B {{accountDetails.dateOfBirth}}</p>
                                                                </div>
                                                                <a href class="font-12 font-w-500 blue-navy-f-2 marg-top-fixed-15 marg-bottom-fixed-15" ng-click="openAccordions.two = true; scrollToMovingElement( 'acc2' );"> Edit </a>
                                                                <div class="marg-top-fixed-15 gray-f-2 font-12"> CONTACT DETAILS </div>
                                                                <div class="marg-top-fixed-10">
                                                                    <p id="confirmContactDetails" class="black-f-1 font-18 font-w-600">
                                                                        Tel. {{accountDetails.phone}}<br>Mob. {{accountDetails.mobile}}<br>Email. {{accountDetails.email}}
                                                                    </p>
                                                                </div>
                                                                <a href class="font-12 font-w-500 blue-navy-f-2 marg-top-fixed-15 marg-bottom-fixed-15" ng-click="openAccordions.two = true; scrollToMovingElement( 'acc2' );"> Edit </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0">
                                                            <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-15 gray-bg-3">
                                                                <div class="marg-top-fixed-15 gray-f-2  font-12  "> BILLING DETAILS </div>
                                                                <div class="marg-top-fixed-10 ">
                                                                    <p id="confirmBillingDetails" class="black-f-1 font-18 font-w-600">
                                                                        {{accountDetails.title}} {{accountDetails.firstName}} {{accountDetails.lastName}}<br />
                                                                        {address}<br />
                                                                        {{accountDetails.city}} {{accountDetails.postcode}}
                                                                    </p>
                                                                    <p class="black-f-1 font-18 font-w-600 op-0"> D.O.B 02/11/71 </p>
                                                                </div>
                                                                <a href class="font-12 font-w-500 blue-navy-f-2 marg-top-fixed-15 marg-bottom-fixed-15" ng-click="openAccordions.two = true; scrollToMovingElement( 'acc2' );"> Edit </a>
                                                                <div class="marg-top-fixed-15 gray-f-2 font-12" ng-show="enableBankDetails"> BANK DETAILS </div>
                                                                <div class="marg-top-fixed-10" ng-show="enableBankDetails">
                                                                    <p id="confirmBankDetails" class="black-f-1 font-18 font-w-600">
                                                                        Bank: {{paymentInfo.submitedInfo.bank}}<br>Sort Code: {{paymentInfo.submitedInfo.sortCode}}<br>Acc No: {{paymentInfo.submitedInfo.accountNumber}}
                                                                    </p>
                                                                </div>
                                                                <a href class="font-12 font-w-500 blue-navy-f-2 marg-top-fixed-15 marg-bottom-fixed-15" ng-click="openAccordions.three = true; scrollToMovingElement( 'acc3' );"
                                                                   ng-show="enableBankDetails"> Edit </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </accordion-group>
                                        </accordion>

                                        <div ng-show="showButtonsOnBottom">

                                            <div class="marg-top-fixed-30 pad-left-fixed-15 gray-f-2 font-12 order-summary-text" ng-show="showSummaryTable"> ORDER SUMMARY </div>


                                            <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                                                <div class="panel-body pad-all-0 pad-top-fixed-30">
                                                    <div>
                                                        <ul class="nav nav-tabs-op" ng-show="selectedProduct.havePromotion && showSummaryTable">
                                                            <li class="{{selectedProduct.havePromotion ? 'active' : ''}}"><a href="#promotional-price" data-toggle="tab">Promotional / Offer price</a></li>
                                                            <li class="{{selectedProduct.havePromotion ? '' : 'active'}}"><a href="#standard-price" data-toggle="tab">Standard Price</a></li>
                                                        </ul>
                                                        <div class="tab-content"><!-- Tab 2 butoons tab-content -->
                                                        <div class="{{selectedProduct.havePromotion ? 'tab-pane fade active in' : 'tab-pane fade '}}" id="promotional-price"><!-- Promotional / Offer price Tab 1 -->
                                                            <div class="container-fluid pad-left-fixed-15 pad-top-fixed-5 pad-bottom-percent-0 col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-20 summary-table" ng-show="showSummaryTable">

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-30 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
                                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-right-percent-0 pad-left-percent-0">
                                                                            <p class="gray-f-1 font-12 font-w-600 ">Product description</p>
                                                                        </div>
                                                                        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 pad-right-percent-0 pad-left-percent-0">
                                                                            <p class="gray-f-1 font-12 font-w-600 pull-right">First {{selectedProduct.promotionDuration}} month(s). Standard price applies afterwards  </p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 white-bg-fff ">
                                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5">
                                                                            <p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Broadband</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband monthly-product">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">{{selectedProduct.title}}&nbsp;({{contractStatus()}})</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5 pull-right">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.price | number:2}}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 b-t-1px-l-gray pad-left-percent-0 white-bg-fff"
                                                                         ng-show="selectedProduct.havePhone">
                                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5">
                                                                            <p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Telephone</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.havePhone">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">Line Rental</p>
                                                                        </div>
                                                                          <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.lineRentalPrice | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.takeAnytimeUK">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">Anytime UK</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.anytimeUKPrice | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.takeInternationalCalls">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">International Calls</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.internationalCallsPrice | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3 b-t-1px-l-gray prod-vat">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-left-fixed-5">
                                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500">VAT</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">Included</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-3 b-b-1px-l-gray prod-monthly-payment">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-left-fixed-5">
                                                                            <p class="l-h-100 font-16 gray-f-2 font-w-700">Total Monthly Payment</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-16 black-f-1 font-w-700 pull-right">£{{selectedProduct.mountlyPrice | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div><!-- End of Promotional / Offer price Tab 1 -->
                                                        <div class="{{selectedProduct.havePromotion ? 'tab-pane fade ' : 'tab-pane fade active in'}}" id="standard-price"><!-- Standard Price Tab 2 -->
                                                            <div class="container-fluid pad-left-fixed-15 pad-top-fixed-5 pad-bottom-percent-0 col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-20 summary-table" ng-show="showSummaryTable">

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-30 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
                                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-right-percent-0 pad-left-percent-0">
                                                                            <p class="gray-f-1 font-12 font-w-600 ">Product description</p>
                                                                        </div>
                                                                        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 pad-right-percent-0 pad-left-percent-0">

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 white-bg-fff ">
                                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5">
                                                                            <p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Broadband</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband monthly-product">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">{{selectedProduct.title}}&nbsp;({{contractStatus()}})</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class="font-13 gray-f-2 pull-right">£{{(selectedProduct.afterPromotionPrice) | number:2}}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 b-t-1px-l-gray pad-left-percent-0 white-bg-fff"
                                                                         ng-show="selectedProduct.havePhone">
                                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5">
                                                                            <p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Telephone</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.havePhone">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">Line Rental</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.lineRentalPriceAfterPromotion | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.takeAnytimeUK">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">Anytime UK</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.anytimeUKPriceAfterPromotion | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.takeInternationalCalls">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-all-0 pad-left-fixed-5">
                                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">International Calls</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.internationalCallsPriceAfterPromotion | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3 b-t-1px-l-gray prod-vat">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-left-fixed-5">
                                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500">VAT</p>
                                                                        </div>
                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">Included</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-3 b-b-1px-l-gray prod-monthly-payment">
                                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 pad-left-fixed-5">
                                                                            <p class="l-h-100 font-16 gray-f-2 font-w-700">Total Monthly Payment</p>
                                                                        </div>

                                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-fixed-5">
                                                                            <p class=" font-16 black-f-1 font-w-700 pull-right">£{{selectedProduct.mountlyPriceAfterPromotion | number:2}}</p>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                        </div><!-- Standard Price Tab 2 -->


                                                        </div><!-- Tab 2 butoons tab-content -->
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="container-fluid pad-left-fixed-15 pad-top-fixed-5 pad-bottom-percent-0 col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-20 summary-table" ng-show="showSummaryTable">

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-45 pad-top-fixed-15 pad-bottom-fixed-10 pad-right-percent-0 pad-left-percent-0 white-bg-fff b-t-1px-l-gray">
                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5">
                                                            <p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Initial Charges</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-all-0 pad-left-fixed-5">
                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">Connection fee</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.connectionFeePrice | number:2}}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-all-0 pad-left-fixed-5">
                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">Hyperoptic Socket</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">

                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class=" font-13 gray-f-2 pull-right">£{{selectedProduct.hyperSocketPrice | number:2}}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3 b-t-1px-l-gray prod-one-time-vat">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5">
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500">VAT</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">

                                                        </div>
                                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">Included</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-3 prod-one-time-payment">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5">
                                                            <p class="pad-top-fixed-5 font-16 gray-f-2 l-h-small font-w-700">Total Initial Charges</p>
                                                        </div>
                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-left-fixed-5">
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500"></p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class=" pad-top-fixed-5 font-16 l-h-small black-f-1 font-w-700 pull-right">£{{selectedProduct.totalInitialCharges | number:2}}</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="check-box-container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15">
                                                    <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                                                        <input id="chAgree1" class="allMustBeChecked" type="checkbox" ng-model="agreeTermsAndConditions">
                                                        <label for="chAgree1">
                                                            I agree to the <a onclick="window.open('{home-url}{terms-and-conditions}', 'Terms and Conditions', 'scrollbars=1,height=900,width=1200');" class="blue-navy-f-2"> Terms and Conditions </a>
                                                        </label>
                                                    </div>
                                                    <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                                                        <input id="chAgree2" class="allMustBeChecked" type="checkbox" ng-model="agreePrivacyAndCookies">
                                                        <label for="chAgree2">
                                                            I have read and agree to the terms & conditions and <a onclick="window.open('{home-url}privacy-and-cookie-policy', 'Terms and Conditions', 'scrollbars=1,height=900,width=1200');" class="blue-navy-f-2">privacy & cookies notice</a>
                                                        </label>
                                                    </div>
                                                    <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                                                        <input id="chAgree3" type="checkbox" ng-model="agreeToReceiveNewsletter">
                                                        <label for="chAgree3">
                                                            I want to receive information about goods and services from Hyperoptic
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 gray-bg-1 b-t-1px-l-gray">
                                                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 pad-all-0 pad-top-fixed-30 ">
                                                    </div>
                                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 pad-all-0 pad-top-fixed-30">
                                                        <button id="orderButton" type="submit" class="btn btn-primary" style="float:right" ng-disabled="!canOrder()" ng-click="onOrderButtonPress()">ORDER</button>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="get-touch-bu" class="col-xs-12 col-sm-12 col-md-12 col-lg-2 marg-top-fixed-10" >
                            <div id="ldh-1"  class=" gray-f-2  font-12  "> AVAILABILITY </div>

                            <div id="ldp-1" class="marg-top-fixed-15 ">
                                <img class=" pad-right-fixed-10 vertical-baseline" id="live-location-icon"  src="{base-url}/images/map-marker-cian-green-icon.png" alt="Hyperoptic fb"/>
                                <span class=" pad-top-fixed-20 black-f-1 font-18 font-w-600"> {live-or-pre-order} </span>
                            </div>

                            <div id="ldh-2"  class=" marg-top-fixed-30 gray-f-2  font-12  "> INSTALLATION ADDRESS </div>
                            <div id="ldp-2" class="marg-top-fixed-10 ">
                                <p class="black-f-1 font-18 font-w-600">
                                    {addressBox}
                                </p>
                            </div>
                            <a href="{routingURL}" class="font-12 font-w-500 blue-navy-f-2 marg-top-fixed-15 marg-bottom-fixed-15">  Change address  </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
