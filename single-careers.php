<?php get_header(); ?>

<?php the_post(); ?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/careers-sidebar.tpl" );

$tpl->prepare ();

$tpl->assign( "header-title", 			isset( $headerTitle ) ?         $headerTitle        : "Hyperoptic | Fastest Fibre Optic Broadband");
$tpl->assign( "header-description",     isset( $headerDescription ) ?   $headerDescription  : "Superfast & Super Affordable Fibre Optic Broadband. Faster than the UK average speed. Check availability now!");
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

$tpl->assign( "title", 		    get_the_title() );
$tpl->assign( "content",        get_the_content()  );

$args = array( 'post_type' => 'careers', 'posts_per_page' => 5);
$faq = new WP_Query( $args );

while($faq->have_posts()) {
    // create a new number_row block
    $tpl->newBlock ( "item" );

    $faq->the_post();

    // assign values
    $tpl->assign ( "link",	 		get_the_permalink() );
    $tpl->assign ( "title", 		get_the_title() );
    $tpl->assign ( "content", 	    get_the_content() );
}

$tpl->printToScreen();

?>

<?php get_footer(); ?>


