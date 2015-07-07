<?php /* Template Name: Order Process Page */ ?>

<?php

if (!isset($_REQUEST["pafid"])){
	header("Location: " . esc_url( home_url( '/' ) ));
}

$pafid = $_REQUEST["pafid"];

if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
	$ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
	$ip = $_SERVER['REMOTE_ADDR'];
}

/*$routingSecurity = new RoutingSecurityAPI();
$routingSecurity->routingProtectPage();*/

$api = new HomepageAPI();
$pafData = $api->getFullAddress($pafid);
$siteData = $api->getSiteForPostCodeId($pafid);

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/order-process-page.tpl" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->assignInclude("header", dirname(__FILE__) . "/templates/header-business.tpl");
} else {
    $tpl->assignInclude("header", dirname(__FILE__) . "/templates/header.tpl");
}
$tpl->assignInclude( "select-package", 	dirname ( __FILE__ ) . "/templates/select-package.tpl" );
$tpl->assignInclude( "product", 	dirname ( __FILE__ ) . "/templates/product.tpl" );
$tpl->assignInclude( "phone-product", 	dirname ( __FILE__ ) . "/templates/phone-product.tpl" );
$tpl->assignInclude( "account-details", 	dirname ( __FILE__ ) . "/templates/account-details.tpl" );
$tpl->assignInclude( "payment-details", 	dirname ( __FILE__ ) . "/templates/payment-details.tpl" );
$tpl->assignInclude( "confirmation", 	dirname ( __FILE__ ) . "/templates/confirmation.tpl" );
$tpl->assignInclude( "order-summary", 	dirname ( __FILE__ ) . "/templates/order-summary.tpl" );
$tpl->assignInclude( "selected-address", 	dirname ( __FILE__ ) . "/templates/selected-address.tpl" );
$tpl->assignInclude( "tab-faceplate", 	dirname ( __FILE__ ) . "/templates/tab-faceplate.tpl" );
$tpl->assignInclude( "tab-broadband", 	dirname ( __FILE__ ) . "/templates/tab-broadband.tpl" );
$tpl->assignInclude( "tab-broadband-and-phone", 	dirname ( __FILE__ ) . "/templates/tab-broadband-and-phone.tpl" );
$tpl->assignInclude( "continue-button", 	dirname ( __FILE__ ) . "/templates/continue-button.tpl" );
// for bb and phone
$tpl->assignInclude( "product-details", 	dirname ( __FILE__ ) . "/templates/product.tpl" );
// for bb 
$tpl->assignInclude( "product-details-bb", 	dirname ( __FILE__ ) . "/templates/product-bb.tpl" );
$tpl->assignInclude( "phone-terms", 	dirname ( __FILE__ ) . "/templates/modals/modal-terms.tpl" );
$tpl->assignInclude( "modal-empty", 	dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );

