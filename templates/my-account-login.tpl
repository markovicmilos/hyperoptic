<!-- INCLUDE BLOCK : header -->

<div class="s-in-swoosh-b-r row container-fluid pad-left-percent-19 gray-bg-1">
	
	<!-- INCLUDE BLOCK : menu-login -->

	<form method="POST" id="loginForm">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
		<div class="row container-fluid pad-right-percent-19">
        	<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 gray-bg-3-tr">
            	<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0"> 
	            	<p class=" font-f-bariol-light font-42 font-w-600 gray-f-4 l-h-130"> Sign in </p>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0" >
                    <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0">
                         <p class="font-13 gray-f-2"> Email </p>
                         <input type="text" name="email" class="validEmail form-control input-ri" placeholder="Email Address" required="required" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-top-fixed-10 pad-left-percent-0">
                    	<p class="pad-top-fixed-30 font-14 red-error-f-2"> {error-login} </p>
                    </div> 
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
                    <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0" >
                         <p class=" marg-top-fixed-10 font-13 gray-f-2"> Password </p>
                         <input type="password" name="password" class="form-control input-ri" placeholder="**********" required="required" />
                    </div> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0 pad-top-fixed-5 marg-top-fixed-30">
                         <button type="submit" class="btn btn-primary" value="submit">SIGN IN</button>
                    </div> 
                </div>
               <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0 pad-top-fixed-10 pad-bottom-fixed-20">
                   <div id="check-box-container" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0 font-13">
                       Forgotten <a class="blue-navy-f-1" href="{forgotPasswordURL}">password?</a>
                   </div>
                   <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0 txt-a-r">
                       <a class="font-13 blue-navy-f-1" href="{privacyAndCookiesURL}"> Privacy & Cookies Notice </a>
                   </div>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>