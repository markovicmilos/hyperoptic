<?php 
	
$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/footer.tpl" );

ob_start(); 
dynamic_sidebar( 'footer-widget-area' );
$footer_widget_area = ob_get_contents(); 
ob_end_clean();

ob_start();
dynamic_sidebar( 'footer-social-widget' );
$footer_social_widget = ob_get_contents();
ob_end_clean();

ob_start();
wp_footer();
$footer_wp_footer = ob_get_contents();
ob_end_clean();

$tpl->prepare ();
$tpl->assign( "footer-menu-1", 			wp_nav_menu( array( 'theme_location' => 'footer-menu-1', 'echo' => false ) ) );
$tpl->assign( "footer-menu-2", 			wp_nav_menu( array( 'theme_location' => 'footer-menu-2', 'echo' => false ) ) );
$tpl->assign( "footer-menu-3", 			wp_nav_menu( array( 'theme_location' => 'footer-menu-3', 'echo' => false ) ) );
$tpl->assign( "footer-menu-4", 			wp_nav_menu( array( 'theme_location' => 'footer-menu-4', 'echo' => false ) ) );
$tpl->assign( "footer-widget-area", 	$footer_widget_area );
$tpl->assign( "footer-social-widget", 	$footer_social_widget );
$tpl->assign( "footer-copyright-menu", 	wp_nav_menu( array( 'theme_location' => 'copyright-menu', 'echo' => false ) ) );
$tpl->assign( "footer-wp-footer", 		$footer_wp_footer );

$tpl->printToScreen();

?>