<?php /* Template Name: Press Releases Page */ ?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/press-releases.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );


$tpl->prepare ();
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Press Room");
$tpl->assign( "header-description",     "All the latest press releases and news from Hyperoptic, the UK's fastest broadband provider.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/global.js"></script>' );


// START BIG BLOCK
$args = array( 'post_type' => 'news', 'meta_key' => '_news_main_news', 'meta_value' => 'yes');
$mainNews = new WP_Query( $args );

if ( $mainNews->have_posts() ){
    $mainNews->the_post();

    $tpl->assign ( "main-link", 		get_the_permalink() );
    $tpl->assign ( "main-date", 		get_the_date() );
    if (strlen($post->post_title) > 59) {
        $tpl->assign ( "main-title", 		substr(get_the_title($before = '', $after = '', FALSE), 0, 59) . '...' );
    }
    else {
        $tpl->assign("main-title", get_the_title());
    }
    $tpl->assign ( "main-text", 		get_the_excerpt() );
}

// SMALL BLOCKS
$args = array( 'post_type' => 'news', 'meta_key' => '_news_main_news', 'meta_value' => 'no', 'posts_per_page' => 40);
$news = new WP_Query( $args );

while($news->have_posts()) {
    // create a new number_row block
    $tpl->newBlock ( "item" );

    $news->the_post();

    // assign values
    $tpl->assign ( "link",	 		get_the_permalink() );
    $tpl->assign ( "date", 			get_the_date() );
    if (strlen($post->post_title) > 59) {
        $tpl->assign ( "title", 		substr(get_the_title($before = '', $after = '', FALSE), 0, 59) . '...' );
    }
    else {
        $tpl->assign("title", get_the_title());
    }
    if (strlen(get_the_excerpt()) > 300) {
        $tpl->assign("text", substr(get_the_excerpt(), 0, 300) . '[...]');
    }
    else {
        $tpl->assign("text", get_the_excerpt());
    }
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