<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');
/*
 * HomeController
 * This file is used to handle the home page.
 */
class HomeController {
  /**
   * Display the home page.
   */
  public function home(): void
  {
    global $smarty;
    $smarty->display('home/index.tpl');
  }

  // Inscription page

  public function inscription(): void
  {
    global $smarty;
    $smarty->display('home/inscription.tpl');
  }

  public function vue2(): void
  {
    global $smarty;
    $utilisateur = new User(1, 'Doe', 'John', 'john@doe.fr', 'password', '0606060606', 'Paris', 'true');
    $smarty->display('home/vue2.tpl');
  }
}
