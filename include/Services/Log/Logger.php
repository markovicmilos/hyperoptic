<?php

define("LOG_FILE", "log.txt");

class Logger
{
	public function addError($txt) {
		$this->writeIntoFile(" ERROR: \n\r" . $txt);
	}
    public function addRESTError($txt, $dataRequest, $dataResponse) {
        $text = $txt . ' -> ';
        $iniSpace = str_repeat(' ', strlen($text));
        $text = $text . 'sent data: ' . $dataRequest . '\n\r';
        $text = $text . $iniSpace . 'response: ' . $dataResponse;
        $this->writeIntoFile($text);
    }
	public function addInfo($txt) {
		$this->writeIntoFile(" INFO: \n\r" . $txt);
	}
	public function addWarning($txt) {
		$this->writeIntoFile(" WARNING: \n\r" . $txt);
	}
	
	private function writeIntoFile($txt) {
		$date = date ( "d/F/Y h:i:s" );
		$ip = $_SERVER ["REMOTE_ADDR"];
		
		file_put_contents(LOG_FILE, $ip . "  [" . $date . "]" . " " . $txt . "\n\r", FILE_APPEND);
	}
	
}
