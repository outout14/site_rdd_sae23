<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

/*
 * Auth Controller
 * This file is used to handle the authentification.
 */

class AuthController
{
  /**
   * Display the login page.
   */
  public function login(): void
  {
    global $smarty;
    $smarty->display('auth/login.tpl');
  }

  /**
   * Display the register page.
   */
  public function register(): void
  {
    global $smarty;
    $smarty->display('auth/register.tpl');
  }

  /**
   * Display the logout page.
   */
  public function logout(): void
  {
    global $smarty;
    session_destroy();
  }

  /**
   * Link to confirm the email.
   */
  public function confirmEmail($token): void
  {
    global $smarty;
    $smarty->display('auth/confirmEmail.tpl');
  }
}
