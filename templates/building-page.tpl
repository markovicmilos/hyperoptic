            <div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">
                     <!-- INCLUDE BLOCK : ri-bar -->
                     <!-- INCLUDE BLOCK : building-page-head-empty -->

                     <!-- INCLUDE BLOCK : live-header -->

                     <!-- INCLUDE BLOCK : ri-check -->
                     <!-- INCLUDE BLOCK : availability-check -->

                     <!-- Popup registering interest  -->
                     <div id="register-popup" class="row marg-right-percent-0 marg-left-percent-0 gray-bg-3 b-b-1px-gray register-popup-d-n ">
                         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gray-bg-3">
                             <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11 pad-left-percent-0">
                                 <p class=" marg-top-fixed-20 marg-left-fixed-15 font-42 blue-navy-f-1"> Register interest </p>
                             </div>
                             <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 pad-right-percent-0">
                                 <button type="button" class="add-inerest-btn font-42 gray-f-2 pull-right" onclick="closeRIonRIPage()"><span>×</span></button>
                             </div>
                         </div>
                         <div id="install-adress" class="marg-left-fixed-15 pad-bottom-fixed-10" >
                             <p class=" pad-top-fixed-15 marg-left-fixed-20 font-12 gray-f-2"> ADDRESS </p>
                             <p class="marg-left-fixed-20 font-16 l-h-130 black-f-1 font-w-600" id="addressInfo">
                                 Wapping Gardens <br />
                                 135 High Street <br />
                                 London EC1A 1BA
                             </p>
                         </div>
                         <form method="POST" id="registerInterestForm">
                             <input type="hidden" name="pafid" id="pafid" />
                             <input type="hidden" name="postcode" id="postcodeInForm" />
                             <input type="hidden" name="interest" id="interest" value="{interest}" />
                             <p class=" pad-top-fixed-15 marg-left-fixed-20 font-12 gray-f-2 fp-padding-rl marg-right-fixed-15"> CONTACT DETAILS
                                  <span id="fb-button-holder" class="pad-left-fixed-15 pull-right">
                                    <fb:login-button id="facebook-button" scope="public_profile,email" onlogin="checkLoginState();" size="large">
                                        Register with Facebook
                                    </fb:login-button>
                                </span>
                             </p>
                             <div class="col-xs-5 col-sm-2 col-md-2 col-lg-3 pad-left-fixed-20 fp-padding-rl" >
                                 <p class="marg-top-fixed-10 font-13 gray-f-2"> <b>Title</b> </p>
                                 <ul class="nav navbar-nav ri-dropdown-small">
                                     <li class="dropdown"> <!-- Changing residential to bussines -->
                                         <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                             <span id="nameTitle">Mr</span>
                                             <input type="text" class="hidden" id="nameTitleInput" name="nameTitle" value="Mr" />
                                             <span class="caret arow-down-ri "></span></a>
                                         <ul class="dropdown-menu" role="menu">
                                             <li><a href="#" onclick="setDropDownValue('nameTitle','Mr')">Mr</a></li>
                                             <li><a href="#" onclick="setDropDownValue('nameTitle','Mrs')">Mrs</a></li>
                                             <li><a href="#" onclick="setDropDownValue('nameTitle','Miss')">Miss</a></li>
                                             <li><a href="#" onclick="setDropDownValue('nameTitle','Ms')">Ms</a></li>
                                             <li><a href="#" onclick="setDropDownValue('nameTitle','Dr')">Dr</a></li>
                                         </ul>
                                     </li>
                                 </ul>
                             </div>

                             <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0 fp-padding-rl" >
                                 <p class=" marg-top-fixed-10 font-13 gray-f-2"> <b>First name</b> </p>
                                 <input id="firstname" name="firstname" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="First name" minlength="2" required />
                             </div>
                             <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-5">
                                 <p class=" marg-top-fixed-10 font-13 gray-f-2"> <b>Last name</b> </p>
                                 <input id="lastname" name="lastname" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="Last name" minlength="2" required />
                             </div>
                             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0" >
                                 <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl" >
                                     <p class=" marg-top-fixed-10 font-13 gray-f-2"> <b>Phone number</b>
                                         <!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm" />-->
                                     </p>
                                     <input type="text" class="phoneNumber form-control input-ri" name="mobile" placeholder="Phone" required="required" />
                                 </div>
                                 <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                     <p class=" marg-top-fixed-10 font-13 gray-f-2"> Mobile
                                         <!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                                     </p>
                                     <input type="text" class="phoneUK form-control input-ri" placeholder="Mobile" name="phone" />
                                 </div>
                             </div>
                             <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0">
                                 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl">
                                     <p class=" marg-top-fixed-10 font-13 gray-f-2"> <b>Email address</b> </p>
                                     <input id="email" type="text" class="validEmail form-control input-ri" placeholder="Email address" name="email" required />
                                 </div>
                             </div>
                             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " >
                                 <p class=" marg-left-fixed-20 font-12 gray-f-2 pad-top-fixed-15 fp-padding-rl "> ADDITIONAL INFORMATION </p>
                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-20 fp-padding-rl" >
                                         <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> Who is your current broadband provider? </p>
                                         <ul class="nav navbar-nav ri-dropdown-medium">
                                             <li class="dropdown"> <!-- Changing residential to bussines -->
                                                 <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                     <span id="currentProvider"> -Select- </span>
                                                     <input type="text" id="currentProviderInput" class="hidden" name="currentProvider" />
                                                     <span class="caret arow-down-ri-big "></span></a>
                                                 <ul class="dropdown-menu" role="menu">
                                                     <li><a href="#" onclick="setDropDownValue('currentProvider','Sky')">Sky</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentProvider','BT')">BT</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentProvider','Virgin')">Virgin</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentProvider','TalkTalk')">TalkTalk</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentProvider','Other')">Other</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentProvider','I dont have broadband')">I don't have broadband</a></li>
                                                 </ul>
                                             </li>
                                         </ul>
                                         <!-- <span class="dropdown-has-error-message">This field is required.</span> -->
                                     </div>
                                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 " >
                                         <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> What is your current download speed? </p>
                                         <ul class="nav navbar-nav ri-dropdown-medium">
                                             <li   class="dropdown"> <!-- Changing residential to bussines -->
                                                 <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                     <span id="currentSpeed"> -Select- </span>
                                                     <input type="text" id="currentSpeedInput" class="hidden" name="currentSpeed" />
                                                     <span class="caret arow-down-ri-big "></span></a>
                                                 <ul class="dropdown-menu" role="menu">
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','< 10Mb')">< 10Mb</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','10 - 20Mb')">10 - 20Mb</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','21 - 50Mb')">21 - 50Mb</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','51 - 100Mb')">51 - 100Mb</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','101 - 300Mb')">101 - 300Mb</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','300Mb+')">300Mb+</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','Not sure')">Not sure</a></li>
                                                     <li><a href="#" onclick="setDropDownValue('currentSpeed','I dont have broadband')">I don't have broadband</a></li>
                                                 </ul>
                                             </li>
                                         </ul>
                                     </div>
                                 </div>
                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0"> <!-- Colum with two dropdowns -->
                                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-20 fp-padding-rl " >
                                         <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> When does your current contract expire? </p>
                                         <ul class="nav navbar-nav ri-dropdown-medium">
                                             <li   class="dropdown"> <!-- Changing residential to bussines -->
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
                                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-bottom-fixed-5 " >
                                         <!-- INCLUDE BLOCK : hear-about-us -->
                                     </div>
                                 </div><!-- End of Colum with two dropdowns -->
                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " >
                                     <form role="form">
                                           <div id="f-cm-i" class="form-group pad-left-fixed-5">
                                               <label for="comment" class="w-99 pad-top-fixed-10 marg-left-fixed-m5 font-13 gray-f-2 font-w-400 b-t-1px-l-gray">Comments</label>
                                             <textarea class="form-control ri-form1" rows="5" id="comment" name="comment"></textarea>
                                         </div>
                                     </form>
                                 </div>
                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                     <div id="c-box-c-ue" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-bottom-fixed-10 " >
                                         <div class="checkbox checkbox-success pad-left-fixed-10 font-13 gray-f-2 ">
                                             <input id="checkbox-1" type="checkbox" name="informations" >
                                             <label for="checkbox-1" class="w-55 l-h-130 let-space-minus-05">
                                                 I agree for Hyperoptic to share my details with my Building Managers to assist in bringing the Hyperoptic service to my building
                                             </label>
                                             <button type="submit" class="btn btn-primary " style="float:right">SUBMIT</button>
                                         </div>

                                         <div class="checkbox checkbox-success pad-left-fixed-10 font-13 gray-f-2 ">
                                             <input id="checkbox-2" type="checkbox" name="goodandservices"  >
                                             <label for="checkbox-2" class="w-55 l-h-130">
                                                 I agree to be contacted about related goods and services from Hyperoptic
                                             </label>
                                         </div>
                                     </div>
                                 </div>
                             </div>  <!-- End of Column with building dethails dropdowns -->
                         </form>
                     </div><!-- End of Popup registering interest  -->
                </div><!-- End of registering your interest  -->
            </div>
             <div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">  <!--  Row 1  -->
				<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0"> <!--  Full width right and left  -->
                    <div class="row container-fluid "> <!--  Content Row  -->
                          <div class="col-xs-12 col-md-12"> <!-- Entire row container left and right 2/2  -->
                            <div class="row"> <!-- Row 1  -->
                              <div class="col-md-6 col-md-push-6 pad-right-percent-0 pad-top-fixed-30" id="under-evaluation-c" > <!--  Right half 1/2-R  -->
                             	<div class="  b-t-1px-l-gray b-b-1px-l-gray" id="txt-container-1">	
                                	<p class=" pad-top-fixed-15 font-12 gray-f-2"> HYPEROPTIC AVAILABILITY </p>
									<!-- START BLOCK : status-under-eval -->
                                   	<p class=" pad-top-fixed-5 font-18 font-w-600 black-f-1"> Coming soon - the UK's fastest fibre broadband </p>
                                	<p class=" pad-bottom-fixed-30 font-15 gray-f-2"> Hyperoptic fibre broadband is coming soon to {site}. To be notified of exclusive broadband deals for residents only, and to find when we 'll be available, simply enter your postcode and click the GO button above.
                                    </p>
									<!-- END BLOCK : status-under-eval -->
									<!-- START BLOCK : status-ri -->
                                   	<p class=" pad-top-fixed-5 font-18 font-w-600 black-f-1"> Register your interest, commitment-free </p>
                                	<p class=" pad-bottom-fixed-30 font-15 gray-f-2"> To register your interest, simply enter your postcode and hit the GO button above – it’s 100% commitment free.
                                    </p>
									<!-- END BLOCK : status-ri -->
									<!-- START BLOCK : status-currently-installing -->
                                   	<p class=" pad-top-fixed-5 font-18 font-w-600 black-f-1"> Currently installing </p>
                                	<p class=" pad-bottom-fixed-30 font-15 gray-f-2"> Hyperoptic is currently available, well almost! See progress below, we made some significant steps with getting Hyperoptic into your building. Click the Check Availability to see if you’re a currently eligible to order today.
                                    </p>
									<!-- END BLOCK : status-currently-installing -->
									<!-- START BLOCK : status-live -->
                                   	<p class="pad-top-fixed-5 font-18 font-w-600 black-f-1"> Hyperoptic is live in your building and taking orders </p>
                                	<p class="pad-bottom-fixed-30 font-15 gray-f-2 txt-a-j"> Hyperoptic is now live in {menu-title} and taking orders. This means that all Hyperoptic cables are installed to bring you the UK's fastest broadband. All you have to do is to start your order. The Hyperoptic team will get in touch within 24 hours after your order is complete to schedule installation. Installation is a simple and frictionless process. You should be all set and activated in five working days from the moment you finish your order.
                                    </p>
									<!-- END BLOCK : status-live -->
									
									<!-- START BLOCK : status-preorder -->
                                   	<p class="pad-top-fixed-5 font-18 font-w-600 black-f-1"> Hyperoptic is coming and taking pre-orders </p>
                                	<p class="pad-bottom-fixed-30 font-15 gray-f-2 txt-a-j"> Hyperoptic's installation is now well under way at {menu-title} and pre-orders are now being accepted. This means that you're just weeks away from experiencing the UKs fastest residential broadband. All you have to do is place your pre-order. The Hyperoptic team will be in touch to schedule your Hyperoptic socket installation nearer to the service going live.
                                    </p>
									<!-- END BLOCK : status-preorder -->
                              	</div>
				
								   
                                <div class="row container-fluid marg-all-percent-0 pad-all-0"  >
									<!-- INCLUDE BLOCK : site-live -->
								    <!-- INCLUDE BLOCK : site-progress -->
								    <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 marg-top-fixed-15 pad-all-0 " >
									    <!-- INCLUDE BLOCK : sales-rep -->
									</div>
		                       	</div>
                              </div> <!--  End of right half 1/2-R  -->
                              
                              <div class="col-md-6 col-md-pull-6 pad-left-percent-0" id="ri-location-pic" > <!--  Left half 1/2-R  -->
 	         	                    <img class="w-100 marg-top-fixed-30"  src="{site-img}" alt="Hyperoptic bb"  />
   		                         	<div class="marg-top-fixed-10 map-canvas-medium" id="map-canvas"></div>
                              </div>
                            </div> <!-- Row 1  -->
                          </div> <!-- End of entire row container left and right 2/2  -->
                    
                      </div> <!--  End of Content Row  -->
					  <!-- INCLUDE BLOCK : banner --> 
      			</div> <!-- End Full width right and left  -->
           </div>	<!--  Row 1  -->

                <!-- End of Under evaluation container  --> 
