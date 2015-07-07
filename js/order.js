//list of functional/control keys that you want to allow always
var functionalKeys = [8, 9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 144, 145];
var activeSection = 1;

function orderOnLoad() {
    $("input.datepicker").datepicker({startView: 'decade', endDate: '-18y'});
    var validator = $("#accountDetailsForm").validate({
        rules: {
            email: {
                validEmail: true,
                uniqueEmail: true
            },
            password: "required",
            password2: {
                equalTo: "#password"
            }
        }
    });
    $("#sortcode").keydown(function (e) {
        var size = $(this).val().length;
        if ($.inArray(e.keyCode, functionalKeys) == -1) {
            if (size >= 6) {
                e.preventDefault();
                e.stopPropagation();
            }
        }
    });
    $("#accountNumber").keydown(function (e) {
        var size = $(this).val().length;
        if ($.inArray(e.keyCode, functionalKeys) == -1) {
            if (size >= 8) {
                e.preventDefault();
                e.stopPropagation();
            }
        }
    });
    $("#paymentInfoForm").validate({
        rules: {
            sortcode: {
                required: true,
                digits: true
            },
            accountNumber: {
                required: true,
                digits: true
            }
        }
    });
    $("#cbAuthorisedDirectDebit").click(function () {
        if ($(this).is(":checked")) {
            $("#paymentInfoContinue").removeAttr("disabled");
        } else {
            $("#paymentInfoContinue").attr("disabled", "disabled");
        }
    });
    $(".allMustBeChecked").click(function () {
        var selectedTabCssId = window.app.hyp.orderProcess.selectedTabCssId;

        if ($(".allMustBeChecked:checked").length == 2 && activeSection == 4) {
            $("#orderButton").removeAttr("disabled");
        } else if ($(".allMustBeChecked:checked").length == 1 && activeSection == 3 && selectedTabCssId === "#tab-3") {
            $("#orderButton").removeAttr("disabled");
        } else {
            $("#orderButton").attr("disabled", "disabled");
        }
    });
    $("#cbIReadAndAgree").click(function () {
        if ($(this).is(":checked")) {
            $("#bntIReadAndAgree").removeAttr("disabled");
        } else {
            $("#bntIReadAndAgree").attr("disabled", "disabled");
        }
    });
}

function initOrder() {
    useThisPacket();
    //window.app.hyp.orderProcess.init();
}

window.app = {};
window.app.hyp = {
    orderProcess: {
        config: {
            base_url: homeURL + "process-api"
        },
        templates: {},
        products: {},
        selectedProduct: {},
        selectedTabCssId: {}, // current selected tab
        selectedProductTabIndex: null, // "#tab-1" var of selected product tab
        selectedProductPanelIndex: null,
        promotion: {},
        anytimeUk: 0,
        internationalCalls: 0,
        user: {},
        bankDetails: {},
        submitProduct: {
            broadBandProductId: null,
            faceplateProductId: null,
            faceplatePrice: null,
            phoneProductId: null,
            connectionFeeProductId: null,
            additionalProducts: null,
            promotionId: null,
            promoCodeId: null,
            isPortPhoneNumber: null,
            portPhoneNumber: null
        },
        currency: "£",
        vat: 0.20
    }
};

(function (app) {
    app.init = function () {
        app.products = app.api.getOrderProducts();
        updateProductTabs(app.products);
    };

    app.api = {
        getOrderProducts: function (data) {
            $.ajax({
                type: "GET",
                dataType: "json",
                url: homeURL + "process-api",
                data: {pafid: pafid},
                success: function (products) {
                    //console.log(data);
                    if (products) {
                        return products;
                    }
                }
            });
        }
    };

}(window.app.hyp.orderProcess));

var orderProcessUrl = homeURL + "process-api";

function changingPacket(e) {
    var tabElement = jQuery(e).parent().parent().parent();
    var tabCssId = jQuery(tabElement).attr('id');
    //console.log(jQuery(tabElement).attr('id'));
    //console.log(jQuery(e).find(".productCategoryId").val());
    //console.log(jQuery(e).find(".productBundleId").val());
    //console.log(jQuery(e).find(".productProductId").val());

    var allProducts = window.app.hyp.orderProcess.products;

    var selectedProduct = getSelectedProduct(
        allProducts,
        jQuery(e).find(".productCategoryId").val(),
        jQuery(e).find(".productBundleId").val(),
        jQuery(e).find(".productProductId").val(),
        tabCssId
    );
    //console.log(selectedProduct);

    window.app.hyp.orderProcess.selectedProduct = selectedProduct;
    window.app.hyp.orderProcess.selectedProductTabIndex = "#" + tabCssId;
    window.app.hyp.orderProcess.selectedProductPanelIndex = jQuery("#" + tabCssId + " .product-panel").index(jQuery(e).parent());

    setSubmitProduct();

    var selectedProducts = getSelectedProducts(allProducts, tabCssId);

    if (tabCssId === "tab-1") {
        var lineRental = getLineRentalProduct(selectedProducts, selectedProduct.bundleId);
        updateLineRentalProduct(lineRental);

        updateAddOnsList(selectedProducts, selectedProduct.bundleId);
        updateProductsTable(selectedProducts, selectedProduct, allProducts['promotion']);
    } else if (tabCssId === "tab-2") {
        updateBroadbandProductsTable(selectedProducts, selectedProduct, allProducts['promotion']);
    }

    updateSummaryTablePromotion(allProducts['promotion']);

    hideContinueButton();
}

/* Changing Tabs Event */
jQuery(document).on('shown.bs.tab', '.nav.nav-tabs-op li a[data-toggle="tab"]', function (e) {
    var tab = e.target;
    var previousTab = e.relatedTarget;

    var selectedTabCssId = jQuery(tab).attr("href");

    window.app.hyp.orderProcess.selectedTabCssId = selectedTabCssId;

    var allProducts = window.app.hyp.orderProcess.products;
    var faceplate = getFaceplateProduct(allProducts['fpProducts']);
    var faceplatePrice = 0;
    if (faceplate !== null) {
        if (faceplate.discountedPrice !== null) {
            faceplatePrice = faceplate.discountedPrice;
        } else {
            faceplatePrice = faceplate.price;
        }
    }

    if (selectedTabCssId === "#tab-3") {
        toggleDefaultPanel(2, false);
        toggleDefaultPanel(3, false);
        togglePromoCodeForm(false);

        if (faceplatePrice === 0) {
            toggleAgreeCheckbox(false);

            toggleSummaryTable(false);
        } else {
            toggleDefaultPanel(1, false);
            toggleSummaryBlock(false);
        }

    } else if (selectedTabCssId !== "#tab-3" && jQuery(previousTab).attr("href") === "#tab-3") {
        toggleDefaultPanel(2, true);
        toggleDefaultPanel(3, true);
        togglePromoCodeForm(false);

        if (faceplatePrice === 0) {
            toggleAgreeCheckbox(true);

            toggleSummaryTable(true);
        } else {
            toggleDefaultPanel(1, true);
            toggleSummaryBlock(true);
        }
    }

    hideContinueButton();

});

