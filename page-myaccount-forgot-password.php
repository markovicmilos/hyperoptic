<?php /* Template Name: My Account Forgot Password Page */ ?>

<?php

$login = new LoginAPI();

if ( isset($_POST["email"]) && isset($_POST["dateOfBirth"]) ){
	$resetInProgress = true;
	$isPasswordChangeOK = $login->requestPasswordChange($_POST["email"], $_POST["dateOfBirth"]);	
}

if ($login->isLogin()){
    header("Location: " . esc_url(home_url('/myaccount/')));
}

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/my-account-forgot-password.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "menu-login", 	dirname ( __FILE__ ) . "/templates/menu-login.tpl" );

$tpl->prepare ();


$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Forgotten Password");
$tpl->assign( "header-description",     "Forgotten username and password recovery");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										<script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										<script src="' . BASE_URL . '/js/bootstrap-datepicker.js"></script>
										 <script>
											$( document ).ready(function() {
												$("#forgotForm").validate({ rules: {	email: "validEmail" } });
												$("input.datepicker").datepicker({startView: "decade", endDate: "-18y"});
											});
										</script>' );

$tpl->assign( "title", 					"Forgot your password" );
$tpl->assign( "forgotPasswordURL",      esc_url( home_url( '/forgot-password' )) );
$tpl->assign( "privacyAndCookiesURL",   esc_url( home_url( '/privacy-and-cookie-policy' )) );
if ( $resetInProgress === true ){
	if ( $isPasswordChangeOK === true ){
		$tpl->assign("info",			"An e-mail with the new password has been sent to you!");
	} else {
		$tpl->assign("info", 			"The email address or date of birth do not match our records!");
	}
}

$tpl->newBlock("tracking-base");
	
$tpl->printToScreen();

?>


<?php get_footer(); ?>