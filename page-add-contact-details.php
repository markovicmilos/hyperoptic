<?php /* Template Name:  Add Building Contact Details Page */ ?>

<?php

require_once 'include/Services/API/DataTransfer/ContactDetailsDTO.php';
require_once 'include/Services/Log/Logger.php';

if ( !isset( $_REQUEST['siteid'] ) ) {
	header("Location: " . esc_url( home_url( '/' ) ));
}
else {
	$siteid = $_REQUEST['siteid'];
}

$api = new HomepageAPI();

if ( isset( $_REQUEST["tabid"] ) ){
	// POST FROM
	$contactDetails = new ContactDetailsDTO();
	$buildingType = "";
	switch ($_REQUEST["tabid"]){
		case 1: {
			$buildingType = 'BUILDING_MANAGER';
			break;
		}
		case 2: {
			$buildingType = 'RESIDENTS_ASSOCIATE';
			break;
		}
		case 3: {
			$buildingType = 'CONCIERGE';
			break;
		}
		case 4: {
			$buildingType = 'BUILDING_REPRESENTATIVE';
			break;
		}
		case 5: {
			$buildingType = 'FREEHOLDER';
			break;
		}
	}
	$contactDetails->setSiteId(				$siteid												);
	$contactDetails->setBuildingType(		$buildingType										);
	$contactDetails->setTitle(				htmlspecialchars($_REQUEST["nameTitle"])	        );
	$contactDetails->setFirstName(			htmlspecialchars($_REQUEST["firstname"])			);
	$contactDetails->setLastName(			htmlspecialchars($_REQUEST["lastname"])				);
	$contactDetails->setCompany(			htmlspecialchars($_REQUEST["companyname"])			);
	$contactDetails->setEmail(				htmlspecialchars($_REQUEST["email"])				);
	$contactDetails->setPhone(				htmlspecialchars($_REQUEST["mobile"])				);
	if (empty( $contactDetails->validate() ) ){
		if (!$api->addContactDetails($contactDetails)){
			$logger = new Logger();
			$logger->addError(' Not added contactDetailsDTO -> ' . var_export($contactDetails->getAssocArray(), true));
		} 
		$submitDONE = true;
	}
}

$siteFromAPI = $api->getSite($siteid);
$site = replaceSalesImageIfNoImage($siteFromAPI->siteForBuildingPage);
$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/add-contact-details.tpl" );
if (stristr($site->siteTypeGrouping, "business") !== FALSE) {
    $tpl->assignInclude("header", dirname(__FILE__) . "/templates/header-business.tpl");
} else {
    $tpl->assignInclude("header", dirname(__FILE__) . "/templates/header.tpl");
}
$tpl->assignInclude( "menu-empty", 	dirname ( __FILE__ ) . "/templates/menu-empty.tpl" );
$tpl->assignInclude( "sales-rep", 	dirname ( __FILE__ ) . "/templates/sales-rep.tpl" );
$tpl->assignInclude( "add-contact", 	dirname ( __FILE__ ) . "/templates/contact-details.tpl" );
$tpl->assignInclude( "building-sidebar-menu", 	dirname ( __FILE__ ) . "/templates/add-contact-sidebar-menu.tpl" );
$tpl->assignInclude( "report-a-problem", 	dirname ( __FILE__ ) . "/templates/modals/modal-report-a-problem.tpl" );
$tpl->assignInclude( "thank-you", 	dirname ( __FILE__ ) . "/templates/modals/modal-end.tpl" );
$tpl->prepare ();
	
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Thank You!");
$tpl->assign( "header-description",     "Thank you for your interest in Hyperoptic. We will be in touch with you shortly.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										<script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										<script>
											$(window).load(function(){
												$("#form-1").validate({ rules: {	email: "validEmail" } });
												$("#form-2").validate({ rules: {	email: "validEmail" } });
												$("#form-3").validate({ rules: {	email: "validEmail" } });
												$("#form-4").validate({ rules: {	email: "validEmail" } });
												$("#form-5").validate({ rules: {	email: "validEmail" } });' .
		(($submitDONE != null && $submitDONE) ?	'openModalWindow("endModal");' : '') .
											'});
										</script>') ;

$tpl->assignGlobal( 'site', $site->siteName);
								
$tpl->assign( 'sales-img', $site->imageSalesLink);
$tpl->assign( 'name', $site->salesAgentName);
$tpl->assign( 'phone', $site->salesAgentPhone);
$tpl->assign( 'email', $site->salesAgentEmail);
			
$tpl->assign( "menu-title", $site->siteName );

// tabs
$tpl->newBlock('add-contact-form');
$tpl->assign('tab-id', '1');
$tpl->assign('title', 'Building mnq.');
$tpl->assign('active-in', 'active in');
$tpl->newBlock('add-contact-form');
$tpl->assign('tab-id', '2');
$tpl->assign('title', 'Residents assoc.');
$tpl->newBlock('add-contact-form');
$tpl->assign('tab-id', '3');
$tpl->assign('title', 'Concierge');
$tpl->newBlock('add-contact-form');
$tpl->assign('tab-id', '4');
$tpl->assign('title', 'Building representative');										
$tpl->newBlock('add-contact-form');
$tpl->assign('tab-id', '5');
$tpl->assign('title', 'Freeholder');

$tpl->newBlock('tab-building-mng');
$tpl->newBlock('tab-residents-assoc');
$tpl->newBlock('tab-building-rep');

// header-top section
$breadcrumb = new Breadcrumb();
$breadcrumb->addBreadcrumb(array("Home","Residential",$site->siteName), array( esc_url( home_url( '/' )), esc_url( home_url( '/residential/' )), esc_url( home_url( '/register-interest/' )) . "?siteid=" . $siteid ), $tpl);

// ri message
if (isset( $_REQUEST['mode'] ) && $_REQUEST['mode'] === 'RI'){
	$tpl->newBlock('ri-header');
	$tpl->newBlock('ri-confirmation');
} else {
	$tpl->newBlock('nori-header');
	$tpl->newBlock('nori-confirmation');
}

$tpl->assignGlobal("modal-title", "Details received");
$tpl->assignGlobal("modal-msg-line-one", "Thank you for providing us with additional information about your building.");
$tpl->assignGlobal("modal-msg-line-two", 'Click <a href="'. esc_url( home_url( '/' )) .'">here</a> to go back to our homepage.');
$tpl->assignGlobal("disable-submit", ($submitDONE != null && $submitDONE) ? 'disabled="disabled"' : '');
$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

if (isset( $_REQUEST['mode'] ) && $_REQUEST['mode'] === 'RI'){
    $data = $api->getSiteForPostCodeId($_SESSION["lastPAF"]);
    $tpl->newBlock("tracking-ri-complete");
	$tpl->assign("track-city", $data->city );
	$tpl->assign("track-postcode", $data->postcode );
	$tpl->assign("track-building-status", $data->siteForBuildingPage->status );
	$tpl->assign("track-contract-expires",  $_REQUEST['contract']);
    $tpl->assign("track-riid", $_REQUEST['riid']);
} else {
	$tpl->newBlock("tracking-base");
}

$tpl->newBlock('five-tabs');
$tpl->newBlock('tab-concierge');

$tpl->printToScreen();

?>

<?php get_footer(); ?>
