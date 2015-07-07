<?php /* Template Name: My Account Payment */ ?>

<?php

require_once 'include/Services/API/DataTransfer/PaymentInfoDTO.php';

$login = new LoginAPI();
$userId = $login->pageProtect();

$api = new MyAccountAPI();

$paymentInfo = null;
if ( isset($_POST["holdername"]) ){
	$paymentInfo = new PaymentInfoDTO();
	$paymentInfo->setCustomerId($userId);
	$paymentInfo->setHolderName(		htmlspecialchars($_POST["holdername"])		);
	$paymentInfo->setAccountNumber(		htmlspecialchars($_POST["accountNumber"])	);
	$paymentInfo->setSortCode(			htmlspecialchars($_POST["sortcode"])		);
	
	if (empty( $paymentInfo->validate() ) ){
		if ($respons = $api->setPaymentInfo($paymentInfo)){
			// DONE
		} else {
			$logger = new Logger();
			$logger->addError(' Not added PaymentInfoDTO -> ' . var_export($paymentInfo->getAssocArray(), true));
		}
	}
}

$profile = $api->getProfileInfo($userId);
$payment = $api->getPaymentInfo($userId);

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/my-account-payment.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "my-account-menu", 	dirname ( __FILE__ ) . "/templates/my-account-menu.tpl" );
$tpl->assignInclude( "my-account-need-support", 	dirname ( __FILE__ ) . "/templates/my-account-need-support.tpl" );
$tpl->assignInclude( "slider", 	dirname ( __FILE__ ) . "/templates/my-account-slider.tpl" );
$tpl->assignInclude( "status-widget", 	dirname ( __FILE__ ) . "/templates/my-account-status-widget.tpl" );
if ($respons != null){
	$tpl->assignInclude( "modal", 	dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );
}
$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "message", 				"Billing method");
$tpl->assign( "header-title", 			"Hyperoptic | Billing and Payment");
$tpl->assign( "header-description",     "Manage & view your Hyperoptic billing and payment information.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										 <script src="' . BASE_URL . '/js/additional-methods.js"></script>
										 <script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										 <script>
											var functionalKeys = [8, 9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 144, 145];
											$( document ).ready(function() {
												$( "#sortcode" ).keydown(function ( e ) {
													var size = $( this ).val().length;
											        if( $.inArray(e.keyCode, functionalKeys) == -1) {
														if ( size >= 6 ){
															e.preventDefault();
												            e.stopPropagation();
														}
											        }
												});
												$( "#accountNumber" ).keydown(function ( e ) {
													var size = $( this ).val().length;
											        if( $.inArray(e.keyCode, functionalKeys) == -1) {
														if ( size >= 8 ){
															e.preventDefault();
												            e.stopPropagation();
														}
											        }
												});
												$("#paymentInfoForm").validate({
													rules: {
														accountNumber: {
															required: true,
															digits: true
														},
														sortcode: {
															required: true,
															digits : true
														}
													}
												});'.	
(($respons != null) ? 							"openModalWindow('modal');" : "" )						
											.'});
										</script>' );
$tpl->assign( "blue",                   "-blue");
$tpl->assign( "active-bills",			"black-f-1 font-w-600");
$tpl->assign( "link-dashboard",			esc_url( home_url( '/myaccount' )));
$tpl->assign( "link-profile",			esc_url( home_url( '/myaccount-profile' )));
$tpl->assign( "link-bills",				esc_url( home_url( '/myaccount-bills' )));
$tpl->assign( "link-package",			esc_url( home_url( '/myaccount-package' )));
$tpl->assign( "link-help",				esc_url( home_url( '/help-and-advice' )));

$tpl->assignGlobal("customerId", 		str_pad($userId, 12, '0', STR_PAD_LEFT));
$tpl->assign( "holderFullName",			$paymentInfo != null ? $paymentInfo->getHolderName() : $payment->holderName );
$tpl->assign( "sortcode",				$paymentInfo != null ? $paymentInfo->getSortCode() : $payment->sortCode );
$tpl->assign( "accountNumber",			$paymentInfo != null ? $paymentInfo->getAccountNumber() : $payment->accountNumber );
$tpl->assign( "bank",					$payment->bank );


if ($respons != null){
	$tpl->assignGlobal( "modal-title", 		    ($respons==='true') ? "Success" : "There has been an error with your submission" );
	$tpl->assignGlobal( "modal-msg-line-one",   ($respons==='true') ? "You have successfully changed your bank details" : $respons );
	$tpl->newBlock( "close-modal-dialog" );
}

$tpl->newBlock("sign-out");

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>