function useThisPacket(productID) {
    $.ajax({
        type: "GET",
        dataType: "json",
        url: orderProcessUrl,
        data: {pafid: pafid},
        success: function (data) {
            //console.log(data);
            if (data) {
                window.app.hyp.orderProcess.products = data;
                updateProductTabs(data);
            }
        }
    });
}

jQuery(document).on('click', '.promo-code-submit', function () {
    var promoCode = jQuery(".promo-code").val();

    usePromoCode(promoCode);
});

function usePromoCode(promoCode) {

    $.ajax({
        type: "GET",
        dataType: "json",
        url: orderProcessUrl,
        data: {pafid: pafid, promocode: promoCode},
        success: function (data) {
            //console.log(data);
            if (data) {
                // store old values
                var oldTabCssId = window.app.hyp.orderProcess.selectedProductTabIndex;
                var oldProductPanelIndex = window.app.hyp.orderProcess.selectedProductPanelIndex;

                updateProductTabs(data);
                window.app.hyp.orderProcess.products = data;

                jQuery('#promocodemsg').removeClass("op-0 fade");
                if (data['promotion'] !== null && data['promoCodeValid']) {
                    jQuery('#promocodemsg').html('<p class="pc-p-op font-13">Thank you, your promo code has been applied.</p>');
                } else {
                    jQuery('#promocodemsg').html('<p class="pc-p-op font-13" style="color: red;">Invalid promo code!</p>');
                }
                jQuery('#promocodemsg').addClass("op-1 fade-in");
                closePromoCodeMsg("#promocodemsg");

                // promo code call - select product that w
                var tabIndex = parseInt(oldTabCssId.substr(oldTabCssId.length - 1)) - 1;
                selectProductPanel(tabIndex, oldProductPanelIndex);
                changingPacket(jQuery(oldTabCssId + " .product-panel:eq(" + oldProductPanelIndex + ")").find("[class^='p-d-op']"));
            }
        }
    });
}

function closePromoCodeMsg(cssSelector) {
    setTimeout(function () {
        jQuery(cssSelector).removeClass("op-1 fade-in");
        jQuery(cssSelector).addClass("op-0 fade");
    }, 5000);
}

/* Any Time UK Checkbox */
jQuery(document).on("change", "#checkbox-1", function () {
    var allProducts = window.app.hyp.orderProcess.products;
    var selectedProduct = window.app.hyp.orderProcess.selectedProduct;
    var selectedProducts = getSelectedProducts(allProducts, "tab-1");
    var promotion = allProducts['promotion'];

    window.app.hyp.orderProcess.anytimeUk = jQuery("#tab-1 #checkbox-1:checked").length;

    if (window.app.hyp.orderProcess.anytimeUk) {
        toggleAnytimeUkSummaryRow(true);
    } else {
        toggleAnytimeUkSummaryRow(false);
    }

    updateProductsTable(selectedProducts, selectedProduct, promotion);
    updateSummaryTablePromotion(promotion);

    setSubmitProduct();
});

/* International Calls Checkbox */
jQuery(document).on("change", "#checkbox-2", function () {
    var allProducts = window.app.hyp.orderProcess.products;
    var selectedProduct = window.app.hyp.orderProcess.selectedProduct;
    var selectedProducts = getSelectedProducts(allProducts, "tab-1");
    var promotion = allProducts['promotion'];

    window.app.hyp.orderProcess.internationalCalls = jQuery("#tab-1 #checkbox-2:checked").length;

    if (window.app.hyp.orderProcess.internationalCalls) {
        toggleInternationalCallsSummaryRow(true);
    } else {
        toggleInternationalCallsSummaryRow(false);
    }

    updateProductsTable(selectedProducts, selectedProduct, promotion);
    updateSummaryTablePromotion(promotion);

    setSubmitProduct();
});

/* PortPhoneNumber Checkbox */
jQuery(document).on("change", "#checkbox-3", function () {
    if (jQuery("#tab-1 #checkbox-3:checked").length === 0) {
        jQuery("#tab-1 .port-phone-number").val("");
        jQuery("#tab-1 .port-phone-number").prop('disabled', true);
    } else {
        jQuery("#tab-1 .port-phone-number").prop('disabled', false);
    }
});

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function updateProductTabs(data) {
    var promotion = data["promotion"];
    updateBradbandAndPhoneProducts(data["bbpProducts"], promotion);
    updateBroadbandProducts(data["bbProducts"], promotion);
    updateFaceplateProducts(data["fpProducts"], promotion);

    // Select product by default
    selectNotDisabledProduct(data);
}

function updateBradbandAndPhoneProducts(products, promotion) {
    var oneGig = getOneGigProduct(products);
    updateOneGigProduct(oneGig, promotion, "#tab-1");

    var hundredMeg = getHunderdMegProduct(products);
    updateHundredMegProduct(hundredMeg, promotion, "#tab-1");

    var twentyMeg = getTwentyMegProduct(products);
    updateTwentyMegProduct(twentyMeg, promotion, "#tab-1");

    //var lineRental = getLineRentalProduct(products);
    //updateLineRentalProduct(lineRental);

    //updateAddOnsList(products, oneGig.bundleId);
}

function updateBroadbandProducts(products, promotion) {
    var oneGig = getOneGigNoPhoneProduct(products);
    updateOneGigProduct(oneGig, promotion, "#tab-2");

    var hundredMeg = getHunderdMegNoPhoneProduct(products);
    updateHundredMegProduct(hundredMeg, promotion, "#tab-2");

    var twentyMeg = getTwentyMegNoPhoneProduct(products);
    updateTwentyMegProduct(twentyMeg, promotion, "#tab-2");
}

function updateFaceplateProducts(products) {
    var faceplate = getFaceplateProduct(products);

    if (faceplate === null) {
        jQuery('.nav.nav-tabs-op li a[href="#tab-3"]').css("visibility", "hidden");
        toggleFaceplateSummaryRow(false);
        return false;
    } else {
        toggleFaceplateSummaryRow(true);
    }

    updateFaceplateProduct(faceplate);

    var faceplatePrice;

    if (faceplate.discountedPrice !== null) {
        faceplatePrice = faceplate.discountedPrice;
    } else {
        faceplatePrice = faceplate.price;
    }

    if (faceplatePrice === 0) {
        toggleFaceplateOrderButton(true);
    } else {
        toggleFaceplateOrderButton(false);
    }
}

