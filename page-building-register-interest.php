<?php /* Template Name: Building Register Interest Page */ ?>

<?php

require_once 'include/Services/API/DataTransfer/RegisterInterestDTO.php';

$api = new HomepageAPI();

if (isset($_POST["firstname"])) {
    // POST FROM
    $ri = new RegisterInterestDTO();
    $ri->setAddressId(htmlspecialchars($_POST["pafid"]));
    $ri->setTitle(htmlspecialchars($_POST["nameTitle"]));
    $ri->setFirstName(htmlspecialchars($_POST["firstname"]));
    $ri->setLastName(htmlspecialchars($_POST["lastname"]));
    $ri->setPhone(htmlspecialchars($_POST["phone"]));
    $ri->setMobile(htmlspecialchars($_POST["mobile"]));
    $ri->setEmail(htmlspecialchars($_POST["email"]));
    $ri->setCurrentProvider(htmlspecialchars($_POST["currentProvider"]));
    $ri->setCurrentDownloadSpeed(htmlspecialchars($_POST["currentSpeed"]));
    $ri->setExistingContractEndDescription(htmlspecialchars($_POST["contractEnd"]));
    $ri->setKnownSourceId(htmlspecialchars($_POST["aboutUs"]));
    $ri->setReceiveContactInfo(($_POST["informations"] == "on") ? true : false);
    $ri->setReceiveServiceInfo(($_POST["goodandservices"] == "on") ? true : false);
    $ri->setComment(htmlspecialchars($_POST["comment"]));
    $ri->setPostcode(htmlspecialchars($_POST["postcode"]));
    $ri->setInterest(htmlspecialchars($_POST["interest"]));

    if (empty($ri->validate())) {
        $riId = $api->registerInterest($ri);
        if ($riId <= 0) {
            $logger = new Logger();
            $logger->addError(' Not added RIDTO -> ' . var_export($ri->getAssocArray(), true));
        }
        $_SESSION["lastPAF"] = $_REQUEST["pafid"];
        header("Location: " . esc_url(home_url('/confirm-registering-interest')) . "?mode=RI&riid=" . $riId  . "&siteid=" . $_REQUEST['siteid'] . "&contract=" . urlencode($_POST["contractEnd"]));
    }
}
// GET PAGE
$routingSecurity = new RoutingSecurityAPI();
$routingSecurity->routingProtectPage();
if (!isset($_REQUEST['siteid']))
    header("Location: " . esc_url(home_url('/')));

$siteFromAPI = $api->getSite($_REQUEST['siteid']);

$site = replaceSalesImageIfNoImage($siteFromAPI->siteForBuildingPage);
$site = replaceSiteImageIfNoImage($site);
$site = replaceComingSoonIntoRIFromSite($site);

$_SESSION['siteId'] = $_REQUEST['siteid'];
$_SESSION['siteType'] = $site->siteTypeGrouping;

if (isset($_REQUEST["pafid"])) {
    $data      = $api->getSiteForPostCodeId($_REQUEST["pafid"]);
    $pafidInfo = array ("pafid"    => $_REQUEST["pafid"],
                        "address"  => $data->address . ", " . $data->city . ", " . $data->postcode,
                        "postcode" => $data->postcode);
}

$postcodeStart = "";
$locations     = array (0 => array ("latitude"  => $siteFromAPI->latitude,
                                    "longitude" => $siteFromAPI->longitude,
                                    "statusId"  => $site->statusId,
                                    "status"    => $site->status,));
if (count($siteFromAPI->postcodes) > 0) {
    if ($siteFromAPI->postcodes[0] != null) {
        $postcodeStart = substr($siteFromAPI->postcodes[0], 0, 3);
    }
}

$tpl = new TemplatePower (dirname(__FILE__) . "/templates/building-master.tpl");
$tpl->assignInclude("header", dirname(__FILE__) . "/templates/header.tpl");
$tpl->assignInclude("menu-empty", dirname(__FILE__) . "/templates/menu-empty.tpl");
$tpl->assignInclude("banner", dirname(__FILE__) . "/templates/1gig-banner.tpl");
$tpl->assignInclude("building-page", dirname(__FILE__) . "/templates/building-page.tpl");
$tpl->assignInclude("sales-rep", dirname(__FILE__) . "/templates/sales-rep.tpl");
$tpl->assignInclude("site-progress", dirname(__FILE__) . "/templates/site-progress.tpl");
$tpl->assignInclude("building-sidebar-menu", dirname(__FILE__) . "/templates/building-sidebar-menu.tpl");
$tpl->assignInclude("ri-bar", dirname(__FILE__) . "/templates/register-interest-progress-bar.tpl");
$tpl->assignInclude("ri-check", dirname(__FILE__) . "/templates/register-interest-check-postcode.tpl");
$tpl->assignInclude("hear-about-us", dirname(__FILE__) . "/templates/hear-about-us.tpl");
$tpl->assignInclude("postcode-results", dirname(__FILE__) . "/templates/elastic-results.tpl");
$tpl->assignInclude("building-contact-popup", dirname(__FILE__) . "/templates/modals/modal-building-contact.tpl");
$tpl->assignInclude("report-a-problem-popup", dirname(__FILE__) . "/templates/modals/modal-report-a-problem.tpl");
if ($siteFromAPI->champions != null && !empty($siteFromAPI->champions)) {
    $tpl->assignInclude("champions", dirname(__FILE__) . "/templates/champions-side-bar.tpl");
} else {}

