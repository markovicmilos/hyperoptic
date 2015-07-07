<?php /* Template Name: Map Page */ ?>

<?php

$q = "SW1A";
if (isset($_GET['q'])){
	$q = $_GET['q'];
}

$api = new HomepageAPI();
$sitesInArea = $api->getSitesInAreaWithAllOther($q);
$markers = replaceSitesImageIfNoImage($sitesInArea->sitesInArea);
$markers = replaceComingSoonIntoRIFromSites($markers);

$city = getCityFromListOfSites($markers, "Empty postarea");

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/map.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "menu-maps", 	dirname ( __FILE__ ) . "/templates/menu-maps.tpl" );

$tpl->prepare ();

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Maps  & Broadband Availability Checker");
$tpl->assign( "header-description",     "Is the fastest broadband in the UK available in your area? Check availability now!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="https://maps.googleapis.com/maps/api/js"></script>
										 <script src="' . BASE_URL . '/js/markerclusterer.js"></script>
										 <script src="' . BASE_URL . '/js/map.js"></script>
										  <script>
											var roterURL = "' . esc_url( home_url( '/routing' )) . '";
											var animated = true;
											var london = new google.maps.LatLng(' . $sitesInArea->latitude  . ', ' . $sitesInArea->longitude . ');
											var map;
											var prev_marker = null;
											var prev_infowindow = null;
											var locations = ' . json_encode( $markers ) . ';
											var startPOI = "' . $q . '";
											google.maps.event.addDomListener(window, \'load\', initializeMapOnMapPage);
											$(window).load(function(){
												is_map = true;
												elasticInit("postcodeText", "postcodeResults");											
											});
										</script>' );
// Menu section
$tpl->assign( "menu-selected", 'Map');
$tpl->assign( "menu-title", !isset($_GET['q']) ? $city : $city . ", " . $q);
$tpl->newBlock('menu-items');
$tpl->assign( 'url', '../grid/?q=' . urlencode($q) );
$tpl->assign( 'name', 'Grid');
$tpl->newBlock('menu-items');
$tpl->assign( 'url', '../list/?q=' . urlencode($q) );
$tpl->assign( 'name', 'List');

$breadcrumb = new Breadcrumb();
$breadcrumb->addBreadcrumb(array("Home","Residential",!isset($_GET['q']) ? $city : $city . ", " . $q), array( esc_url( home_url( '/' )), esc_url( home_url( '/residential/' )), "#" ), $tpl);

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>

<?php get_footer(); ?>