function selectNotDisabledProduct(allProducts) {
    //var selectedProduct = getOneGigProduct(allProducts["bbpProducts"]);
    var selectedProduct = null;
    var products = {};
    var promotion = allProducts["promotion"];

    var tabIndex = 0;
    var productPanelIndex = 0;

    var categoryId = "C-00001";
    var productIds = ["P-00001", "P-00002"];
    var bundleIds = ["B-01000", "B-00100", "B-00020"];

    product:
        for (var i in productIds) {
            var tmpProduct = {};
            tabIndex = i;

            if (productIds[i] === "P-00001") {
                products = allProducts['bbpProducts'];
            } else if (productIds[i] === "P-00002") {
                products = allProducts['bbProducts'];
            }

            bundle:
                for (var j in bundleIds) {
                    productPanelIndex = j;
                    tmpProduct = getProduct(products, categoryId, bundleIds[j], productIds[i]);
                    if (!tmpProduct.isDisabled) {
                        selectedProduct = tmpProduct;
                        break product;
                    }

                    // hide tab with disabled products
                    var tmpProductsCount = parseInt(bundleIds.length) - 1;
                    if (j == tmpProductsCount) {
                        var tmpTabIndex = parseInt(tabIndex) + 1;
                        jQuery('.nav.nav-tabs-op li a[href="#tab-' + tmpTabIndex + '"]').css("visibility", "hidden");
                    }
                }
        }

    //TODO select faceplate if everything is disabled

    if (window.app.hyp.orderProcess.selectedProductPanelIndex === null) { // don't select product if is promo code call
        selectProductPanel(tabIndex, productPanelIndex);

        window.app.hyp.orderProcess.selectedTabCssId = jQuery('.nav.nav-tabs-op li:eq(' + tabIndex + ') a').attr("href");
        window.app.hyp.orderProcess.selectedProductTabIndex = jQuery('.nav.nav-tabs-op li:eq(' + tabIndex + ') a').attr("href");
    }

    window.app.hyp.orderProcess.selectedProduct = selectedProduct;
    window.app.hyp.orderProcess.selectedProductPanelIndex = productPanelIndex;

    setSubmitProduct();

    if (tabIndex == 0) {
        var lineRental = getLineRentalProduct(products, selectedProduct.bundleId);
        updateLineRentalProduct(lineRental);

        updateAddOnsList(products, selectedProduct.bundleId);
        updateProductsTable(products, selectedProduct, promotion);
    } else if (tabIndex == 1) {
        updateBroadbandProductsTable(products, selectedProduct, promotion);
    }
    updateSummaryTablePromotion(promotion);

    //hideContinueButton();
}

function selectProductPanel(tabIndex, productPanelIndex) {
    jQuery('.nav.nav-tabs-op li:eq(' + tabIndex + ') a').tab('show');

    var tabIndex = parseInt(tabIndex) + 1;

    var imageId = jQuery("#tab-" + tabIndex + " .product-panel:eq(" + productPanelIndex + ")").find("[id^='p-i-op']").attr("id");
    var textId = jQuery("#tab-" + tabIndex + " .product-panel:eq(" + productPanelIndex + ")").find("[id^='p-t-op']").attr("id")

    changingPacketText(textId);
    changingPacketImg(imageId);
}

function updateSummaryTablePromotion(promotion) {
    var visibility = "";
    if (promotion !== null) {
        visibility = "visible";
    } else {
        visibility = "hidden";
    }

    jQuery(".summary-table .promotion-months").parent().css("visibility", visibility);
    jQuery(".summary-table .promotion-ex-vat").parent().css("visibility", visibility);
    jQuery(".summary-table .prod-price-discount").parent().css("visibility", visibility);
    jQuery(".summary-table .prod-price-discount-vat").parent().css("visibility", visibility);
    jQuery(".summary-table .vat-price-discount").parent().css("visibility", visibility);
    jQuery(".summary-table .vat-price-discount-vat").parent().css("visibility", visibility);
    jQuery(".summary-table .monthly-price-discount").parent().css("visibility", visibility);
    jQuery(".summary-table .monthly-price-discount-vat").parent().css("visibility", visibility);
}

function updateOneGigProduct(product, promotion, tabId) {
    var productPanel = jQuery(tabId + " .product-panel")[0];

    updateProductPanel(product, promotion, productPanel);
}

function updateHundredMegProduct(product, promotion, tabId) {
    var productPanel = jQuery(tabId + " .product-panel")[1];

    updateProductPanel(product, promotion, productPanel);
}

function updateTwentyMegProduct(product, promotion, tabId) {
    var productPanel = jQuery(tabId + " .product-panel")[2];

    updateProductPanel(product, promotion, productPanel);
}

function updateProductPanel(product, promotion, productPanel) {
    if (product.discountedPrice !== null) {
        jQuery(productPanel).find(".offer-i-op").css("visibility", "visible");
        jQuery(productPanel).find(".pd-p-co-op").html(window.app.hyp.orderProcess.templates.panelPriceDiscount);

        jQuery(productPanel).find(".p-p-op").text("£" + product.discountedPrice.toFixed(2));
        jQuery(productPanel).find(".promotion-months").text(promotion.duration);
    } else {
        jQuery(productPanel).find(".offer-i-op").css("visibility", "hidden");
        jQuery(productPanel).find(".pd-p-co-op").html(window.app.hyp.orderProcess.templates.panelPrice);

        jQuery(productPanel).find(".p-price-only-op").text("£" + product.price.toFixed(2));
    }

    if (product.isDisabled) {
        jQuery(productPanel).addClass("f-d-grayscale-op");

        jQuery(productPanel).find(".pd-p-co-op").css("visibility", "hidden");

        jQuery(productPanel).find("[class^='p-d-op']").removeAttr("onclick");
    } else {
        jQuery(productPanel).removeClass("f-d-grayscale-op");

        jQuery(productPanel).find(".pd-p-co-op").css("visibility", "visible");
    }

    jQuery(productPanel).find(".product-title").text(product.title);

    jQuery(productPanel).find(".productBundleId").val(product.bundleId);
    jQuery(productPanel).find(".productProductId").val(product.productId);
    jQuery(productPanel).find(".productCategoryId").val(product.categoryId);
}

function updateLineRentalProduct(product) {
    if (product.discountedPrice !== null) {
        jQuery(".product-line-rental-price").text("£" + product.discountedPrice.toFixed(2));
    } else {
        jQuery(".product-line-rental-price").text("£" + product.price.toFixed(2));
    }
}

function updateAddOnsList(products, bundleId) {
    var anytimeUk = getAnytimeUkProduct(products, bundleId);
    var internationalCalls = getInternationalCallsProduct(products, bundleId);

    jQuery(".item-anytime-uk .prod-price").text(anytimeUk.price.toFixed(2));
    jQuery(".item-international-calls .prod-price").text(internationalCalls.price.toFixed(2));
}

