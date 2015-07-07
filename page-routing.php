<?php /* Template Name: Routing API */ ?>

<?php	

$routingSecurity = new RoutingSecurityAPI();
$routingSecurity->setLastPageToUserRouting();
$api = new HomepageAPI();

if ( isset ( $_REQUEST ['pafid'] ) ){
	// ROUTING BY PAFID (from elastic search)
	$site = $api->getSiteForPostCodeId($_REQUEST ['pafid']);
	
	if ( isset( $_REQUEST ['fromjs'] ) ){
		$isFromJS = true;
	} else {
		$isFromJS = false;
	}

	if ($site->siteForBuildingPage == null){
		$_SESSION["address"] = $site->address;
		$_SESSION["city"] = $site->city;
		$_SESSION["pafid"] = $_REQUEST ['pafid'];
		if ($isFromJS) {
			echo esc_url( home_url( '/building-unknown')) . '/?q=' . urlencode($site->postcode) ;
		} else {
			header("Location: " . esc_url( home_url( '/building-unknown')) . '/?q=' . urlencode($site->postcode) );
		}
	} else {
		$isLive = $site->premiseHaveActiveService;
        if (stristr($site->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
            $addresses = array(
                'RI' => '/business-interest',
                'ORDER' => '/business-order'
            );
        } else {
            $addresses = array(
                'RI' => '/register-interest',
                'ORDER' => '/order'
            );
        }
		switch ( $site->siteForBuildingPage->statusId ){
			case SiteStatus::RI:
				if ($isFromJS) {
					if ($isLive) echo "CANT";
					else echo esc_url( home_url( $addresses['RI'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid'];
				} else {
					header("Location: " . esc_url( home_url( $addresses['RI'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid']);
				}
				break;
			case SiteStatus::Evaluation :
				if ($isFromJS) {
					if ($isLive) echo "CANT";
					else echo esc_url( home_url( $addresses['RI'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid'];
				} else {
					header("Location: " . esc_url( home_url( $addresses['RI'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid']);
				}
				break;
			case SiteStatus::Live:
				if ($isFromJS) {
					if ($isLive) echo "CANT";
					else echo esc_url( home_url( $addresses['ORDER'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid'];
				} else {
					header("Location: " . esc_url( home_url( $addresses['ORDER'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid']);
				}
				break;
			case SiteStatus::Preorder:
				if ($isFromJS) {
					if ($isLive) echo "CANT";
					else echo esc_url( home_url( $addresses['ORDER'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid'];
				} else {
					header("Location: " . esc_url( home_url( $addresses['ORDER'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId . '&pafid=' . $_REQUEST ['pafid']);
				}
				break;
		}
	}
}

if ( isset ( $_REQUEST ['siteid'] ) ){
	// ROUTING BY SITEID (from map)
	$site = $api->getSite($_REQUEST ['siteid']);

    if (stristr($site->siteForBuildingPage->siteTypeGrouping, "business") !== FALSE) {
        $addresses = array(
            'RI' => '/business-interest',
            'LIVE' => '/business-live',
            'PREORDER' => '/business-preorder'
        );
    } else {
        $addresses = array(
            'RI' => '/register-interest',
            'LIVE' => '/live',
            'PREORDER' => '/preorder'
        );
    }

	switch ( $site->siteForBuildingPage->statusId ){
		case SiteStatus::RI:
			header("Location: " . esc_url( home_url( $addresses['RI'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId );
			break;
		case SiteStatus::Evaluation :
			header("Location: " . esc_url( home_url( $addresses['RI'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId );
			break;
		case SiteStatus::Live:
			header("Location: " . esc_url( home_url( $addresses['LIVE'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId );
			break;
		case SiteStatus::Preorder:
			header("Location: " . esc_url( home_url( $addresses['PREORDER'] )) . '/?siteid=' . $site->siteForBuildingPage->siteId );
			break;
	}
}
?>