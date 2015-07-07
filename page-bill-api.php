<?php /* Template Name: Bill API */ ?>

<?php 

$login = new LoginAPI();

if ( isset($_REQUEST['date']) && $login->isLogin() ){

	$api = new MyAccountAPI();
    $profile = $api->getProfileInfo($login->getUserId());
	$data = null;
	if ( $_REQUEST['date'] != 'last' ) {
		$data = $api->getBill($login->getUserId(), $_REQUEST['date']);
	} else {
		$data = $api->getLastBill($login->getUserId());
	}
	//var_dump($data);
	if ($data != null) {

		$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/modals/modal-bill.tpl" );

		$tpl->prepare ();

		$tpl->assign( "bill-name", 					date("F Y", strtotime('next month',strtotime($data->paymentDate))) . " Bill" );
		$tpl->assign( "account-name", 				$data->name );
		$tpl->assign( "account-number", 			str_pad($data->accountNumber, 12, '0', STR_PAD_LEFT) );
		$tpl->assign( "account-bill-number", 		$data->billNumber );
		$tpl->assign( "payment-date", 				$data->paymentDate );
		$tpl->assign( "vat-value",					number_format($data->vatAmount,2,"."," ") );
		$tpl->assign( "total",						number_format($data->totalAmount,2,"."," ") );
		$tpl->assign( "bill-div-id",				(isset($_REQUEST['billDivId']) ? $_REQUEST['billDivId'] : "modal") );
		
		if ( $data->broadbandDetails != null ) {
			$tpl->newBlock( "broadband-section" );
			$keys = get_object_vars($data->broadbandDetails);
			foreach ($keys as $key => $value){
				$tpl->assign( "broadband-name", 	$key);
                $tpl->assign( "contractLength",     $profile->contractLength != null && $profile->contractLength == 1 ? "No Contract" : "12 Month Contract" );
				$tpl->assign( "broadband-price", 	number_format($value,2,"."," "));
			}
		}
		
		if ( $data->phoneUsageAndCharges != null ) {
			$tpl->newBlock( "line-rental-section" );
			$keys = get_object_vars($data->phoneUsageAndCharges);
			foreach ($keys as $key => $value){
				if ($key == 'Line Rental') {
					$tpl->assignGlobal("line-rental-price",		number_format($value,2,"."," "));
					continue;
				}
				$tpl->newBlock( "line-additional-section" );
				$tpl->assign( "line-additional-name", 	$key);
				$tpl->assign( "line-additional-price", 	number_format($value,2,"."," "));
			}
		}
		
		if ( $data->oneOffCharges != null ) {
			$tpl->newBlock( "other-section" );
			$keys = get_object_vars($data->oneOffCharges);
			foreach ($keys as $key => $value){
				$tpl->newBlock( "other-additional-section" );
				$tpl->assign( "other-additional-name", 	$key);
				$tpl->assign( "other-additional-price", number_format($value,2,"."," "));
			}
		}
		
		if ( $_REQUEST['date'] != 'last' && getdate()['mday'] > 15 ){
			$tpl->newBlock( "current-bill" );
			$tpl->assign("bill-date", date("d F Y", mktime(0, 0, 0, date('n') + (date('j') >= 15), 15)));
		}
		$tpl->printToScreen();
	} else {
		
		$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );
		
		$tpl->prepare();
		
		$tpl->assign( "addOnDivID",						"Bill");
		$tpl->assign( "modal-title", 					"Currently not available" );
		$tpl->assign( "modal-msg-line-one", 			"Bill unavailable, please try later." );
		
		$tpl->newBlock( "close-modal-dialog" );
		
		$tpl->printToScreen();
	}

}


?>