function updateFaceplateProduct(product) {
    if (product.discountedPrice !== null) {
        jQuery("#tab-3 .prod-faceplate-price").text(product.discountedPrice.toFixed(2));
    } else {
        jQuery("#tab-3 .prod-faceplate-price").text(product.price.toFixed(2));
    }
}

/* Summary Table */
function updateProductsTable(products, selectedProduct, promotion) {
    if (promotion !== null) {
        jQuery(".summary-table .promotion-months").text(promotion.duration);
    } else {
        jQuery(".summary-table .promotion-months").text(0);
    }

    updateProductsTableRow(selectedProduct, ".prod-broadband");

    toggleLineRentalSummaryRow(true);
    var lineRental = getLineRentalProduct(products, selectedProduct.bundleId);
    updateProductsTableRow(lineRental, ".prod-line-rental");

    if (window.app.hyp.orderProcess.anytimeUk) {
        toggleAnytimeUkSummaryRow(true);
    } else {
        toggleAnytimeUkSummaryRow(false);
    }
    var anytimeUk = getAnytimeUkProduct(products, selectedProduct.bundleId);
    updateProductsTableRow(anytimeUk, ".prod-anytime-uk");

    if (window.app.hyp.orderProcess.internationalCalls) {
        toggleInternationalCallsSummaryRow(true);
    } else {
        toggleInternationalCallsSummaryRow(false);
    }
    var internationalCalls = getInternationalCallsProduct(products, selectedProduct.bundleId);
    updateProductsTableRow(internationalCalls, ".prod-international-calls");

    var connectionCharge = getConnectionFeeProduct(products, selectedProduct.bundleId);
    updateOneTimeProductsTableRow(connectionCharge, ".prod-connection-charge");

    var faceplate = getFaceplateProduct(products);
    if (faceplate !== null) {
        updateOneTimeProductsTableRow(faceplate, ".prod-faceplate");
    }

    updateSummaryVAT();
    updateSummaryMonthlyPayment();
    updateSummaryOneTimeVAT();
    updateSummaryOneTimeTotal(promotion);
}

function updateBroadbandProductsTable(products, selectedProduct, promotion) {
    if (promotion !== null) {
        jQuery(".summary-table .promotion-months").text(promotion.duration);
    } else {
        jQuery(".summary-table .promotion-months").text(0);
    }

    toggleLineRentalSummaryRow(false);
    toggleAnytimeUkSummaryRow(false);
    toggleInternationalCallsSummaryRow(false);

    updateProductsTableRow(selectedProduct, ".prod-broadband");

    var connectionCharge = getConnectionFeeNoPhoneProduct(products, selectedProduct.bundleId);
    updateOneTimeProductsTableRow(connectionCharge, ".prod-connection-charge");

    var faceplate = getFaceplateProduct(products);
    if (faceplate !== null) {
        updateOneTimeProductsTableRow(faceplate, ".prod-faceplate");
    }

    updateSummaryVAT();
    updateSummaryMonthlyPayment();
    updateSummaryOneTimeVAT();
    updateSummaryOneTimeTotal(promotion);
}

function updateProductsTableRow(product, productId) {
    var vat = window.app.hyp.orderProcess.vat;

    jQuery(".summary-table " + productId + " .prod-title").text(product.title);

    if (product.discountedPrice !== null) {
        jQuery(".summary-table " + productId + " .prod-price-discount").text(product.discountedPrice.toFixed(2));
        jQuery(".summary-table " + productId + " .prod-price-discount-vat").text((product.discountedPrice / (1 + vat)).toFixed(2));
    } else {
        jQuery(".summary-table " + productId + " .prod-price-discount").text(product.price.toFixed(2));
        jQuery(".summary-table " + productId + " .prod-price-discount-vat").text((product.price / (1 + vat)).toFixed(2));
    }

    jQuery(".summary-table " + productId + " .prod-price").text(product.price.toFixed(2));
    jQuery(".summary-table " + productId + " .prod-price-vat").text((product.price / (1 + vat)).toFixed(2));
}

function updateOneTimeProductsTableRow(product, productId) {
    var vat = window.app.hyp.orderProcess.vat;

    jQuery(".summary-table " + productId + " .prod-title").text(product.title);

    if (product.discountedPrice !== null) {
        jQuery(".summary-table " + productId + " .prod-price").text(product.discountedPrice.toFixed(2));
        jQuery(".summary-table " + productId + " .prod-price-vat").text((product.discountedPrice / (1 + vat)).toFixed(2));
    } else {
        jQuery(".summary-table " + productId + " .prod-price").text(product.price.toFixed(2));
        jQuery(".summary-table " + productId + " .prod-price-vat").text((product.price / (1 + vat)).toFixed(2));
    }
}

function updateSummaryVAT() {
    var vatDiscount = 0;
    var vatTotal = 0;
    var vat = window.app.hyp.orderProcess.vat;
    var monthlyDiscount = 0;
    var monthly = 0;

    jQuery(".summary-table .monthly-product .prod-price-discount-vat").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            vatDiscount += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .monthly-product .prod-price-discount").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            monthlyDiscount += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .monthly-product .prod-price-vat").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            vatTotal += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .monthly-product .prod-price").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            monthly += parseFloat(jQuery(val).text());
        }
    });

    //vatDiscount = vatDiscount * vat;
    vatDiscount = monthlyDiscount - vatDiscount; // TODO fixing bug with rounding
    //vatTotal = vatTotal * vat;
    vatTotal = monthly - vatTotal; // TODO fixing bug with rounding

    jQuery(".summary-table .prod-vat .vat-price-discount-vat").text(vatDiscount.toFixed(2));
    jQuery(".summary-table .prod-vat .vat-price-vat").text(vatTotal.toFixed(2));
}

function updateSummaryMonthlyPayment() {
    var monthlyDiscount = 0;
    var monthlyDiscountVat = 0;
    var monthly = 0;
    var monthlyVat = 0;
    var vat = window.app.hyp.orderProcess.vat;

    jQuery(".summary-table .monthly-product .prod-price-discount").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            monthlyDiscount += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .monthly-product .prod-price-discount-vat").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            monthlyDiscountVat += parseFloat(jQuery(val).text());
        }
    });
    //monthlyDiscountVat = monthlyDiscountVat + (monthlyDiscountVat*vat); // add VAT discount total
    monthlyDiscountVat = monthlyDiscount; // TODO fixing bug with rounding

    jQuery(".summary-table .monthly-product .prod-price").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            monthly += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .monthly-product .prod-price-vat").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            monthlyVat += parseFloat(jQuery(val).text());
        }
    });
    //monthlyVat = monthlyVat + (monthlyVat*vat); // add VAT total
    monthlyVat = monthly; // TODO fixing bug with rounding

    jQuery(".summary-table .prod-monthly-payment .monthly-price-discount").text(monthlyDiscount.toFixed(2));
    jQuery(".summary-table .prod-monthly-payment .monthly-price-discount-vat").text(monthlyDiscountVat.toFixed(2));
    jQuery(".summary-table .prod-monthly-payment .monthly-price").text(monthly.toFixed(2));
    jQuery(".summary-table .prod-monthly-payment .monthly-price-vat").text(monthlyVat.toFixed(2));
}

