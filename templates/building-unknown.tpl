	
	<!-- INCLUDE BLOCK : header -->
	
	<!-- INCLUDE BLOCK : menu-empty -->

	<!-- INCLUDE BLOCK : modal -->

    <!--  Building unknown container  -->      
    <div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">  <!--  Row 1  -->      
		<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0   "> <!--  Full width right and left  -->
                <div class="row-fluid">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9 pad-all-0" >
                    <div class="row-fluid">
                      <div id="border-right-1" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-15 pad-left-percent-0 b-r-1px-l-gray " >
                        <p class="marg-top-fixed-20 font-18 black-f-1 font-w-600 "> Tell us more about where you live</p>
                        <p class="font-15 gray-f-2 "> Hyperoptic is not yet servicing that building, but could be very soon. We invest heavily in our infrastructure and to help us determine whether your address could go Hyperoptic in the near future, please tell us a little more about where you live (below). One of our representatives will then get back to you with details of our evaluation. Fingers crossed.
                        </p>
                       	<div id="map-canvas" class="map-canvas-medium"></div>
                       	<form method="POST" id="registerInterestForm">
                       	<input type="hidden" name="pafid" value="{pafid}" /> 
                        <div id="bu-form"> 
	                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-3 " > <!-- Column Registering interest  -->
                            <p class=" marg-top-fixed-15 marg-left-fixed-15 font-12 gray-f-2 "> REGISTER YOUR INTEREST
                                <span id="fb-button-holder" class="pad-left-fixed-15 pull-right">
                                    <fb:login-button id="facebook-button" scope="public_profile,email" onlogin="checkLoginState();" size="large">
                                        Register with Facebook
                                    </fb:login-button>
                                </span>
                            </p>
	                           <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-left-fixed-15" >
                           		  <p class=" marg-top-fixed-10 font-13 gray-f-2"> Title </p>
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
                               
	                           <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0 first-name-bu" >
                               		<p class=" marg-top-fixed-10 font-13 gray-f-2"> First name </p>
			                        <input id="firstname" name="firstname" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="First name" minlength="2" required />
                               </div>
 	                           <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
                               		<p class=" marg-top-fixed-10 font-13 gray-f-2"> Last name </p>
			                        <input id="lastname" name="lastname" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="Last name" minlength="2" required />
                               </div>
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-right-percent-0  " >
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Address </p>
                                    <input name="address" type="text" class="form-control input-ri" placeholder="" value="{address}" minlength="3" disabled="disabled" />
                                </div>
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> City </p>
                                        <input type="text" class="acceptLettersOnly form-control input-ri" placeholder="" name="city" value="{city}" minlength="2" disabled="disabled" />
                                   </div> 
                                   <!-- <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> County </p>
                                        <input type="text" class="form-control input-ri" placeholder="" name="county" value="{county}" minlength="2" />
                                   </div>  -->                                   
                                </div>
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-3 marg-top-fixed-5 pad-right-percent-0 " >
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> Postcode </p>
                                        <input type="text" class="postcodeUK form-control input-ri" placeholder="" name="postcode" value="{postcode}" minlength="3" disabled="disabled" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
                                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                            <p class=" marg-top-fixed-10 font-13 gray-f-2"> Landline number
                                                <!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                                            </p>
                                            <input type="text" class="phoneNumber form-control input-ri" placeholder="Landline number" name="mobile" required="required" />
                                        </div>
                                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                           <p class=" marg-top-fixed-10 font-13 gray-f-2"> Mobile number
                                                <!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                                            </p>
                                           <input type="text" class="phoneUK form-control input-ri" placeholder="Mobile number" name="phone" />
                                       </div>
                                </div>
                                   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
                                       <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                            <p class=" marg-top-fixed-10 font-13 gray-f-2"> Email address </p>
                                            <input id="email" type="text" class="validEmail form-control input-ri" placeholder="Email address" name="email" required />
                                       </div> 
                                   </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " ><!-- Column 5 -->
                                   <p class=" marg-top-fixed-15 marg-left-fixed-15 font-12 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray  "> BUILDING DETAILS </p>
                                   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0"> <!-- Two dropdown in same col -->
                                       <div class="input-group-h dropdown-error-message col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                              <p class=" marg-top-fixed-10 font-13 gray-f-2"> Property type </p>
                                              <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                               <ul class="nav navbar-nav ri-dropdown-big dropdown-has-error">
                                                <li class="dropdown"> <!-- Changing residential to bussines -->
                                                  <span id="propertyType"> -Select- </span>
                                                    <input type="text" id="propertyTypeInput" class="hidden" name="propertyType" required="required" />
                                                    <span class="caret arow-down-ri-big "></span></a>
                                                  <ul class="dropdown-menu" role="menu" id="propertyType">
                                                    <li><a href="#" onclick="setDropDownValue('propertyType','Detached house')">Detached house</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('propertyType','Semi-detached house')">Semi-detached house</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('propertyType','Terraced house')">Terraced house</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('propertyType','Maisonette')">Maisonette</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('propertyType','High rise flats')">High rise flats</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('propertyType','Low rise flats')">Low rise flats</a></li>
                                                      <li><a href="#" onclick="setDropDownValue('propertyType','Business')">Business</a></li>
                                                  </ul>
                                                </li>
                                              </ul>
                                       </div>
                                       <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                            <p class=" marg-top-fixed-10 font-13 gray-f-2"> Ownership </p>
                                            <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                               <ul class="nav navbar-nav ri-dropdown-big">
                                                <li   class="dropdown"> <!-- Changing residential to bussines -->
                                                  <span id="ownership"> -Select- </span>
                                                    <input type="text" id="ownershipInput" class="hidden" name="ownership" />
                                                    <span class="caret arow-down-ri-big "></span></a>
                                                  <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#" onclick="setDropDownValue('ownership','Freeholder')">Freeholder</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('ownership','Leaseholder')">Leaseholder</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('ownership','Property Management company')">Property Management company</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('ownership','Tenant')">Tenant</a></li>
                                                  </ul>
                                                </li>
                                              </ul>
                                       </div>
                                   </div> <!-- End of Two dropdown in same col -->
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                          <p class=" marg-top-fixed-10 font-13 gray-f-2"> Number of apartments in your building </p>
                                          <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                           <ul class="nav navbar-nav ri-dropdown-big">
                                            <li   class="dropdown"> <!-- Changing residential to bussines -->
                                              <span id="numOfApartments"> -Select- </span> 
												<input type="text" id="numOfApartmentsInput" class="hidden" name="numOfApartments" />	
                                                <span class="caret arow-down-ri-big "></span></a>
                                              <ul class="dropdown-menu" role="menu">
                                                <li><a href="#" onclick="setDropDownValue('numOfApartments','0-30')">0-30</a></li>
                                                <li><a href="#" onclick="setDropDownValue('numOfApartments','31-60')">31-60</a></li>
                                                <li><a href="#" onclick="setDropDownValue('numOfApartments','61+')">61+</a></li>
                                              </ul>
                                            </li>
                                          </ul>
                                   </div> 
                                </div>
                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " ><!-- Column 6 -->
                                   <p class=" marg-top-fixed-15 marg-left-fixed-15 font-12 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray  "> ADDITIONAL INFORMATION </p>
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                          <p class=" marg-top-fixed-10 font-13 gray-f-2"> Who is your current broadband provider? </p>
                                          <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                           <ul class="nav navbar-nav ri-dropdown-big">
                                            <li   class="dropdown"> <!-- Changing residential to bussines -->
                                              <span id="currentProvider"> -Select- </span>
												<input type="text" id="currentProviderInput" class="hidden" name="currentProvider" />
                                                <span class="caret arow-down-ri-big "></span></a>
                                              <ul class="dropdown-menu" role="menu">
                                                  <li><a href="#" onclick="setDropDownValue('currentProvider','Sky')">Sky</a></li>
                                                  <li><a href="#" onclick="setDropDownValue('currentProvider','BT')">BT</a></li>
                                                  <li><a href="#" onclick="setDropDownValue('currentProvider','Virgin')">Virgin</a></li>
                                                  <li><a href="#" onclick="setDropDownValue('currentProvider','TalkTalk')">TalkTalk</a></li>
                                                  <li><a href="#" onclick="setDropDownValue('currentProvider','Other')">Other</a></li>
                                                  <li><a href="#" onclick="setDropDownValue('currentProvider','I dont have broadband')">I don’t have broadband</a></li>
                                              </ul>
                                            </li>
                                          </ul>
                                   </div> 
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> What is your current download speed? </p>
                                        <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                           <ul class="nav navbar-nav ri-dropdown-big">
                                            <li   class="dropdown"> <!-- Changing residential to bussines -->
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
                                                  <li><a href="#" onclick="setDropDownValue('currentSpeed','I dont have broadband')">I don’t have broadband</a></li>
                                              </ul>
                                            </li>
                                          </ul>
                                   </div>
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> When does your current broadband contract expire? </p>
                                        <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                           <ul class="nav navbar-nav ri-dropdown-big">
                                            <li   class="dropdown"> <!-- Changing residential to bussines -->
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
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-bottom-fixed-30 " >
                                       <!-- INCLUDE BLOCK : hear-about-us -->
                                   </div>
    
                                </div>                                       

							</div> <!-- End of Registering interest column -->
 							</div>  <!-- Building details form  -->

                        </div> <!-- End of Color for entire left 9/12 column  -->
                      </div> <!-- Color for entire left 9/12 column  -->
                      <div id="check-box-container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-60 gray-bg-1 " >
                        <div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
                            <input id="checkbox-1" type="checkbox" name="receiveInfo">
                            <label for="checkbox-1">
                               I would like to receive information about products and services from Hyperoptic
                            </label>
                            <button id="submitDataBtn" type="submit" class="btn btn-primary" style="float:right">CONTINUE</button>
                        </div>
                      </div>
                      </form>
                  </div>
                      <div id="get-touch-bu" class="col-xs-12 col-sm-12 col-md-12 col-lg-3 marg-top-fixed-30" >
                      	<div id="ldh-1"  class=" gray-f-2  font-12  "> GET IN TOUCH </div>
                        <div id="ldp-1" class="marg-top-fixed-10 ">
                        	<span class="gray-f-2 font-13 font-w-300 font-w-700"> Hyperoptic Sales </span>
                            <p class="gray-f-4 font-13 font-w-300 font-w-500"> 
                            	<!-- Tel 0830 555 5555 <br /> -->
                                Email sales@hyperoptic.com  <br />
                            </p>
                        <ul id="ri-ul1" class=" marg-top-fixed-30 pad-left-percent-0 "> </a>
                          <a name="getInvolved"> <li class=" gray-f-2  font-12 b-b-1px-l-gray  ">GET INVOLVED</li> </a>
                         <!-- <a href="#" > <li id="lc-bu-list" class=" blue-navy-f-2 font-15 b-b-1px-l-gray "> Become a Hyperoptic Champion </li> </a> -->
						  <a href="javascript:openModalWindow('reportModal')" > <li id="lc-bu-list" class=" blue-navy-f-2 font-15 b-b-1px-l-gray "> Update us with important news </li> </a>
                        </ul>    
                        </div>
                      </div>
                      
                </div>
    	</div> <!-- End Full width right and left  -->
    </div>
	<!-- INCLUDE BLOCK : report-a-problem -->
    