<?php /* Template Name: My Account Login Page */ ?>

<?php

$login = new LoginAPI();

if ( isset($_POST["email"]) && isset($_POST["password"]) ){
	$isLoginOK = $login->login($_POST["email"], $_POST["password"]);
}

if ($login->isLogin()){
    header("Location: " . esc_url(home_url('/myaccount/')));
}

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/my-account-login.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "menu-login", 	dirname ( __FILE__ ) . "/templates/menu-login.tpl" );

$tpl->prepare ();


$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Sign In");
$tpl->assign( "header-description",     isset($isLoginOK) && !$isLoginOK ? "Incorrect login information" : "Access My Hyperoptic Account  for billing & payments, package details and troubleshooting. Login Here!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "blue",                   "-blue");
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										<script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										 <script>
											$( document ).ready(function() {
												$("#loginForm").validate({ rules: {	email: "validEmail" } });
											});
										</script>' );

$tpl->assign( "title", 					"Sign in" );
$tpl->assign( "forgotPasswordURL",      esc_url( home_url( '/forgot-password' )) );
$tpl->assign( "privacyAndCookiesURL",   esc_url( home_url( '/privacy-and-cookie-policy' )) );
if ( isset($isLoginOK) && !$isLoginOK ){
	$tpl->assign("error-login", 		"Email address/password incorrect!");
}

$tpl->newBlock("tracking-base");
	
$tpl->printToScreen();

?>


<?php get_footer(); ?>