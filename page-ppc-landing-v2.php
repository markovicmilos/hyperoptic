<?php /* Template Name:PPC Landing Page Version 2 */ ?>

<?php

if(isset($_REQUEST['q'])) {
    header("Location: " . home_url( '/' ) . "map?q=" . $_REQUEST['q'] );
}

?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/ppc-landing-page-v2.tpl" );
$tpl->assignInclude( "header", 	        dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );
$tpl->assignInclude( "modal-offers", 	dirname ( __FILE__ ) . "/templates/modals/modal-offers.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Offers | Broadband");
$tpl->assign( "header-description",     "Fantastic offers on phone and broadband from the fastest broadband provider in the UK.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>
                                        $(window).load(function(){
                                                is_map = false;
                                                elasticInit("postcodeText","postcodeResults");
                                                elasticInit("postcodeText1", "postcodeResults1");
                                                elasticInit("postcodeTextModal","postcodeResultsModal");
												onLoadHomepages(700);
                                        });
                                        // animating start your order message on button click
                                            $(function() {
                                                    $("#start-order-ppc-1").click(function() {
                                                        $("#start-your-order-message-1").removeClass("dis-none");
                                                    });
                                                     $("#postcodeText").click(function() {
                                                        $("#start-your-order-message-1").addClass("dis-none");
                                                    });
                                                    $("#start-order-ppc-2").click(function() {
                                                        $("#start-your-order-message-2").removeClass("dis-none");
                                                    });
                                                     $("#postcodeText1").click(function() {
                                                        $("#start-your-order-message-2").addClass("dis-none");
                                                    });
                                            });

										</script>');

$login = new LoginAPI();
if ($login->isLogin()){
    $tpl->assignGlobal( "blue","-blue");
    $tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>