<?php /* Template Name: Privacy and Cookie Policy */ ?>

<?php
$headerTitle = "Hyperoptic | Legal";
$headerDescription = "Hyperoptic code of practice, privacy policy, terms of service and fair use policy.";
get_header();
?>

<?php

while ( have_posts() ) {
	the_post();
    the_content();
}

?>

<?php get_footer(); ?>