function updateSummaryOneTimeTotal(promotion) {
    var oneTimeTotal = 0;

    //if( promotion !== null ) {
    //	jQuery(".summary-table .one-time-product .prod-price-discount").each(function( key, val) {
    //		if(jQuery(val).text() !== "-") {
    //			oneTimeTotal += parseFloat( jQuery(val).text() );
    //		}
    //	});
    //} else {
    //	jQuery(".summary-table .one-time-product .prod-price").each(function( key, val) {
    //		if(jQuery(val).text() !== "-") {
    //			oneTimeTotal += parseFloat( jQuery(val).text() );
    //		}
    //	});
    //}

    jQuery(".summary-table .one-time-product .prod-price").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            oneTimeTotal += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .prod-one-time-payment .one-time-price").text(oneTimeTotal.toFixed(2));
    jQuery(".summary-table .prod-one-time-payment .one-time-price-vat").text(oneTimeTotal.toFixed(2));
}

function updateSummaryOneTimeVAT() {
    var oneTimeVat = 0;
    var oneTimeTotal = 0;

    jQuery(".summary-table .one-time-product .prod-price-vat").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            oneTimeVat += parseFloat(jQuery(val).text());
        }
    });

    jQuery(".summary-table .one-time-product .prod-price").each(function (key, val) {
        if (jQuery(val).text() !== "-") {
            oneTimeTotal += parseFloat(jQuery(val).text());
        }
    });

    oneTimeVat = oneTimeTotal - oneTimeVat;

    jQuery(".summary-table .prod-one-time-vat .vat-price-vat").text(oneTimeVat.toFixed(2));
}

/* Products */
function setSubmitProduct() {
    var submitProduct = {
        broadBandProductId: null,
        faceplateProductId: null,
        faceplatePrice: null,
        phoneProductId: null,
        connectionFeeProductId: null,
        additionalProducts: null,
        promotionId: null,
        promoCodeId: null,
        isPortPhoneNumber: null,
        portPhoneNumber: null
    };

    var selectedProduct = window.app.hyp.orderProcess.selectedProduct;
    var selectedTabCssId = window.app.hyp.orderProcess.selectedTabCssId;
    var allProducts = window.app.hyp.orderProcess.products;
    var promotion = allProducts['promotion'];

    if (selectedTabCssId === "#tab-1") {
        submitProduct.broadBandProductId = selectedProduct.id;

        var faceplate = getFaceplateProduct(allProducts['bbpProducts']);
        if (faceplate !== null) {
            submitProduct.faceplateProductId = faceplate.id;

            if (faceplate.discountedPrice !== null) {
                submitProduct.faceplatePrice = faceplate.discountedPrice;
            } else {
                submitProduct.faceplatePrice = faceplate.price;
            }
        }

        var lineRental = getLineRentalProduct(allProducts['bbpProducts'], selectedProduct.bundleId);
        submitProduct.phoneProductId = lineRental.id;

        var connectionFee = getConnectionFeeProduct(allProducts['bbpProducts'], selectedProduct.bundleId);
        submitProduct.connectionFeeProductId = connectionFee.id;

        submitProduct.additionalProducts = getAdditionalProducts(allProducts, selectedProduct);

        if (promotion !== null) {
            submitProduct.promotionId = promotion.id;
            submitProduct.promoCodeId = promotion.promoCodeId;
        }

        if (jQuery("#tab-1 #checkbox-3:checked").length === 1) {
            submitProduct.isPortPhoneNumber = true;
        } else {
            submitProduct.isPortPhoneNumber = false;
        }

        if (jQuery("#tab-1 .port-phone-number").val() !== "") {
            submitProduct.portPhoneNumber = jQuery("#tab-1 .port-phone-number").val();
        }

    } else if (selectedTabCssId === "#tab-2") {
        submitProduct.broadBandProductId = selectedProduct.id;

        var faceplate = getFaceplateProduct(allProducts['bbProducts']);
        if (faceplate !== null) {
            submitProduct.faceplateProductId = faceplate.id;

            if (faceplate.discountedPrice !== null) {
                submitProduct.faceplatePrice = faceplate.discountedPrice;
            } else {
                submitProduct.faceplatePrice = faceplate.price;
            }
        }

        var connectionFee = getConnectionFeeNoPhoneProduct(allProducts['bbProducts'], selectedProduct.bundleId);
        submitProduct.connectionFeeProductId = connectionFee.id;

        if (promotion !== null) {
            submitProduct.promotionId = promotion.id;
            submitProduct.promoCodeId = promotion.promoCodeId;
        }

    } else if (selectedTabCssId === "#tab-3") {
        var faceplate = getFaceplateProduct(allProducts['fpProducts']);
        submitProduct.faceplateProductId = faceplate.id;

        if (faceplate.discountedPrice !== null) {
            submitProduct.faceplatePrice = faceplate.discountedPrice;
        } else {
            submitProduct.faceplatePrice = faceplate.price;
        }

        if (promotion !== null) {
            submitProduct.promotionId = promotion.id;
            submitProduct.promoCodeId = promotion.promoCodeId;
        }

    }

    window.app.hyp.orderProcess.submitProduct = submitProduct;
}

function getAdditionalProducts(allProducts, selectedProduct) {
    var additionalProducts = [];

    if (window.app.hyp.orderProcess.anytimeUk == 1) {
        var anytimeUk = getAnytimeUkProduct(allProducts['bbpProducts'], selectedProduct.bundleId);
        additionalProducts[additionalProducts.length] = anytimeUk.id;
    }

    if (window.app.hyp.orderProcess.internationalCalls == 1) {
        var internationalCalls = getInternationalCallsProduct(allProducts['bbpProducts'], selectedProduct.bundleId);
        additionalProducts[additionalProducts.length] = internationalCalls.id;
    }

    if (additionalProducts.length !== 0) {
        return additionalProducts;
    } else {
        return null;
    }
}

function getSelectedProduct(allProducts, categoryId, bundleId, productId, tabCssId) {
    var products = getSelectedProducts(allProducts, tabCssId);

    return getProduct(products, categoryId, bundleId, productId);
}

function getSelectedProducts(allProducts, tabCssId) {
    var products = {};

    if (tabCssId === "tab-1") {
        products = allProducts['bbpProducts'];
    } else if (tabCssId === "tab-2") {
        products = allProducts['bbProducts'];
    }

    return products;
}

