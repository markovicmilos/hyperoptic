<?php

// allowed file types for job application upload
$allowedDocumentFileTypes = array
    (
    "PDF" => "application/pdf",
    "DOCX" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
);

// allowed upload file size (has to be <= than the one in php.ini)
$allowedDocumentFileSize = 8388608;

if (ISDEBUG) {
    $pageMap = array
        (
        "CHECK_AVAILABILITY" => "CheckAvailability.php",
        "CONTACT_US" => "ContactUs.php",
        "ORDER_FACEPLATE_ONLY" => "OrderFaceplateOnly.php",
        "REGISTER_INTEREST_IN_PIPELINE" => "RegisterInterestInPipeline.php",
        "REGISTER_INTEREST_NOT_IN_PIPELINE" => "RegisterInterestNotInPipeline.php",
        "SUBSCRIBE" => "Subscribe.php",
        "CAREERS" => "Careers.php",
        "CUSTOMER_LOGIN" => "Login.php",
        "MY_ACCOUNT" => "/wp36/MyAccount.php",
        "PERSONAL_DETAILS" => "/wp36/PersonalDetails.php",
        "PAYMENT_DETAILS" => "/wp36/payment-details/",
        "SUMMARY" => "/wp36/summary/",
        "PAYMENT_CONFIRMATION" => "/wp36/payment-confirmation/",
        "ORDER_SERVICE" => "/wp36/order-service/",
        "CONGRATULATIONS" => "/wp36/congratulations/"
    );
} else {
    $pageMap = array
        (
        "CHECK_AVAILABILITY" => "/wp36/check-availability/",
        "CONTACT_US" => "/wp36/contact-us/",
        "ORDER_FACEPLATE_ONLY" => "/wp36/order-faceplate-only/",
        "REGISTER_INTEREST_IN_PIPELINE" => "RegisterInterestInPipeline.php",
        "REGISTER_INTEREST_NOT_IN_PIPELINE" => "RegisterInterestNotInPipeline.php",
        "SUBSCRIBE" => "/wp36/subscribe/",
        "CAREERS" => "/wp36/page-careers/",
        "CUSTOMER_LOGIN" => "Login.php",
        "MY_ACCOUNT" => "/wp36/my-account/",
        "MY_ACCOUNT_BILLING_INFORMATION" => "/wp36/my-account-billing-information/",
        "MY_ACCOUNT_PRODUCT_INFORMATION" => "/wp36/my-account-product-information/",
        "MY_ACCOUNT_ORDER_INFORMATION" => "/wp36/my-account-order-information/",
        "PERSONAL_DETAILS" => "/wp36/personal-details/",
        "PAYMENT_DETAILS" => "/wp36/payment-details/",
        "SUMMARY" => "/wp36/summary/",
        "PAYMENT_CONFIRMATION" => "/wp36/payment-confirmation/",
        "CONGRATULATIONS" => "/wp36/congratulations/",
        "FACEPLATE_SUMMARY" => "/wp36/faceplate-order-summary/",
        "ORDER_SERVICE" => "/wp36/order-service/",
        "CREDIT_CARD_PAYMENT" => "/wp36/credit-card-payment/",
        "MEDIA_PACKS" => "/wp36/media/"
    );
}

function getLink($key) {
    global $pageMap;
    return $pageMap[$key];
}

function prepareLinks($tpl) {
    global $pageMap;
    foreach ($pageMap as $key => $value) {
        $tpl->assignGlobal($key, $value);
    }
}

// checks if the type of the uploaded file is allowed
function isAllowedFileType($type) {
    global $allowedDocumentFileTypes;
    foreach ($allowedDocumentFileTypes as $key => $value) {
        if ($value == $type) {
            return true;
        }
    }
    return false;
}

// checks if the size of the uploaded file is not greater than the limit
function isAllowedFileSize($size) {
    global $allowedDocumentFileSize;
    if ($size <= $allowedDocumentFileSize) {
        return true;
    } else {
        return false;
    }
}

?>
