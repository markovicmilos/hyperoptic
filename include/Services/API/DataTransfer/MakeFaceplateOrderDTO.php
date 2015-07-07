<?php

require_once("validation.php");
require_once("NewCustomerDTO.php");

class MakeFaceplateOrderDTO {
	
	private $fpProductCategoryId;
	private $promotionId;
	private $transactionId;
	private $price;
    private $comment;
	private $newCustomer;
	
	private $rules = array(
			// required
			"required,fpProductCategoryId,This field (Product Category Id) is required.",

			// other
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
	public function getFpProductCategoryId() {
		return $this->fpProductCategoryId;
	}
	public function setFpProductCategoryId($fpProductCategoryId) {
		$this->fpProductCategoryId = $fpProductCategoryId;
		return $this;
	}
	public function getPromotionId() {
		return $this->promotionId;
	}
	public function setPromotionId($promotionId) {
		$this->promotionId = $promotionId;
		return $this;
	}
	public function getTransactionId() {
		return $this->transactionId;
	}
	public function setTransactionId($transactionId) {
		$this->transactionId = $transactionId;
		return $this;
	}
	public function getPrice() {
		return $this->price;
	}
	public function setPrice($price) {
		$this->price = $price;
		return $this;
	}
	public function getNewCustomer() {
		return $this->newCustomer;
	}
	public function setNewCustomer($newCustomer) {
		$this->newCustomer = $newCustomer;
		return $this;
	}
	public function getRules() {
		return $this->rules;
	}
    public function getComment () {
        return $this->comment;
    }
    public function setComment ($comment) {
        $this->comment = $comment;
    }

		
}