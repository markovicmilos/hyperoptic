<?php /* Template Name: All FAQ Page */ ?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/all-faq.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );


$tpl->prepare ();

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Read All FAQ");
$tpl->assign( "header-description",     "Hyperoptic services, billing, installation, technical support. Find out more!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );

//var_dump(get_the_category_by_ID( 3 ));


// FAQ BLOCKS
$args = array( 'post_type' => 'faq', 'posts_per_page' => 1000);
$faq = new WP_Query( $args );

while($faq->have_posts()) {
    // create a new number_row block
    $tpl->newBlock ( "faq-item" );

    $faq->the_post();

    // assign values
    $tpl->assign ( "link",	 		get_the_permalink() );
    $tpl->assign ( "title", 		get_the_title() );
    $tpl->assign ( "text", 			get_the_excerpt() );
}

// END FAQ BLOCK

$tpl->printToScreen();


?>

<?php get_footer(); ?>