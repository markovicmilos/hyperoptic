<div class="tab-pane fade {active-in} " id="tab-{tab-id}">
	<form method="POST" id="form-{tab-id}">
	<input type="hidden" name="tabid" value="{tab-id}" /> 
	<div class="row container-fluid">
		<div id="bum-form">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0" >
			<p class=" marg-top-fixed-15 marg-left-fixed-15 font-12 gray-f-2 ">  </p>
			   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-left-fixed-15" >
				  <p class=" marg-top-fixed-10 font-13 gray-f-2"> Title </p>
				   <ul class="nav navbar-nav ri-dropdown-small">
					<li class="dropdown" name="dropdown-{tab-id}">
					  <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
						<span id="nameTitle{tab-id}">Mr</span>
						<input type="text" class="hidden" id="nameTitle{tab-id}Input" name="nameTitle" value="Mr" />
						<span class="caret arow-down-ri "></span></a>
					  <ul class="dropdown-menu" role="menu">
							<li><a href="#" onclick="setDropDownValue('nameTitle{tab-id}','Mr')">Mr</a></li>
                            <li><a href="#" onclick="setDropDownValue('nameTitle{tab-id}','Mrs')">Mrs</a></li>
                            <li><a href="#" onclick="setDropDownValue('nameTitle{tab-id}','Miss')">Miss</a></li>
							<li><a href="#" onclick="setDropDownValue('nameTitle{tab-id}','Ms')">Ms</a></li>
							<li><a href="#" onclick="setDropDownValue('nameTitle{tab-id}','Dr')">Dr</a></li>
					  </ul>
					</li>
				  </ul>
				 
			   </div>
			   
			   <div class="input-group-h first-name-bu col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0" >
					<p class="marg-top-fixed-10 font-13 gray-f-2"> First name </p>
					<input name="firstname" id="first-name-{tab-id}" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="First name" minlength="2" required>
			   </div>
			   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0">
					<p class="marg-top-fixed-10 font-13 gray-f-2"> Last name </p>
					<input name="lastname" id="last-name-{tab-id}" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="Last name" minlength="2" required>
			   </div>
				<div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-right-percent-0  " >
					<p class="marg-top-fixed-10 font-13 gray-f-2"> Company </p>
					<input name="companyname" id="company-name-{tab-id}" type="text" class="form-control input-ri" placeholder="Company name" minlength="2" required>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
				   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
						<p class="marg-top-fixed-10 font-13 gray-f-2"> Email address </p>
						<input name="email" id="email-{tab-id}" type="email" class="form-control input-ri" placeholder="Email address" required="required" />
				   </div> 
				   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 " >
						<p class="marg-top-fixed-10 font-13 gray-f-2"> Phone number </p>
						<input name="mobile" id="mobile-{tab-id}" type="text" class="phoneNumber form-control input-ri" placeholder="Landline/Mobile" required="required" />
				   </div>                                     
				</div>

			</div>
		 </div>
		  <div id="check-box-container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 gray-bg-1" >
			<div class="input-group-h checkbox checkbox-success pad-top-fixed-30 pad-left-fixed-5 font-13 gray-f-2 b-t-1px-l-gray">
				<input id="checkbox-{tab-id}" type="checkbox" name="permission">
				<label for="checkbox-{tab-id}">
				   I give Hyperoptic permission to use my contact details
				</label>
				<button type="submit" class="btn btn-primary" style="float:right" {disable-submit}>SUBMIT</button>
			</div>
		  </div>
	</div>
	</form>
</div>