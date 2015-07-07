<?php
ini_set('error_reporting', E_ALL);
require_once 'OrderProcessAPI.php';

require_once 'DataTransfer/NewUserDTO.php';

$api = new OrderProcessAPI();
//var_dump($api->getOrderProducts(101, 9));

$newUser = new NewUserDto();
$newUser->setFirstName("Seiya");
$newUser->setLastName("Saint");
$newUser->setJobTitle("Miss");
$newUser->setEmail("systems.hyperoptic.krishh@gmail.com");
$newUser->setBirthday("1986-11-11");
$newUser->setReceiveInfo(true);
$newUser->setPasskey("xxxxxx");
$newUser->setRegistrationIPAddress($_SERVER['REMOTE_ADDR']);
$newUser->setUserAgent($_SERVER['HTTP_USER_AGENT']);
$newUser->setMobile("3816433132213");
$newUser->setLandline("33423324324");
$newUser->setAgreeToBeContacted(true);
$newUser->setType(CUSTOMER_TYPE_RESI);
$newUser->setAddressId(12);

$madeOrderDTO = new MadeOrderDTO();
$madeOrderDTO->setBroadBandProductId("109");
$madeOrderDTO->setConnectionFeeProductId("110");
$madeOrderDTO->setFaceplateProductId("130");
$madeOrderDTO->setNewUser($newUser);
$madeOrderDTO->setPhoneProductId("125");
$madeOrderDTO->setPromoCodeId("2");
$madeOrderDTO->setPromotionId("1");

$madeOrderDTO->setAdditionalProducts(array(111, 112));

//echo $api->placeServiceOrder($madeOrderDTO);

var_dump($api->checkBankDetails("Nem", 30535308, 826030));

echo $api->checkEmailAvailability("raspadamse@koza.com");

var_dump($api->getOrderProductsWithPromoCode(101, 9, 2));
?>