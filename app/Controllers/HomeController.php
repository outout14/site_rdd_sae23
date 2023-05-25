<?php

// Load the bootstrap file
use JetBrains\PhpStorm\NoReturn;

require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */

class HomeController {
  private array $menu = [
    'home' => 'Accueil',
    'gallery' => 'Galerie',
    'goldbook' => 'Livre d\'or',
    'annuaire' => 'Annuaire',
  ];
  /**
   * Display the home page.
   */
  public function home(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Accueil');

    $smarty->assign('creators',Utils::GetData(__DIR__ . '/../Data/organisators.json'));

    $smarty->assign('sponsors',Utils::GetData(__DIR__ . '/../Data/sponsors.json'));

    $smarty->assign('organisation',Utils::GetData(__DIR__ . '/../Data/organisation.json'));

    try {
      $smarty->display('home/index.tpl');
    } catch (SmartyException $e) {
    }
  }

  // Inscription page

  public function register(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');

    try {
      $smarty->display('home/inscription.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function resetPassword($token=""): void
  {
    if($token==""){
      header("Location: " . APP_URL . "/home");
      exit();
    }
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Mot de passe oublié');
    $smarty->assign('token', $token);
    try {
      $smarty->display('home/resetPassword.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function golddbook(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');

    try {
      $smarty->display('home/inscription.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function gallery(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Galerie');

    try {
      $smarty->display('home/galerie.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function annuaire(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Annuaire');
    $smarty->assign('traitement',$_POST);
    if(isset($_POST["submit"])){
      $users = User::getAll();

      if($_POST["name"]!=""){
        $name = $_POST["name"];
      }
      if($_POST["status"]!="other"){
        $status = $_POST["status"];
      }
      if($_POST["company"]){
        $company = $_POST["company"];
      }

      $promotion = $_POST["promotion"];

      foreach ($users as $user){
        if(isset($name) && $user -> firstname !=$name){
          unset($users[$user -> id]);
        }
        if(isset($status) && $user -> status != $status){
          unset($users[$user -> id]);
        }
        if(isset($company) && $user -> company != $company){
          unset($users[$user -> id]);
        }
        if(isset($promotion) && $user -> promotion != $promotion){
          unset($users[$user -> id]);
        }
      }

      $smarty->assign('users', $users);
    }
    else{
      $smarty->assign('users', User::getAll());
    }

    $smarty->display('home/users.tpl');
  }
  public function pagenotfound(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, '404 not found');

    $smarty->display('home/pagenotfound.tpl');
  }
}
