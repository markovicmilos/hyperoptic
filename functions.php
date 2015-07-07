<?php

require_once('config.php');
require_once('include/TemplatePower/class.TemplatePower.inc.php');
require_once('include/TemplatePower/TplUtils.php');
require_once('include/Services/API/HomepageAPI.php');
require_once('include/Services/API/MyAccountAPI.php');
require_once('include/Services/API/LoginAPI.php');
require_once('include/Services/API/RoutingSecurityAPI.php');
require_once('include/Breadcrumb/Breadcrumb.php');
require_once('include/Services/Log/Logger.php');

require_once('include/Wordpress/News.php');
require_once('include/Wordpress/History.php');
require_once('include/Wordpress/TeamMembers.php');
require_once('include/Wordpress/FAQ.php');
require_once('include/Wordpress/Topic.php');
require_once('include/Wordpress/Careers.php');

/*require_once('include/Services/AWS/aws-autoloader.php');

use Aws\DynamoDb\DynamoDbClient;
use Aws\DynamoDb\Session\SessionHandler;*/

define ("BASE_URL", get_template_directory_uri());
define ("SEPARATOR", ", ");
define ("ERROR404_PAGE_URL", esc_url( home_url( '/error' )));

$markerIcons = array ('https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png',
                      'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',
                      'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',
                      'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png');

function add_footer_widgets () {
    // Footer widget area
    register_sidebar(array ('name'          => __('Footer Widget Area'),
                            'id'            => 'footer-widget-area',
                            'description'   => __('Footer column #5', 'twentyten'),
                            'before_widget' => '',
                            'after_widget'  => '',
                            'before_title'  => '<h3 class="widget-title">',
                            'after_title'   => '</h3>'));

    // Footer social widget area
    register_sidebar(array ('name'          => __('Footer Social Widget Area'),
                            'id'            => 'footer-social-widget',
                            'description'   => __('Social widget area in footer', 'twentyten'),
                            'before_widget' => '',
                            'after_widget'  => '',
                            'before_title'  => '<p class="l-h-small">',
                            'after_title'   => '</p>'));
}

add_action('widgets_init', 'add_footer_widgets');
function register_menus () {
    register_nav_menus(array ('copyright-menu' => __('Copyright Menu'),
                              'footer-menu-1'  => __('Footer Menu First Column'),
                              'footer-menu-2'  => __('Footer Menu Second Column'),
                              'footer-menu-3'  => __('Footer Menu Third Column'),
                              'footer-menu-4'  => __('Footer Menu Fourth Column')));
}

add_action('init', 'register_menus');
function create_post_type () {
    register_post_type('news', array ('labels'      => array ('name'          => __('News'),
                                                              'singular_name' => __('News')),
                                      'public'      => true,
                                      'has_archive' => true));

    register_post_type('history', array ('labels'      => array ('name'          => __('History'),
                                                                 'singular_name' => __('History')),
                                         'public'      => true,
                                         'has_archive' => true));

    register_post_type('team', array ('labels'      => array ('name'          => __('Team'),
                                                              'singular_name' => __('Team')),
                                      'public'      => true,
                                      'has_archive' => true));

    register_post_type('faq', array ('labels'      => array ('name'          => __('FAQ'),
                                                             'singular_name' => __('FAQ')),
                                     'public'      => true,
                                     'has_archive' => true));

    register_post_type('careers', array ('labels'      => array ('name'          => __('Careers'),
                                                                 'singular_name' => __('Careers')),
                                         'public'      => true,
                                         'has_archive' => true));

    register_post_type('topic', array ('labels'      => array ('name'          => __('Topic'),
                                                               'singular_name' => __('Topic')),

                                       'taxonomies'  => array ('category'),
                                       'public'      => true,
                                       'has_archive' => true));


}

// Instantiate the class
if (class_exists('NewsCustomFields')) {
    new NewsCustomFields ();
}
// Instantiate the class
if (class_exists('HistoryCustomFields')) {
    new HistoryCustomFields ();
}
// Instantiate the class
if (class_exists('TeamCustomFields')) {
    new TeamCustomFields();
}

// Instantiate the class
if (class_exists('FAQCustomFields')) {
    new FAQCustomFields();
}
if (class_exists('FAQCustomFields')) {
    new CareersCustomFields();
}

add_action('init', 'create_post_type');

function getCityFromListOfSites ($sites, $error) {
    if ($sites == null || count($sites) == 0) {
        return $error;
    } else {
        return $sites[0]->city;
    }
}

