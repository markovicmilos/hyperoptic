<?php


$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/topic-list.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );

$tpl->prepare ();

// Globals
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Website | Topics" );
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/global.js"></script>
										 <script>
											var homeURL = "' . esc_url( home_url( '/' )) . '";
											$(window).load(function(){
												elasticInit("postcodeText", "postcodeResults");
											});
										</script>' );


$args = array( 'post_type' => 'topic', 'posts_per_page' => 30);
$args = new WP_Query( $args );

$i = 0;

while ( have_posts() ) {
    // create a new number_row block
    $tpl->newBlock ( "item" );
    $i++;
    the_post();

    // assign values
    $tpl->assign ( "link",	 		get_the_permalink() );
    $tpl->assign ( "title", 		get_the_title() );
    $tpl->assign ( "text", 			get_the_excerpt() );
}

if ($i==0) {
    $tpl->newBlock("no-items");
}

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue", "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>