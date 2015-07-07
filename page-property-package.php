<?php /* Template Name: Property Package Page */ ?>

<?php

require_once 'include/Services/API/DataTransfer/BuildingUnknownDTO.php';

$api = new HomepageAPI();

if ( isset( $_POST["pafid"] ) ){
    // POST FROM
    $buildingUnknown = new BuildingUnknownDTO();
    $buildingUnknown->setPafId(				htmlspecialchars($_POST["pafid"])				);
    $buildingUnknown->setTitle(				htmlspecialchars($_POST["nameTitle"])			);
    $buildingUnknown->setFirstName(			htmlspecialchars($_POST["firstname"])			);
    $buildingUnknown->setLastName(			htmlspecialchars($_POST["lastname"])				);
    $buildingUnknown->setPhone(				htmlspecialchars($_POST["phone"])				);
    $buildingUnknown->setMobile(			htmlspecialchars($_POST["mobile"])				);
    $buildingUnknown->setEmail(				htmlspecialchars($_POST["email"])				);
    $buildingUnknown->setPropertyType(		htmlspecialchars($_POST["propertyType"])			);
    $buildingUnknown->setOwnership(			htmlspecialchars($_POST["ownership"])			);
    $buildingUnknown->setNumOfApartments(	htmlspecialchars($_POST["numOfApartments"])		);
    $buildingUnknown->setCurrentProvider(	htmlspecialchars($_POST["currentProvider"])		);
    $buildingUnknown->setCurrentSpeed(		htmlspecialchars($_POST["currentSpeed"])			);
    $buildingUnknown->setContractEnd(		htmlspecialchars($_POST["contractEnd"])			);
    $buildingUnknown->setAboutUs(			htmlspecialchars($_POST["aboutUs"])				);
    $buildingUnknown->setReceiveInfo(		($_POST["receiveInfo"])=="on" ? true : false		);

    if (empty( $buildingUnknown->validate() ) ){
        if (!$api->buildingUnknown($buildingUnknown)){
            $logger = new Logger();
            $logger->addError(' Not added BuildingUnknownDTO -> ' . var_export($buildingUnknown->getAssocArray(), true));
        }
        $dataSubmited = true;
    }
}

$city="";
$address="";
$pafid="";
if (isset($_SESSION['address'])){
    $address = $_SESSION['address'];
    unset($_SESSION['address']);
}
if (isset($_SESSION['city'])){
    $city = $_SESSION['city'];
    unset($_SESSION['city']);
}
if (isset($_SESSION['pafid'])){
    $pafid = $_SESSION['pafid'];
    unset($_SESSION['pafid']);
}

$q = "NW1 3AA";
if (isset($_GET['q'])){
    $q = $_GET['q'];
}

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/property-package.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "menu-empty", 	dirname ( __FILE__ ) . "/templates/menu-empty.tpl" );
$tpl->assignInclude( "report-a-problem", 	dirname ( __FILE__ ) . "/templates/modals/modal-report-a-problem.tpl" );
$tpl->assignInclude( "hear-about-us", 	dirname ( __FILE__ ) . "/templates/hear-about-us.tpl" );
if ($dataSubmited === true){
    $tpl->assignInclude( "modal", 	dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );
}

$tpl->prepare ();
$tpl->assignGlobal( "home-url", 				esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 				BASE_URL );
$tpl->assignGlobal( "report-problem-link",		esc_url( home_url( '/contact-us' )) );
// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Add a Building");
$tpl->assign( "header-description",     "Add contact details for your building to find out more about getting Hyperoptic internet.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="https://maps.googleapis.com/maps/api/js"></script>
										 <script src="' . BASE_URL . '/js/map.js"></script>
										 <script src="' . BASE_URL . '/js/global.js"></script>
										 <script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										 <script src="' . BASE_URL . '/js/additional-methods.js"></script>
										 <script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										 <script>
											var baseURL = "' . BASE_URL . '";
											var london = new google.maps.LatLng(51.507842, -0.066678);	
											var map;
											var postcode = "' . $q . '";
											markerIcons[2] = "../wp-content/themes/hyperoptic/images/map-marker-gray-icon.png";
											google.maps.event.addDomListener(window, \'load\', initializeBuildingUnknown);
											$( document ).ready(function() {
												$("#registerInterestForm").validate({ rules: {	email: "validEmail" } });	'.
    ( $dataSubmited === true ?						"openModalWindow('modal'); $('#submitDataBtn').attr('disabled','disabled');" : "" )
    .'});
										</script>' );

$tpl->assign( "address", 				$address );
$tpl->assign( "city", 					$city );
$tpl->assign( "postcode", 				$q );
$tpl->assign( "pafid",					$pafid);
$tpl->assign( "modal-title",			"Thank you");
$tpl->assign( "modal-msg-line-one",		"You have added this building to our database.");

// Menu section
$tpl->assign( "menu-title", $q);
$breadcrumb = new Breadcrumb();
$breadcrumb->addBreadcrumb(array("Home","Residential"), array( esc_url( home_url( '/' )), esc_url( home_url( '/residential/' )) ), $tpl);

$tpl->newBlock('close-modal-dialog');

$api->addHowYouHearAboutUs($tpl, InputSizeTypes::Big);
$login = new LoginAPI();
if ($login->isLogin()){
    $tpl->assignGlobal( "blue",                   "-blue");
    $tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>

<?php get_footer(); ?>