<?php /* Template Name: Map List Page */ ?>

<?php

$q = "SW1P";
if (isset($_GET['q'])){
	$q = $_GET['q'];
}

$api = new HomepageAPI();
$markers = $api->getSitesInAreaByAreaCode($q);
$markers = replaceSitesImageIfNoImage($markers);
$markers = replaceComingSoonIntoRIFromSites($markers);

$city = getCityFromListOfSites($markers, "Empty postarea");

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/map-list.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "menu-maps", 	dirname ( __FILE__ ) . "/templates/menu-maps.tpl" );

$tpl->prepare ();
// Globals
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Maps  & Broadband Availability Checker | List");
$tpl->assign( "header-description",     "Is the fastest broadband in the UK available in your area? Check availability now!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 	   '<script src="https://maps.googleapis.com/maps/api/js"></script>
										  <script src="' . BASE_URL . '/js/map.js"></script>
										  <script>
											var homeURL = "' . esc_url( home_url( '/' )) . '";
											var london = new google.maps.LatLng(51.507842, -0.066678);
											var map;
											var prev_marker = null;
											var prev_infowindow = null;
											var locations = ' . json_encode( $markers ) . ';
											google.maps.event.addDomListener(window, \'load\', initializeListMaps);
											$(window).load(function(){
												elasticInit("postcodeText", "postcodeResults");
											});
										</script>' );
// Menu section
$tpl->assign( "menu-selected", 'List');
$tpl->assign( "menu-title", !isset($_GET['q']) ? $city : $city . ", " . $q);
$tpl->newBlock('menu-items');
$tpl->assign( 'url', '../map/?q=' . urlencode($q) );
$tpl->assign( 'name', 'Map');
$tpl->newBlock('menu-items');
$tpl->assign( 'url', '../grid/?q=' . urlencode($q) );
$tpl->assign( 'name', 'Grid');

$breadcrumb = new Breadcrumb();
$breadcrumb->addBreadcrumb(array("Home","Residential",!isset($_GET['q']) ? $city : $city . ", " . $q), array( esc_url( home_url( '/' )), esc_url( home_url( '/residential/' )), "#" ), $tpl);

$i = 1;
if ($markers != null) {
    foreach ($markers as $marker) {

        if ($marker->latitude == null || $marker->longitude == null) continue;

        // create a new number_row block
        $tpl->newBlock("item");

        $imageLink = file_exists(getcwd() . '/wp-content/themes/hyperoptic/images/sites/' . $marker->siteId . '.jpg') ?
            BASE_URL . '/images/sites/' . $marker->siteId . '.jpg' :
            BASE_URL . '/images/sites/default.jpg';

        // assign values
        $tpl->assign("number", $i++);
        $tpl->assign("id", $marker->siteId);
        $tpl->assign("name", $marker->siteName);
        $tpl->assign("image", $imageLink);
        $tpl->assign("city", $marker->city);
        $tpl->assign("postarea", $marker->greaterCityLocator);
        $tpl->assign("marker", $markerIcons[$marker->statusId]);

        $tpl->assign("phone", $marker->salesRepPhone);
        $tpl->assign("email", $marker->salesRepEmail);
        $tpl->assign("repname", $marker->salesRepName);
        $tpl->newBlock("status-blue");
        $tpl->assign("status", $marker->statusId == 2 ? "Registering Interest" : $marker->status);

    }
}
$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen ();

?>

<?php get_footer(); ?>