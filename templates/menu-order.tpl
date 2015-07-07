   <!--  Building live container  -->
            <div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">  <!--  Row 1  -->
				<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0   "> <!--  Full width right and left  -->
                    <div class="row container-fluid "> <!--  Content Row  -->
                        <div class=" progress-h-active col-xs-12 col-sm-12 col-md-6 navy-blue-bg-2 "  >
                            <p class=" marg-top-fixed-15 font-18 white-f-fff" > Your building is live and taking order </p>
                        </div>
                        <div class="  col-xs-12 col-sm-12 col-md-6 pad-left-percent-0  pad-top-fixed-10 pad-bottom-fixed-10 navy-blue-bg-2 " ><!-- Registering interest  -->
                            <div class="  col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0">
                            	<p class=" marg-top-fixed-10 font-12" style="float: left;" > GET STARTED </p>
                            </div>
                            <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0 ">
  	                          <input type="text" class="form-control input-ri navy-blue-bg-1" placeholder="Enter Postcode">
                            </div>
                            <div class="  col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-all-0">
                            	<button type="submit" id="register-ue" class="btn register-button " style="float:right">ORDER NOW</button>
							</div>



							<!-- Popup registering interest  -->
                            <div id="register-popup" class="row marg-right-percent-0 marg-left-percent-0 gray-bg-3 b-b-1px-gray register-popup-d-n ">
                               <p class=" marg-top-fixed-20 marg-left-fixed-15 font-42 blue-navy-f-1"> Register interest </p>
                               <div id="install-adress" class="marg-left-fixed-15 pad-bottom-fixed-10" >
                                	<p class=" pad-top-fixed-15 marg-left-fixed-20 font-12 gray-f-2"> INSTALL ADDRESS </p>
                                    <p class=" marg-left-fixed-20 font-16 l-h-130 black-f-1 font-w-600">
										Wapping Gardens <br />
                                        135 High Street <br />
                                        London EC1A 1BA
                                    </p>
                               </div>
                            	<p class=" pad-top-fixed-15 marg-left-fixed-20 font-12 gray-f-2 fp-padding-rl"> CONTACT DETAILS </p>
		 	                           <div class="col-xs-2 col-sm-2 col-md-2 col-lg-3 pad-left-fixed-20 fp-padding-rl" >
                                   		  <p class=" marg-top-fixed-10 font-13 black-f-1 font-w-600"> Title </p>
                                           <ul id="ri-dropdown" class="nav navbar-nav ">
                                            <li   class="dropdown"> <!-- Changing residential to bussines -->
                                              <a href="#" class="dropdown-toggle font-15 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                <span id="nameTitleBig">Mr</span>
                                              	<span class="caret arow-down-ri "></span></a>
                                              <ul class="dropdown-menu" role="menu">
                                                <li><a href="#" onclick="setDropDownValue('nameTitleBig','Mrs')">Mrs</a></li>
                                                <li><a href="#" onclick="setDropDownValue('nameTitleBig','Ms')">Ms</a></li>
                                                <li><a href="#" onclick="setDropDownValue('nameTitleBig','Miss')">Miss</a></li>
												<li><a href="#" onclick="setDropDownValue('nameTitleBig','Dr')">Dr</a></li>
                                              </ul>
                                            </li>
                                          </ul>

                                       </div>

		 	                           <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0 fp-padding-rl" >
                                       		<p class=" marg-top-fixed-10 font-13 black-f-1 font-w-600"> First name </p>
					                        <input type="text" class="form-control input-ri" placeholder="First name">
                                       </div>
		 	                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-5 ">
                                       		<p class=" marg-top-fixed-10 font-13 black-f-1 font-w-600"> Last name </p>
					                        <input type="text" class="form-control input-ri" placeholder="Last name">
                                       </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " ><!-- Column 5 -->
                                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl " >
                                                <p class=" marg-top-fixed-10 font-13 black-f-1 font-w-600"> Phone Number
    												<!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                                                </p>
                                                <input type="text" class="form-control input-ri" placeholder="Phone number">
                                           </div>
                                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 " >
                                                <p class=" marg-top-fixed-10 font-13 gray-f-2"> Mobile number
      												<!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                                                </p>
                                                <input type="text" class="form-control input-ri" placeholder="Mobile number">
                                           </div>
                                        </div>
                                           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 w-94 marg-top-fixed-5 marg-left-fixed-20 pad-all-0  pad-bottom-fixed-15 b-b-1px-l-gray f-em-i">
                                               <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 " >
                                                    <p class=" marg-top-fixed-10 font-13 black-f-1 font-w-600"> Email address </p>
                                                    <input type="text" class="form-control input-ri" placeholder="Email address">
                                               </div>
                                           </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " ><!-- Column with building dethails dropdowns -->
                                           <p class=" marg-left-fixed-20 font-12 gray-f-2 pad-top-fixed-15 fp-padding-rl "> ADDITIONAL INFORMATION </p>
                                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-20 fp-padding-rl" >
                                                  <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05"> Who is your current broadband provider? </p>
                                                   <ul id="ri-pop-dropdown-medium" class="nav navbar-nav ">
                                                    <li   class="dropdown"> <!-- Changing residential to bussines -->
                                                      <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                        <span id="nameTitle"> -Select- </span>
                                                        <span class="caret arow-down-ri-big "></span></a>
                                                      <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle','One')">One</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle','Two')">Two</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle','Love')">Love</a></li>
                                                      </ul>
                                                    </li>
                                                  </ul>
                                           </div>
                                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 " >
                                                <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05"> What is your current download speed? </p>
                                                   <ul id="ri-pop-dropdown-medium" class="nav navbar-nav ">
                                                    <li   class="dropdown"> <!-- Changing residential to bussines -->
                                                      <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                        <span id="nameTitle2"> -Select- </span>
                                                        <span class="caret arow-down-ri-big "></span></a>
                                                      <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle2','One')">One</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle2','Two')">Two</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle2','Love')">Love</a></li>
                                                      </ul>
                                                    </li>
                                                  </ul>
                                           </div>
                                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-20 fp-padding-rl " >
                                                  <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05"> When does your current contract expire? </p>
                                                   <ul id="ri-pop-dropdown-medium" class="nav navbar-nav">
                                                    <li   class="dropdown"> <!-- Changing residential to bussines -->
                                                      <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                        <span id="nameTitle3"> -Select- </span>
                                                        <span class="caret arow-down-ri-big "></span></a>
                                                      <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle3','One')">One</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle3','Two')">Two</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle3','Love')">Love</a></li>
                                                      </ul>
                                                    </li>
                                                  </ul>
                                           </div>
                                           <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-bottom-fixed-5 " >
                                                <p class=" marg-top-fixed-10 font-13 black-f-1 font-w-600 let-space-minus-05"> How did you hear about us? </p>
                                                   <ul id="ri-pop-dropdown-medium" class="nav navbar-nav  ">
                                                    <li   class="dropdown"> <!-- Changing residential to bussines -->
                                                      <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                                        <span id="nameTitle4"> -Select- </span>
                                                        <span class="caret arow-down-ri-big "></span></a>
                                                      <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle4','One')">One</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle4','Two')">Two</a></li>
                                                        <li><a href="#" onclick="setDropDownValue('nameTitle4','Love')">Love</a></li>
                                                      </ul>
                                                    </li>
                                                  </ul>
                                           </div>
                                           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " >
                                            <form role="form">
                                                <div id="f-cm-i" class="form-group pad-left-fixed-5">
                                                  <label for="comment" class="w-99 pad-top-fixed-10 marg-left-fixed-m5 font-13 gray-f-2 font-w-400 b-t-1px-l-gray  ">Comments</label>
                                                  <textarea class="form-control ri-form1" rows="5" id="comment"></textarea>
                                                </div>
                                              </form>
                                           </div>
                                           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " >
                                                <div id="c-box-c-ue" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-bottom-fixed-10 " >
                                                    <div class="checkbox checkbox-success pad-left-fixed-10 font-13 gray-f-2 ">
                                                        <input id="checkbox-1" type="checkbox" >
                                                        <label for="checkbox-1" class="w-55 l-h-130 let-space-minus-05">
                                                           I agree to be contacted to receive information related to my contact request
                                                        </label>
                                                        <button type="submit" class="btn btn-primary " style="float:right">SUBMIT</button>
                                                    </div>
                                                    <div class="checkbox checkbox-success pad-left-fixed-10 font-13 gray-f-2 ">
                                                        <input id="checkbox-2" type="checkbox" >
                                                        <label for="checkbox-2" class="w-55 l-h-130">
                                                           I want to receive information about goods and services from Hyperoptic
                                                        </label>
                                                    </div>
                                                </div>
                                         	</div>
                                        </div>  <!-- End of Column with building dethails dropdowns -->


                            </div><!-- End of Popup registering interest  -->
                        </div><!-- End of registering your interest  -->
