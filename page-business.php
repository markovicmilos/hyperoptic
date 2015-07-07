<?php /* Template Name: Business Page */ ?>

<?php

require_once 'include/Services/API/DataTransfer/LeasedLineDTO.php';

if(isset($_REQUEST['q'])) {
    header("Location: " . home_url( '/' ) . "map?q=" . $_REQUEST['q'] );
}

$api = new HomepageAPI();

if (isset($_POST['companyName'])){
    // POST FROM
    $ll = new LeasedLineDTO();
    $ll->setCompanyName($_POST['companyName']);
    $ll->setTitle($_POST['nameTitle']);
    $ll->setFirstName($_POST['firstname']);
    $ll->setLastName($_POST['lastname']);
    $ll->setAddress($_POST['address']);
    $ll->setCity($_POST['city']);
    $ll->setPostcode($_POST['postcode']);
    $ll->setPhone($_POST['phone']);
    $ll->setMobile($_POST['mobile']);
    $ll->setEmail($_POST['email']);
    $ll->setProductDetails($_POST['leasedLine']);
    $ll->setCurrentSpeed($_POST['currentSpeed']);
    $ll->setCurrentBroadbandMonthlyPrice($_POST['currentPrice']);
    if (empty($ll->validate())) {
        $llId = $api->leasedLineRequest($ll);
        if ($llId <= 0) {
            $logger = new Logger();
            $logger->addError(' Not added LeasedLineDTO -> ' . var_export($ll->getAssocArray(), true));
        }
        $DATA_ADDED = true;
    }
}


$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/business.tpl" );
$tpl->assignInclude( "header", 	dirname ( __FILE__ ) . "/templates/header-business.tpl" );
$tpl->assignInclude( "map-home", 	dirname ( __FILE__ ) . "/templates/map-package-small.tpl" );
$tpl->assignInclude( "modal-leased-line", 	dirname ( __FILE__ ) . "/templates/modals/modal-leased-line.tpl" );
$tpl->assignInclude( "modal-thank-you", dirname ( __FILE__ ) . "/templates/modals/modal-empty.tpl" );
$tpl->assignInclude( "modal-offers", 	dirname ( __FILE__ ) . "/templates/modals/modal-offers.tpl" );

$tpl->prepare ();

$tpl->assignGlobal("home-url", 			esc_url( home_url( '/' )) );
$tpl->assignGlobal("base-url", 			BASE_URL);

$tpl->assign( "header-title", 			"Hyperoptic | Business Fibre Optic Broadband");
$tpl->assign( "header-description",     "Superfast Fibre Optic Broadband for Business.Faster than the UK average speed. Check availability now!");

$tpl->assign( "header-css", 			BASE_URL . "/css/hyper.css" );
$tpl->assign( "header-body-class", 		join(' ', get_body_class()) );
$tpl->assign( "header-jscript", 		'<script src="' . BASE_URL . '/js/jquery.validate.js"></script>
										<script src="' . BASE_URL . '/js/additional-methods.js"></script>
										<script src="' . BASE_URL . '/js/validating.js"></script>
                                        <script>
                                        $( document ).ready(function() {
                                                is_map = false;
                                                elasticInit("postcodeText","postcodeResults");
                                                elasticInit("postcodeText1", "postcodeResults1");
                                                elasticInit("postcodeText2", "postcodeResults2");
                                                elasticInit("postcodeText3", "postcodeResults3");
                                                elasticInit("postcodeTextModal","postcodeResultsModal");
												onLoadHomepages(700);
												$("#leasedLineForm").validate();
												' . (isset($DATA_ADDED) ? 'openModalWindow("modal")' : '') . '
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

										</script>' );

$login = new LoginAPI();
if ($login->isLogin()){
	$tpl->assignGlobal( "blue",                   "-blue");
	$tpl->newBlock("sign-out");
}

$tpl->newBlock("tracking-base");
$tpl->newBlock("close-modal-dialog-home");
$tpl->assignGlobal( "modal-title",                  "Thank you for request");
$tpl->assignGlobal( "modal-msg-line-one",           "Your leased line request has been submitted and is now being processed.");
$tpl->assignGlobal( "additional-modal-data",        'data-backdrop="static"');

$tpl->printToScreen();

?>


<?php get_footer(); ?>