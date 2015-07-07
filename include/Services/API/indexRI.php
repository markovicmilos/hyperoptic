<?php
ini_set('error_reporting', E_ALL);
require_once 'RegisterInterestAPI.php';

$riDTO = new RegisterInterestDTO();
// either one of the two has to be entered
$riDTO->setPafId(9);
$riDTO->setPostCode("NW7 3DS");
$riDTO->setKnownSource("Press");
$riDTO->setType(RI_STANDARD);

$newUser = new NewUserDto();
$newUser->setFirstName("Seiya");
$newUser->setLastName("Saint");
$newUser->setJobTitle("Miss");
$newUser->setEmail("systems00112233445566.hyperoptic@gmail.com");
$newUser->setBirthday("1986-11-11");
$newUser->setReceiveInfo(true);
$newUser->setPasskey("xxxxxx");
$newUser->setRegistrationIPAddress($_SERVER['REMOTE_ADDR']);
$newUser->setUserAgent($_SERVER['HTTP_USER_AGENT']);
$newUser->setMobile("3816433132213");
$newUser->setLandline("33423324324");
$newUser->setAgreeToBeContacted(true);
$newUser->setType(CUSTOMER_TYPE_RESI);

$riDTO->setNewUser($newUser);
$api = new RegisterInterestAPI();
//var_dump($api->createRIAccount($riDTO));

//
//$surveyDTO = new SurveyDTO();
//$surveyDTO->setUserId(117443);
//$surveyDTO->setRegisterInterestId(51330);
//$surveyDTO->setpostCode(170512);
//$surveyDTO->setContractEnd("2014-12-12");
//$surveyDTO->setCurrentSupplier("BT");
//$surveyDTO->setRateService(SURVEY_RATE_EXC);
//$surveyDTO->setComment("You're the best!!");
//
//var_dump($api->createRISurvey($surveyDTO));

$qualifyBuildingDTO = new QualifyBuildingDTO();
$qualifyBuildingDTO->setBuildingType("Victorian");
$qualifyBuildingDTO->setNumOfFlatFrom(2);
$qualifyBuildingDTO->setNumOfFlatTo(5);
$qualifyBuildingDTO->setTimeToContactFrom(14);
$qualifyBuildingDTO->setTimeToContactTO(18);
$qualifyBuildingDTO->setOrder($riDTO);
echo $api->createRIBuilding($qualifyBuildingDTO);

?>

