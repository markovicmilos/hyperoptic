<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PaymentRequest
 *
 * @author Nemanja Prekovic
 */
class PaymentRequest {
    public $shaPassword;
    public $shaSignature;
    public $params;
    
    public function __construct($password) {

        $this->shaPassword = $password;
        $this->shaSignature = "";
        $this->params = array(
           "OPERATION" => "SAL",
           //"OPERATION" => "RES", 
           "RTIMEOUT" => 30,
           "ECI" => 7
        );
    }

    // params
    public function setPSPID($PSPID) {
        $this->params["PSPID"] = urlencode($PSPID);
    }
    
    public function getPSPID() {
        return $this->params["PSPID"];
    }

    public function setUSERID($USERID) {
        $this->params["USERID"] = urlencode($USERID);
    }
    
    public function getUSERID() {
        return $this->params["USERID"];
    }
    
    public function setPSWD($PSWD) {
        $this->params["PSWD"] = urlencode($PSWD);
    }
    
    public function getPSWD() {
        return $this->params["PSWD"];
    }
    
    public function setORDERID($ORDERID) {
        $this->params["ORDERID"] = urlencode($ORDERID);
    }
    
    public function getORDERID() {
        return $this->params["ORDERID"];
    }
    
    public function setAMOUNT($AMOUNT) {
        $this->params["AMOUNT"] = urlencode($AMOUNT * 100);
    }
    
    public function getAMOUNT() {
        return $this->params["AMOUNT"];
    }
    
    public function setCURRENCY($CURRENCY) {
        $this->params["CURRENCY"] = urlencode($CURRENCY);
    }
    
    public function getCURRENCY() {
        return $this->params["CURRENCY"];
    }
    
    public function setCARDNO($CARDNO) {
        $this->params["CARDNO"] = urlencode($CARDNO);
    }
    
    public function getCARDNO() {
        return $this->params["CARDNO"];
    }
    
    public function setED($ED) {
        //$this->params["ED"] = urlencode($ED);
        $this->params["ED"] = $ED;
    }
    
    public function getED() {
        return $this->params["ED"];
    }

    public function setCREDITCODE($CREDITCODE) {
        $this->params["CREDITCODE"] = urlencode($CREDITCODE);
    }
    
    public function getCREDITCODE() {
        return $this->params["CREDITCODE"];
    }

    public function setEMAIL($EMAIL) {
        //$this->params["EMAIL"] = urlencode($EMAIL);
        $this->params["EMAIL"] = $EMAIL;
    }
    
    public function getEMAIL() {
        return $this->params["EMAIL"];
    }

    public function setCVC($CVC) {
        $this->params["CVC"] = urlencode($CVC);
    }
    
    public function getCVC() {
        return $this->params["CVC"];
    }
    
    public function setREMOTE_ADDR($REMOTE_ADDR) {
        $this->params["REMOTE_ADDR"] = urlencode($REMOTE_ADDR);
    }
    
    public function getREMOTE_ADDR() {
        return $this->params["REMOTE_ADDR"];
    }
    
    public function setECI($ECI) {
        $this->params["ECI"] = urlencode($ECI);
    }
    
    public function getECI() {
        return $this->params["ECI"];
    } 
    
    public function setFLAG3D($FLAG3D) {
        $this->params["FLAG3D"] = urlencode($FLAG3D);
    }
    
    public function getFLAG3D() {
        return $this->params["FLAG3D"];
    }    

    public function setHTTP_ACCEPT($HTTP_ACCEPT) {
        $this->params["HTTP_ACCEPT"] = urlencode($HTTP_ACCEPT);
    }
    
    public function getHTTP_ACCEPT() {
        return $this->params["HTTP_ACCEPT"];
    } 
    
   public function setHTTP_USER_AGENT($HTTP_USER_AGENT) {
        $this->params["HTTP_USER_AGENT"] = urlencode($HTTP_USER_AGENT);
    }
    
    public function getHTTP_USER_AGENT() {
        return $this->params["HTTP_USER_AGENT"];
    } 
    
    public function setACCEPTURL($ACCEPTURL) {
        $this->params["ACCEPTURL"] = $ACCEPTURL;
    }
    
    public function getACCEPTURL() {
        return $this->params["ACCEPTURL"];
    }
    
    public function setDECLINEURL($DECLINEURL) {
        $this->params["DECLINEURL"] = $DECLINEURL;
    }
    
    public function getDECLINEURL() {
        return $this->params["DECLINEURL"];
    }   
    
    public function setEXCEPTIONURL($EXCEPTIONURL) {
        $this->params["EXCEPTIONURL"] = $EXCEPTIONURL;
    }
    
    public function getEXCEPTIONURL() {
        return $this->params["EXCEPTIONURL"];
    } 
    
    public function setWIN3DS($WIN3DS) {
        $this->params["WIN3DS"] = urlencode($WIN3DS);
    }
    
    public function getWIN3DS() {
        return $this->params["WIN3DS"];
    } 
    
    public function setLANGUAGE($LANGUAGE) {
        $this->params["LANGUAGE"] = urlencode($LANGUAGE);
    }
    
    public function getLANGUAGE() {
        return $this->params["LANGUAGE"];
    } 
    
    public function setPARAMPLUS($PARAMPLUS) {
        $this->params["PARAMPLUS"] = urlencode($PARAMPLUS);
    }
    
    public function getPARAMPLUS() {
        return $this->params["PARAMPLUS"];
    }
    
   private function prepareShaSignature()
   {
      ksort( $this->params, SORT_STRING );
      foreach($this->params as $key => $value)
      {
         $this->shaSignature .= $key . "=" . $value . $this->shaPassword;
      }
    }
    
    public function generateShaSignature() {
        $this->prepareShaSignature();
        $this->shaSignature = strtoupper( SHA1($this->shaSignature) );
    }
    
    public function setSHASIGN() {
        if($this->shaSignature == "") {
            $this->generateShaSignature();
        }
        $this->params["SHASIGN"] = $this->shaSignature;
        //ksort( $this->params, SORT_STRING );
    }
    
    public function getSHASIGN() {
       return $this->shaSignature;
        //return $this->params["SHASIGN"];
    }
}

?>
