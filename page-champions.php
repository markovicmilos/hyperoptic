<?php /* Template Name: Champions Page */ ?>

<?php
require_once('include/Botdetect/botdetect.php');

if (!isset($_SESSION['siteId'])) {
    header("Location: " . esc_url(home_url('/')));
}

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/champions-page.tpl" );
if (stristr($_SESSION['siteType'], "business") !== FALSE) {
    $tpl->assignInclude("header", dirname(__FILE__) . "/templates/header-business.tpl");
} else {
    $tpl->assignInclude("header", dirname(__FILE__) . "/templates/header.tpl");
}
$tpl->assignInclude( "map-package-small", 	dirname ( __FILE__ ) . "/templates/map-package-small.tpl" );
$tpl->assignInclude( "modal-become-champion", 	dirname ( __FILE__ ) . "/templates/modals/modal-become-champion.tpl" );
$tpl->assignInclude( "modal-tell-a-friend", 	dirname ( __FILE__ ) . "/templates/modals/modal-tell-a-friend.tpl" );
$tpl->assignInclude( "modal-champion-thank-you", 	dirname ( __FILE__ ) . "/templates/modals/modal-champion-thank-you.tpl" );
$tpl->assignInclude( "modal-champion-tell-a-friend-thank-you", 	dirname ( __FILE__ ) . "/templates/modals/modal-champion-tell-a-friend-thank-you.tpl" );
$tpl->assignInclude( "modal-please-read", 	dirname ( __FILE__ ) . "/templates/modals/modal-please-read.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Residential Fibre Optic Broadband | Champions Page ");
$tpl->assign( "header-description",     "Superfast Fibre Optic Broadband for Business.Faster than the UK average speed. Check availability now!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<link type="text/css" rel="Stylesheet" href="' . BASE_URL . '/include/Botdetect/botdetect/public/lbd_layout.css" />
                                        <script src="' . BASE_URL . '/js/jquery.validate.js"></script>
                                        <script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js?v=1"></script>
                                        <script>
                                            var countOfNames = 1;
                                            $(window).load(function(){
                                                initPostcodeElasticSelectAddress();
                                                becomeChampionInit();
                                                $("#tellAFriendForm").validate({
                                                    rules: {
                                                        email0: "validEmail",
                                                        youremail: "validEmail",
                                                        CaptchaCode: { required: true, remote: $("#CaptchaCode").get(0).Captcha.ValidationUrl },
                                                    },
                                                    messages: {
                                                      CaptchaCode: {
                                                        required: "The Captcha code is required",
                                                        remote: "The Captcha code must be retyped correctly"
                                                      }
                                                    },
                                                    onkeyup: false,
                                                    onfocusout: function(element) { $(element).valid(); },
                                                    showErrors: function(errorMap, errorList) {
                                                      if (typeof(errorMap.CaptchaCode) != "undefined" &&
                                                          errorMap.CaptchaCode === this.settings.messages.CaptchaCode.remote) {
                                                        $("#CaptchaCode").get(0).Captcha.ReloadImage();
                                                      }
                                                      this.defaultShowErrors();
                                                    },
                                                });
                                            });
										</script>');

$jQueryValidatedCaptcha = new Captcha("jQueryValidatedCaptcha");
$jQueryValidatedCaptcha->UserInputID = "CaptchaCode";
$jQueryValidatedCaptcha->CustomLightColor = "#EFEFEF";
$jQueryValidatedCaptcha->CustomDarkColor = "#838589";
$jQueryValidatedCaptcha->CodeLength = CaptchaRandomization::GetRandomCodeLength(5, 7);;
$jQueryValidatedCaptcha->ImageStyle = 16;
$jQueryValidatedCaptcha->ImageWidth = 200;
$jQueryValidatedCaptcha->ImageHeight = 50;

$captchaHTML = $jQueryValidatedCaptcha->Html();

$captchaHTML = str_replace('<a href="https://captcha.com/wordpress-captcha-info.html" target="_blank" title="BotDetect WordPress CAPTCHA" style="display: block !important; height: 10px !important; margin: 0 !important; padding: 0 !important; font-size: 9px !important; line-height: 9px !important; visibility: visible !important; font-family: Verdana, DejaVu Sans, Bitstream Vera Sans, Verdana Ref, sans-serif !important; vertical-align: middle !important; text-align: center !important; text-decoration: none !important; background-color: #f8f8f8 !important; color: #606060 !important;">BotDetect WordPress CAPTCHA</a>',
                          '',
                          $captchaHTML);

$CSF = generateUUID();
$_SESSION["CSF"] = $CSF;

$tpl->assignGlobal( "captcha",          $captchaHTML );
$tpl->assignGlobal( "csf",              $CSF );
$tpl->assignGlobal( "siteid",           $_SESSION['siteId']);

$tpl->assignGlobal("addOnDivID", "ThankYou");
$tpl->assignGlobal("modal-title", "We are waiting for COPY");
$tpl->assignGlobal("modal-msg-line-one", "Waiting for copy");
//$tpl->assignGlobal("modal-msg-line-two", 'Click <a href="'. esc_url( home_url( '/' )) .'">here</a> to go back to our homepage.');

$tpl->newBlock( "close-modal-dialog" );

$login = new LoginAPI();
if ($login->isLogin()){
    $tpl->assignGlobal( "blue","-blue");
    $tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>