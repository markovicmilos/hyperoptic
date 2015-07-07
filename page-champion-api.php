<?php /* Template Name: Champions API */ ?>

<?php
/**
 * Created by PhpStorm.
 * User: Ivan Herceg
 * Date: 25-May-15
 * Time: 15:27
 */
require_once 'include/Botdetect/botdetect.php';
require_once 'include/Services/API/DataTransfer/BecomeChampionDTO.php';

$api = new HomepageAPI();

if ($_POST['championEmail'] != null) {
    $returnData = false;
    if ($_SESSION['CSF'] == $_POST['csf']) {
        unset( $_POST['csf'] );
        $data       = json_decode(json_encode($_POST), true);
        $returnData = $api->tellAFriend($data);
    }
    echo json_encode(array ('isOK' => $returnData));
}

if ($_POST['pafId'] != null) {
    $becomeChampionDTO = new BecomeChampionDTO();
    $becomeChampionDTO->setFullName($_POST['fullname']);
    $becomeChampionDTO->setEmail($_POST['email']);
    $becomeChampionDTO->setMobile($_POST['mobile']);
    $becomeChampionDTO->setPafId($_POST['pafId']);
    $becomeChampionDTO->setPhone($_POST['phone']);
    $becomeChampionDTO->setSiteId($_POST['siteId']);
    if (empty($becomeChampionDTO->validate())) {
        $returnData = $api->becomeChampion($becomeChampionDTO);
        echo json_encode(array ('isOK' => $returnData));
    }
}