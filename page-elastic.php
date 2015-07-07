<?php /* Template Name: Elastic Results API */ ?>

<?php

include_once 'include/Services/ElasticSearch/ElasticSearchAPI.php';

header('Timestamp: ' . $_REQUEST ['timestamp']);

if (isset ( $_REQUEST ['query'] ) ) {

	$q = $_REQUEST ['query'];
	$is_link_js = (isset ( $_REQUEST ['is_link_js'] ) && $_REQUEST ['is_link_js'] === 'true') ? true : false;
    $isJustSelect = (isset ( $_REQUEST ['isJustSelect'] ) && $_REQUEST ['isJustSelect'] === 'true') ? true : false;

	$api = new ElasticSearchAPI();
	$results = $api->search($q,
			isset ( $_REQUEST ['siteid'] ) ? $_REQUEST ['siteid'] : null,
			isset ( $_REQUEST ['sitegroupid'] ) ? $_REQUEST ['sitegroupid'] : null );

	$tpl = new TemplatePower ( dirname ( __FILE__ ) . "/templates/elastic-results.tpl" );

	$tpl->prepare ();
	$tpl->assign('total', (($results != null && $results ['hits'] != null) ? $results ['hits'] ['total'] : 0) );

	if ($results != null && $results ['hits'] != null) {
		if (isset ( $_REQUEST ['siteid'] ) || isset ( $_REQUEST ['sitegroupid'] ) || $isJustSelect) {
			// for postcode search use
			foreach ( $results ['hits'] ['hits'] as $value ) {
                if ($isJustSelect && $value['_type'] == 'poi') continue;
				$tpl->newBlock ( "itemSELECT" );
				$tpl->assign( 'address', str_replace("'", "", $api->getPostAddress( $value ['_source'] ) ));
				$tpl->assign( 'postcode',  str_replace("'", "", $value ['_source']['PCD'] ));
				$tpl->assign( 'pafid', str_replace("'", "", $value ['_source']['PAFID'] ));
			}
		} else {
			// for regular search use
			foreach ( $results ['hits'] ['hits'] as $value ) {
				$source = $value ['_source'];
				$type = $value ['_type'];
				$item = null;
				if ($type == "paf") {
					$pafid = $source ['PAFID'];
					$postAddress = $api->getPostAddress ( $source );
					$item = array (
							"id" => $pafid,
							"fullAddress" => $postAddress,
							"isPoi" => 0
					);
				} else if ($type == "poi") {
					$postDistrict = $source ['PostDistricts'];
					$fullAddress = $api->composeDistrict ( $source );
					$item = array (
							"id" => $postDistrict,
							"fullAddress" => $fullAddress,
							"isPoi" => 1
					);
				}
				$tpl->newBlock ( "item" );
				if ($item['isPoi'] == 1){
					$tpl->newBlock ( "itemPOI" );
					$tpl->assign('address', $item['fullAddress']);
					if ($is_link_js){
						$tpl->newBlock ( "linkjs" );
					} else {
						$tpl->newBlock ( "linkNOTjs" );
					}
					$tpl->assign('id', urlencode($item['id']));
				} else {
					$tpl->newBlock ( "itemPAF" );
					$tpl->assign('address', $item['fullAddress']);
					$tpl->assign('id', urlencode($item['id']));
				}
				$tpl->assign('address', $item['fullAddress']);
				$tpl->assign('id', urlencode($item['id']));
			}
		}
	}
	if (!isset ( $_REQUEST ['siteid'])) {
		$tpl->newBlock ( "address-not-found " );
	}
	$tpl->printToScreen();
}

?>