/*function faq( $query ) {
    if ( $query->is_home() && $query->is_main_query() ) {
        $query->set( 'cat', '11'); } } add_action( 'pre_get_posts', 'faq' );*/


function replaceSitesImageIfNoImage ($sites) {
    if ($sites != null) {
        foreach ($sites as $site) {
            $site = replaceSiteImageIfNoImage($site);
        }
    }
    return $sites;
}

function replaceSiteImageIfNoImage ($site) {
    $defImg = BASE_URL . '/images/sites/default.jpg';
    if ($site->underConstruction) {
        $defImg = BASE_URL . '/images/sites/default-uc.jpg';
    }
    $site->imageSiteLink = file_exists(getcwd() . '/wp-content/themes/hyperoptic/images/sites/' . $site->siteId . '.jpg') ? BASE_URL . '/images/sites/' . $site->siteId . '.jpg' : $defImg;
    return $site;
}


function replaceSalesImageIfNoImage ($site) {
    $imageLink            = file_exists(getcwd() . '/wp-content/themes/hyperoptic/images/sales/' . $site->salesAgentId . '.jpg') ? BASE_URL . '/images/sales/' . $site->salesAgentId . '.jpg' : BASE_URL . '/images/sales/default.jpg';
    $site->imageSalesLink = $imageLink;
    return $site;
}

function replaceComingSoonIntoRIFromSites ($sites) {
    if ($sites != null) {
        foreach ($sites as $site) {
            $site = replaceComingSoonIntoRIFromSite($site);
        }
    }
    return $sites;
}

function replaceComingSoonIntoRIFromSite ($site) {
    if ($site->statusId == 2) {
        $site->status   = "Registering Interest";
        $site->statusId = 1;
    }
    return $site;
}

function  generateUUID() {
    return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        // 32 bits for "time_low"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

        // 16 bits for "time_mid"
        mt_rand( 0, 0xffff ),

        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
        mt_rand( 0, 0x0fff ) | 0x4000,

        // 16 bits, 8 bits for "clk_seq_hi_res",
        // 8 bits for "clk_seq_low",
        // two most significant bits holds zero and one for variant DCE1.1
        mt_rand( 0, 0x3fff ) | 0x8000,

        // 48 bits for "node"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
    );
}

function myStartSession () {
    /*if (PRODUCTION) {
        $dynamoDb = DynamoDbClient::factory(array ('credentials' => array ('key'    => 'AKIAJMVU4WLJFKQKATBA',
                                                                           'secret' => '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'),
                                                   'region'      => 'eu-west-1'));

        $sessionHandler = SessionHandler::factory(array ('dynamodb_client'  => $dynamoDb,
                                                         'table_name'       => 'php-sessions',
                                                         'session_lifetime' => 3600));
        $sessionHandler->register();
        //$sessionHandler->createSessionsTable(10, 10);
    }*/


    if (!session_id()) {
        session_start();
    }

   /* if (MAINTENENCE) {

        wp_redirect( 'http://localhost/git_site/ho-site/map/', 301 );

    }*/

}

add_action('init', 'myStartSession', 1);

add_action('wp_loaded', function() {
    global $pagenow;
    if(
        defined('IN_MAINTENANCE')
        && IN_MAINTENANCE
        && $pagenow !== 'wp-login.php'
        && ! is_user_logged_in()
    ) {
        header('HTTP/1.1 Service Unavailable', true, 503);
        header('Content-Type: text/html; charset=utf-8');
        if ( file_exists(WP_CONTENT_DIR . '/maintenance.html') ) {
            require_once( WP_CONTENT_DIR . '/maintenance.html' );
        }
        die();
    }
});

/*function custom_rewrite_rule() {
	add_rewrite_rule('^building-unknown/([^/]*)?/?','building-unknown/?q=$matches[1]','top');
	flush_rewrite_rules();
}
add_action('init', 'custom_rewrite_rule', 10, 0);

function dev4press_debug_page_request() {
	global $wp, $template;
	define("D4P_EOL", "rn");

	echo 'Request: ';
	echo empty($wp->request) ? "None" : esc_html($wp->request);
	echo '<br />';
	echo 'Matched Rewrite Rule: ';
	echo empty($wp->matched_rule) ? None : esc_html($wp->matched_rule);
	echo '<br />';
	echo 'Matched Rewrite Query: ';
	echo empty($wp->matched_query) ? "None" : esc_html($wp->matched_query);
	echo '<br />';
	echo 'Loaded Template: ';
	echo basename($template);
	echo '<br />';
}*/
