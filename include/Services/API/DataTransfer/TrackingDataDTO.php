<?php
/**
 * Created by PhpStorm.
 * User: Marko Vasic
 * Date: 6/11/15
 * Time: 9:26 AM
 */

class TrackingDataDTO {

    private $sessionId;
    private $step;
    private $formContents;
    private $userAgent;
    private $pafId;
    private $siteId;
    private $ipAddress;
    private $broadband;
    private $havePhone;
    private $price;


    public function __construct() {

    }

    public function getAssocArray() {
        $assocArray = get_object_vars($this);
        unset($assocArray['rules']);
        $main = json_decode(json_encode($assocArray), true);
        return $main;
    }

    public function getSessionId () {
        return $this->sessionId;
    }

    public function setSessionId ($sessionId) {
        $this->sessionId = $sessionId;
    }

    public function getStep () {
        return $this->step;
    }

    public function setStep ($step) {
        $this->step = $step;
    }

    public function getFormContents () {
        return $this->formContents;
    }

    public function setFormContents ($formContents) {
        $this->formContents = $formContents;
    }

    public function getUserAgent () {
        return $this->userAgent;
    }

    public function setUserAgent ($userAgent) {
        $this->userAgent = $userAgent;
    }

    public function getPafId () {
        return $this->pafId;
    }

    public function setPafId ($pafId) {
        $this->pafId = $pafId;
    }

    public function getSiteId () {
        return $this->siteId;
    }

    public function setSiteId ($siteId) {
        $this->siteId = $siteId;
    }

    public function getIpAddress () {
        return $this->ipAddress;
    }

    public function setIpAddress ($ipAddress) {
        $this->ipAddress = $ipAddress;
    }

    public function getBroadband () {
        return $this->broadband;
    }

    public function setBroadband ($broadband) {
        $this->broadband = $broadband;
    }

    public function getHavePhone () {
        return $this->havePhone;
    }

    public function setHavePhone ($havePhone) {
        $this->havePhone = $havePhone;
    }

    public function getPrice () {
        return $this->price;
    }

    public function setPrice ($price) {
        $this->price = $price;
    }


} 