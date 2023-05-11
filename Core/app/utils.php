<?php

class Utils{
  public static function GenerateMenu($controller, $data): array
  {
    $result = array();
    // Append controller name to menu value url
    foreach($data as $key => $value){
      $result[] = array('name' => $value, 'url' => APP_URL . "/" . $controller . "/" . $key);
    }
    return $result;
  }

  public static function CheckForInputs($inputs): bool
  {
    foreach($inputs as $input){
      if(!isset($_POST[$input])){
        return false;
      }
    }
    return true;
  }

  /*
   * SmartyGeneralValues : void
   * This function is used to pass default variables to the smarty engine.
   */
    public static function SmartyGeneralValues($prefix, $menu, $currentPage): void {
        global $smarty;
        $smarty->assign('menu', Utils::GenerateMenu($prefix, $menu));
        $smarty->assign('currentPage', $currentPage);
        $smarty->assign('sessionUser', connexionMiddleware::getLoginUser());
    }
}
