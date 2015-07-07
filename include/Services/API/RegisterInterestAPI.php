<?php

require_once 'config.php';
require_once 'BaseAPI.php';

require_once 'DataTransfer/RegisterInterestDTO.php';
require_once 'DataTransfer/BuildingUnknownDTO.php';
require_once 'DataTransfer/ContactDetailsDTO.php';


class RegisterInterestAPI extends BaseAPI {

	public function getSiteForPostCodeId($postCodeId) {
    	$data = array(
    			'postAddressId' => $postCodeId
    	);
    	$returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . 'getSiteForBuildingPage', $data);
    	return json_decode($returnData);
    }
	
    public function getRIBuildingPageDetails($siteId) {
        $site = array( "id" => 1, 
        			   "name" => "Nem's Court", 
        			   "message" => "This site is HOT!! This site is HOT!! This site is HOT!!", 
        			   "postCodes" => array( array("postCode" => "AB1 0AA", "longitude" => 57.101478, "latitude" => -2.242852, "statusId" => 0, "address" => "W10 Third Floor, 33, Alfred Street, BELFAST, BT1 8ED"), 
                                             array("postCode" => "AB2 0AB", "longitude" => 57.102558, "latitude" => -2.246309, "statusId" => 0, "address" => "W10 Third Floor, 33, Alfred Street, BELFAST, BT2 8ED"), 
                                             array("postCode" => "AB3 0AD", "longitude" => 57.10056, "latitude" => -2.248342, "statusId" => 0, "address" => "W10 Third Floor, 33, Alfred Street, BELFAST, BT3 8ED") 
                                            ), 
        				"city" => "Abardeen", 
        				"registerInterestPercent" => 50, 
        				"required" => 25, 
        				"progress" => array( array( "step" => "Feasibility Study", "status" => true ),
                                             array( "step" => "Wayleave submitted", "status" => true ),
                                             array( "step" => "Installations being shcheduled", "status" => true ),
                                             array( "step" => "Fibre ordered", "status" => false ),
                                             array( "step" => "Awaiting Final testing", "status" => false )
                                            ), 
                    "salesRep" => array( "name" => "Willy Mouse", "id" => 1, "title" => "Hyperoptic Executive", "phone" => "+3815484512742", "email" => "willy.mouse@hyperoptic.com" ),
                    "champions" => array( array( "name" => "Bolan Volan", "id" => 2, "phone" => "+988754524245", "email" => "bolan.volan@gmail.com" ), 
                    					  array( "name" => "Put In", "id" => 3, "phone" => "+9833232324245", "email" => "put.in@gmail.com" ) 
                    					)
                    );
        return $site;
    }
    
    public function registerInterest($registerInterestDTO) {
    	
    	return true;
    }
    
    public function buildingUnknown($buildingUnknownDTO){
    	
  		return true;
    }
    
    public function addContactDetails($contactDetailsDTO){
    	
    	return true;
    }
}

?>