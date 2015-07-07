<?php

require_once("validation.php");

class PaymentInfoDTO {
	private $holderName;
    private $accountNumber;
    private $sortCode;
    private $customerId;
    
    private $rules = array(
    		// required
    		"required,holderName,This field (Holder name) is required.",
    		"required,accountNumber,This field (Account number) is required.",
    		"required,sortCode,This field (Sortcode) is required.",
    		"required,customerId,This field (Sortcode) is required.",
    			
    		// other
    		"length>2,holderName,Please enter Holder name that is over 2 characters long.",
    		"length=8,accountNumber,Please enter Account number that is exactly 8 characters long.",
    		"length=6,sortCode,Please enter Sortcode that is exactly 6 characters long.",
    		"digits_only,accountNumber,Account number field may only contain digits.",
    		"digits_only,sortCode,Sortcode field may only contain digits."
    );
    
    public function validate() {
    	return validateFields($this->getAssocArray(), $this->getRules());
    }
    
    public function getAssocArray() {
    	$assocArray = get_object_vars($this);
		unset($assocArray['rules']);
		$main = json_decode(json_encode($assocArray), true);
		return $main;
    }
	public function getHolderName() {
		return $this->holderName;
	}
	public function setHolderName($holderName) {
		$this->holderName = $holderName;
		return $this;
	}
	public function getAccountNumber() {
		return $this->accountNumber;
	}
	public function setAccountNumber($accountNumber) {
		$this->accountNumber = $accountNumber;
		return $this;
	}
	public function getSortCode() {
		return $this->sortCode;
	}
	public function setSortCode($sortCode) {
		$this->sortCode = $sortCode;
		return $this;
	}
	public function getCustomerId() {
		return $this->customerId;
	}
	public function setCustomerId($customerId) {
		$this->customerId = $customerId;
		return $this;
	}
	public function getRules() {
		return $this->rules;
	}
	
	
}