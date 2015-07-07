<!-- INCLUDE BLOCK : header -->

<div
	class="s-in-swoosh-b-r row container-fluid pad-left-percent-19 gray-bg-1">

	<!-- INCLUDE BLOCK : menu-login -->

	<form method="POST" id="forgotForm">
		<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
			<div class="row container-fluid pad-right-percent-19">
				<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 gray-bg-3-tr">
					<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
						<p class=" font-f-bariol-light font-42 font-w-600 gray-f-4 l-h-130">
							Forgot your password
						</p>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
						<p class="pad-top-fixed-10 font-13 gray-f-2">Please enter your
							email and date of birth to help us identify you</p>
						<div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0">
							<p class="font-13 gray-f-2"> Email address</p>
							<input type="text" name="email" class="validEmail form-control input-ri" placeholder="Email address" required="required" />
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-top-fixed-10 pad-left-percent-0">
                    		<p class="pad-top-fixed-30 font-14 red-error-f-2"> {info} </p>
                    	</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 pad-bottom-fixed-30">
						<div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0">
							<p class="marg-top-fixed-10 font-13 gray-f-2"> Date of birth
							</p>
							<div class="date" >
								<input type="text" class="datepicker form-control input-ri" data-date-format="dd M yyyy" name="dateOfBirth" required="required" placeholder="  dd/mm/yyyy" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0 pad-top-fixed-5 marg-top-fixed-30">
							<button type="submit" class="btn btn-primary">CONTINUE</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>