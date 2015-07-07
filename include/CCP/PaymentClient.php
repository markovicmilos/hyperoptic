<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.

 *  */
require_once (dirname(__FILE__) . "/PaymentRequest.php");
require_once (dirname(__FILE__) . "/PaymentResponse.php");
require_once (dirname(__FILE__) . "/PaymentResponseParser.php");

/**
 * Description of PaymentClient
 *
 * @author Nemanja Prekovic
 */
class PaymentClient {
    public $url;
    public $response;
    public $request;
    
    public function __construct($url, $shaPassword, $ppsid, $userid, $pswd) {
        $this->url = $url;
        $this->request = new PaymentRequest($shaPassword);
        // basic params
        $this->request->setPSPID($ppsid);
        $this->request->setUSERID($userid);
        $this->request->setPSWD($pswd);
        // generate sha1 sign and add it to the params array
        $this->response = new PaymentResponse();
    }
    
    private function postRequest( array $options = array() )
    { 
        $this->request->setSHASIGN();
        $defaults = array( 
            CURLOPT_SSL_VERIFYPEER => 0,
            CURLOPT_POST => 1, 
            CURLOPT_HEADER => 0, 
            CURLOPT_URL => $this->url, 
            CURLOPT_FRESH_CONNECT => 1, 
            CURLOPT_RETURNTRANSFER => 1, 
            CURLOPT_FORBID_REUSE => 1, 
            CURLOPT_TIMEOUT => 9, 
            CURLOPT_POSTFIELDS => http_build_query( $this->request->params ) 
        ); 

        $ch = curl_init(); 
        curl_setopt_array($ch, ($options + $defaults)); 
        if( ! $result = curl_exec($ch)) { 
            trigger_error(curl_error($ch)); 
        } 
        curl_close($ch); 
        return $result; 
    } 
    
    public function processPayment() {
        $responseXML = $this->postRequest();
        $this->response = PaymentResponseParser::parse($responseXML);
        // for debugging
        return $responseXML;
    }
    
}

?>