function getOneGigProduct(products) {
    var categoryId = "C-00001";
    var bundleId = "B-01000";
    var productId = "P-00001";

    return getProduct(products, categoryId, bundleId, productId);
}

function getHunderdMegProduct(products) {
    var categoryId = "C-00001";
    var bundleId = "B-00100";
    var productId = "P-00001";

    return getProduct(products, categoryId, bundleId, productId);
}

function getTwentyMegProduct(products) {
    var categoryId = "C-00001";
    var bundleId = "B-00020";
    var productId = "P-00001";

    return getProduct(products, categoryId, bundleId, productId);
}

function getOneGigNoPhoneProduct(products) {
    var categoryId = "C-00001";
    var bundleId = "B-01000";
    var productId = "P-00002";

    return getProduct(products, categoryId, bundleId, productId);
}

function getHunderdMegNoPhoneProduct(products) {
    var categoryId = "C-00001";
    var bundleId = "B-00100";
    var productId = "P-00002";

    return getProduct(products, categoryId, bundleId, productId);
}

function getTwentyMegNoPhoneProduct(products) {
    var categoryId = "C-00001";
    var bundleId = "B-00020";
    var productId = "P-00002";

    return getProduct(products, categoryId, bundleId, productId);
}

function getLineRentalProduct(products, bundleId) {
    var categoryId = "C-00005";
    var bundleIdStar = "*";
    var productId = "P-00001";

    var lineRental = getProduct(products, categoryId, bundleIdStar, productId);

    if (lineRental === null) {
        lineRental = getProduct(products, categoryId, bundleId, productId);
    }

    return lineRental;
}

function getAnytimeUkProduct(products, bundleId) {
    var categoryId = "C-00003";
    var productId = "P-00001";

    return getProduct(products, categoryId, bundleId, productId);
}

function getInternationalCallsProduct(products, bundleId) {
    var categoryId = "C-00004";
    var productId = "P-00001";

    return getProduct(products, categoryId, bundleId, productId);
}

function getConnectionFeeProduct(products, bundleId) {
    var categoryId = "C-00002";
    var productId = "P-00001";

    return getProduct(products, categoryId, bundleId, productId);
}

function getConnectionFeeNoPhoneProduct(products, bundleId) {
    var categoryId = "C-00002";
    var productId = "P-00002";

    return getProduct(products, categoryId, bundleId, productId);
}

function getFaceplateProduct(products) {
    //var categoryId = "C-00014";
    var bundleId = "*";
    var productId = "P-00003";
    var product = null;

    for (var key in products) {
        if (products[key].bundleId === bundleId && products[key].productId === productId) {
            product = products[key];
            break;
        }
    }

    return product;
}

function getProduct(products, categoryId, bundleId, productId) {
    var product = null;

    for (var key in products) {
        if (products[key].bundleId === bundleId && products[key].categoryId === categoryId && products[key].productId === productId) {
            product = products[key];
            break;
        }
    }

    return product;
}

/* Templates */
function toggleLineRentalSummaryRow(show) {
    var e = jQuery(".summary-table .holder-line-rental");
    var t = jQuery(".summary-table .telephone");

    if (show) {
        jQuery(e).html(window.app.hyp.orderProcess.templates.lineRentalProduct);
        jQuery(t).html(window.app.hyp.orderProcess.templates.telephone);
        jQuery(t).addClass("pad-top-fixed-15 pad-bottom-fixed-10 b-t-1px-l-gray");
    } else {
        jQuery(e).html("");
        jQuery(t).html("");
        jQuery(t).removeClass("pad-top-fixed-15 pad-bottom-fixed-10 b-t-1px-l-gray");
    }
}

function toggleAnytimeUkSummaryRow(show) {
    var e = jQuery(".summary-table .holder-anytime-uk");

    if (show) {
        jQuery(e).html(window.app.hyp.orderProcess.templates.anytimeUkProduct);
    } else {
        jQuery(e).html("");
    }
}

function toggleInternationalCallsSummaryRow(show) {
    var e = jQuery(".summary-table .holder-international-calls");

    if (show) {
        jQuery(e).html(window.app.hyp.orderProcess.templates.internationalCallsProduct);
    } else {
        jQuery(e).html("");
    }
}

function toggleFaceplateSummaryRow(show) {
    var e = jQuery(".summary-table .holder-faceplate");

    if (show) {
        jQuery(e).html(window.app.hyp.orderProcess.templates.faceplate);
    } else {
        jQuery(e).html("");
    }
}

function toggleSummaryTable(show) {
    if (show) {
        jQuery(".summary-table").css("display", "block");
    } else {
        jQuery(".summary-table").css("display", "none");
    }
}

function toggleSummaryBlock(show) {
    if (show) {
        jQuery(".order-summary-text").css("display", "block");
        jQuery(".summary-table").parent().css("display", "block");
    } else {
        jQuery(".order-summary-text").css("display", "none");
        jQuery(".summary-table").parent().css("display", "none");
    }
}

function toggleDefaultPanel(index, show) {
    if (show) {
        jQuery("#accordion .panel-default:eq(" + index + ")").css("display", "block");
    } else {
        jQuery("#accordion .panel-default:eq(" + index + ")").css("display", "none");
    }
}

function toggleAgreeCheckbox(show) {
    if (show) {
        jQuery("#check-box-container #chAgree1").parent().css("display", "block");
    } else {
        jQuery("#check-box-container #chAgree1").parent().css("display", "none");
    }
}

function togglePromoCodeForm(show) {
    if (show) {
        jQuery("#promoCodeForm").css("visibility", "visible");
    } else {
        jQuery("#promoCodeForm").css("visibility", "hidden");
    }
}

function toggleFaceplateOrderButton(show) {
    if (show) {
        jQuery("#tab-3 button").css("display", "block");
        jQuery("#tab-3 .faceplate-text").removeClass("dis-block").addClass("dis-none");
    } else {
        jQuery("#tab-3 button").css("display", "none");
        jQuery("#tab-3 .faceplate-text").removeClass("dis-none").addClass("dis-block");
    }
}

function hideContinueButton() {
    var selectedTabCssId = window.app.hyp.orderProcess.selectedTabCssId;
    var selectedProductTabIndex = window.app.hyp.orderProcess.selectedProductTabIndex;

    if ((selectedTabCssId === "#tab-1" || selectedTabCssId === "#tab-2") && selectedTabCssId !== selectedProductTabIndex) {
        toggleContinueButton(selectedTabCssId, false);
    } else if (selectedTabCssId !== "#tab-3") {
        toggleContinueButton(selectedTabCssId, true);
    }
}

function toggleContinueButton(tabCssId, show) {
    if (show) {
        jQuery(tabCssId + " button").css("display", "block");
    } else {
        jQuery(tabCssId + " button").css("display", "none");
    }
}

