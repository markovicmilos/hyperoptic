<?php /* Template Name: My Account My Bills */ ?>

<?php

require_once 'include/Services/API/DataTransfer/PaymentInfoDTO.php';

$login = new LoginAPI();
$userid = $login->pageProtect();

$api = new MyAccountAPI();

$payment = $api->getBillsOverview($userid);
$bills = $api->getBillList($userid);

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/my-account-bills.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "my-account-menu", 	dirname ( __FILE__ ) . "/templates/my-account-menu.tpl" );
$tpl->assignInclude( "my-account-need-support", 	dirname ( __FILE__ ) . "/templates/my-account-need-support.tpl" );
$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "message", 				"My Bills and Payments");
$tpl->assign( "header-title", 			"Hyperoptic | Billing and Payment");
$tpl->assign( "header-description",     "Manage & view your Hyperoptic billing and payment information.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );

$tpl->assign( "blue",                   "-blue");
$tpl->assign( "active-bills",			"black-f-1 font-w-600");
$tpl->assign( "link-dashboard",			esc_url( home_url( '/myaccount' )));
$tpl->assign( "link-profile",			esc_url( home_url( '/myaccount-profile' )));
$tpl->assign( "link-bills",				esc_url( home_url( '/myaccount-bills' )));
$tpl->assign( "link-package",			esc_url( home_url( '/myaccount-package' )));
$tpl->assign( "link-help",				esc_url( home_url( '/help-and-advice' )));

$tpl->assign( "last-bils", 				number_format($payment->latestBillAmount,2,"."," ") );
$tpl->assign( "last-billled-on",		$payment->lastBill );
$tpl->assign( "next-billed-on",			$payment->nextBill );
$tpl->assign( "balance",				number_format($payment->balance,2,"."," ") );
$tpl->assign( "address",				$payment->billingAddress);

if ($bills != null) {
	foreach ($bills as $bill){
		$tpl->newBlock("bill-item");
		$tpl->assign( "date",			$bill->paymentDate );
		$tpl->assign( "name",			date("F Y", strtotime('next month',strtotime($bill->paymentDate))) );
	}
}

$tpl->newBlock("sign-out");

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>