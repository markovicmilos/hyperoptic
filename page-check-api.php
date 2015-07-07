<?php /* Template Name: Check API */ ?>

<?php

require_once ('include/Services/API/OrderProcessAPI.php');

if ( isset($_REQUEST['mode']) ){
	$api = new OrderProcessAPI();
	if ( $_REQUEST['mode'] == "email" ){
		// Chack email
		$data = $api->checkEmailAvailability( $_REQUEST['email'] );
		if ( $data != null && $data !== 0 && $data == 'true' ){
			echo json_encode(array('isOK' => true));
		} else {
			echo json_encode(array('isOK' => false));
		}
	} else if ( $_REQUEST['mode'] == "bank" ){
		// Chack bank
		$data = $api->checkBankDetails( $_REQUEST['holderName'], $_REQUEST['accountNo'], $_REQUEST['sortCode'] );
		if ( $data != null && $data !== 0 && $data->detailsOK ){
			echo json_encode(array('isOK' => true, 'bank' => $data->bank));
		} else {
			echo json_encode(array('isOK' => false, 'message' => $data->message));
		}
	}
}