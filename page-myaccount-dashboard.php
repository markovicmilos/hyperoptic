<?php /* Template Name: My Account Dashboard */ ?>

<?php
require_once('include/Twitter/TwitterAPI.php');

$login = new LoginAPI();
$userId = $login->pageProtect();
$api = new MyAccountAPI();

if (isset($_REQUEST["comment"])) {

    $api->sendMail($userId, $_REQUEST["comment"], "community@hyperoptic.com", "[Promotion] Win 1 month's free broadband");
}

$profile = $api->getProfileInfo($userId);
$billsOverview = $api->getBillsOverview($userId);
$statusWidget = $api->getAccountStatus($userId);

$tpl = new TemplatePower (dirname(__FILE__) . "/templates/my-account-dashboard.tpl");
$tpl->assignInclude("header", dirname(__FILE__) . "/templates/header-noselect.tpl");
$tpl->assignInclude("my-account-menu", dirname(__FILE__) . "/templates/my-account-menu.tpl");
$tpl->assignInclude("my-account-need-support", dirname(__FILE__) . "/templates/my-account-need-support.tpl");
//$tpl->assignInclude( "slider", 	dirname ( __FILE__ ) . "/templates/my-account-slider.tpl" );
$tpl->assignInclude("twitter", dirname(__FILE__) . "/templates/twitter-box.tpl");
$tpl->assignInclude("modal-game", dirname(__FILE__) . "/templates/modals/modal-game.tpl");
if (!$statusWidget->billingDatePassed) {
    $tpl->assignInclude("status-widget", dirname(__FILE__) . "/templates/my-account-status-widget.tpl");
}
if (isset($_REQUEST['mode']) && $_REQUEST['mode'] === 'ThankYou' || $statusWidget->orderStatus == 8 || isset($_REQUEST['comment'])) {
    $tpl->assignInclude("modal-thank-you", dirname(__FILE__) . "/templates/modals/modal-empty.tpl");
}

$tpl->prepare();

$tpl->assignGlobal("home-url", esc_url(home_url('/')));
$tpl->assignGlobal("base-url", BASE_URL);

