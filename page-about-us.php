<?php /* Template Name: About Us Page */ ?>

<?php
$headerTitle = "Hyperoptic | About Us";
$headerDescription = "Hyperoptic is the UKs fastest fibre broadband provider. We work with businesses, developers and residents to deliver award winning internet. Find out more!";
get_header();
?>

<?php

while ( have_posts() ) {
	the_post();
    the_content();
}

?>

<?php get_footer(); ?>