window.app.hyp.orderProcess.templates = {
    panelPrice: '<p class="p-price-only-op font-f-bariol-light font-30 font-w-600 blue-navy-f-2">£{product-price}</p>',

    panelPriceDiscount: '<p class="d-p-op marg-left-fixed-m5 gray-f-2 font-w-500">per month<br>for <span class="promotion-months">{promotion-months}</span> months</p> \
		<p class="p-p-op font-f-bariol-light font-30 font-w-600 blue-navy-f-2">£{product-price}</p>',

    lineRentalProduct: '\
		<div class=""> \
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-lg-5 pad-left-fixed-5" > \
				<p class="l-h-small font-13 font-w-500 gray-f-2 prod-title">Line rental</p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 op-0" > \
				<p class="pad-top-fixed-5 l-h-small font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-discount-vat"></span></p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0" > \
				<p class="pad-top-fixed-5 l-h-small font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-discount"></span></p> \
			</div> \
			<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" ></div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5 op-0" > \
				<p class="pad-top-fixed-5 l-h-small font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-vat"></span></p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5" > \
				<p class="pad-top-fixed-5 l-h-small font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price"></span></p> \
			</div> \
		</div>',

    anytimeUkProduct: '\
		<div class=""> \
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5" > \
				<p class="l-h-68 font-13 gray-f-2 font-w-500 prod-title">Anytime UK</p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 op-0" > \
				<p class="l-h-68 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-discount-vat"></span></p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0" > \
				<p class="l-h-68 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-discount"></span></p> \
			</div> \
			<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" ></div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5 op-0" > \
				<p class="l-h-68 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-vat"></span></p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5" > \
				<p class="l-h-68 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price"></span></p> \
			</div> \
		</div>',

    internationalCallsProduct: '\
		<div class=""> \
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5" > \
				<p class="l-h-100 font-13 gray-f-2 font-w-500 prod-title">International Calls</p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0 op-0" > \
				<p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-discount-vat"></span></p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0" > \
				<p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-discount"></span></p> \
			</div> \
			<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" ></div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5 op-0" > \
			    <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-vat"></span></p> \
			</div> \
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5" > \
				<p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price"></span></p> \
			</div> \
		</div>',

    telephone: '\
		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 pad-all-0 pad-left-fixed-5" > \
			<p class="l-h-small font-18 font-w-700 blue-navy-f-2"> Telephone</p> \
		</div>',

    faceplate: '\
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-5" > \
			<p class="l-h-100 font-13 gray-f-2 font-w-500 prod-title">Hyperoptic Socket</p> \
		</div> \
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0" ></div> \
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-percent-0" ></div> \
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" ></div> \
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5 op-0" > \
		<p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price-vat"></span></p> \
		</div> \
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-right-fixed-5" > \
        <p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£<span class="prod-price"></span></p> \
        </div>'

};

function goToNextPanel() {
    /* If faceplate tab is active, select faceplate product */
    var selectedTabCssId = window.app.hyp.orderProcess.selectedTabCssId;
    if (activeSection === 1 && selectedTabCssId === "#tab-3") {
        var faceplate = getFaceplateProduct(window.app.hyp.orderProcess.products["fpProducts"]);
        window.app.hyp.orderProcess.selectedProduct = faceplate;

    }
    setSubmitProduct();
//console.log(window.app.hyp.orderProcess.submitProduct);

    if (activeSection === 3) {
        jQuery("#chAgree1, #chAgree2, #chAgree3").prop('disabled', false);
    }

    if (activeSection === 2 && selectedTabCssId === "#tab-3") {
        jQuery("#chAgree1, #chAgree2, #chAgree3").prop('disabled', false);
    }

    $("#collapse" + (activeSection + 1)).collapse('show');
    $("#collapse" + activeSection).collapse('hide');
    $("#collapseDone" + activeSection).parent().addClass("collapsed");
    $("#collapseDone" + activeSection).parent().attr("href", "#");
    $("#collapseDone" + activeSection).removeClass("op-progress-udone");
    $("#collapseDone" + activeSection).addClass("op-progress-done");
    var nextP = $("#collapseDone" + activeSection).next();
    nextP.removeClass("op-fc-ud");
    nextP.addClass("op-fc-d");
    nextP.html("COMPLETED");
    $("#collapseDone" + (activeSection + 1)).parent().removeClass("collapsed");
    $('html, body').css("height", "auto").animate({
        scrollTop: 680 + ((activeSection - 1) * 85)
    }, 1000);
    activeSection += 1;

    panelSelectionTracking(selectedTabCssId, activeSection);

    return false;
}

function accountDetailsSave(event) {
    if ($("#accountDetailsForm").valid()) {
        window.app.hyp.user = {
            title: $("#nameTitleInput").val(),
            firstName: $("#firstName").val(),
            lastName: $("#lastName").val(),
            phone: $("#phone").val(),
            mobile: $("#mobile").val(),
            email: $("#email").val(),
            pafid: $("#pafid").val(),
            password: md5($("#password").val()),
            dateOfBirth: $("#dateOfBirth").val(),
            userIP: $("#userIP").val(),
            userAgent: navigator.userAgent
        };

        var accDetails = "" + ($("#nameTitleInput").val()) + " " + ($("#firstName").val()) + " " + ($("#lastName").val()) + "<br />" +
            ($("#address").val()) + "<br />" +
            $("#city").val() + " " + $("#postcode").val();
        $("#confirmAccountDetails").html(accDetails);
        $("#confirmBillingDetails").html(accDetails);
        $("#confirmDateOfBirth").html("D.O.B " + $("#dateOfBirth").val());
        var conDetails = "Tel. " + window.app.hyp.user.phone + "<br />" +
            "Mob. " + window.app.hyp.user.mobile + "<br />" +
            "Email. " + window.app.hyp.user.email;
        $("#confirmContactDetails").html(conDetails);

        goToNextPanel();
    }
    return false;
}

function bankDetailsSave(name, number, sort) {
    window.app.hyp.bankDetails = {
        holdername: name,
        accountNumber: number,
        sortcode: sort
    }
}

function checkBankDetails() {
    if (!$("#paymentInfoForm").valid()) return false;
    $("#paymentInfoButton").attr('disabled', 'disabled');
    var name = $("#holdername").val();
    var number = $("#accountNumber").val();
    var sort = $("#sortcode").val();

    bankDetailsSave(name, number, sort);

    $.ajax({
        url: homeURL + "check-api/",
        type: 'POST',
        data: {mode: 'bank', holderName: name, accountNo: number, sortCode: sort},
        dataType: "json"
    }).done(function (data) {
        if (data.isOK) {
            $("#paymentInfoError").addClass("hidden");
            $("#authorisedDirectDebit").removeClass("hidden");
            if (data.bank != null) $("#bankName").html(data.bank);
        } else {
            $("#paymentInfoError").removeClass("hidden");
            $("#paymentInfoError").html(data.message);
            $("#paymentInfoButton").removeAttr("disabled");
        }
        var bankDetails = "Bank: " + (data.bank != null ? data.bank : "") + "<br />" +
            "Sort Code " + sort + "<br />" +
            "Acc Nr " + number;
        $("#confirmBankDetails").html(bankDetails);
    });
    return false;
}