$tpl->assign("message", "Welcome back, " . $profile->firstName);
$tpl->assign("header-title", "Hyperoptic | My Account");
$tpl->assign("header-description", "Dashboard: navigate for account billing & payments, package details and troubleshooting");
$tpl->assign("header-css", BASE_URL . "/css/hyper.css");
$tpl->assign("header-body-class", join(' ', get_body_class()));
if ((isset($_REQUEST['mode']) && $_REQUEST['mode'] === 'ThankYou') || $statusWidget->orderStatus == 8 || isset($_REQUEST['comment'])) {              // SUSPENDED OR GAME SUBMIT
    $tpl->assign("header-jscript", '<script>
										 $( document ).ready(function() {
                                            openModalWindow("modal");
										 });
										 </script>');
}


$tpl->assign("blue", "-blue");
$tpl->assign("active-dashboard", "black-f-1 font-w-600");
$tpl->assign("link-dashboard", esc_url(home_url('/myaccount')));
$tpl->assign("link-profile", esc_url(home_url('/myaccount-profile')));
$tpl->assign("link-bills", esc_url(home_url('/myaccount-bills')));
$tpl->assign("link-package", esc_url(home_url('/myaccount-package')));
$tpl->assignGlobal("link-help", esc_url(home_url('/help-and-advice')));

if ($statusWidget->orderStatus == 7 || $statusWidget->orderStatus == 1 || $statusWidget->orderStatus == 4) {
    // ISSUE, ORDER or PREORDER
    $tpl->assign("disable-bill-tab", "f-d-grayscale-op");
    $tpl->assign("disable-last-bill-button", 'disabled="disabled"');
    $tpl->assign("active-bills", "f-d-grayscale-ma");
    $tpl->assign("link-bills", "#");
    $tpl->assign("disable-mybills", "in-active-anchor");
}


$tpl->assign("customerEmail", $profile->email != null ? $profile->email : "N/A");
$tpl->assign("customerId", str_pad($userId, 12, '0', STR_PAD_LEFT));
$tpl->assign("customerPackage", $billsOverview->bundle != null ? $billsOverview->bundle : "N/A");
$tpl->assign("customerContactPhone", $profile->phoneNumber != null ? $profile->phoneNumber : "N/A");
$tpl->assign("currentBillAmount", $billsOverview->latestBillAmount != null ? number_format($billsOverview->latestBillAmount, 2, ".", " ") : "N/A");
$tpl->assign("lastBillOn", $billsOverview->lastBill != null ? $billsOverview->lastBill : "N/A");
$tpl->assign("nextBillOn", $billsOverview->nextBill != null ? $billsOverview->nextBill : "N/A");
$tpl->assign("currentBalance", $billsOverview->balance != null ? number_format($billsOverview->balance, 2, ".", " ") : "N/A");
$tpl->assign("bill-method", $billsOverview->billingMethod != null ? $billsOverview->billingMethod : "Direct debit");
$tpl->assign("contractLength", $profile->contractLength != null && $profile->contractLength == 1 ? "No Contract" : "12 Month Contract");
$tpl->assign("faq-link", esc_url(home_url('/faq')));

if ((isset($_REQUEST['mode']) && $_REQUEST['mode'] === 'ThankYou') || $statusWidget->orderStatus == 8 || isset($_REQUEST['comment'])) {              // SUSPENDED
    if (isset($_REQUEST['comment'])) {
        $tpl->assign('modal-title', "Thanks!");
        $tpl->assign('modal-msg-line-one', "You've been entered into the prize draw!");
    } else if ($statusWidget->orderStatus == 1) {
        $tpl->assign('modal-title', "Your pre-order has been placed");
        $tpl->assign('modal-msg-line-one', "Service at your building is not yet live however, once installation has been completed, your order will progress automatically.");
    } else if ($statusWidget->orderStatus == 8) {
        $tpl->assign('modal-title', "Account suspended");
        $tpl->assign('modal-msg-line-one', "Your service has been suspended, please call our customer support to resolve the issue.");
    } else {
        $tpl->assign('modal-title', "Your order has been placed");
        $tpl->assign('modal-msg-line-one', "We have received your order and it will soon be processed.");
    }
    if (isset($_REQUEST['eastVillageSsid']) && !isset($_REQUEST['comment']) && $statusWidget->orderStatus != 8) {
        $tpl->assign('modal-msg-line-two', 'Once the service is live, you will be able to connect to Hyperoptic using a wireless connection.
   Simply search for available wireless networks and connect to your wireless network that includes your flat or house number.
   Your SSID is <b>"' . $_REQUEST['eastVillageSsid'] . '"</b>. Your unique password is <b>' . $_REQUEST['eastVillagePassword'] . '</b>.');
    }
}

$tpl->newBlock("sign-out");

if (!$statusWidget->billingDatePassed && $statusWidget->steps != null) {
	if ($statusWidget->installationDate == null || $statusWidget->installationTime == null) {
		$tpl->newBlock ( "no-jobe" );
	} else {
		$tpl->newBlock ( "have-jobe" );
		$tpl->assignGlobal("order-status-date", $statusWidget->installationDate);
		//$tpl->assignGlobal("order-status-time", $statusWidget->installationTime);
	}
	$tpl->assignGlobal("order-status-message", ($statusWidget->orderStatus == 2 ||
												$statusWidget->orderStatus == 5 ||
												$statusWidget->orderStatus == 8) ? "Your Hyperoptic service is good to go. " :
												"Exciting times. Not long now. ");
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

$tpl->newBlock("close-modal-dialog");

if (isset($_REQUEST['mode']) && $_REQUEST['mode'] === 'ThankYou') {
    $_SESSION['promoCode'] = 'deepseafishing';
    $tpl->newBlock("tracking-op-complete");
    // call to webservice
    $tpl->assign("track-order-id", $profile->orderId);
    $tpl->assign("track-order-id2", $profile->orderId);
    $tpl->assign("track-order-amount", $_SESSION['monthlyPrice']);
    $tpl->assign("track-order-amount2", $_SESSION['monthlyPrice']);
    $tpl->assign("track-promo-code", $_SESSION['promoCode']);
    $tpl->assign("track-promo-code2", $_SESSION['promoCode']);
    $tpl->assign("track-city", $profile->city);
    $tpl->assign("track-postcode", $profile->postCode);
    $tpl->assign("track-product-type", "Service");
    $tpl->assign("track-package-name", $profile->productName);
    $tpl->assign("track-contract-length", $profile->contractLength != null && $profile->contractLength == 1 ? 1 : 12);
} else {
    $tpl->newBlock("tracking-base");
}

$twitter = new TwitterAPI();
$twitter->assignGlobalTPLVars($tpl, Twitter::HyperopticCS);

$tpl->printToScreen();

?>


<?php get_footer(); ?>