<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PaymentResponse
 * This class is used as a container for a response from Barkclay's payment platform
 * see 
 * @author njanjayrp
 */
class PaymentResponse {
        
        public $orderId;
	public $payId;
	public $ncStatus;
	public $ncError;
	public $ncErrorPlus;
	public $acceptance;
	public $status;
	public $amount;
	public $currency;
	public $paymentMethod;
	public $brand;
        public $htmlAnswer; 
        public $traxDate;
        
        const STATUS_INVALID_OR_INCLOMPLETE = 0;
        const STATUS_AUTHORIZATION_REFUSED = 2;
        const STATUS_AUTHORIZED = 5;
        const STATUS_PAYMENT_REQUESTED = 9;
        const STATUS_WAITING_FOR_IDENTIFICATION = 46;
        const STATUS_AUTHORIZATION_WAITING = 51;
        const STATUS_AUTHORIZATION_NOT_KNOWN = 52;
        const STATUS_QUERY_ERROR = 88;
        const STATUS_PAYMENT_UNCERTAIN = 92;
        
        // if we did the 3DESC verification the params will be included in the request
        // otherwise the regular xml will be returned
        public function fetchFromRequest() {
            $this->orderId          = $_REQUEST['orderID'];
            $this->currency         = $_REQUEST['currency'];
            $this->amount           = $_REQUEST['amount'];
            $this->paymentMethod    = $_REQUEST['PM'];
            $this->acceptance       = $_REQUEST['ACCEPTANCE'];
            $this->status           = $_REQUEST['STATUS'];
            $this->traxDate         = $_REQUEST['TRXDATE'];
            $this->payId            = $_REQUEST['PAYID'];
            $this->ncError          = $_REQUEST['NCERROR'];
            $this->brand            = $_REQUEST['BRAND']; 
        }
        
        public function getOrderId() {
            return $this->orderId;
        }

        public function setOrderId($orderId) {
            $this->orderId = $orderId;
        }

        public function getPayId() {
            return $this->payId;
        }

        public function setPayId($payId) {
            $this->payId = $payId;
        }

        public function getNcStatus() {
            return $this->ncStatus;
        }

        public function setNcStatus($ncStatus) {
            $this->ncStatus = $ncStatus;
        }

        public function getNcError() {
            return $this->ncError;
        }

        public function setNcError($ncError) {
            $this->ncError = $ncError;
        }

        public function getNcErrorPlus() {
            return $this->ncErrorPlus;
        }

        public function setNcErrorPlus($ncErrorPlus) {
            $this->ncErrorPlus = $ncErrorPlus;
        }

        public function getAcceptance() {
            return $this->acceptance;
        }

        public function setAcceptance($acceptance) {
            $this->acceptance = $acceptance;
        }

        public function getStatus() {
            return $this->status;
        }

        public function setStatus($status) {
            $this->status = $status;
        }

        public function getAmount() {
            return $this->amount;
        }

        public function setAmount($amount) {
            $this->amount = $amount;
        }

        public function getCurrency() {
            return $this->currency;
        }

        public function setCurrency($currency) {
            $this->currency = $currency;
        }

        public function getPaymentMethod() {
            return $this->paymentMethod;
        }

        public function setPaymentMethod($paymentMethod) {
            $this->paymentMethod = $paymentMethod;
        }

        public function getBrand() {
            return $this->brand;
        }

        public function setBrand($brand) {
            $this->brand = $brand;
        }

        public function getHtmlAnswer() {
            return str_replace('"', "'", base64_decode($this->htmlAnswer));
        }

        public function setHtmlAnswer($htmlAnswer) {
            $this->htmlAnswer = $htmlAnswer;
        }
        
        // wrong 3DESC password has been entered
        public function isWrongIdentifictaion() {
            if($this->status == PaymentResponse::STATUS_INVALID_OR_INCLOMPLETE && $this->ncStatus == 5 && $this->ncError == 50001134)
                return true;
            else
                return false;
        }
        
        // the card has 3DESC protection, verification needed
        public function isWaitingForIdentification() {
            if($this->status == PaymentResponse::STATUS_WAITING_FOR_IDENTIFICATION)
                return true;
            else
                return false;
        }
        
        // payment has been accepted
        public function isPaymentAccepted() {
            if($this->status == PaymentResponse::STATUS_PAYMENT_REQUESTED || $this->status == PaymentResponse::STATUS_AUTHORIZED)
                return true;
            else
                return false;
        }
}

?>
