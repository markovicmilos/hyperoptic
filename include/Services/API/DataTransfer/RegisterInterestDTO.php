<?php

require_once("validation.php");

class RegisterInterestDTO {

    private $addressId;
    private $title;
    private $firstName;
    private $lastName;
    private $phone;
    private $mobile;
    private $email;
    private $postcode;
    private $receiveContactInfo;
    private $receiveServiceInfo;
    private $knownSourceId;
    private $interest = "cunsumer";
	private $currentProvider;
	private $currentDownloadSpeed;
	private $existingContractEndDescription;
	private $comment;

    private $businessName;
    private $natureOfBusiness;
    private $numberOfEmployees;
    
    private $rules = array(	
    						// required
    						"required,addressId,This field (PafID) is required.",
				    		"required,firstName,This field (First name) is required.",
				    		"required,lastName,This field (Last name) is required.",
				    		"required,email,This field (Email) is required.",
							
    						// other
				    		"length>1,firstName,Please enter First name that is over 2 characters long.",
				    		"length>1,lastName,Please enter Last name that is over 2 characters long.",
    						"digits_only,addressId, "
    		
    );

    public function __construct() {
    	
    }
    
    public function validate() {
		return validateFields($this->getAssocArray(), $this->getRules());
	}
	
	public function getAssocArray() {
		$assocArray = get_object_vars($this);
		unset($assocArray['rules']);
		$main = json_decode(json_encode($assocArray), true);
		return $main;
	}
	public function getAddressId() {
		return $this->addressId;
	}
	public function setAddressId($addressId) {
		$this->addressId = $addressId;
		return $this;
	}
	public function getTitle() {
		return $this->title;
	}
	public function setTitle($title) {
		$this->title = $title;
		return $this;
	}
	public function getFirstName() {
		return $this->firstName;
	}
	public function setFirstName($firstName) {
		$this->firstName = $firstName;
		return $this;
	}
	public function getLastName() {
		return $this->lastName;
	}
	public function setLastName($lastName) {
		$this->lastName = $lastName;
		return $this;
	}
	public function getPhone() {
		return $this->phone;
	}
	public function setPhone($phone) {
		$this->phone = $phone;
		return $this;
	}
	public function getMobile() {
		return $this->mobile;
	}
	public function setMobile($mobile) {
		$this->mobile = $mobile;
		return $this;
	}
	public function getEmail() {
		return $this->email;
	}
	public function setEmail($email) {
		$this->email = $email;
		return $this;
	}
	public function getPostcode() {
		return $this->postcode;
	}
	public function setPostcode($postcode) {
		$this->postcode = $postcode;
		return $this;
	}
	public function getReceiveContactInfo() {
		return $this->receiveContactInfo;
	}
	public function setReceiveContactInfo($receiveContactInfo) {
		$this->receiveContactInfo = $receiveContactInfo;
		return $this;
	}
	public function getReceiveServiceInfo() {
		return $this->receiveServiceInfo;
	}
	public function setReceiveServiceInfo($receiveServiceInfo) {
		$this->receiveServiceInfo = $receiveServiceInfo;
		return $this;
	}
	public function getKnownSourceId() {
		return $this->knownSourceId;
	}
	public function setKnownSourceId($knownSourceId) {
		$this->knownSourceId = $knownSourceId;
		return $this;
	}
	public function getInterest() {
		return $this->interest;
	}
	public function setInterest($interest) {
		$this->interest = $interest;
		return $this;
	}
	public function getCurrentProvider() {
		return $this->currentProvider;
	}
	public function setCurrentProvider($currentProvider) {
		$this->currentProvider = $currentProvider;
		return $this;
	}
	public function getCurrentDownloadSpeed() {
		return $this->currentDownloadSpeed;
	}
	public function setCurrentDownloadSpeed($currentDownloadSpeed) {
		$this->currentDownloadSpeed = $currentDownloadSpeed;
		return $this;
	}
	public function getExistingContractEndDescription() {
		return $this->existingContractEndDescription;
	}
	public function setExistingContractEndDescription($existingContractEndDescription) {
		$this->existingContractEndDescription = $existingContractEndDescription;
		return $this;
	}
	public function getComment() {
		return $this->comment;
	}
	public function setComment($comment) {
		$this->comment = $comment;
		return $this;
	}
	public function getRules(){
		return $this->rules;
	}

    public function getBusinessName () {
        return $this->businessName;
    }

    public function setBusinessName ($businessName) {
        $this->businessName = $businessName;
    }

    public function getNatureOfBusiness () {
        return $this->natureOfBusiness;
    }

    public function setNatureOfBusiness ($natureOfBusiness) {
        $this->natureOfBusiness = $natureOfBusiness;
    }

    public function getNumberOfEmployees () {
        return $this->numberOfEmployees;
    }

    public function setNumberOfEmployees ($numberOfEmployees) {
        $this->numberOfEmployees = $numberOfEmployees;
    }
}