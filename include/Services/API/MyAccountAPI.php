<?php

require_once "BaseAPI.php";
require_once "DataTransfer/PaymentInfoDTO.php";
require_once "DataTransfer/MyProfileDTO.php";

class MyAccountAPI extends BaseAPI {
	
	public function getProfileInfo($customerId) {
		$params = array("customerId" => $customerId);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getProfileInfo", $params));
	}
	
	public function getFullProfileInfo($customerId) {
		$params = array("customerId" => $customerId);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getAccountDetails", $params));
	}
	
	public function setNewProfileInfo($myProfileDTO){
		$returnData = $this->doPOSTRequest(MYACCOUNT_SERVICE_BASE_URL . "saveAccountDetails", $myProfileDTO->getAssocArray());
		if (is_numeric($returnData) && $returnData == 0){
			return false;
		} else {
			return true;
		} 
	}
	
	public function getBillsOverview($customerId){
		$params = array("customerId" => $customerId);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getBillsOverview", $params));
	}
	
	public function getPaymentInfo($customerId) {
		$params = array("customerId" => $customerId);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getPaymentInfo", $params));
	}
	
	public function setPaymentInfo($paymentInfoDTO) {
		$returnData = $this->doPOSTRequest(MYACCOUNT_SERVICE_BASE_URL . "setPaymentInfo", $paymentInfoDTO->getAssocArray());
		if (is_numeric($returnData) && $returnData == 0){
			return false;
		} else {
			return $returnData;
		}
	}
	
	public function getLastBill($customerId) {
		$lastMonth = date("d M Y");
		if (getdate()['mday'] <= 15){
			$lastMonth = date("d M Y",strtotime("-1 month"));
		}
		$params = array("customerId" => $customerId, "period" => $lastMonth);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getBill", $params));
	}
	
	public function getBill($customerId, $month) {
		$params = array("customerId" => $customerId, "period" => $month);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getBill", $params));
	}
	
	public function getBillList($customerId) {
		$params = array("customerId" => $customerId);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getBillList", $params));
	}
	
	public function getAccountStatus($customerId) {
		$params = array("customerId" => $customerId);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "getAccountStatus", $params));
	}

    public function sendMail($customerId, $emailText, $emailTo, $emailSubject) {
        $params = array("customerId" => $customerId,
                        "emailText" => $emailText,
                        "emailTo" => $emailTo,
                        "emailSubject" => $emailSubject);
        return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . "sendMail", $params));
    }
}