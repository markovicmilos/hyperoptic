<?php /* Template Name: FAQ Page */ ?>

<?php get_header(); ?>

<?php the_post(); ?>

<?php

require_once( 'include/Twitter/TwitterAPI.php' );

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/faq.tpl" );
$tpl->assignInclude( "twitter", dirname ( __FILE__ ) . "/templates/twitter-box.tpl" );


$tpl->prepare ();
$tpl->assign( "header-title", 			isset( $headerTitle ) ?         $headerTitle        : "Hyperoptic | Fastest Fibre Optic Broadband");
$tpl->assign( "header-description",     isset( $headerDescription ) ?   $headerDescription  : "Superfast & Super Affordable Fibre Optic Broadband. Faster than the UK average speed. Check availability now!");
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

$tpl->assign( "title", 		    get_the_title() );
$tpl->assign( "content",        get_the_content()  );

$twitter = new TwitterAPI();
$twitter->assignGlobalTPLVars($tpl, Twitter::Hyperoptic);

$tpl->printToScreen();

?>

<?php get_footer(); ?>
