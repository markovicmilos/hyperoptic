<?php /* Template Name:Error 404 Page */ ?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/error-404.tpl" );
$tpl->assignInclude( "header", 	        dirname ( __FILE__ ) . "/templates/header-noselect.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Broadband");
$tpl->assign( "header-description",     "Fantastic offers on phone and broadband from the fastest broadband provider in the UK.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>
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