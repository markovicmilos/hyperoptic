<?php 

require_once("validation.php");

class BecomeChampionDTO {

    private $siteId;
    private $pafId;
    private $phone;
    private $mobile;
    private $email;
    private $fullName;
	
	private $rules = array(
			// required
			"required,pafId,This field (PafID) is required.",
			"required,fullName,This field (Full name) is required.",
			"required,email,This field (Email) is required.",
				
			// other
			"length>1,fullName,Please enter Full name that is over 2 characters long.",
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

    public function getSiteId () {
        return $this->siteId;
    }

    public function setSiteId ($siteId) {
        $this->siteId = $siteId;
    }

    public function getPafId () {
        return $this->pafId;
    }

    public function setPafId ($pafId) {
        $this->pafId = $pafId;
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

    public function getFullName () {
        return $this->fullName;
    }

    public function setFullName ($fullName) {
        $this->fullName = $fullName;
    }

    public function getRules () {
        return $this->rules;
    }

    public function setRules ($rules) {
        $this->rules = $rules;
    }


}