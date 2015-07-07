
<?php get_header(); ?>

<?php the_post(); ?>

<?php

require_once( 'include/Twitter/TwitterAPI.php' );

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/topic.tpl" );
$tpl->assignInclude( "twitter", dirname ( __FILE__ ) . "/templates/twitter-box.tpl" );
$tpl->assignInclude( "breadcrumb", dirname ( __FILE__ ) . "/templates/twitter-box.tpl" );


$tpl->prepare ();

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

$tpl->assign( "title", 		    get_the_title() );
$tpl->assign( "content",        get_the_content()  );
$tpl->assign( "date", 			get_the_date() );

$twitter = new TwitterAPI();
$twitter->assignGlobalTPLVars($tpl, Twitter::Hyperoptic);

$tpl->printToScreen();

?>

<?php get_footer(); ?>
