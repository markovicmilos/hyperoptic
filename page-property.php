<?php /* Template Name: Property Page */ ?>

<?php


$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/property.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-property.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Property Developers Fibre Optic Broadband ");
$tpl->assign( "header-description",     "Superfast Fibre Optic Broadband  for Property: New Developments, Private Rented Sector & Retrofits. Faster than the UK average speed. Enquire now! ");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>
                                        $(window).load(function(){
                                                setInterval(function() {
                                                         if ($("#speed-test, #features, #how-to-get" ).hasClass( "active in")) {
                                                                $(".gr-activation").addClass("gradient-1-bg-h");
                                                         }
                                                         else {
                                                                $(".gr-activation").removeClass("gradient-1-bg-h");
                                                         }
                                                });
                                        });
                                        // animating gaph on tab 2 when tab Speed test is clicked
                                        $(function() {
                                                $("#run-speed-test").click(function() {
                                                        setTimeout(function() {
                                                                setDropDownValue("yourSpeedTitle","10 Mbps");
                                                                updateChart(10);
                                                        },500);
                                                });
                                        });
										</script>' );

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>