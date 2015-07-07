<?php /* Template Name: Company History Page */ ?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/company-history.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );


$tpl->prepare ();
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | History");
$tpl->assign( "header-description",     "The Hyperoptic story starts  with our first launch  in 2011. Find out more about the company history up to the present day");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/global.js"></script>' );


// SMALL BLOCKS
$args = array( 'post_type' => 'history', 'posts_per_page' => 15);
$news = new WP_Query( $args );

while($news->have_posts()) {
    // create a new number_row block
    $tpl->newBlock ( "item" );

    $news->the_post();

    // assign values
    $tpl->assign ( "date", 			get_the_date() );
    $tpl->assign ( "text", 			get_the_excerpt() );
    $tpl->assign ( "image",			get_post_custom_values('_history_image_url')[0]);
}
$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen ();

// END SMALL BLOCK

?>

<?php get_footer(); ?>