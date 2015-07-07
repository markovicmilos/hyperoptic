<?php

global $headerTitle, $headerDescription;

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/header.tpl" );

$tpl->prepare ();
$tpl->assign( "header-title", 			isset( $headerTitle ) ?         $headerTitle        : "Hyperoptic | Fastest Fibre Optic Broadband");
$tpl->assign( "header-description",     isset( $headerDescription ) ?   $headerDescription  : "Superfast & Super Affordable Fibre Optic Broadband. Faster than the UK average speed. Check availability now!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/global.js"></script>' );

$tpl->assignGlobal( "home-url", 		esc_url( home_url( '/' )) );
$tpl->assignGlobal( "base-url", 		BASE_URL );

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assign( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();



