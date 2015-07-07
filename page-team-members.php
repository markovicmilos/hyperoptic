<?php /* Template Name: Meet the Team Members Page */ ?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/team.tpl" );

$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );


$tpl->prepare ();
$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

// Header section
$tpl->assign( "header-title", 			"Hyperoptic | Our Fibre Broadband Team");
$tpl->assign( "header-description",     "Meet the team behind Hyperoptic's revolutionary service.");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>src="' . BASE_URL . '/js/global.js"></script>
                                        <script>
											$(window).load(function(){
												$(".item-team-content").click(function (){
													$("#teamMemberModal").find(".real-modal-content").html( $(this).html() );
													$("#teamMemberModal").find(".hidden").removeClass("hidden");
													$("#teamMemberModal").find("img").removeClass("meet-the-team-img");
													$("#teamMemberModal").find("img").addClass("meet-the-team-img-popup-img");
													$("#teamMemberModal").modal("show");
												});
												$("#all-items").click(function() {
													$(".all-items").show(300);
												});
												$("#sales").click(function() {
													$(".all-items:not(.sales)").hide(300);
													$(".sales").show(300);
												});
												$("#management").click(function() {
													$(".all-items:not(.management)").hide(300);
													$(".management").show(300);
												});
											});
										 </script>' );




// SMALL BLOCKS
$args = array( 'post_type' => 'team', 'posts_per_page' => 20);
$news = new WP_Query( $args );

while($news->have_posts()) {
    // create a new number_row block
    $tpl->newBlock ( "item" );

    $news->the_post();

    // assign values
    $tpl->assign ( "link",	 		get_the_permalink() );
    $tpl->assign ( "title", 		get_the_title() );
    $tpl->assign ( "text", 			get_the_content() );
    $tpl->assign ( "image",			get_post_custom_values('_team_image_url')[0]);
    $tpl->assign ( "job-title",		get_post_custom_values('_team_job_title')[0]);
    $tpl->assign ( "category",		strtolower( get_post_custom_values('_team_category')[0] ));
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