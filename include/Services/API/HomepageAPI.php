<?php

require_once "config.php";
require_once "BaseAPI.php";

class HomepageAPI extends BaseAPI {
	
	public function getSitesInAreaByAreaCode($areaCode){
		$data = array(
				"areaCode" => $areaCode
		);
		$returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . "getSitesInAreaByAreaCode", $data);
		return json_decode($returnData);
	}

    public function getSitesInAreaWithAllOther($areaCode){
        $data = array(
            "areaCode" => $areaCode
        );
        $returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . "getSitesInAreaWithAllOther", $data);
        return json_decode($returnData);
    }
	
	public function getSiteForPostCodeId($postCodeId) {
		$data = array(
				"postAddressId" => $postCodeId
		);
		$returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . "getSiteForBuildingPage", $data);
		return json_decode($returnData);
	}
	
	public function getSite($siteID) {
        if ($siteID == null || empty($siteID)) return null;
		$data = array(
				"siteId" => $siteID
		);
		$returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . "getSiteForBuildingPageUsingSiteId", $data);
		return json_decode($returnData);
	}
	
	public function getFullAddress($addressId){
		$data = array(
				"pafId" => $addressId
		);
		$returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . "getFullAddress", $data);
		return $returnData;
	}
	
	public function registerInterest($registerInterestDTO) {
		return $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "registerInterest", $registerInterestDTO->getAssocArray());
	}
	
	public function buildingUnknown($buildingUnknownDTO){
		$returnData = $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "reportUnknownBuilding", $buildingUnknownDTO->getAssocArray());
		if (is_numeric($returnData) && $returnData == 0){
			return false;
		} else {
			return true;
		} 
	}
	
	public function addContactDetails($contactDetailsDTO){
		$returnData = $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "addBuildingContact", $contactDetailsDTO->getAssocArray());
		if (is_numeric($returnData) && $returnData == 0){
			return false;
		} else {
			return true;
		} 
	}
	
	public function getHowYouHearAboutUs(){
		return json_decode($this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . "getInterestSources", null));
	}

    public function leasedLineRequest($leasedLineDTO){
        return json_decode($this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "leasedLineRequest", $leasedLineDTO->getAssocArray()));
    }
	
	public function tellUsMoreAbout($subject, $name, $email, $message, $siteid){
		$data = array(
				"subject" => $subject,
				"name" => $name,
				"email" => $email,
				"message" => $message,
				"siteid" => ($siteid !== "") ? $siteid : null
		);
		$returnData = $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "sendImportantUpdateEmail", $data);
		if (is_numeric($returnData) && $returnData == 0){
			return false;
		} else {
			return true;
		} 
	}

	public function submitContactForm($contactDetailsDTO){
		$returnData = $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "submitContactForm", $contactDetailsDTO->getAssocArray());
		if (is_numeric($returnData) && $returnData == 0){
			return false;
		} else {
			return true;
		}
	}

    public function becomeChampion($becomeChampionDto) {
        return $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "becomeChampion", $becomeChampionDto->getAssocArray());
    }

    public function tellAFriend ($data){
        return $this->doPOSTRequest(HOMEPAGE_SERVICE_BASE_URL . "sendChampionEmail", $data);
    }

	public function addHowYouHearAboutUs($tpl, $size){
		switch ($size){
			case InputSizeTypes::Small :
				$tpl->assignGlobal("class-dropdown", "ri-dropdown-small");
				break;
			case InputSizeTypes::Medium :
				$tpl->assignGlobal("class-dropdown", "ri-dropdown-medium");
				break;
			case InputSizeTypes::Big :
				$tpl->assignGlobal("class-dropdown", "ri-dropdown-big");
				break;
			case InputSizeTypes::Order :
				$tpl->assignGlobal("class-dropdown", "op-dropdown-big");
				break;
		}
		$data = $this->getHowYouHearAboutUs();
		foreach ($data as $item){
			$tpl->newBlock("about-us-item");
			$tpl->assign("name", $item->name);
			$tpl->assign("value", $item->id);
		}
	}

}

interface InputSizeTypes {
	const Small				= 0;
	const Medium			= 1;
	const Big				= 2;
	const Order				= 3;
}

interface SiteStatus {
	const Live 				= 0;
	const RI 				= 1;
	const Evaluation 		= 2;
	const Preorder			= 3;
	const Unknown 			= 4;
}
