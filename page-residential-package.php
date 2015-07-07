<?php /* Template Name: Residential Package Page */ ?>

<?php

if(isset($_REQUEST['q'])) {
    header("Location: " . home_url( '/' ) . "map?q=" . $_REQUEST['q'] );
}

?>

<?php

$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/residential-package.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header.tpl" );
$tpl->assignInclude( "map-package-small", 	dirname ( __FILE__ ) . "/templates/map-package-small.tpl" );
$tpl->assignInclude( "modal-offers", 	dirname ( __FILE__ ) . "/templates/modals/modal-offers.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Residential Fibre Optic Broadband | Residential Package ");
$tpl->assign( "header-description",     "Superfast Fibre Optic Broadband for Business.Faster than the UK average speed. Check availability now!");
$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script>
                                        $(window).load(function(){
                                                is_map = false;
                                                elasticInit("postcodeText","postcodeResults");
                                                elasticInit("postcodeText1", "postcodeResults1");
                                                elasticInit("postcodeText2", "postcodeResults2");
                                                elasticInit("postcodeText3", "postcodeResults3");
                                                elasticInit("postcodeText4", "postcodeResults4");
                                                elasticInit("postcodeTextModal","postcodeResultsModal");
												onLoadHomepages(700);
                                        });
                                        // animating gaph on tab 2 when tab Speed test is clicked
                                            $(function() {
                                                    $("#start-st-rp").click(function() {
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
                                        // Function for changing prices based on contract length
                                            function changeContractLength(){
                                                var header = {"promo":
                                                {"title":"No commitment with our No Contract service","description":"Hyperoptic recognise that not everyone can sign up to a 12 month contract, so we created this No Contract service. There are no tie-ins or cancellation fees, just a 30 day notice period, and you can still chose the UK’s fastest  fibre broadband."},
                                                "regularBP":{"title":" Save all year with our 12 month deal on full fibre.","description":"Hyperoptic is so powerful there is almost no limit to what you can do with it. And for a limited time, all our broadband packages come with a 12 month discount."},
                                                "regularB":{"title":" Don’t need a landline? No problem.","description":"The UK’s fastest residential broadband, without the need for a phone line. No additional monthly fees, no usage caps of limits. Just reliable, fast, award-winning broadband designed to make the most of the internet."}
                                                };
                                                var contractLength = $(".contract-change").html();
                                                var length = length;
                                                var BandP = {"promo":
                                                    {"OneGbPrice":"£51","OneGbConnection":"£40 connection fee","HundredMbPrice":"£25","HundredMbbConnection":"£40 connection fee","TwentyMbPrice":"£11","TwentyMbConnection":"£40 connection fee"},
                                                    "regular":
                                                    {"OneGbPrice":"£30","OneGbConnection":" for the first 12 months <br/> £47 afterwards ","HundredMbPrice":"£12","HundredMbbConnection":" for the first 12 months <br/> £22 afterwards ","TwentyMbPrice":"£7.50","TwentyMbConnection":" for the first 12 months <br/> £9 afterwards "}};
                                                var B = {"promo":
                                                    {"OneGbPrice":"£64","OneGbConnection":"£40 connection fee","HundredMbPrice":"£38","HundredMbbConnection":"£40 connection fee","TwentyMbPrice":"£24","TwentyMbConnection":"£40 connection fee"},
                                                    "regular":
                                                    {"OneGbPrice":"£50","OneGbConnection":"first 12 months, £60 afterwards <br/> £40 connection fee ","HundredMbPrice":"£30","HundredMbbConnection":"first 12 months, £35 afterwards <br/> £40 connection fee ","TwentyMbPrice":"£18","TwentyMbConnection":"first 12 months, £22 afterwards <br/> £40 connection fee "}};
                                                var offerImageClass = ".offer-i-res-package";
                                                var contractLengthId = ".contract-length-info";
                                                if(contractLength == "View 12 Month Contract"){
                                                    $("#headTitleBP").html(header.regularBP.title);
                                                    $("#headDescriptionBP").html(header.regularBP.description);
                                                    $("#headTitleB").html(header.regularB.title);
                                                    $("#headDescriptionB").html(header.regularB.description);
                                                    $("#BandP1Gb").html(BandP.regular.OneGbPrice);
                                                    $("#BandP1Gbdescription").html(BandP.regular.OneGbConnection);
                                                    $("#BandP100Mb").html(BandP.regular.HundredMbPrice);
                                                    $("#BandP100Mbdescription").html(BandP.regular.HundredMbbConnection);
                                                    $("#BandP20Mb").html(BandP.regular.TwentyMbPrice);
                                                    $("#BandP20Mbdescription").html(BandP.regular.TwentyMbConnection);
                                                    $("#B1Gb").html(B.regular.OneGbPrice);
                                                    $("#B1Gbdescription").html(B.regular.OneGbConnection);
                                                    $("#BP100Mb").html(B.regular.HundredMbPrice);
                                                    $("#B100Mbdescription").html(B.regular.HundredMbbConnection);
                                                    $("#B20Mb").html(B.regular.TwentyMbPrice);
                                                    $("#B20Mbdescription").html(B.regular.TwentyMbConnection);
                                                    $(contractLengthId).html("12 month contract ");
                                                    $(offerImageClass).removeClass("op-0");
                                                    $(".contract-change").html("View No Contract");
                                                }
                                                if(contractLength == "View No Contract"){
                                                    $("#headTitleBP").html(header.promo.title);
                                                    $("#headDescriptionBP").html(header.promo.description);
                                                    $("#headTitleB").html(header.promo.title);
                                                    $("#headDescriptionB").html(header.promo.description);
                                                    $("#BandP1Gb").html(BandP.promo.OneGbPrice);
                                                    $("#BandP1Gbdescription").html(BandP.promo.OneGbConnection);
                                                    $("#BandP100Mb").html(BandP.promo.HundredMbPrice);
                                                    $("#BandP100Mbdescription").html(BandP.promo.HundredMbbConnection);
                                                    $("#BandP20Mb").html(BandP.promo.TwentyMbPrice);
                                                    $("#BandP20Mbdescription").html(BandP.promo.TwentyMbConnection);
                                                    $("#B1Gb").html(B.promo.OneGbPrice);
                                                    $("#B1Gbdescription").html(B.promo.OneGbConnection);
                                                    $("#B100Mb").html(B.promo.HundredMbPrice);
                                                    $("#B100Mbdescription").html(B.promo.HundredMbbConnection);
                                                    $("#B20Mb").html(B.promo.TwentyMbPrice);
                                                    $("#B20Mbdescription").html(B.promo.TwentyMbConnection);
                                                    $(contractLengthId).html("No contract – just 30 days notice");
                                                    $(offerImageClass).addClass("op-0");
                                                    $(".contract-change").html("View 12 Month Contract");
                                                }
                                            }
										</script>');
$tpl->assign("isBBactive", $_REQUEST['broadband-only'] == 'true' ? 'active' : '');
$tpl->assign("defaultActive", $_REQUEST['broadband-only'] == 'true' ? '' : 'active');

$login = new LoginAPI();
if ($login->isLogin()){
    $tpl->assignGlobal( "blue","-blue");
    $tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");

$tpl->printToScreen();

?>


<?php get_footer(); ?>