<?php

require_once 'BaseAPI.php';

define("LOGIN_PAGE_URL", "/login/"); // login page relativ url

class LoginAPI extends BaseAPI {
	
	public function forceLoginUser($userID) {
		$_SESSION['user_id'] = $userID;
	}
	
	public function getUserId() {
		return $_SESSION['user_id'];
	}
	
	public function isLogin(){
		return isset($_SESSION['user_id']);
	}
	
	public function pageProtect() {
		//session_start();
		if (!isset($_SESSION['user_id'])){
			$_SESSION['return_url'] = $this->full_url($_SERVER);  //$_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
			header("Location: " . esc_url( home_url( LOGIN_PAGE_URL ) ));
			exit();
		}
		return $_SESSION['user_id'];
	}
	
	public function logout() {
		//session_start();
	
		/* Delete the sessions ****************/
		unset($_SESSION['user_id']);
	
		session_unset();
		session_destroy();
	
		header("Location: " . esc_url( home_url( '/' ) ));
	}
	
	public function login($email, $password) {
		$logger = new Logger();
		
		$pass = md5($password);
		$user = $this->validateCustomer($email, $pass);
		if ($user != null && $user->valid) {
			// Login user
			// this sets session and logs user in
			//session_start();
			session_regenerate_id (true); //prevent against session fixation attacks.
				
			// this sets variables in the session
			$_SESSION['user_id']= $user->customerId;
			$logger->addInfo(' userID -> ' . var_export($_SESSION['user_id'], true));
			$logger->addInfo(' returnURL -> ' . var_export($_SESSION['return_url'], true));
			//redirect to return url if exist
			if (isset($_SESSION['return_url'])){
				$url = $_SESSION['return_url'];
				unset($_SESSION['return_url']);
				header("Location: " . $url);
			} else {
				header("Location: " . esc_url( home_url( '/' ) ));
			}
			exit();
		} else {
			return false;
		}
	}
	
	public function validateCustomer($email, $password){
		$params = array("email" => $email, "password" => $password);
		return json_decode($this->doGETRequest(MYACCOUNT_SERVICE_BASE_URL . 'validateCustomer', $params));
	}
	
	public function requestPasswordChange($email, $dateOfBirth) {
		$params = array("email" => $email, "birthday" => $dateOfBirth);
		return json_decode($this->doPOSTRequest(MYACCOUNT_SERVICE_BASE_URL . 'requestPasswordChange', $params));
	}
	
	private function url_origin($s, $use_forwarded_host=false) {
		$ssl = (!empty($s['HTTPS']) && $s['HTTPS'] == 'on') ? true:false;
		$sp = strtolower($s['SERVER_PROTOCOL']);
		$protocol = substr($sp, 0, strpos($sp, '/')) . (($ssl) ? 's' : '');
		$port = $s['SERVER_PORT'];
		$port = ((!$ssl && $port=='80') || ($ssl && $port=='443')) ? '' : ':'.$port;
		$host = ($use_forwarded_host && isset($s['HTTP_X_FORWARDED_HOST'])) ? $s['HTTP_X_FORWARDED_HOST'] : (isset($s['HTTP_HOST']) ? $s['HTTP_HOST'] : null);
		$host = isset($host) ? $host : $s['SERVER_NAME'] . $port;
		return $protocol . '://' . $host;
	}
	private function full_url($s, $use_forwarded_host=false) {
		return $this->url_origin($s, $use_forwarded_host) . $s['REQUEST_URI'];
	}
}