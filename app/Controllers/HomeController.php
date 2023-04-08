<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

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

  public function vue2(): void
  {
    global $smarty;

    $smarty->display('home/vue2.tpl');
  }
}
