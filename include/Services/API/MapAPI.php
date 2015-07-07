<?php

require_once 'config.php';
require_once 'BaseAPI.php';

class MapAPI extends BaseAPI {
	public function getMarkers($topLatitude, $topLongitude, $bottomLatitude, $bottomLongitude) {
		$data = array(
				'topLeftLatitude' => $topLatitude,
				'topLeftLongitude' => $topLongitude,
				'bottomRightLatitude' => $bottomLatitude,
				'bottomRightLongitude' => $bottomLongitude
		);
		$returnData = $this->doGETRequest(HOMEPAGE_SERVICE_BASE_URL . 'getSitesInArea', $data);
		return $returnData;
	}
}