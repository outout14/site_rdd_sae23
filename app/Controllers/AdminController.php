<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

/*
 * AdminController
 * This file is used to handle the admin page.
 */

class AdminController
{

  /**
   * Display the admin page.
   */
  public function home(): void
  {
    global $smarty;

    $smarty->display('admin/index.tpl');
  }
}
