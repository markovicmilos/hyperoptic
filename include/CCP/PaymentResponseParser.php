<?php
require_once (dirname(__FILE__) . "/PaymentResponse.php");
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Utility class for parsing xml in format
 * <ncresponse orderID="99999" PAYID="1111111" NCSTATUS="0" NCERROR="" NCERRORPLUS="" ACCEPTANCE="12345" STATUS="5" ECI="7" amount="125" currency="EUR" PM="CreditCard" BRAND="VISA"/>
 *
 * @author makcro
 */
class PaymentResponseParser {
    
    const ORDER_ID_ATTR_NAME='orderID';
    const PAY_ID_ATTR_NAME='PAYID';
    const NCSTATUS_ATTR_NAME='NCSTATUS';
    const NCERROR_ATTR_NAME='NCERROR';
    const NCERRORPLUS_ATTR_NAME='NCERRORPLUS';
    const ACCEPTANCE_ATTR_NAME='ACCEPTANCE';
    const STATUS_ATTR_NAME='STATUS';
    const ECI_ATTR_NAME='ECI';
    const AMOUNT_ATTR_NAME='amount';
    const CURRENCY_ATTR_NAME='currency';
    const PM_ATTR_NAME='PM';
    const BRAND_ATTR_NAME='BRAND';
    const HTML_ANSWER_ATTR_NAME='HTML_ANSWER';
    
    

    public static function parse($xmlString){
        // this is what will be returned
        $result = new PaymentResponse();
        // crate xml elemnt
        $xml = new SimpleXMLElement($xmlString);
        
        /*
         * Set property values
         */
        $result->setOrderId( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::ORDER_ID_ATTR_NAME));
        $result->setPayId( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::PAY_ID_ATTR_NAME));
        $result->setNcStatus( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::NCSTATUS_ATTR_NAME));
        $result->setNcError( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::NCERROR_ATTR_NAME));
        $result->setNcErrorPlus( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::NCERRORPLUS_ATTR_NAME));
        $result->setAcceptance( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::ACCEPTANCE_ATTR_NAME));
        $result->setStatus( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::STATUS_ATTR_NAME));
        $result->setAmount( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::AMOUNT_ATTR_NAME));
        $result->setCurrency( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::CURRENCY_ATTR_NAME));
        $result->setPaymentMethod( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::PM_ATTR_NAME));
        $result->setBrand( PaymentResponseParser::getAttributeValue($xml, PaymentResponseParser::BRAND_ATTR_NAME));
        $result->setHtmlAnswer( PaymentResponseParser::getHTMLAnswerValue($xml)); 
        
        return $result;
    }
    /**
     * Gets the value of the specified attribute in xml string
     * @param type $attrName name of the attribute
     * @param type $xmlString xml string to query from
     */
    protected static function getAttributeValue($xmlElemnt, $attrName) {
        /*
         * Query the xml for attribute value and return the first element of
         * the result array
         */
        $nodes = $xmlElemnt->xpath("/ncresponse/@".$attrName);
        $value = $nodes[0];
        return $value;
    }
    
    protected static function getHTMLAnswerValue($xmlElemnt) {
        return (string) $xmlElemnt->HTML_ANSWER;
    }
}

?>
