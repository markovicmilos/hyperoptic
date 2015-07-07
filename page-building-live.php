<?php /* Template Name: Building Live Page */ ?>

<?php

$api = new HomepageAPI();

$routingSecurity = new RoutingSecurityAPI();
$routingSecurity->routingProtectPage();

if (!isset($_REQUEST['siteid']))
    header("Location: " . esc_url(home_url('/')));

$siteFromAPI = $api->getSite($_REQUEST['siteid']);

$site = replaceSiteImageIfNoImage($siteFromAPI->siteForBuildingPage);
$site = replaceComingSoonIntoRIFromSite($site);

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
$tpl->assignInclude("site-live", dirname(__FILE__) . "/templates/building-live.tpl");
$tpl->assignInclude("live-header", dirname(__FILE__) . "/templates/live-header.tpl");

$tpl->prepare();

$siteORSiteGroup = ($site->siteGroupId != null) ? "var sitegroupid = " . $site->siteGroupId . ";var siteid = null;" : "var siteid = " . $_REQUEST['siteid'] . ";var sitegroupid = null;";

$tpl->assignGlobal("home-url", esc_url(home_url('/')));
$tpl->assignGlobal("base-url", BASE_URL);
$tpl->assignGlobal("siteid", $_REQUEST['siteid']);

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | " . $site->siteName);
$tpl->assign( "header-description",     "Hyperoptic is live in " . $site->siteName . ". Get the fastest 1 Gig broadband in the UK with phone and broadband only options. Start your order now!");
$tpl->assign( "header-css",             BASE_URL . "/css/hyper.css");
$tpl->assign( "header-body-class",      join(' ', get_body_class()));
$tpl->assign( "header-jscript",         '<script src="https://maps.googleapis.com/maps/api/js"></script>
                                        <script src="' . BASE_URL . '/js/map.js"></script>
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
												initPostcodeElasticOnBuildingPages("postcode");
												$("#registerInterestForm").validate({ rules: {	email: "validEmail" } });' . (($pafidInfo != null) ? 'selectPostCode("' . $pafidInfo['pafid'] . '", "' . $pafidInfo['address'] . '", "' . $pafidInfo['postcode'] . '");' : '') . '$(".arov-clicker").click(function(){
 												$( this ).find("span").toggleClass("arow-down-bl");
 											}); 
											});
										</script>');

$tpl->assign('site-img', $site->imageSiteLink);
$tpl->assign('sales-img', $site->imageLink);
$tpl->assign('name', $site->salesAgentName);
$tpl->assign('phone', $site->salesAgentPhone);
$tpl->assign('email', $site->salesAgentEmail);

$tpl->assignGlobal('site', $site->siteName);

// Menu section
$tpl->assignGlobal("menu-title", $site->siteName);

$tpl->assign('percentage', $siteFromAPI->registerInterestPercent);
$tpl->assign('required', $siteFromAPI->registerInterestNeeded);

$breadcrumb = new Breadcrumb();
$breadcrumb->addBreadcrumb(array ("Home", "Residential"), array (esc_url(home_url('/')), esc_url(home_url('/residential/'))), $tpl);

$tpl->newBlock('assigned-postcodes');
$tpl->assign('city', $site->siteCityName);
$tpl->assign('area', $postcodeStart);

foreach ($siteFromAPI->postcodes as $value) {
    $tpl->newBlock('postcodes');
    $tpl->assign('pcd', $value);
}

$tpl->newBlock('available-1g');
$tpl->newBlock('available-100m');
$tpl->newBlock('available-20m');

$tpl->newBlock('contract-12-or-1-1');
$tpl->newBlock('contract-12-or-1-2');
$tpl->newBlock('contract-12-or-1-3');

$tpl->newBlock('status-live');
$login = new LoginAPI();
if ($login->isLogin()) {
    $tpl->assignGlobal("blue", "-blue");
    $tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->newBlock('msg-live');

$tpl->newBlock('order-banner');

$tpl->printToScreen();

?>

<?php get_footer(); ?>
