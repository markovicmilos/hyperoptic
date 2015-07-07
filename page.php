<?php get_header(); ?>

<?php

while ( have_posts() ){
	the_post();
    get_the_content();
}

?>

<?php get_footer(); ?>
