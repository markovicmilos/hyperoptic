<?php /* Template Name: My Account Package */ ?>

<?php

require_once( 'include/Twitter/TwitterAPI.php' );

$login = new LoginAPI();
$userId = $login->pageProtect();

$api = new MyAccountAPI();
$profile = $api->getBillsOverview($userId);
$statusWidget = $api->getAccountStatus($userId);

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/my-account-package.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "my-account-menu", 	dirname ( __FILE__ ) . "/templates/my-account-menu.tpl" );
$tpl->assignInclude( "my-account-need-support", 	dirname ( __FILE__ ) . "/templates/my-account-need-support.tpl" );
if (!$statusWidget->billingDatePassed){
	$tpl->assignInclude( "status-widget", 	dirname ( __FILE__ ) . "/templates/my-account-status-widget.tpl" );
}
$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "message", 				"My Package");
$tpl->assign( "header-title", 			"Hyperoptic | My Account | My Package");
$tpl->assign( "header-description",     "Manage & view your Hyperoptic package.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "blue",                   "-blue");
$tpl->assign( "active-package",			"black-f-1 font-w-600");
$tpl->assign( "link-dashboard",			esc_url( home_url( '/myaccount' )));
$tpl->assign( "link-profile",			esc_url( home_url( '/myaccount-profile' )));
$tpl->assign( "link-bills",				esc_url( home_url( '/myaccount-bills' )));
$tpl->assign( "link-package",			esc_url( home_url( '/myaccount-package' )));
$tpl->assign( "link-help",				esc_url( home_url( '/help-and-advice' )));

if ($statusWidget->orderStatus == 7 || $statusWidget->orderStatus == 1 || $statusWidget->orderStatus == 4){
    // ISSUE, ORDER or PREORDER
    $tpl->assign( "active-bills",       "f-d-grayscale-ma" );
    $tpl->assign( "link-bills",			"#");
}

$tpl->assign("customerPackage", 		$profile->bundle );
$tpl->assign("monthlyFee", 				number_format($profile->monthlyFee,2,"."," ") );
$tpl->assign("nextBillOn", 				$profile->nextBill );

if ( strpos($profile->bundle, '1Gb') !== false ) {
	$tpl->newBlock ( "g1" );
	$tpl->newBlock ( "img-g1" );
} else if ( strpos($profile->bundle, '100Mb') !== false ) {
	$tpl->newBlock ( "mb100" );
	$tpl->newBlock ( "img-mb100" );
} else {
	$tpl->newBlock ( "mb20" );
	$tpl->newBlock ( "img-mb20" );
}

if ( strpos($profile->bundle, 'Phone') !== false ) {
	$tpl->newBlock ( "phone" );			// description text block
	$tpl->newBlock ( "have-phone" );
	$tpl->assign("customerPhone", 		$profile->phoneNumber );
	if ( !empty( $profile->extras ) ){
		$tpl->newBlock ( "extras" );
		$tpl->assign( "extras", 		join(', ', $profile->extras) );
	}
}

$tpl->assignGlobal("order-status-message", ($statusWidget->billingDatePassed ||
											$statusWidget->orderStatus == 2 || 
											$statusWidget->orderStatus == 5 ||
											$statusWidget->orderStatus == 8) ? "Your Hyperoptic service is good to go. " : 
											"Exciting times. Not long now. ");

if (!$statusWidget->billingDatePassed) {
	if ($statusWidget->installationDate == null || $statusWidget->installationTime == null) {
		$tpl->newBlock ( "no-jobe" );
	} else {
		$tpl->newBlock ( "have-jobe" );
		$tpl->assignGlobal("order-status-date", $statusWidget->installationDate);
		$tpl->assignGlobal("order-status-time", $statusWidget->installationTime);
	}
    if ($statusWidget->steps != null) {
        foreach ($statusWidget->steps as $step) {
            if ($step->val == null) continue;
            if ($step->status == 1) {
                $className = "progress-done-medium-green";
            } else if ($step->status == 2) {
                $className = "progress-done-light-green";
            } else {
                $className = "progress-done-gry";
            }
            $tpl->newBlock("step");
            $tpl->assign("title", $step->val);
            $tpl->assign("status-class", $className);
        }
    }
}

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>