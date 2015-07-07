<?php

require_once("validation.php");

class ContactDetailsDTO {
	private $buildingType;
	private $siteId;
	private $title;
	private $firstName;
	private $lastName;
	private $company;
	private $phone;
	private $email;
	
	private $rules = array(
			// required
			"required,siteId,This field (PafID) is required.",
			"required,firstName,This field (First name) is required.",
			"required,lastName,This field (Last name) is required.",
			"required,buildingType, ",
			"required,company,This field (City) is required.",
	
			// other
			"length>1,firstName,Please enter First name that is over 2 characters long.",
			"length>1,lastName,Please enter Last name that is over 2 characters long.",
			"digits_only,siteId, "
	
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
	public function getBuildingType() {
		return $this->buildingType;
	}
	public function setBuildingType($buildingType) {
		$this->buildingType = $buildingType;
		return $this;
	}
	public function getSiteId() {
		return $this->siteId;
	}
	public function setSiteId($siteId) {
		$this->siteId = $siteId;
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
	public function getCompany() {
		return $this->company;
	}
	public function setCompany($company) {
		$this->company = $company;
		return $this;
	}
	public function getPhone() {
		return $this->phone;
	}
	public function setPhone($phone) {
		$this->phone = $phone;
		return $this;
	}
	public function getEmail() {
		return $this->email;
	}
	public function setEmail($email) {
		$this->email = $email;
		return $this;
	}
	public function getRules() {
		return $this->rules;
	}
	public function setRules($rules) {
		$this->rules = $rules;
		return $this;
	}
	
}