$tpl->prepare ();	

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Your Order | Select Package");
$tpl->assign( "header-description",     "Fantastic deals on phone and broadband packages from Hyperoptic. Select your level of coverage. ");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/order.js?v=1"></script>
										 <script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										 <script src="' . BASE_URL . '/js/additional-methods.js"></script>
										 <script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										 <script src="' . BASE_URL . '/js/bootstrap-datepicker.js"></script>
										 <script src="' . BASE_URL . '/js/md5.js"></script>
										 <script>
											var pafid = ' . $pafid . ';
											initOrder();
											$( document ).ready(function() {
												orderOnLoad();' .
    ($siteData->premiseHaveActiveService ?       'openModalWindow("modalPremiseActive")' : '')
											. '});
										 </script>') ;

// address section
$tpl->assign( 'addressBox', 			$pafData );
$tpl->assign( 'address',				$siteData->address );
$tpl->assign( 'postcode',				$siteData->postcode );
$tpl->assign( 'city',					$siteData->city );
$tpl->assign( 'routingURL',				esc_url( home_url( '/routing' )) . "?siteid=" . $_REQUEST["siteid"] );
$tpl->assign( 'pafid',					$pafid);
$tpl->assign( 'userip', 				$ip );
$tpl->assign( "additional-modal-data",  'data-backdrop="static"');

$tpl->assign( 'terms-and-conditions', (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) ? 'terms-and-conditions-for-hyperoptics-business-broadband-service' : 'website-terms-and-conditions');

if ($siteData->premiseHaveActiveService) {
    $tpl->assign('addOnDivID', "PremiseActive");
    $tpl->assign('modal-title', "Have you selected the right address?");
    $tpl->assign('modal-msg-line-one', "We have previously received a request for service for this address.");
    $tpl->assign('modal-msg-line-two', "If this is your address, please contact Customer Support on 0333 332 1120 for further assistance.");
    $tpl->assign( "additional-modal-data",  'data-backdrop="static"');
    $tpl->newBlock('close-modal-dialog-home');
} else {
    $tpl->assign('addOnDivID', "ThankYou");
    $tpl->assign('modal-title', "Thank you for placing the order");
    $tpl->assign('modal-msg-line-one', "Your Hyperoptic Socket order has been successfully placed.");
    $tpl->assign('modal-msg-line-two', "You'll receive an email confirming your Hyperoptic Socket order, and we'll be in touch with you soon to arrange an installation date.");
    $tpl->newBlock('close-modal-dialog-home');
}
// faceplate only 
$tpl->assign( "faceplate-price", '200' );		

// phone section
//$tpl->assign( "anytimeuk-price", '20' );		
//$tpl->assign( "international-price", "5.00" );
//$tpl->assign( "line-rental-product-price", "12.50" );														

// summary section
$tpl->assign( 'total', '72.50');
$tpl->assign( 'total-discount', '35.00');
$tpl->assign( "bb-product-name", "Hypersonic (1 Gig + Phone)" );
$tpl->assign( "bb-product-price", "50.00" );

$tpl->assign( "bb-product-price", "50.00" );
$tpl->assign( "bb-product-price-discount", "25.00" );
$tpl->assign( "line-rental-price", "12.50" );
$tpl->assign( "line-rental-price-discount", "5.00" );

$tpl->newBlock('promotion');
$tpl->assign( "discount-months", "6" );

$tpl->newBlock('add-on-title');
$tpl->assign( "add-on-title-value", "Anytime UK" );
$tpl->newBlock('add-on-title');
$tpl->assign( "add-on-title-value", "International Calls" );

$tpl->newBlock('add-on-price');
$tpl->assign( "add-on-price-value", "5.00" );
$tpl->newBlock('add-on-price');
$tpl->assign( "add-on-price-value", "5.00" );

$tpl->newBlock('add-on-price-discount');
$tpl->assign( "add-on-price-discount-value", "0.00" );

$tpl->newBlock('add-on-price-discount');
$tpl->assign( "add-on-price-discount-value", "0.00" );

$tpl->newBlock('connection-charge');
$tpl->newBlock('faceplate-installation');

$tpl->newBlock('connection-charge-price');
$tpl->assign( "connection-charge-price-value", "20.00" );
$tpl->newBlock('faceplate-installation-price');
$tpl->assign( "faceplate-installation-price-value", "240.00" );

$tpl->newBlock('connection-charge-price-discount');
$tpl->assign( "connection-charge-price-discount-value", "0.00" );
$tpl->newBlock('faceplate-installation-price-discount');
$tpl->assign( "faceplate-installation-price-discount-value", "0.00" );

$tpl->newBlock('total');
$tpl->assign( "oneoff", "0.00" );

$tpl->newBlock('vat');
$tpl->assign( "vat-price", "23.70" );
$tpl->assign( "vat-price-discount", "10.70" );

$tpl->newBlock('status-live');
$tpl->assign( "live-or-pre-order", $siteData->siteForBuildingPage->statusId == SiteStatus::Live ? "Live" : "Pre-order" );

// products bb & phone
$tpl->newBlock('product');	
$tpl->assign( "state", "SELECT" );
$tpl->assign( "product-description", "The UK's most powerful service for limitless online freedom." );
$tpl->assign( "product-title", "1Gb Fibre Broadband and Phone" );
$tpl->assign( "product-id", "1" );

if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('business-use-with');
    $tpl->assign( "image-id", "1" );
} else {
    $tpl->newBlock('residential-use-with');
    $tpl->assign( "image-id", "1" );
}

$tpl->newBlock('enable-click');
$tpl->assign( "product-id", "1" );

$tpl->newBlock('inactive-product');
$tpl->assign( "product-id", "1" );
$tpl->assign( "image-id", "1" );

$tpl->newBlock('price1');
$tpl->assign( "product-price", "50.00" );
$tpl->newBlock('offer1');
$tpl->assign( "promotion-months", "3" );
$tpl->newBlock('offer2');

$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Up to 1,000Mb for downloads AND uploads" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Always fast, even at peak times" );	
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "FREE Hyperhub router" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "FREE evening and weekend landline calls" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Phone Includes voicemail and call waiting" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('pros');
    $tpl->assign( "pros-text", "Prices include VAT" );
}


// ----------------------------------------

$tpl->newBlock('product');	
$tpl->assign( "state", "SELECT" );
$tpl->assign( "product-description", "The ideal package to power your household's online experience." );
$tpl->assign( "product-title", "100Mb Fibre Broadband and Phone" );
$tpl->assign( "product-id", "100" );

if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('business-use-with');
    $tpl->assign( "image-id", "100" );
} else {
    $tpl->newBlock('residential-use-with');
    $tpl->assign( "image-id", "100" );
}

$tpl->newBlock('enable-click');
$tpl->assign( "product-id", "100" );

$tpl->newBlock('inactive-product');
$tpl->assign( "product-id", "100" );

$tpl->newBlock('price1');
$tpl->assign( "product-price", "25.00" );
$tpl->newBlock('offer1');
$tpl->assign( "promotion-months", "2" );
$tpl->newBlock('offer2');

