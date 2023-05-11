<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */
class HomeController {
  private array $menu = [
    'home' => 'Accueil',
    'organisation' => 'Organisation',
    'register' => 'Inscription',
    'galerie' => 'Galerie',
    'livre-or' => 'Livre d\'or',
  ];
  /**
   * Display the home page.
   */
  public function home(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Accueil');
    $smarty->display('home/index.tpl');
  }

  // Inscription page

  public function register(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');
    $smarty->display('home/inscription.tpl');
  }
}
