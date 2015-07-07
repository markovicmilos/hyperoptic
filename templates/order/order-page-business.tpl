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
                <div class="  col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-10 " >
                    <img class="face-plate-img" src="{base-url}/images/hyperoptic-face-plate.jpg" alt="Hyperoptic bb"  />
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
                                                        <tab heading="Broadband" select="tabBSelected()">
                                                            <div class="marg-top-fixed-15 marg-bottom-fixed-30 gray-f-2 font-12"> SELECT BROADBAND PACKAGE </div>
                                                            <hyper-product product="productB" on-product-activate="productActivated(id)" ng-repeat="productB in productsB">
                                                                <hyper-product-description>
                                                                </hyper-product-description>
                                                            </hyper-product>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 marg-bottom-fixed-15  pad-left-percent-0 b-b-1px-l-gray">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                    <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0">
                                                                        <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2">
                                                                            <input id="checkbox-4" type="checkbox" ng-model="accountDetails.readyToActivate">
                                                                            <label for="checkbox-4">
                                                                                <span class="blue-navy-f-2">I HAVE HYPERHUB</span>
                                                                                <p class="l-h-small"> By ticking this you confirm that your Hypersocket is installed and that you have received your Hyperoptic router. </p>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
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
                                                                        ng-click="openAccordions.two = true; scrollToMovingElement( 'acc2' )">CONTINUE</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </accordion-group>
                                            <accordion-group id="acc2" index="2" heading="Account Details" is-open="openAccordions.two" not-valid="!isSecondBusinessAccordionValid()" done="doneAccordions.two" is-disabled="disableAllAccordions">
                                                <form id="accountDetailsForm" name="accountDetailsForm"
                                                      angular-validator-submit="onSubmittedBusinessAccountDetailsForm()"
                                                      novalidate angular-validator>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                        <p class="marg-left-fixed-15 font-12 gray-f-2 "> ACCOUNT DETAILS </p>

                                                        <div class="input-group-h first-name-bu col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                            <p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Company Name </p>
                                                            <input name="firstName" class="form-control input-ri" placeholder="Company Name" type="text"
                                                                   ng-model = "accountDetails.firstName"
                                                                   validator = "nameValidator(accountDetails.firstName) === true"
                                                                   invalid-message = "nameValidator(accountDetails.firstName)"
                                                                   validate-on="dirty" />
                                                        </div>
                                                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                            <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Registration number </p>
                                                            <input name="lastName" class="form-control input-ri" placeholder="Registration number" type="text"
                                                                   ng-model = "accountDetails.lastName"
                                                                   validator = "businessNumberValidator(accountDetails.lastName) === true"
                                                                   invalid-message = "businessNumberValidator(accountDetails.lastName)"
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
                                                                <input name="email" class="form-control input-ri" placeholder="Email address" type="text"
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
                                                                <input name="address" id="address" class="form-control input-ri" placeholder="" disabled="disabled" value="{address}" type="text" />
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 ">
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> City </p>
                                                                    <input name="city" id="city" class="form-control input-ri" placeholder="" disabled="disabled" value="{city}" type="text"
                                                                           ng-model="accountDetails.city" />
                                                                </div>
                                                                <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                                                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Postcode </p>
                                                                    <input name="postcode" id="postcode" class="form-control input-ri" placeholder="" disabled="disabled" value="{postcode}" type="text"
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
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-20 pad-right-percent-0">
                                                                <p class="font-13 gray-f-2 font-w-700">Claim your free connection?*
                                                                    <img id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"
                                                                         tooltip="Hyperoptic is a pre-registered supplier of the Governments Connected Voucher Scheme which covers cost of your installation. By ticking this you are confirming you have read our terms and conditions and are eligible for the scheme."
                                                                         tooltip-placement="bottom"
                                                                         tooltip-class="tooltipInfo" />
                                                                </p>
                                                                <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2">
                                                                    <input id="chCVS" type="checkbox" class="allMustBeChecked" ng-model="accountDetails.cvs">
                                                                    <label for="chCVS">
                                                                        Connected Voucher Scheme
                                                                    </label>
                                                                </div>
                                                                <p class="font-11 gray-f-2 font-w-400">* All CVS credits will be applied once your order details have been validated </p>
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
                                            <accordion-group id="acc4" index="4" heading="Confirmation" is-open="openAccordions.four" done="doneAccordions.four" not-valid="!isFourthBusinessAccordionValid()" is-disabled="disableAllAccordions">
                                                <div class="row container-fluid pad-right-percent-0 pad-left-percent-0">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                        <div class="marg-top-fixed-15 pad-bottom-fixed-15 pad-left-fixed-15 gray-f-2 font-13">
                                                            Please check the following details before placing your order
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
                                                        <div id="ac-d-op" class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-15 gray-bg-3">
                                                                <div class="marg-top-fixed-15 gray-f-2 font-12"> ACCOUNT DETAILS </div>
                                                                <div class="marg-top-fixed-10">
                                                                    <p id="confirmAccountDetails" class="black-f-1 font-18 font-w-600">
                                                                        {{accountDetails.title}} {{accountDetails.firstName}} {{accountDetails.lastName}}<br />
                                                                        {address}<br />
                                                                        {{accountDetails.city}} {{accountDetails.postcode}}
                                                                    </p>
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

                                            <div class="marg-top-fixed-30 pad-left-fixed-15 gray-f-2 font-12 b-l-1px-l-gray order-summary-text" ng-show="showSummaryTable"> ORDER SUMMARY </div>

                                            <div class="container-fluid pad-left-fixed-15 pad-top-fixed-5 pad-bottom-percent-0 col-xs-12 col-sm-12 col-md-12 col-lg-12 b-l-1px-l-gray">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-20 summary-table" ng-show="showSummaryTable">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4 pad-right-percent-0 pad-left-percent-0 ">
                                                            <p class="gray-f-1 font-13 txt-a-r" ng-show="selectedProduct.havePromotion">Promotional / Offer price</p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2 pad-right-percent-0 pad-left-percent-0 ">
                                                            <p class="gray-f-1 font-13 txt-a-r">Standard Price</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0">
                                                            <p class="gray-f-1 font-12 font-w-600 ">Product description</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 pad-left-percent-0">
                                                            <p class="gray-f-1 font-12 font-w-600 pull-right" ng-show="selectedProduct.havePromotion">First {{selectedProduct.promotionDuration}} months</p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 pad-left-percent-0 ">
                                                            <p class="gray-f-1 font-12 font-w-600 pull-right">Ongoing Price</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 white-bg-fff ">
                                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5">
                                                            <p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Broadband</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband monthly-product">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-all-0 pad-left-fixed-5">
                                                            <p class="font-13 gray-f-2 l-h-small font-w-500 prod-title">{{selectedProduct.title}}</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">
                                                            <p class="font-13 gray-f-2 pull-right" ng-show="selectedProduct.havePromotion">£{{excludeVAT(selectedProduct.price) | number:2}}</p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class=" font-13 gray-f-2 pull-right">£{{excludeVAT(selectedProduct.havePromotion ? selectedProduct.afterPromotionPrice : selectedProduct.price) | number:2}}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3 b-t-1px-l-gray prod-vat">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5">
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500">VAT</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right" ng-show="selectedProduct.havePromotion">£{{calculateVAT(selectedProduct.mountlyPrice) | number:2}}</p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£{{calculateVAT(selectedProduct.mountlyPriceAfterPromotion) | number:2}}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-3 b-b-1px-l-gray prod-monthly-payment">
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5">
                                                            <p class="l-h-100 font-16 gray-f-2 font-w-700">Total Monthly Payment</p>
                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0">
                                                            <p class="font-16 black-f-1 font-w-700 pull-right" ng-show="selectedProduct.havePromotion">£{{selectedProduct.mountlyPrice | number:2}}</p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0 pad-left-percent-0 op-0">

                                                        </div>
                                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5">
                                                            <p class=" font-16 black-f-1 font-w-700 pull-right">£{{selectedProduct.mountlyPriceAfterPromotion | number:2}}</p>
                                                        </div>
                                                    </div>

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
                                                            <p class=" font-13 gray-f-2 pull-right">£{{excludeVAT(selectedProduct.connectionFeePrice) | number:2}}</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 white-bg-fff prod-broadband" ng-show="selectedProduct.haveHyperSocket">
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
                                                            <p class=" font-13 gray-f-2 pull-right">£{{excludeVAT(selectedProduct.hyperSocketPrice) | number:2}}</p>
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
                                                            <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£{{calculateVAT(selectedProduct.totalInitialCharges) | number:2}}</p>
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
                                                    <div id="promoCodeForm" class="col-xs-12 col-sm-9 col-md-9 col-lg-9 pad-all-0 pad-top-fixed-30 ">
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
                                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 pad-all-0 pad-top-fixed-30">
                                                        <button id="orderButton" type="submit" class="btn btn-primary" style="float:right" ng-disabled="!canBusinessOrder()" ng-click="onOrderButtonPress()">ORDER</button>
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
