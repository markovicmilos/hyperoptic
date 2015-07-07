<?php

require_once 'BaseAPI.php';

class OrderProcessAPI extends BaseAPI {

    // RETURNS A COMPLEX OBJECT
    public function getOrderProducts($pafId) {
        $params = array("pafId" => $pafId);
        $oneMonth = json_decode($this->doGETRequest(ORDER_SERVICE_BASE_URL . 'getOrderProductsForOneMonthContract', $params));
        $twelveMonth = json_decode($this->doGETRequest(ORDER_SERVICE_BASE_URL . 'getOrderProducts', $params));
        $response = ["oneMonth" => $oneMonth, "twelveMonth" => $twelveMonth];
        return $response;
    }
    
    // RETURNS A COMPLEX OBJECT
    public function getOrderProductsWithPromoCode($pafId, $promoCode) {
        $params = array( "pafId" => $pafId, "promoCode" => $promoCode);
        $oneMonth = json_decode($this->doGETRequest(ORDER_SERVICE_BASE_URL . 'getOrderProductsWithPromoCodeForOneMonthContract', $params));
        $twelveMonth = json_decode($this->doGETRequest(ORDER_SERVICE_BASE_URL . 'getOrderProductsWithPromoCode', $params));
        $response = ["oneMonth" => $oneMonth, "twelveMonth" => $twelveMonth];
        return $response;
    }
    
    // RETURNS A COMPLEX OBJECT
    public function checkBankDetails($holderName, $accountNo, $sortCode) {
        $params = array("holderName" => $holderName, "accountNo" => $accountNo, "sortCode" => $sortCode);
        return json_decode($this->doGETRequest(ORDER_SERVICE_BASE_URL . 'checkBankDetails', $params));
    }
        
    // RETURNS BOOLEAN, TRUE MEANS AVAILABLE
    public function checkEmailAvailability($email) {
        $params = array("email" => $email);
        return $this->doGETRequest(ORDER_SERVICE_BASE_URL . 'checkEmailAvailability', $params);
    }
    
    // RETURNS NEW USER ID
    public function placeServiceOrder($madeOrderDTO) {
        $returnData = $this->doPOSTRequest(ORDER_SERVICE_BASE_URL . 'placeServiceOrder', $madeOrderDTO->getAssocArray());
        if (is_numeric($returnData) && $returnData == 0){
        	return false;
        } else {
        	return json_decode( $returnData );
        }
    }
    
    public function placeFaceplateOrder($madeFaceplateOrderDTO) {
    	$returnData = $this->doPOSTRequest(ORDER_SERVICE_BASE_URL . 'placeFaceplateOrder', $madeFaceplateOrderDTO->getAssocArray());
    	if (is_numeric($returnData) && $returnData == 0){
    		return false;
    	} else {
    		return json_decode( $returnData );
    	}
    }

    public function trackStepOrder($trackData) {
        $this->doPOSTRequest(ORDER_SERVICE_BASE_URL . 'trackOrderStep', $trackData->getAssocArray());
    }
}
