<?php /* Template Name: My Account Profile */ ?>

<?php

require_once 'include/Services/API/DataTransfer/MyProfileDTO.php';

$login = new LoginAPI();
$userId = $login->pageProtect();

$api = new MyAccountAPI();

if ( isset($_POST['mobile']) ){
	// SUBMIT NEW DATA
	$profileDTO = new MyProfileDTO();
	$profileDTO->setId(					$userId);
	$profileDTO->setLandLine(			htmlspecialchars($_POST['phone']));
	$profileDTO->setMobile(				htmlspecialchars($_POST['mobile']));
	$profileDTO->setReveiveNewsletter(	$_POST['reveiveNewsletter']=="on" ? true : false);
	$profileDTO->setReceiveUpdates(		$_POST['receiveUpdates']=="on" ? true : false);	
	
	if (isset( $_POST['password'] ) &&
			trim($_POST['password']) != "" &&
			$_POST['password'] == $_POST['password2']){
		$password = trim($_POST['password']);
		$password = md5($password);
		$profileDTO->setPassword($password);
	} else {
		$profileDTO->setPassword(null);
	}

	if (!$api->setNewProfileInfo($profileDTO)){
		$logger = new Logger();
		$logger->addError(' Not added newProfileIngoDTO -> ' . var_export($profileDTO->getAssocArray(), true));
	}
	$dataSaved = true;
}

$profileInfo = $api->getFullProfileInfo($userId);
$statusWidget = $api->getAccountStatus($userId);

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/my-account-profile.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "my-account-menu", 	dirname ( __FILE__ ) . "/templates/my-account-menu.tpl" );
$tpl->assignInclude( "my-account-need-support", 	dirname ( __FILE__ ) . "/templates/my-account-need-support.tpl" );
$tpl->assignInclude( "my-account-address", 	dirname ( __FILE__ ) . "/templates/my-account-address.tpl" );
if ($dataSaved === true){
	$tpl->assignInclude( "modal", 	dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );
}
$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "message", 				"My Profile");
$tpl->assign( "header-title", 			"Hyperoptic |  My Profile");
$tpl->assign( "header-description",     "Manage & view your Hyperoptic profile information.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										<script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										<script src="' . BASE_URL . '/js/bootstrap-datepicker.js"></script>
										 <script>
											$( document ).ready(function() {
												$("#profileForm").validate({ rules: {	email: "validEmail" } });
												$("input.datepicker").datepicker({startView: "decade", endDate: "-18y"});
												$("#password").change(function(){
													if ($( this ).val() != ""){
														$( this ).rules( "add", {
															required: true,
															minlength: 8
														});
														$( "#password2" ).rules( "add", {
															equalTo: "#password"
														});
													} else {
														$( this ).rules( "remove" );
														$( "#password2" ).rules( "remove" );
													}
												});' .
( $dataSaved === true  ?						'openModalWindow("modal");' : '') 
											. '});
										</script>' );
$tpl->assign( "blue",                   "-blue");
$tpl->assign( "active-profile",			"black-f-1 font-w-600");
$tpl->assign( "link-dashboard",			esc_url( home_url( '/myaccount' )));
$tpl->assign( "link-profile",			esc_url( home_url( '/myaccount-profile' )));
$tpl->assign( "link-bills",				esc_url( home_url( '/myaccount-bills' )));
$tpl->assign( "link-package",			esc_url( home_url( '/myaccount-package' )));
$tpl->assign( "link-help",				esc_url( home_url( '/help-and-advice' )));

$tpl->assign( "nameTitle", 				$profileInfo->title );
$tpl->assign( "firstname",				$profileInfo->firstName );
$tpl->assign( "lastname",				$profileInfo->lastName );
$tpl->assign( "phone",					$profileInfo->landLine );
$tpl->assign( "mobile",					$profileInfo->mobile );
$tpl->assign( "email", 					$profileInfo->email );
$tpl->assign( "dateOfBirth", 			$profileInfo->dateOfBirth );
$tpl->assign( "reveiveNewsletter", 		$profileInfo->reveiveNewsletter ? 'checked="checked"' : "" );
$tpl->assign( "receiveUpdates",			$profileInfo->receiveUpdates ? 'checked="checked"' : "" );

if ($statusWidget->orderStatus == 7 || $statusWidget->orderStatus == 1 || $statusWidget->orderStatus == 4){
    // ISSUE, ORDER or PREORDER
    $tpl->assign( "active-bills",       "f-d-grayscale-ma" );
    $tpl->assign( "link-bills",			"#");
}

if ($dataSaved === true){
	$tpl->assign( "modal-title", 		"Success" );
	$tpl->assign( "modal-msg-line-one",	"New account data saved." );
	$tpl->newBlock("close-modal-dialog");
}

$tpl->assignGlobal("customerEmail", $profileInfo->email);
$tpl->assignGlobal("customerId", str_pad($profileInfo->id, 12, '0', STR_PAD_LEFT));
$tpl->assignGlobal("fullAddress", $profileInfo->address);
$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>
