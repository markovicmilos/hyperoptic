<?php

ini_set('error_reporting', E_ALL);
require_once 'FaceplateOrderAPI.php';

require_once 'DataTransfer/NewUserDTO.php';

$newUser = new NewUserDto();
$newUser->setFirstName("Seiya");
$newUser->setLastName("Saint");
$newUser->setJobTitle("Miss");
$newUser->setEmail("systems.hyperoptic.krishh22@gmail.com");
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

$madeFaceplateOrder = new MadeFaceplateOrderDTO();
$madeFaceplateOrder->setFpProductCategoryId("C-00012");
$madeFaceplateOrder->setPromotionId(1);
$madeFaceplateOrder->setTransactionId(13213);
$madeFaceplateOrder->setPrice(40.0);
$madeFaceplateOrder->setNewUser($newUser);

$api = new FaceplateOrderAPI();
//echo $api->placeFaceplateOrder($madeFaceplateOrder);


?>
