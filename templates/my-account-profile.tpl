<!-- INCLUDE BLOCK : header -->

<!-- INCLUDE BLOCK : my-account-menu -->
<!-- INCLUDE BLOCK : my-account-need-support -->
<!-- INCLUDE BLOCK : modal -->

<!--  Main Content container  -->      
<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">  <!--  Row 1  -->      
	<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0   "> <!--  Full width right and left  -->
		<div class="row container-fluid "> <!--  Content Row  -->
			<!-- ACCOUNT DETAILS + ACCOUNT NUMBER col   -->
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-60 pad-left-percent-0" >
				<div class="col-xs-12 col-sm-12 col-md-10 col-lg-9 pad-left-percent-0"><!-- Account details 9/12 -->
					<form method="POST" id="profileForm">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 b-r-1px-l-gray b-r-0-l-768"> <!-- Column all input fields  -->
					<p class="font-12 gray-f-2 "> ACCOUNT DETAILS </p>
					   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-left-percent-0">
						  <p class=" marg-top-fixed-10 font-13 gray-f-2"> Title </p>
                          <ul class="nav navbar-nav ri-dropdown-small">
                           <li class="dropdown"> <!-- Changing residential to bussines -->
                             <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false" aria-disabled="true">
                               <span id="nameTitle">{nameTitle}</span>
                                 <input type="text" class="hidden" id="nameTitleInput" name="nameTitle" value="{nameTitle}" />
                             	<span class="caret arow-down-ri"></span></a>
                             <!--<ul class="dropdown-menu" role="menu">
                               <li><a href="#" onclick="setDropDownValue('nameTitle','Mr')">Mr</a></li>
                               <li><a href="#" onclick="setDropDownValue('nameTitle','Mrs')">Mrs</a></li>
                               <li><a href="#" onclick="setDropDownValue('nameTitle','Miss')">Miss</a></li>
							   <li><a href="#" onclick="setDropDownValue('nameTitle','Ms')">Ms</a></li>
                             </ul>-->
                           </li>
                         </ul>
						 
					   </div>
					   
					   <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0">
							<p class="marg-top-fixed-10 font-13 gray-f-2"> First name </p>
							<input type="text" name="firstname" value="{firstname}" class="acceptLettersOnly form-control input-ri" placeholder="First name" minlength="2" disabled="disabled" />
					   </div>
					   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 input-f-padd-left-0-l-768 input-f-padd-left-0-l-992">
							<p class=" marg-top-fixed-10 font-13 gray-f-2"> Last name </p>
							<input type="text" name="lastname" value="{lastname}" class="acceptLettersOnly form-control input-ri" placeholder="Last name" minlength="2" disabled="disabled" />
					   </div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0" ><!-- Column 2 -->
                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
                                <p class=" marg-top-fixed-10 font-13 gray-f-2"> Phone number
                                    <!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                                </p>
                                <input type="text" name="mobile" value="{mobile}" class="phoneNumber form-control input-ri" placeholder="Landline" required="required" />
                            </div>
                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 input-f-padd-left-0-l-768 input-f-padd-left-0-l-992" >
                               <p class=" marg-top-fixed-10 font-13 gray-f-2"> Mobile
									<!--<img class="pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
								</p>
                               <input type="text" name="phone" value="{phone}" class="phoneUK form-control input-ri" placeholder="Mobile" />
                           </div>
						</div>
						   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " ><!-- Row 3 -->
							   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
									<p class=" marg-top-fixed-10 font-13 gray-f-2"> Email address</p>
									<input type="email" name="email" value="{email}" class="form-control input-ri" placeholder="Email address" disabled="disabled" />
							   </div> 
						   </div>
						 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " ><!-- Column 10 Please note + PREFERENCES -->
						   <p class="marg-top-fixed-15 font-13 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray"> 
								Your email address and password allow you to access your account and change your details.

						   </p>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " ><!-- Column 11 -->
							   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
									<p class="font-13 gray-f-2">Password</p>
									<input type="password" id="password" name="password" class="form-control input-ri" />
							   </div> 
							   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 input-f-padd-left-0-l-768 input-f-padd-left-0-l-992">
									<p class="font-13 gray-f-2">Confirm password</p>
									<input type="password" id="password2" name="password2" class="form-control input-ri" />
							   </div>    
							</div>
						   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 pad-left-percent-0" ><!-- Column 12 How did you hear about us?-->
								<div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0">
                                    <p class="marg-top-fixed-10 font-13 gray-f-2"> Date of birth </p>
                                    <div class="date">
                                      <input name="dateOfBirth" value="{dateOfBirth}" class="datepicker form-control input-ri" type="text" data-date-format="dd M yyyy" disabled="disabled" />
                                    </div>
                               	</div>
						   </div> 
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " ><!-- Column 4 -->
							   <p class=" marg-top-fixed-15 font-12 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray  "> PREFERENCES </br> To receive updates on Hyperoptic products and services, select how you'd prefer to be contacted.</p>
								  <div id="check-box-container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0">
									<div class="checkbox checkbox-success pad-left-fixed-5 font-13 gray-f-2 ">
										<input id="checkbox-4" type="checkbox" name="reveiveNewsletter" {reveiveNewsletter} />
										<label for="checkbox-4">
										   Email
										</label>
									</div>
									<div class="checkbox checkbox-success pad-bottom-fixed-20 pad-left-fixed-5 font-13 gray-f-2">
										<input id="checkbox-5" type="checkbox" name="receiveUpdates" {receiveUpdates} />
										<label for="checkbox-5">
										   Phone
										</label>
									</div>
								  </div>
							</div><!-- End of Column 4 -->
						</div><!-- End of Please + PREFERENCES note etc.-->                                
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 b-t-1px-l-gray">
							<button type="submit" class="btn btn-primary pull-right">SAVE</button>
						</div>

					</div> 
					</form>
				</div>                        
				<!-- INCLUDE BLOCK : my-account-address -->

			
		</div> 
	</div>
</div>