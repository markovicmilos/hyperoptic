<?php /* Template Name: Residential Page */ ?>

<?php

if(isset($_REQUEST['q'])) {
    header("Location: " . home_url( '/' ) . "map?q=" . $_REQUEST['q'] );
}
    
?>
    
<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/residential.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "map-home", 	dirname ( __FILE__ ) . "/templates/map-package-small.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Fastest Fibre Optic Broadband");
$tpl->assign( "header-description",     "Superfast & Super Affordable Fibre Optic Broadband. Faster than the UK average speed. Check availability now!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>
																			
                                                                                    $(window).load(function(){
																									is_map = false;
                                                                                            elasticInit("postcodeText","postcodeResults");                                         
                                                                                            elasticInit("postcodeText1", "postcodeResults1");
																							onLoadHomepages(700);
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
                                                                                    // Function for changing Location Description windows for cities when clicked on pin
                                                                                        function changingLocationDescription(chosenld) {
                                                                                            $(".ld-rp-small").each(function(index) {
                                                                                                if ($(this).attr("id") == chosenld) {
                                                                                                    $(this).addClass("dis-block");
                                                                                                        $(".close-ld-rp-small").css("z-index", "1");
                                                                                                    }
                                                                                                    else {
                                                                                                        $(this).removeClass("dis-block")
                                                                                                    }
                                                                                            });
                                                                                            $(".close-ld-rp-small").click(function(){
                                                                                                $(".ld-rp-small").removeClass("dis-block");
                                                                                                $(this).css("z-index", "-1");
                                                                                            });
                                                                                        };
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