<?php

define ( "BASE_SERVICE_URL", SERVICE_URL . 'website-api-rest/api/website/' );
define ( "HOMEPAGE_SERVICE_BASE_URL", BASE_SERVICE_URL . 'homepage/' );
define ( "ORDER_SERVICE_BASE_URL", BASE_SERVICE_URL . 'orderprocess/');
define ( "MYACCOUNT_SERVICE_BASE_URL", BASE_SERVICE_URL . 'myaccount/');

class BaseAPI {
    
    private function initPOSTRequest($url, $json_data) {
        if (ISDEBUG) {
            $logger = new Logger();
            $logger->addInfo(' URL -> ' . var_export($url, true));
            $logger->addInfo(' JSON -> ' . $json_data);
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json_data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($json_data))
        );
        return $ch;
    }

    protected function doPOSTRequest($url, $data_to_encode) {
        $json_data = json_encode($data_to_encode, true);
        $ch = $this->initPOSTRequest($url, $json_data);
        $data = curl_exec($ch);
        if (ISDEBUG) {
            $logger = new Logger();
            $logger->addInfo(' DATA (POST) returned -> ' . var_export($data, true));
        }
        if (!curl_errno($ch)) {
            $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if ($status >= 200 && $status < 300){
                return $data;
            }
            $logger = new Logger();
            $logger->addRESTError('REST (POST) call failed', $json_data, $data);
            header("Location: " . ERROR404_PAGE_URL);
        } else {
            curl_close($ch);
            return 0;
        }
    }

    private function initGETRequest($url, $data) {
        $ch = curl_init();
        if ($data != null)
        	$url = $url . "?" . http_build_query($data);
        if (ISDEBUG) {
            $logger = new Logger();
            $logger->addInfo(' URL -> ' . var_export($url, true));
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        return $ch;
    }

    protected function doGETRequest($url, $data) {
        $json_data = json_encode($data, true);
        $ch = $this->initGETRequest($url, $data);
        $data = curl_exec($ch);
        if (ISDEBUG) {
            $logger = new Logger();
            $logger->addInfo(' DATA (GET) returned -> ' . var_export($data, true));
        }
        if (!curl_errno($ch)) {
            $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if ($status >= 200 && $status < 300){
                return $data;
            }
            $logger = new Logger();
            $logger->addRESTError('REST (GET) call failed', $json_data, $data);
            header("Location: " . ERROR404_PAGE_URL);
        } else {
            curl_close($ch);
            return 0;
        }
    }

}