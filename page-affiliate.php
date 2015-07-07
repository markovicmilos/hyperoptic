<?php /* Template Name: Affiliate Programme Page */ ?>

<?php
$headerTitle = "Hyperoptic | Affiliates";
$headerDescription = "Earn commission  by driving  traffic and sales to Hyperoptic. Find out more  about joining our affiliate program!";
get_header();
?>

<?php

while ( have_posts() ) {
	the_post();
    the_content();
}

?>

<?php get_footer(); ?>

