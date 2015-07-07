<?php /* Template Name: Offers Broadband and Phone */ ?>

<?php

if(isset($_REQUEST['q'])) {
    header("Location: " . home_url( '/' ) . "map?q=" . $_REQUEST['q'] );
}
    
?>
    
<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/offers-bb-phone.tpl" );
$tpl->assignInclude( "header", 	        dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "modal-offers", 	dirname ( __FILE__ ) . "/templates/modals/modal-offers.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Offers");
$tpl->assign( "header-description",     "Fantastic offers on phone and broadband from the fastest broadband provider in the UK.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>
                                        $(window).load(function(){
                                                is_map = false;
                                                elasticInit("postcodeText","postcodeResults");
                                                elasticInit("postcodeTextModal","postcodeResultsModal");
                                        });
										</script>' );

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>