<?php

ini_set('error_reporting', E_ALL);
require_once 'HomepageAPI.php';

require_once 'DataTransfer/SpreadTheWordDTO.php';
require_once 'DataTransfer/NotifyBuildingRepDTO.php';
require_once 'DataTransfer/ContactFormDTO.php';
require_once 'DataTransfer/PasswordChangeDTO.php';

$api = new HomepageAPI();
//var_dump($api->getLocation("NW7 3DS"));
var_dump($api->getSitesForPostCode("NW7"));
//var_dump($api->getPremiseStatus(9));

//
//$spreadTheWordDTO = new SpreadTheWordDTO();
//$spreadTheWordDTO->setUserName("Nemanja Y");
//$spreadTheWordDTO->setEmailAddress("nja@gmail.com");
//$spreadTheWordDTO->setNeighbourName("Finkle X");
//$spreadTheWordDTO->setNeighbourEmailAddress("njanjayrp@gmail.com");
//$spreadTheWordDTO->setComment("XXXXXXXXXXXXXXXXXXXXXX");
//$spreadTheWordDTO->setPafId(9);
//$spreadTheWordDTO->setSendCopy(false);
//    
//
////echo $api->spreadTheWord($spreadTheWordDTO);
//
//$notifyBuildingRepDTO = new NotifyBuildingRepDTO();
//$notifyBuildingRepDTO->setTitle("Nom");
//$notifyBuildingRepDTO->setFirstName("Nommmy");
//$notifyBuildingRepDTO->setLastName("Monny");
//$notifyBuildingRepDTO->setPhoneNumber("381643115431");
//$notifyBuildingRepDTO->setJobRole("Nomster");
//$notifyBuildingRepDTO->setPafId("9");
//$notifyBuildingRepDTO->setSendCopy(true);
//$notifyBuildingRepDTO->setEmailAddress("njanjayrp@gmail.com");
//                
////echo $api->notifyBuildingRep($notifyBuildingRepDTO);
//
//
//$contactFormDTO = new ContactFormDTO();
//$contactFormDTO->setTitle("Nom");
//$contactFormDTO->setFirstName("Nommmy");
//$contactFormDTO->setLastName("Monny");
//$contactFormDTO->setPhoneNumber("381643115431");
//$contactFormDTO->setPafId("9");
//$contactFormDTO->setSendCopy(true);
//$contactFormDTO->setNatureOfEnquiry("XXX");
//$contactFormDTO->setComment("COMMENTS BLA BLA");
//$contactFormDTO->setReceiveInfo(true);
//$contactFormDTO->setPostCode("XXX YYY");
//
//echo $api->submitContactForm($contactFormDTO);

?>
