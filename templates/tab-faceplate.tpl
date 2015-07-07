<div class="tab-pane fade" id="tab-3">
    <div class="row container-fluid"> <!-- Row for Faceplate Only Package -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0">
            <!-- Column 1   -->
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                <!-- 1/2 of Column 1   -->
                <div class="marg-top-fixed-15 marg-bottom-fixed-30 gray-f-2 font-12"></div>
                <div class="blue-navy-f-2 font-18 font-w-600"> Hyperoptic Socket Only</div>
                <p class="font-f-bariol-light font-38 gray-f-2">£<span class="prod-faceplate-price">-</span></p>

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
            <!-- End of 1/2 of Column 1   -->
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                <!-- 1/2 of Column 1   -->
                <img class="pull-right marg-top-fixed-50 marg-right-fixed-30"
                     src="{base-url}/images/hyperoptic-port-op.png" alt="Hyperoptic bb"/>
            </div>
            <!-- End of 1/2 of Column 1   -->
        </div>
        <!-- End of Column 1   -->
    </div>
    <!-- End of Row for Faceplate Only Package -->
    <div class="row container-fluid"> <!-- Row for CONTINUE -->
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 marg-all-percent-0">
            <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> To help us serve you better, please tell us why you
                only need a socket at this time? </p>
            <ul class="nav navbar-nav ri-dropdown-big">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                        <span id="youNeedOnlySocket"> -Please tell us- </span>
                        <input type="text" id="youNeedOnlySocketInput" class="hidden" name="youNeedOnlySocket" />
                        <span class="caret arow-down-ri-big "></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#" onclick="faceplateHelpUs('youNeedOnlySocket','In a contract & not ready to order')">In a contract & not ready to order</a></li>
                        <li><a href="#" onclick="faceplateHelpUs('youNeedOnlySocket','Leaseholder/Landlord')">Leaseholder/Landlord</a></li>
                        <li><a href="#" onclick="faceplateHelpUs('youNeedOnlySocket','Not currently at the property')">Not currently at the property</a></li>
                        <li><a href="#" onclick="faceplateHelpUs('youNeedOnlySocket','Other')">Other</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="otherContainer" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 marg-all-percent-0 hidden" >
            <p class="marg-top-fixed-10 font-13 gray-f-2"> Other </p>
            <input type="email" class="form-control input-ri" placeholder="Please tell us why" name="other" id="otherInput" />
        </div>
        <div id="contractEndContainer" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 marg-all-percent-0 hidden" >
            <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> When does your current contract expire? </p>
            <ul class="nav navbar-nav ri-dropdown-big">
                <li   class="dropdown">
                    <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                        <span id="contractEnd"> -Select- </span>
                        <input type="text" id="contractEndInput" class="hidden" name="contractEnd" />
                        <span class="caret arow-down-ri-big "></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#" onclick="setDropDownValue('contractEnd','< 3 months')">< 3 months</a></li>
                        <li><a href="#" onclick="setDropDownValue('contractEnd','3 - 6 months')">3 - 6 months</a></li>
                        <li><a href="#" onclick="setDropDownValue('contractEnd','6 - 12 months')">6 - 12 months</a></li>
                        <li><a href="#" onclick="setDropDownValue('contractEnd','12-24 months')">12 - 24 months</a></li>
                        <li><a href="#" onclick="setDropDownValue('contractEnd','I dont have a contract')">I don't have a contract</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0" >
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-1">
                </div>
            </div><!-- End of 1/2 of Column 6   -->
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                <button type="submit" class="btn btn-primary " style="float:right" onclick="goToNextPanelFaceplate()" disabled="disabled" id="faceplateContinueBtn">CONTINUE</button>
                <div class="font-16 font-w-600 faceplate-text dis-none">Please contact Customer Support (0333 332 1111) to purchase a Hyperoptic socket.</div>
            </div><!-- End of 1/2 of Column 6   -->
        </div>
    </div>
    <!-- End of Row for CONTINUE -->
</div>