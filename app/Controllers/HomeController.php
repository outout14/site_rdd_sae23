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
  public function index(): void
  {
    global $smarty;

    $smarty->display('home/index.tpl');
  }
}
