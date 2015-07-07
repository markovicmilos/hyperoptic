<?php
/**
 * Created by PhpStorm.
 * User: Ivan Herceg
 * Date: 25/02/2015
 * Time: 11:36
 */

class RoutingSecurityAPI {
    public function setLastPageToUserRouting(){
        $_SESSION["lastpage"] = true;
    }
    public function routingProtectPage(){
        if ($_SESSION["lastpage"] === true){
            unset($_SESSION["lastpage"]);
        } else {
            if (isset($_GET["pafid"])){
                header("Location: " . esc_url(home_url('/routing/')) . "?pafid=" . $_GET["pafid"]);
            } else {
                header("Location: " . esc_url(home_url('/routing/')) . "?siteid=" . $_GET["siteid"]);
            }
        }
    }
}