$tpl->prepare();

$siteORSiteGroup = ($site->siteGroupId != null) ? "var sitegroupid = " . $site->siteGroupId . ";var siteid = null;" : "var siteid = " . $_REQUEST['siteid'] . ";var sitegroupid = null;";

$tpl->assignGlobal("home-url", esc_url(home_url('/')));
$tpl->assignGlobal("base-url", BASE_URL);
$tpl->assignGlobal("siteid", $_REQUEST['siteid']);

if($siteFromAPI->registerInterestPercent < 10) {
	$siteFromAPI->registerInterestPercent = 5;
} 

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Register Interest");
$tpl->assign( "header-description",     "Register your building to stay up to date with Hyperoptic's service and availability.");
$tpl->assign( "header-css",             BASE_URL . "/css/hyper.css");
$tpl->assign( "header-body-class",      join(' ', get_body_class()));
$tpl->assign( "header-jscript",         '<script src="https://maps.googleapis.com/maps/api/js"></script>
										<script src="' . BASE_URL . '/js/map.js"></script>
										<script src="' . BASE_URL . '/js/markerclusterer.js"></script>
										<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										<script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										<script src="' . BASE_URL . '/js/facebook-login.js"></script>
										<script>
											var homeURL = "' . esc_url(home_url('/')) . '";
											' . $siteORSiteGroup . '
											var animated = false;
											var london = new google.maps.LatLng(51.507842, -0.066678);
											var map;
											var locations = ' . json_encode($locations) . ';
											google.maps.event.addDomListener(window, \'load\', initializeMap);
											$( document ).ready(function() {
												onRILoad("' . $siteFromAPI->registerInterestPercent . '%");
												$("#registerInterestForm").validate({ignore: "", rules: {	email: "validEmail" } });' . (($pafidInfo != null) ? 'selectPostCode("' . $pafidInfo['pafid'] . '", "' . $pafidInfo['address'] . '", "' . $pafidInfo['postcode'] . '");' : '') . '});
										</script>');
$tpl->assign('site-img', $site->imageSiteLink);
$tpl->assign('sales-img', $site->imageSalesLink);
$tpl->assign('name', $site->salesAgentName);
$tpl->assign('phone', $site->salesAgentPhone);
$tpl->assign('email', $site->salesAgentEmail);
if (stristr($site->siteTypeGrouping, "business") !== FALSE) {
    $tpl->assign('interest', 'business');
} else {
    $tpl->assign('interest', 'consumer');
}

$tpl->assignGlobal('site', $site->siteName);
$tpl->assignGlobal('siteid', $site->siteId);

// Menu section
$tpl->assign("menu-title", $site->siteName);

$tpl->assign('percentage', $siteFromAPI->registerInterestPercent);
	
if ($siteFromAPI->registerInterestNeeded < 1) {
    $tpl->assign('percentage', 95);
    $tpl->newBlock('no-more-required');
} else {
    $tpl->newBlock('required-one-or-more');
    $tpl->assign('required', $siteFromAPI->registerInterestNeeded);
}

$breadcrumb = new Breadcrumb();
$breadcrumb->addBreadcrumb(array ("Home", "Residential"), array(esc_url(home_url('/')), esc_url(home_url('/residential/'))), $tpl);

$tpl->newBlock('assigned-postcodes');
$tpl->assign('city', $site->siteCityName);
$tpl->assign('area', $postcodeStart);

if ($siteFromAPI->champions != null) {
    foreach ($siteFromAPI->champions as $value) {
        $tpl->newBlock('champion');
        $tpl->assign('champion-name', $value->name);
        $tpl->assign('champion-phone', $value->phone);
        $tpl->assign('champion-email', $value->email);
    }
}

foreach ($siteFromAPI->postcodes as $value) {
    $tpl->newBlock('postcodes');
    $tpl->assign('pcd', $value);
}

$tpl->newBlock('status-ri');

if ($siteFromAPI->siteStatusMessages != null) {
    foreach ($siteFromAPI->siteStatusMessages as $step) {
        if ($step->stage == 0 || $step->messageText == "")
            continue;
        if ($step->stage == 3) {
            $className = "progress-done-medium-green";
        } else if ($step->stage == 2) {
            $className = "progress-done-light-green";
        } else {
            $className = "progress-done-gry";
        }
        $tpl->newBlock("step");
        $tpl->assign("title", $step->messageText);
        $tpl->assign("status-class", $className);
    }
}

$tpl->newBlock('reg-int-progress-msg');

$api->addHowYouHearAboutUs($tpl, InputSizeTypes::Medium);

if (empty($siteFromAPI->champions)){
    $tpl->newBlock("champion-link");
}

$login = new LoginAPI();
if ($login->isLogin()) {
    $tpl->assignGlobal("blue", "-blue");
    $tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");
$tpl->newBlock("ri-banner");
$tpl->newBlock("residential-ri-bar");
$tpl->newBlock("residential-update-us-link");
$tpl->newBlock("residential-add-building-contact-details");

$tpl->printToScreen();

?>

<?php get_footer(); ?>
