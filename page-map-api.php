<?php /* Template Name: Map API */ ?>
<?php

include_once 'include/Services/API/MapAPI.php';

if (isset ( $_REQUEST ['topLatitude'] ) && 
	isset ( $_REQUEST ['topLongitude'] ) && 
	isset ( $_REQUEST ['btmLatitude'] ) && 
	isset ( $_REQUEST ['btmLongitude'] )) {
	
	$api = new MapAPI();
	$markers = $api->getMarkers($_REQUEST ['topLatitude'], $_REQUEST ['topLongitude'], $_REQUEST ['btmLatitude'], $_REQUEST ['btmLongitude']);
	
	$markers = json_encode( replaceSitesImageIfNoImage(json_decode($markers)) );
	
	echo $markers;
}
?>