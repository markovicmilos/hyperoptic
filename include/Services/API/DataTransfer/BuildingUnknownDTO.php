<?php 

require_once("validation.php");

class BuildingUnknownDTO {
	
	private $title;
	private $firstName;
	private $lastName;
	private $pafId;
	private $phone;
	private $mobile;
	private $email;
	private $propertyType;
	private $ownership;
	private $numOfApartments;
	private $currentProvider;
	private $currentSpeed;
	private $contractEnd;
	private $aboutUs;
	private $receiveInfo;
	
	private $rules = array(
			// required
			"required,pafId,This field (PafID) is required.",
			"required,firstName,This field (First name) is required.",
			"required,lastName,This field (Last name) is required.",
			"required,email,This field (Email) is required.",
				
			// other
			"length>1,firstName,Please enter First name that is over 2 characters long.",
			"length>1,lastName,Please enter Last name that is over 2 characters long.",
			"digits_only,pafId, "
	
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
	public function getPafId() {
		return $this->pafId;
	}
	public function setPafId($pafId) {
		$this->pafId = $pafId;
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
	public function getPropertyType() {
		return $this->propertyType;
	}
	public function setPropertyType($propertyType) {
		$this->propertyType = $propertyType;
		return $this;
	}
	public function getOwnership() {
		return $this->ownership;
	}
	public function setOwnership($ownership) {
		$this->ownership = $ownership;
		return $this;
	}
	public function getNumOfApartments() {
		return $this->numOfApartments;
	}
	public function setNumOfApartments($numOfApartments) {
		$this->numOfApartments = $numOfApartments;
		return $this;
	}
	public function getCurrentProvider() {
		return $this->currentProvider;
	}
	public function setCurrentProvider($currentProvider) {
		$this->currentProvider = $currentProvider;
		return $this;
	}
	public function getCurrentSpeed() {
		return $this->currentSpeed;
	}
	public function setCurrentSpeed($currentSpeed) {
		$this->currentSpeed = $currentSpeed;
		return $this;
	}
	public function getContractEnd() {
		return $this->contractEnd;
	}
	public function setContractEnd($contractEnd) {
		$this->contractEnd = $contractEnd;
		return $this;
	}
	public function getAboutUs() {
		return $this->aboutUs;
	}
	public function setAboutUs($aboutUs) {
		$this->aboutUs = $aboutUs;
		return $this;
	}
	public function getReceiveInfo() {
		return $this->receiveInfo;
	}
	public function setReceiveInfo($receiveInfo) {
		$this->receiveInfo = $receiveInfo;
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
?>