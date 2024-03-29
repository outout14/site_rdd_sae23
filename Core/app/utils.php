<?php

use JetBrains\PhpStorm\NoReturn;

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

  public static function CheckForInputs($inputs, $strict=false): bool
  {
    foreach($inputs as $input){
      if(!isset($_POST[$input])){
        return false;
      }
      if($strict && $_POST[$input] == ""){
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

    #[NoReturn] public static function DisplayJsonError($error): void
    {
      header('Content-Type: application/json');
      echo json_encode(array("error" => $error));
      exit();
    }

    public static function GetData($path) {
      return json_decode(file_get_contents($path), true);
    }



    public static function hCaptcha($response)
    {
      if (isset($response) && !empty($response)) {
        $secret = HCAPTCHA_KEY;
        $verifyResponse = file_get_contents('https://hcaptcha.com/siteverify?secret=' . $secret . '&response=' . $response . '&remoteip=' . $_SERVER['REMOTE_ADDR']);
        $responseData = json_decode($verifyResponse);
        if ($responseData->success) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }

    public static function displayErrorPage() : void {
      $menu = [
        'home' => 'Accueil',
      ];
      global $smarty;
      Utils::SmartyGeneralValues("home", $menu, 'Page introuvable');
      $smarty->display('home/pagenotfound.tpl');
    }

}
