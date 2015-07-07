<?php

require_once("validation.php");
require_once("NewCustomerDTO.php");

class MakeOrderDTO {
	
	private $broadBandProductId;
	private $faceplateProductId;
    private $faceplatePrice;
	private $phoneProductId;
	private $connectionFeeProductId;
	private $additionalProducts;
	private $newCustomer;
	private $promotionId;
	private $promoCodeId;
    private $contractLength;
	
	private $rules = array(
			// required
			"required,broadBandProductId,This field (Broadband Product ID) is required.",

			// other
			"digits_only,broadBandProductId, "

	);

	public function __construct() {

	}

	public function validate() {
		return validateFields($this->getAssocArray(), $this->getRules());
	}

	public function getAssocArray() {
		$assocArray = get_object_vars($this);
		$assocArray['newCustomer'] = $this->getNewCustomer()->getAssocArray();
		unset($assocArray['rules']);
		$main = json_decode(json_encode($assocArray), true);
		return $main;
	}
	public function getBroadBandProductId() {
		return $this->broadBandProductId;
	}
	public function setBroadBandProductId($broadBandProductId) {
		$this->broadBandProductId = $broadBandProductId;
		return $this;
	}
	public function getFaceplateProductId() {
		return $this->faceplateProductId;
	}
	public function setFaceplateProductId($faceplateProductId) {
		$this->faceplateProductId = $faceplateProductId;
		return $this;
	}
    public function getFaceplatePrice()
    {
        return $this->faceplatePrice;
    }
    public function setFaceplatePrice($faceplatePrice)
    {
        $this->faceplatePrice = $faceplatePrice;
    }
	public function getPhoneProductId() {
		return $this->phoneProductId;
	}
	public function setPhoneProductId($phoneProductId) {
		$this->phoneProductId = $phoneProductId;
		return $this;
	}
	public function getConnectionFeeProductId() {
		return $this->connectionFeeProductId;
	}
	public function setConnectionFeeProductId($connectionFeeProductId) {
		$this->connectionFeeProductId = $connectionFeeProductId;
		return $this;
	}
	public function getAdditionalProducts() {
		return $this->additionalProducts;
	}
	public function setAdditionalProducts($additionalProducts) {
		$this->additionalProducts = $additionalProducts;
		return $this;
	}
	public function getNewCustomer() {
		return $this->newCustomer;
	}
	public function setNewCustomer($customerDTO) {
		$this->newCustomer = $customerDTO;
		return $this;
	}
	public function getRules() {
		return $this->rules;
	}
	public function getPromotionId() {
		return $this->promotionId;
	}
	public function setPromotionId($promotionId) {
		$this->promotionId = $promotionId;
		return $this;
	}
	public function getPromoCodeId() {
		return $this->promoCodeId;
	}
	public function setPromoCodeId($promoCodeId) {
		$this->promoCodeId = $promoCodeId;
		return $this;
	}

    public function getContractLength () {
        return $this->contractLength;
    }

    public function setContractLength ($contractLength) {
        $this->contractLength = $contractLength;
    }
	
}