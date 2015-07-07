<?php /* Template Name: Get Image Page */ ?>

<?php

$api = new HomepageAPI();

$siteFromAPI = $api->getSite($_REQUEST['siteid']);
//var_dump($siteFromAPI);
$site = replaceSiteImageIfNoImage($siteFromAPI->siteForBuildingPage);

?>

<html>
<head></head>
<title><?php echo $site->name; ?></title>
<body>

<img src="<?php echo $site->imageSiteLink; ?>" />
</body>

</html>
