<?php

require_once("validation.php");

class ContactUsDTO {
	private $title;
	private $firstName;
	private $lastName;
	private $emailAddress;

	private $interestedIn;
	private $hearAboutUs;

	private $postCode;
	private $address1;
	private $address2;
	private $town;
	private $city;
	
	private $receiveInfo;
	private $sendCopy;
	
	private $rules = array(
			// required
			"required,firstName,This field (First name) is required.",
			"required,lastName,This field (Last name) is required.",
			"required,emailAddress,This field (Email) is required.",
	
			// other
			"length>1,firstName,Please enter First name that is over 2 characters long.",
			"length>1,lastName,Please enter Last name that is over 2 characters long."
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
	public function getEmailAddress() {
		return $this->emailAddress;
	}
	public function setEmailAddress($emailAddress) {
		$this->emailAddress = $emailAddress;
		return $this;
	}
	public function getInterestedIn() {
		return $this->interestedIn;
	}
	public function setInterestedIn($interestedIn) {
		$this->interestedIn = $interestedIn;
		return $this;
	}
	public function getHearAboutUs() {
		return $this->hearAboutUs;
	}
	public function setHearAboutUs($hearAboutUs) {
		$this->hearAboutUs = $hearAboutUs;
		return $this;
	}
	public function getPostCode() {
		return $this->postCode;
	}
	public function setPostCode($postCode) {
		$this->postCode = $postCode;
		return $this;
	}
	public function getAddress1() {
		return $this->address1;
	}
	public function setAddress1($address1) {
		$this->address1 = $address1;
		return $this;
	}
	public function getAddress2() {
		return $this->address2;
	}
	public function setAddress2($address2) {
		$this->address2 = $address2;
		return $this;
	}
	public function getTown() {
		return $this->town;
	}
	public function setTown($town) {
		$this->town = $town;
		return $this;
	}
	public function getCity() {
		return $this->city;
	}
	public function setCity($city) {
		$this->city = $city;
		return $this;
	}
	public function getReceiveInfo() {
		return $this->receiveInfo;
	}
	public function setReceiveInfo($receiveInfo) {
		$this->receiveInfo = $receiveInfo;
		return $this;
	}
	public function getSendCopy() {
		return $this->sendCopy;
	}
	public function setSendCopy($sendCopy) {
		$this->sendCopy = $sendCopy;
		return $this;
	}
	public function getRules() {
		return $this->rules;
	}
		
}