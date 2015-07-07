<div class="panel-heading collapsed" data-toggle="collapse" data-parent="#accordion" href=""> <!-- #collapse2 -->
	<div class="numbe-undone-2 "> </div>
	<p class="panel-title font-f-bariol-regular font-w-600 font-22 "> <a >Account Details</a></p>
	<div id="collapseDone2" class=" marg-right-fixed-20 pull-right op-progress-udone" >  </div>
	<p class="pad-top-fixed-10 pad-right-fixed-20 pull-right font-12 op-fc-ud "> TO BE COMPLETED </p>
</div>
<div id="collapse2" class="panel-collapse collapse">
<div class="panel-body">

<div id="bu-form" class="row container-fluid pad-right-percent-0 pad-left-percent-0">
	<form id="accountDetailsForm" onsubmit="return accountDetailsSave()">
	<input type="hidden" name="userIP" value="{userip}" id="userIP" />
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0" > <!-- Column Registering interest  -->
	<p class="marg-left-fixed-15 font-12 gray-f-2 "> ACCOUNT DETAILS </p>
	   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-left-fixed-15" >
		  <p class="marg-top-fixed-10 font-13 gray-f-2"> Title </p>
		  <ul class="nav navbar-nav ri-dropdown-small">
           <li class="dropdown"> <!-- Changing residential to bussines -->
                     <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                       <span id="nameTitle">Mr</span>
						<input type="text" class="hidden" id="nameTitleInput" name="nameTitle" value="Mr" />
                     	<span class="caret arow-down-ri "></span></a>
                     <ul class="dropdown-menu" role="menu">
                       <li><a href="#" onclick="return setDropDownValue('nameTitle','Mr')">Mr</a></li>
		               <li><a href="#" onclick="return setDropDownValue('nameTitle','Mrs')">Mrs</a></li>
		               <li><a href="#" onclick="return setDropDownValue('nameTitle','Miss')">Miss</a></li>
					   <li><a href="#" onclick="return setDropDownValue('nameTitle','Ms')">Ms</a></li>
					   <li><a href="#" onclick="return setDropDownValue('nameTitle','Dr')">Dr</a></li>
            		 </ul>
           </li>
         </ul>
		 
	   </div>
	   
	   <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0" >
			<p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> First Name </p>
			<input type="text" id="firstName" name="firstName" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="First name" minlength="2" required="required" />
	   </div>
	   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
			<p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Last Name </p>
			<input type="text" id="lastName" name="lastName" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="Last name" minlength="2" required="required" />
	   </div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0" >
                <p class="marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Phone number
                    <!--<img class=" pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
                </p>
                <input type="text" id="mobile" name="mobile" class="phoneNumber form-control input-ri" placeholder="Phone number" required="required" />
            </div>
            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
               <p class="marg-top-fixed-10 font-13 gray-f-2"> Mobile
					<!--<img class="pad-right-fixed-10 " id="user-avatar-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
				</p>
               <input type="text" id="phone" name="phone" class="phoneUK form-control input-ri" placeholder="Mobile" />
           </div>
		</div>
		   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
			   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
					<p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Email address </p>
					<input type="text" id="email" name="email" class="form-control input-ri" placeholder="Email address" required="required" />
			   </div>
		   </div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " >
			<input type="hidden" value="{pafid}" id="pafid" name="pafid" />
		   <p class=" marg-top-fixed-15 marg-left-fixed-15 font-12 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray"> BILLING ADDRESS </p>
		   <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0  " ><!-- Column 6 Adress -->
				<p class=" marg-top-fixed-10 font-13 gray-f-2"> Address </p>
				<input type="text" name="address" id="address" class="form-control input-ri" placeholder="" disabled="disabled" value="{address}" />
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
			   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0" >
					<p class=" marg-top-fixed-10 font-13 gray-f-2"> City </p>
					<input type="text" name="city" id="city" class="form-control input-ri" placeholder="" disabled="disabled" value="{city}" />
			   </div> 
			   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0" >
					<p class=" marg-top-fixed-10 font-13 gray-f-2"> Postcode </p>
					<input type="text" name="postcode" id="postcode" class="form-control input-ri" placeholder="" disabled="disabled" value="{postcode}" />
			   </div>                                     
			</div>
		</div>
		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " ><!-- Column 10 -->
		   <p class=" marg-top-fixed-15 marg-left-fixed-15 font-13 gray-f-2 pad-top-fixed-15 b-t-1px-l-gray  "> 
				Please note that you need your email address (provided above) together with a password (please type your preferred password below) to login into your account.
		   </p>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " ><!-- Column 11 -->
			   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
				<p class="font-13 gray-f-2 font-w-700">Password (min 8 characters)</p>
				<input type="password" id="password" name="password" class="form-control input-ri" required="required" minlength="8" />
			   </div> 
			   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
					<p class="font-13 gray-f-2 font-w-700">Confirm password</p>
					<input type="password" id="password2" name="password2" class="form-control input-ri" required="required" />
			   </div>    
			</div>
		   <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 " ><!-- Column 12 How did you hear about us?-->
				<p class=" marg-top-fixed-10 font-13 gray-f-2 font-w-700"> Date of birth
				 <!-- <img class=" pad-right-fixed-10 " id="hyperoptic-icon"  src="{base-url}/images/question-mark-blue-icon.png" alt="Hyperoptic qm"  />-->
				</p>
				<input id="dateOfBirth" name="dateOfBirth" class="datepicker form-control input-ri" type="text" data-date-format="dd M yyyy" placeholder="  dd/mm/yyyy" required="required" />
		   </div>
		</div><!-- End of Please note etc.-->                                
		  <div id="check-box-container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-top-fixed-15 pad-bottom-fixed-60 gray-bg-1 " >
				<button id="accountDetailsButton" type="submit" class="btn btn-primary " style="float:right">CONTINUE</button>
		  </div>

	</div> <!-- End of Registering interest column -->
	</form>
</div>  <!-- Building details form  -->


</div>
</div>