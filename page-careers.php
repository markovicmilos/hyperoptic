<?php /* Template Name: Careers Page */ ?>

<?php

$args = array( 'post_type' => 'careers', 'posts_per_page' => 1);
$faq = new WP_Query( $args );

if($faq->have_posts()) {
    $faq->the_post();
    header("Location: " . get_the_permalink() );
}

?>
