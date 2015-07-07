<?php /* Template Name: Order API */ ?>

<?php 

include_once 'include/Services/API/OrderProcessAPI.php';
include_once 'include/Services/API/DataTransfer/NewCustomerDTO.php';
include_once 'include/Services/API/DataTransfer/MakeOrderDTO.php';
include_once 'include/Services/API/DataTransfer/MakeFaceplateOrderDTO.php';
include_once 'include/Services/API/DataTransfer/TrackingDataDTO.php';

$api = new OrderProcessAPI();


if ( isset( $_REQUEST['order'] ) ){
    $csfId = $_REQUEST['csfId'];
    if($csfId == $_SESSION["CSF"]){
        // ORDERING
        $newCustomer = new NewCustomerDTO();
        $newCustomer->setJobTitle( $_REQUEST['title'] );
        $newCustomer->setFirstName( $_REQUEST['firstName'] );
        $newCustomer->setLastName( $_REQUEST['lastName'] );
        $newCustomer->setLandline( $_REQUEST['phone'] );
        $newCustomer->setMobile( $_REQUEST['mobile'] );
        $newCustomer->setEmail( $_REQUEST['email'] );
        $newCustomer->setAddressId( $_REQUEST['pafid'] );
        $newCustomer->setInvoiceAddressId( $_REQUEST['pafid'] );
        $newCustomer->setPasskey( $_REQUEST['password'] );
        $newCustomer->setBirthday( $_REQUEST['dateOfBirth'] );
        $newCustomer->setRegistrationIPAddress( $_REQUEST['userIP'] );
        $newCustomer->setSessionId( session_id());
        $newCustomer->setUserAgent(	$_REQUEST['userAgent'] );
        $newCustomer->setReceiveInfo( true );
        $newCustomer->setReceiveNewsletter( $_REQUEST['receiveNewsletter'] != null ? $_REQUEST['receiveNewsletter'] : false );
        $newCustomer->setPortPhoneNumber( $_REQUEST['isPortPhoneNumber'] );
        $newCustomer->setPhoneNumberToBePorted( $_REQUEST['portPhoneNumber'] );
        $newCustomer->setIsBusiness( $_REQUEST['isBusiness'] != null ? $_REQUEST['isBusiness'] : false );
        $newCustomer->setCvs( $_REQUEST['cvs'] != null ? $_REQUEST['cvs'] : false );
        $newCustomer->setReadyToActivate( $_REQUEST['readyToActivate'] != null ? $_REQUEST['readyToActivate'] : false );

        if ( $_REQUEST['order'] === 'product' ){
            $makeOrder = new MakeOrderDTO();
            $newCustomer->setHolder( $_REQUEST['holdername'] );
            $newCustomer->setAccountNumber( $_REQUEST['accountNumber'] );
            $newCustomer->setSortCode( $_REQUEST['sortcode'] );
            $makeOrder->setContractLength( ( $_REQUEST['contractLength'] ==12 || $_REQUEST['contractLength'] ==1) ? $_REQUEST['contractLength'] : 12);
            $makeOrder->setNewCustomer($newCustomer);
            $makeOrder->setBroadBandProductId( $_REQUEST['broadBandProductId'] );
            $makeOrder->setFaceplateProductId( $_REQUEST['faceplateProductId'] );
            $makeOrder->setFaceplatePrice( $_REQUEST['faceplatePrice'] );
            $makeOrder->setPhoneProductId( $_REQUEST['phoneProductId'] );
            $makeOrder->setConnectionFeeProductId( $_REQUEST['connectionFeeProductId'] );
            if (!empty( $_REQUEST['additionalProducts'] )) $makeOrder->setAdditionalProducts( $_REQUEST['additionalProducts'] );
            else $makeOrder->setAdditionalProducts( null );
            $makeOrder->setPromotionId( $_REQUEST['promotionId'] );
            $makeOrder->setPromoCodeId( $_REQUEST['promoCodeId'] );

            if ( empty( $newCustomer->validate() ) && empty( $makeOrder->validate() ) ){
                $data = $api->placeServiceOrder($makeOrder);
                if ($data !== false) {
                    $_SESSION['monthlyPrice'] = $_REQUEST['monthlyPrice'];
                    $_SESSION['promoCode'] = $_REQUEST['promoCode'];
                    $login = new LoginAPI();
                    $login->forceLoginUser($data->customerId);
                    echo json_encode(array('redirect' => true, 'eastVillageSsid' => $data->eastVillageSsid, 'eastVillagePassword' => $data->eastVillagePassword, 'eastVillageCustomer' => $data->eastVillageCustomer));
                } else {
                    $logger = new Logger();
                    $logger->addError(' Order not created -> ' . var_export($makeOrder->getAssocArray(), true));
                }
            }
        } else {
            $makeFaceplateOrder = new MakeFaceplateOrderDTO();
            $makeFaceplateOrder->setFpProductCategoryId( $_REQUEST['faceplateProductId'] );
            $makeFaceplateOrder->setPromotionId( $_REQUEST['promotionId'] );
            $makeFaceplateOrder->setPrice( $_REQUEST['faceplatePrice'] );
            $makeFaceplateOrder->setComment( $_REQUEST['whyNeedOnlySocet'] );
            $makeFaceplateOrder->setTransactionId(null);
            $makeFaceplateOrder->setNewCustomer($newCustomer);
            if ( empty( $newCustomer->validate() ) && empty( $makeFaceplateOrder->validate() ) ){
                $data = $api->placeFaceplateOrder($makeFaceplateOrder);
                if ($data !== false) {
                    echo json_encode(array('redirect' => false));
                } else {
                    $logger = new Logger();
                    $logger->addError(' Faceplate order not created -> ' . var_export($makeFaceplateOrder->getAssocArray(), true));
                }
            }
        }
    }
} elseif ( isset( $_REQUEST['pafid'] ) ){

		// GETTING PRODUCTS
		if ( isset( $_REQUEST['promocode'] ) ){
			// PRODUCTS WITH PROMOCODE
			echo json_encode($api->getOrderProductsWithPromoCode($_REQUEST['pafid'], $_REQUEST['promocode']));
		} else {
			// PRODUCTS
			echo json_encode($api->getOrderProducts($_REQUEST['pafid']));
		}

} else {
    $logger = new Logger();
    $logger->addError(' TEST -> ' . var_export($_REQUEST, true));
    if( isset($_REQUEST['postAddressId'])){
        $trackingData = new TrackingDataDTO();
        $trackingData->setSessionId(session_id());
        $trackingData->setStep($_REQUEST['step']);
        $trackingData->setFormContents($_REQUEST['formData']);
        $trackingData->setUserAgent($_REQUEST['userAgent']);
        $trackingData->setPafId($_REQUEST['postAddressId']);
        $trackingData->setSiteId($_REQUEST['siteId']);
        $trackingData->setIpAddress($_REQUEST['ip']);
        $trackingData->setBroadband($_REQUEST['broadband']);
        $trackingData->setHavePhone($_REQUEST['havePhone']);
        $trackingData->setPrice($_REQUEST['price']);
        $api->trackStepOrder($trackingData);
    }
}
?>