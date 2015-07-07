<?php /* Template Name: Angular Order Process Business Page */ ?>

<?php

if (!isset($_REQUEST["pafid"])){
    header("Location: " . esc_url( home_url( '/' ) ));
}

$pafid = $_REQUEST["pafid"];

$isBusiness = true;

if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}

$routingSecurity = new RoutingSecurityAPI();
$routingSecurity->routingProtectPage();

$api = new HomepageAPI();
$pafData = $api->getFullAddress($pafid);
$siteData = $api->getSiteForPostCodeId($pafid);
$CSF = generateUUID();
$_SESSION["CSF"] = $CSF;

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/order/order-page-business.tpl" );
$tpl->assignInclude("header", dirname(__FILE__) . "/templates/order/header.tpl");


$tpl->assignInclude( "phone-terms", 	dirname ( __FILE__ ) . "/templates/modals/modal-terms.tpl" );
$tpl->assignInclude( "modal-empty", 	dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );

$tpl->prepare ();

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );
$tpl->assignGlobal( "business",         "/business/");

// Header section
$tpl->assign( "header-title", 			        "Hyperoptic | Your Order | Select Package");
$tpl->assign( "header-description",             "Fantastic deals on phone and broadband packages from Hyperoptic. Select your level of coverage. ");
$tpl->assign( "header-css", 			        BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		        join(' ', get_body_class()) );
$tpl->assign( 'user-ip', 				        $ip );
$tpl->assign( 'pafid',					        $pafid);
$tpl->assign( 'is-business',                    $isBusiness ? 'true' : 'false');
$tpl->assign( 'addressBox', 			        $pafData );
$tpl->assign( 'address',				        $siteData->address );
$tpl->assign( 'postcode',				        $siteData->postcode );
$tpl->assign( 'city',					        $siteData->city );
$tpl->assign( 'routingURL',				        esc_url( home_url( '/routing' )) . "?siteid=" . $_REQUEST["siteid"] );
$tpl->assign( "additional-modal-data",          'data-backdrop="static"');
$tpl->assign( 'terms-and-conditions',           $isBusiness ? 'terms-and-conditions-for-hyperoptics-business-broadband-service' : 'website-terms-and-conditions');
$tpl->assign( 'live-or-pre-order',              $siteData->siteForBuildingPage->statusId == SiteStatus::Live ? "Live" : "Pre-order" );
$tpl->assign( 'premise-have-active-service',    $siteData->premiseHaveActiveService ? 'true' : 'false');
$tpl->assign( 'csfId',                          $_SESSION["CSF"]);

$tpl->newBlock('Business-templates');
$tpl->newBlock('Business-header');

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->printToScreen();

?>

<?php get_footer(); ?>