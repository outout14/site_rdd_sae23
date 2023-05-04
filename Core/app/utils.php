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
}