function orderNow() {
    if (window.app.hyp.orderProcess.selectedProduct.productId == "P-00001") {
        // have phone
        openModalWindow("pleaseReadModal");
    } else {
        makeOrder();
    }
    return false;
}

function makeOrder() {
    $('#bntIReadAndAgree').attr("disabled", "disabled");
    $('#orderButton').attr("disabled", "disabled");

    var dataForOrder = {
        order: 'product',
        title: window.app.hyp.user.title,
        firstName: window.app.hyp.user.firstName,
        lastName: window.app.hyp.user.lastName,
        phone: window.app.hyp.user.phone,
        mobile: window.app.hyp.user.mobile,
        email: window.app.hyp.user.email,
        pafid: window.app.hyp.user.pafid,
        password: window.app.hyp.user.password,
        dateOfBirth: window.app.hyp.user.dateOfBirth,
        userIP: window.app.hyp.user.userIP,
        userAgent: window.app.hyp.user.userAgent,
        isPortPhoneNumber: window.app.hyp.orderProcess.submitProduct.isPortPhoneNumber,
        portPhoneNumber: window.app.hyp.orderProcess.submitProduct.portPhoneNumber
    }

    if (window.app.hyp.orderProcess.selectedTabCssId === "#tab-3") {
        dataForOrder.order = 'faceplate';
        dataForOrder.faceplateProductId = window.app.hyp.orderProcess.submitProduct.faceplateProductId;
        dataForOrder.faceplatePrice = window.app.hyp.orderProcess.submitProduct.faceplatePrice;
        dataForOrder.promotionId = window.app.hyp.orderProcess.submitProduct.promotionId;
        dataForOrder.whyNeedOnlySocet = window.app.hyp.orderProcess.whyNeedOnlySocet;

    } else {
        dataForOrder.holdername = window.app.hyp.bankDetails.holdername;
        dataForOrder.accountNumber = window.app.hyp.bankDetails.accountNumber;
        dataForOrder.sortcode = window.app.hyp.bankDetails.sortcode;

        dataForOrder.broadBandProductId = window.app.hyp.orderProcess.submitProduct.broadBandProductId;
        dataForOrder.faceplateProductId = window.app.hyp.orderProcess.submitProduct.faceplateProductId;
        dataForOrder.faceplatePrice = window.app.hyp.orderProcess.submitProduct.faceplatePrice;
        dataForOrder.phoneProductId = window.app.hyp.orderProcess.submitProduct.phoneProductId;
        dataForOrder.connectionFeeProductId = window.app.hyp.orderProcess.submitProduct.connectionFeeProductId;
        dataForOrder.additionalProducts = window.app.hyp.orderProcess.submitProduct.additionalProducts;
        dataForOrder.promotionId = window.app.hyp.orderProcess.submitProduct.promotionId;
        dataForOrder.promoCodeId = window.app.hyp.orderProcess.submitProduct.promoCodeId;

    }

    $.ajax({
        url: homeURL + "process-api/",
        type: 'POST',
        data: dataForOrder,
        dataType: "json"
    }).done(function (data) {
        if (data != null && data.redirect) {
            var url = homeURL + "myaccount/?mode=ThankYou";
            if (data.eastVillageCustomer != null && data.eastVillageCustomer) {
                url += "&eastVillageSsid=" + data.eastVillageSsid + "&eastVillagePassword=" + data.eastVillagePassword;
            }
            window.location.replace(url);
        } else {
            openModalWindow('modalThankYou');
        }
    });
    return false;
}

function panelSelectionTracking(tabCssId, activePanel) {
    try {
        if (typeof adf !== 'undefined') return;
        var msgs = [];
        var index = activePanel - 2; // array starts from 0, and take msg from previous panel

        var tab1 = ["Hyperoptic.com (New)|BB and Phone order|Step 1: Select Package", "Hyperoptic.com (New)|BB and Phone order|Step 2: Account Details", "Hyperoptic.com (New)|BB and Phone order|Step 3: Payment Details", "Hyperoptic.com (New)|BB and Phone order|Step 4: Confirmation"];
        var tab2 = ["Hyperoptic.com (New)|BB only order|Step 1: Select Package", "Hyperoptic.com (New)|BB only order|Step 2: Account Details", "Hyperoptic.com (New)|BB only order|Step 3: Payment Details", "Hyperoptic.com (New)|BB only order|Step 4: Confirmation"];

        if (tabCssId === "#tab-1") {
            msgs = tab1;
        } else if (tabCssId === "#tab-2") {
            msgs = tab2;
        }

        //console.log(msgs[index]);
        adf.Params.PageName = encodeURIComponent(msgs[index]);
        adf.Params.Divider = encodeURIComponent('|');
        adf.track(189202);
    } catch (e) {

    }
}

function faceplateHelpUs(dropdownId, valueDisplay) {
    if (valueDisplay == 'In a contract & not ready to order') {
        $('#contractEndContainer').removeClass("hidden");
        $('#otherContainer').addClass("hidden");
        if ($('#contractEndInput').val() == '') {
            $("#faceplateContinueBtn").attr('disabled', 'disabled');
        }
        $('#contractEndInput').change(function () {
            if ($(this).val() != '') {
                $("#faceplateContinueBtn").removeAttr('disabled');
            } else {
                $("#faceplateContinueBtn").attr('disabled', 'disabled');
            }
        });
    } else if (valueDisplay == 'Other') {
        $('#contractEndContainer').addClass("hidden");
        $('#otherContainer').removeClass("hidden");
        $("#faceplateContinueBtn").attr('disabled', 'disabled');
        $('#otherInput').keyup(function () {
            if ($(this).val() != '') {
                $("#faceplateContinueBtn").removeAttr('disabled');
            } else {
                $("#faceplateContinueBtn").attr('disabled', 'disabled');
            }
        });
    } else {
        $('#otherContainer').addClass("hidden");
        $('#contractEndContainer').addClass("hidden");
        $("#faceplateContinueBtn").removeAttr('disabled');
    }
    setDropDownValue(dropdownId, valueDisplay);
}

function goToNextPanelFaceplate() {
    var value = $('#youNeedOnlySocketInput').val();
    if (value == 'In a contract & not ready to order') {
        value = value + ": " + $('#contractEndInput').val();
    } else if (value == 'Other') {
        value = value + ": " + $('#otherInput').val();
    }
    window.app.hyp.orderProcess.whyNeedOnlySocet = value;
    goToNextPanel();
}

