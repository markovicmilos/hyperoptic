<?php

require_once("validation.php");

class MyProfileDTO {
	
	private $id;
	private $firstName;
	private $lastName;
	private $landLine;
	private $mobile;
	private $password;
	private $reveiveNewsletter;
	private $receiveUpdates;
	private $title;
	private $dateOfBirth;
	private $address;
	private $email;
	
	private $rules = array(
			// required
			"required,firstName,This field (First name) is required.",
			"required,lastName,This field (Last number) is required.",
			 
			// other
			"length>1,firstName,Please enter First name that is over 2 characters long.",
			"length>1,lastName,Please enter Last name that is over 2 characters long.",
			"digits_only,id, "
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
	public function getId() {
		return $this->id;
	}
	public function setId($id) {
		$this->id = $id;
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
	public function getLandLine() {
		return $this->landLine;
	}
	public function setLandLine($landLine) {
		$this->landLine = $landLine;
		return $this;
	}
	public function getMobile() {
		return $this->mobile;
	}
	public function setMobile($mobile) {
		$this->mobile = $mobile;
		return $this;
	}
	public function getPassword() {
		return $this->password;
	}
	public function setPassword($password) {
		$this->password = $password;
		return $this;
	}
	public function getEmail() {
		return $this->email;
	}
	public function setEmail($email) {
		$this->email = $email;
		return $this;
	}
	public function getReveiveNewsletter() {
		return $this->reveiveNewsletter;
	}
	public function setReveiveNewsletter($reveiveNewsletter) {
		$this->reveiveNewsletter = $reveiveNewsletter;
		return $this;
	}
	public function getReceiveUpdates() {
		return $this->receiveUpdates;
	}
	public function setReceiveUpdates($receiveUpdates) {
		$this->receiveUpdates = $receiveUpdates;
		return $this;
	}
	public function getTitle() {
		return $this->title;
	}
	public function setTitle($title) {
		$this->title = $title;
		return $this;
	}
	public function getRules() {
		return $this->rules;
	}	
}