$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Up to 100Mb for downloads AND uploads" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "No slow downs, no limits" );	
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "FREE Hyperhub router" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "FREE evening and weekend landline calls" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Phone Includes voicemail and call waiting" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('pros');
    $tpl->assign( "pros-text", "Prices include VAT" );
}
		
// ---------------------------------------

$tpl->newBlock('product');	
$tpl->assign( "state", "SELECT" );
$tpl->assign( "product-description", "A fast and dependable service for general internet use." );
$tpl->assign( "product-title", "20Mb Fibre Broadband and Phone" );
$tpl->assign( "product-id", "20" );

if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('business-use-with');
    $tpl->assign( "image-id", "20" );
} else {
    $tpl->newBlock('residential-use-with');
    $tpl->assign( "image-id", "20" );
}

$tpl->newBlock('enable-click');
$tpl->assign( "product-id", "20" );

$tpl->newBlock('inactive-product');
$tpl->assign( "product-id", "20" );

$tpl->newBlock('price2');
$tpl->assign( "product-price", "15.00" );

$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Up to 20Mb downloads, 1Mb uploads" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "No slow downs, no limits" );	
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "FREE Hyperhub router" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "FREE evening and weekend landline calls" );
$tpl->newBlock('pros');
$tpl->assign( "pros-text", "Phone Includes voicemail and call waiting" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('pros');
    $tpl->assign( "pros-text", "Prices include VAT" );
}
		
// ------------------

// products bb
$tpl->newBlock('product-bb');	
$tpl->assign( "state", "SELECT" );
$tpl->assign( "product-description", "The UK's most powerful service for limitless online freedom." );
$tpl->assign( "product-title", "1Gb Fibre Broadband" );
$tpl->assign( "product-id", "10" );

if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('business-bb-use-with');
    $tpl->assign( "image-id", "1" );
} else {
    $tpl->newBlock('residential-bb-use-with');
    $tpl->assign( "image-id", "1" );
}

$tpl->newBlock('enable-click1');
$tpl->assign( "product-id", "10" );

$tpl->newBlock('inactive-product1');
$tpl->assign( "product-id", "10" );
$tpl->assign( "image-id", "1" );

$tpl->newBlock('price11');
$tpl->assign( "product-price", "50.00" );
$tpl->newBlock('offer11');
$tpl->assign( "promotion-months", "3" );
$tpl->newBlock('offer21');

$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "Up to 1,000Mb for downloads AND uploads" );
$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "Always fast, even at peak times" );	
$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "FREE Hyperhub router" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('pros1');
    $tpl->assign( "pros-text", "Prices include VAT" );
}

// ----------------------------------------

$tpl->newBlock('product-bb');	
$tpl->assign( "state", "SELECT" );
$tpl->assign( "product-description", "The ideal package to power your household's online experience." );
$tpl->assign( "product-title", "100Mb Fibre Broadband" );
$tpl->assign( "product-id", "101" );

if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('business-bb-use-with');
    $tpl->assign( "image-id", "100" );
} else {
    $tpl->newBlock('residential-bb-use-with');
    $tpl->assign( "image-id", "100" );
}

$tpl->newBlock('enable-click1');
$tpl->assign( "product-id", "101" );

$tpl->newBlock('inactive-product1');
$tpl->assign( "product-id", "101" );
$tpl->assign( "image-id", "100" );

$tpl->newBlock('price11');
$tpl->assign( "product-price", "25.00" );
$tpl->newBlock('offer11');
$tpl->assign( "promotion-months", "3" );
$tpl->newBlock('offer21');

$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "Up to 100Mb for downloads AND uploads" );
$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "No slow downs, no limits" );	
$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "FREE Hyperhub router" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('pros1');
    $tpl->assign( "pros-text", "Prices include VAT" );
}
		
// ------------------

$tpl->newBlock('product-bb');	
$tpl->assign( "state", "SELECT" );
$tpl->assign( "product-description", "A fast and dependable service for general internet use." );
$tpl->assign( "product-title", "20Mb Fibre Broadband" );
$tpl->assign( "product-id", "200" );

if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('business-bb-use-with');
    $tpl->assign( "image-id", "20" );
} else {
    $tpl->newBlock('residential-bb-use-with');
    $tpl->assign( "image-id", "20" );
}

$tpl->newBlock('enable-click1');
$tpl->assign( "product-id", "200" );

$tpl->newBlock('inactive-product1');
$tpl->assign( "product-id", "200" );
$tpl->assign( "image-id", "20" );

$tpl->newBlock('price11');
$tpl->assign( "product-price", "15.00" );
$tpl->newBlock('offer11');
$tpl->assign( "promotion-months", "3" );
$tpl->newBlock('offer21');

$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "Up to 20Mb downloads, 1Mb uploads" );
$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "No slow downs, no limits" );	
$tpl->newBlock('pros1');
$tpl->assign( "pros-text", "FREE Hyperhub router" );
if (stristr($siteData->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
    $tpl->newBlock('pros1');
    $tpl->assign( "pros-text", "Prices include VAT" );
}

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>

<?php get_footer(); ?>