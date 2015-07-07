<?php /* Template Name: Contact Us Page */ ?>

<?php 

require_once( 'include/Twitter/TwitterAPI.php' );
require_once( 'include/Services/API/DataTransfer/ContactUsDTO.php' );

$api = new HomepageAPI();

if ( isset( $_POST["firstname"] ) ){
	$contactUsDTO = new ContactUsDTO();
	$contactUsDTO->setTitle(			htmlspecialchars($_POST["nameTitle"])			);
	$contactUsDTO->setFirstName(		htmlspecialchars($_POST["firstname"])			);
	$contactUsDTO->setLastName(			htmlentities($_POST["lastname"])				);
	$contactUsDTO->setEmailAddress(		htmlentities($_POST["email"])					);
	$contactUsDTO->setAddress1(			htmlspecialchars($_POST["address1"])			);
	$contactUsDTO->setAddress2(			htmlspecialchars($_POST["address2"])			);
	$contactUsDTO->setTown(				htmlspecialchars($_POST["town"])				);
	$contactUsDTO->setCity(				htmlspecialchars($_POST["city"])				);
	$contactUsDTO->setPostCode(			htmlspecialchars($_POST["postcode"])			);
	$contactUsDTO->setHearAboutUs(		$_POST["aboutUs"]								);
	$contactUsDTO->setInterestedIn(		$_POST["interestedIn"]							);
	$contactUsDTO->setReceiveInfo(		($_POST["wantToReceiveInformation"])=="on" ? true : false );
	$contactUsDTO->setSendCopy(			($_POST["agreeToBeContacted"])=="on" ? true : false );

	if (empty( $contactUsDTO->validate() ) ){
		if (!$api->submitContactForm($contactUsDTO)){
			$logger = new Logger();
			$logger->addError(' Not added ContactUsDTO -> ' . var_export($contactUsDTO->getAssocArray(), true));
		}
		$submited = true;
	}
}

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/contact-us.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "twitter", dirname ( __FILE__ ) . "/templates/twitter-box.tpl" );
$tpl->assignInclude( "hear-about-us", 	dirname ( __FILE__ ) . "/templates/hear-about-us.tpl" );
if ($submited === true){
	$tpl->assignInclude( "modal", 	dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );
}

$tpl->prepare ();

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Contact Us");
$tpl->assign( "header-description",     "Get in touch with the team at Hyperoptic for technical support. Contact information for email, phone and Twitter");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/global.js"></script>
										 <script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										 <script src="' . BASE_URL . '/js/additional-methods.js"></script>
										 <script src="' . BASE_URL . '/js/validating.js?v=1"></script>
										 <script>
											$( document ).ready(function() {
												$("#contactUsForm").validate({ rules: {	email: "validEmail" } });	' .
($submited === true ? 							"openModalWindow('modal');" : "" ) . 																			
											'});
										 </script>');

$tpl->assign( "additional-modal-data",  'data-backdrop="static"');
$tpl->assign( "modal-title",			"Submitted" );
$tpl->assign( "modal-msg-line-one", 	"Contact service will contact you." );
$tpl->assign( "modal-msg-line-two", 	'<a href="' . esc_url( home_url( '/' )) . '">Go back to home page</a>' );

$twitter = new TwitterAPI();
$twitter->assignGlobalTPLVars($tpl, Twitter::Hyperoptic);

$api->addHowYouHearAboutUs($tpl, InputSizeTypes::Big);
$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>

<?php get_footer(); ?>