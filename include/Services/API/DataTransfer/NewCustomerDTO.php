<?php

require_once("validation.php");

class NewCustomerDTO {

	private $firstName;
	private $lastName;
	private $jobTitle;
	private $email;
	private $mobile;
	private $landline;
	private $birthday;
	private $receiveInfo;
	private $receiveNewsletter;
	private $passkey;
	private $registrationIPAddress;
	
	private $invoiceAddressId;
	private $addressId;
	private $portPhoneNumber;
	private $phoneNumberToBePorted;
	private $whoReffered;
	private $userAgent;
	private $sessionId;



	private $holder;
	private $sortCode;
	private $accountNumber;

    private $isBusiness;
    private $cvs;
    private $readyToActivate;

	private $rules = array(
			// required
			"required,addressId,This field (Address ID) is required.",
			"required,firstName,This field (First name) is required.",
			"required,email,This field (Email) is required.",
			"required,passkey,This field (Password) is required.",
			"required,registrationIPAddress,This field (User IP Address) is required.",
			"required,invoiceAddressId,This field (Invoice Address ID) is required.",
			"required,userAgent,This field (User Agent) is required.",

			// other
			"length>1,firstName,Please enter First name that is over 2 characters long.",
			"digits_only,addressId, ",
			"digits_only,invoiceAddressId, "

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
	public function getJobTitle() {
		return $this->jobTitle;
	}
	public function setJobTitle($jobTitle) {
		$this->jobTitle = $jobTitle;
		return $this;
	}
	public function getEmail() {
		return $this->email;
	}
	public function setEmail($email) {
		$this->email = $email;
		return $this;
	}
	public function getMobile() {
		return $this->mobile;
	}
	public function setMobile($mobile) {
		$this->mobile = $mobile;
		return $this;
	}
	public function getLandline() {
		return $this->landline;
	}
	public function setLandline($landline) {
		$this->landline = $landline;
		return $this;
	}
	public function getBirthday() {
		return $this->birthday;
	}
	public function setBirthday($birthday) {
		$this->birthday = $birthday;
		return $this;
	}
	public function getReceiveInfo() {
		return $this->receiveInfo;
	}
	public function setReceiveInfo($receiveInfo) {
		$this->receiveInfo = $receiveInfo;
		return $this;
	}
	public function getReceiveNewsletter() {
		return $this->receiveNewsletter;
	}
	public function setReceiveNewsletter($receiveNewsletter) {
		$this->receiveNewsletter = $receiveNewsletter;
		return $this;
	}
	public function getPasskey() {
		return $this->passkey;
	}
	public function setPasskey($passkey) {
		$this->passkey = $passkey;
		return $this;
	}
	public function getRegistrationIPAddress() {
		return $this->registrationIPAddress;
	}
	public function setRegistrationIPAddress($registrationIPAddress) {
		$this->registrationIPAddress = $registrationIPAddress;
		return $this;
	}
	public function getInvoiceAddressId() {
		return $this->invoiceAddressId;
	}
	public function setInvoiceAddressId($invoiceAddressId) {
		$this->invoiceAddressId = $invoiceAddressId;
		return $this;
	}
	public function getAddressId() {
		return $this->addressId;
	}
	public function setAddressId($addressId) {
		$this->addressId = $addressId;
		return $this;
	}
	public function getPortPhoneNumber() {
		return $this->portPhoneNumber;
	}
	public function setPortPhoneNumber($portPhoneNumber) {
		$this->portPhoneNumber = $portPhoneNumber;
		return $this;
	}
	public function getWhoReffered() {
		return $this->whoReffered;
	}
	public function setWhoReffered($whoReffered) {
		$this->whoReffered = $whoReffered;
		return $this;
	}
	public function getUserAgent() {
		return $this->userAgent;
	}
	public function setUserAgent($userAgent) {
		$this->userAgent = $userAgent;
		return $this;
	}
    public function setSessionId($sessionId)
    {
        $this->sessionId = $sessionId;
    }
    public function getSessionId()
    {
        return $this->sessionId;
    }
	public function getRules() {
		return $this->rules;
	}
	public function getPhoneNumberToBePorted() {
		return $this->phoneNumberToBePorted;
	}
	public function setPhoneNumberToBePorted($phoneNumberToBePorted) {
		$this->phoneNumberToBePorted = $phoneNumberToBePorted;
		return $this;
	}
	public function getHolder() {
		return $this->holder;
	}
	public function setHolder($holder) {
		$this->holder = $holder;
		return $this;
	}
	public function getSortCode() {
		return $this->sortCode;
	}
	public function setSortCode($sortCode) {
		$this->sortCode = $sortCode;
		return $this;
	}
	public function getAccountNumber() {
		return $this->accountNumber;
	}
	public function setAccountNumber($accountNumber) {
		$this->accountNumber = $accountNumber;
		return $this;
	}

    public function getIsBusiness () {
        return $this->isBusiness;
    }

    public function setIsBusiness ($isBusiness) {
        $this->isBusiness = $isBusiness;
    }

    public function getCvs () {
        return $this->cvs;
    }

    public function setCvs ($cvs) {
        $this->cvs = $cvs;
    }

    public function getReadyToActivate () {
        return $this->readyToActivate;
    }

    public function setReadyToActivate ($readyToActivate) {
        $this->readyToActivate = $readyToActivate;
    }
}