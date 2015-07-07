<?php /* Template Name: News Page */ ?>

<?php the_post(); ?>

<?php

require_once( 'include/Twitter/TwitterAPI.php' );

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/news.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "twitter", dirname ( __FILE__ ) . "/templates/twitter-box.tpl" );

$headerTitle = get_the_title();
$headerDescription = get_the_excerpt();
$headerDescription = (strlen($headerDescription) > 155) ? substr($headerDescription,0,155) : $headerDescription;

$tpl->prepare ();
$tpl->assign( "header-title", 			isset( $headerTitle ) ?         $headerTitle        : "Hyperoptic | Fastest Fibre Optic Broadband");
$tpl->assign( "header-description",     isset( $headerDescription ) ?   $headerDescription  : "Superfast & Super Affordable Fibre Optic Broadband. Faster than the UK average speed. Check availability now!");
$tpl->assign( "header-css",             BASE_URL . "/css/hyper.css");
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

$tpl->assign( "title", 		    get_the_title() );
$tpl->assign( "content",        get_the_content()  );
$tpl->assign ( "date", 			get_the_date() );
$tpl->assign ( "p-type", 	    get_the_title() );

$twitter = new TwitterAPI();
$twitter->assignGlobalTPLVars($tpl, Twitter::Hyperoptic);




$tpl->printToScreen();

?>

<?php get_footer(); ?>
