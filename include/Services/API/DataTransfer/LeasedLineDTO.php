<?php 

require_once("validation.php");

class LeasedLineDTO {

    private $companyName;
    private $title;
    private $firstName;
    private $lastName;
    private $address;
    private $city;
    private $postcode;
    private $phone;
    private $mobile;
    private $email;
    private $productDetails;
    private $currentSpeed;
    private $currentBroadbandMonthlyPrice;
	
	private $rules = array(
			// required
			"required,companyName,This field (companyName) is required.",
			"required,firstName,This field (First name) is required.",
			"required,lastName,This field (Last name) is required.",
			"required,email,This field (Email) is required.",
				
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

    public function getCompanyName () {
        return $this->companyName;
    }

    public function setCompanyName ($companyName) {
        $this->companyName = $companyName;
    }

    public function getTitle () {
        return $this->title;
    }

    public function setTitle ($title) {
        $this->title = $title;
    }

    public function getFirstName () {
        return $this->firstName;
    }

    public function setFirstName ($firstName) {
        $this->firstName = $firstName;
    }

    public function getLastName () {
        return $this->lastName;
    }

    public function setLastName ($lastName) {
        $this->lastName = $lastName;
    }

    public function getAddress () {
        return $this->address;
    }

    public function setAddress ($address) {
        $this->address = $address;
    }

    public function getCity () {
        return $this->city;
    }

    public function setCity ($city) {
        $this->city = $city;
    }

    public function getPostcode () {
        return $this->postcode;
    }

    public function setPostcode ($postcode) {
        $this->postcode = $postcode;
    }

    public function getPhone () {
        return $this->phone;
    }

    public function setPhone ($phone) {
        $this->phone = $phone;
    }

    public function getMobile () {
        return $this->mobile;
    }

    public function setMobile ($mobile) {
        $this->mobile = $mobile;
    }

    public function getEmail () {
        return $this->email;
    }

    public function setEmail ($email) {
        $this->email = $email;
    }

    public function getProductDetails () {
        return $this->productDetails;
    }

    public function setProductDetails ($productDetails) {
        $this->productDetails = $productDetails;
    }

    public function getCurrentSpeed () {
        return $this->currentSpeed;
    }

    public function setCurrentSpeed ($currentSpeed) {
        $this->currentSpeed = $currentSpeed;
    }

    public function getCurrentBroadbandMonthlyPrice () {
        return $this->currentBroadbandMonthlyPrice;
    }

    public function setCurrentBroadbandMonthlyPrice ($currentBroadbandMonthlyPrice) {
        $this->currentBroadbandMonthlyPrice = $currentBroadbandMonthlyPrice;
    }

    public function getRules () {
        return $this->rules;
    }
}