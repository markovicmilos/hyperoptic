<?php /* Template Name: Tell us more API */ ?>
<?php

if (isset ( $_REQUEST ['subject'] ) && 
	isset ( $_REQUEST ['username'] ) && 
	isset ( $_REQUEST ['email'] ) && 
	isset ( $_REQUEST ['text'] )) {
	$api = new HomepageAPI();
	$siteid = isset( $_REQUEST['siteid'] ) ? $_REQUEST['siteid'] : null;
	if  ( $api->tellUsMoreAbout($_REQUEST ['subject'], $_REQUEST ['username'], $_REQUEST ['email'], $_REQUEST ['text'], $siteid ) ){
		echo json_encode(array("isOK" => true));
		exit();
	} else {
		$text = $_REQUEST ['subject'] . ', ' . $_REQUEST ['username'] . ', ' . $_REQUEST ['email'] . ', ' . $_REQUEST ['text'];
		$logger = new Logger();
		$logger->addError(' Not added tellUsMore -> ' . $text);
	}
}
echo json_encode(array("isOK" => false));


?>