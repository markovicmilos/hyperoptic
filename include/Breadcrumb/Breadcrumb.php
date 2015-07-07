<?php
/**
 * Created by PhpStorm.
 * User: Ivan Herceg
 * Date: 24/02/2015
 * Time: 16:02
 */

class Breadcrumb {
    public function addBreadcrumb($names, $links, $tpl){
        for( $i = 0; $i < sizeof($names); $i++ ){
            $tpl->newBlock('bread-crumbs');
            $tpl->assign('crumb', $names[$i]);
            $tpl->assign('link', $links[$i]);
        }
        return $tpl;
    }
}