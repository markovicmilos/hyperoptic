<?php /* Template Name: Help and Advice Page */ ?>

<?php

require_once( 'include/Twitter/TwitterAPI.php' );

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/help-and-advice.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "twitter", dirname ( __FILE__ ) . "/templates/twitter-box.tpl" );

$tpl->prepare ();

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Help & Advice");
$tpl->assign( "header-description",     "Hyperoptic services, billing, installation, technical support. Find out more!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );

//var_dump(get_the_category_by_ID( 3 ));


// TOPIC BLOCK

$args = array('child_of' => 14);
$categories = get_the_category( $args );
foreach($categories as $category) {
    $tpl->newBlock ( "topic-item" );

    // assign values
    $tpl->assign ( "link-topic",	 		 get_category_link( $category->term_id ) );
    $tpl->assign ( "title-topic", 		     $category->name );

}

// END OF TOPIC BLOCK


// FAQ BLOCKS
$args = array( 'post_type' => 'faq', 'posts_per_page' => 10);
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

$twitter = new TwitterAPI();
$twitter->assignGlobalTPLVars($tpl, Twitter::Hyperoptic);


// Twetter API
$twitter = new TwitterOAuth(
		'itoDFy9SljVcw47xEYuZFFkyA',
		'bn7T2wZ184cEtYarFcLEdUJmLvsoUpmKx6M4y6tp6Sp1wAXcy8',
		'2364295441-27QoMhXed3yX0WctpW6seAA453UCbxjE2l4GNpC',
		'3aKmoI4I1uGlW4DlY2MAWWlUNG2Eno7IlRvWlz7rY62kW');

$tweets = $twitter->get('statuses/user_timeline',
		array('screen_name' => 'hyperoptic',
				'exclude_replies' => 'true',
				'include_rts' => 'false',
				'count' => 1)
);

if (!empty($tweets)) {
	$tweet = $tweets[0];

	$tpl->assign("tweet-text", replace_links($tweet->text));
	$tpl->assign("tweet-time", x_time_before($tweet->created_at));
}
$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();


?>

<?php get_footer(); ?>