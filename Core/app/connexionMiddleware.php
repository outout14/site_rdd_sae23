<?php

/*
  getLogin() : ?object
  This method checks if the user is logged in.
  If so it returns the user object.
  If not it returns null.
*/

use JetBrains\PhpStorm\NoReturn;

require_once __DIR__ . '/../../app/Models/user.php';

class connexionMiddleware{
  public static function getLoginUser(): ?User
  {
    return $_SESSION['user'] ?? null;
  }

  /*
    shouldBeLoggedIn() : void
    This method checks if the user is logged in.
    If not it redirects the user to the login page.
  */
  public static function shouldBeLoggedIn(): void
  {
    if (!isset($_SESSION['user'])) {
      header('Location: ' . APP_URL . '/?notification=login_required&redirect=' . urlencode($_SERVER['REQUEST_URI']));
      exit();
    }
  }

  /*
   checkUserAdmin() : ?User
    This method checks if the user is logged in and if the user is an admin.
    If so it returns the user object.
    If not it returns null.
  */
  public static function checkUserAdmin(): ?User
  {
    if (isset($_SESSION['user']) && $_SESSION['user']->role == 'admin') {
      return $_SESSION['user'];
    } else {
      return null;
    }
  }

  /*
   * shouldBeAdmin() : void
   * This method checks if the user is logged in and if the user is an admin.
   * If not it redirects the user to the home page.
   */
  public static function shouldBeAdmin(): void {
    if (!isset($_SESSION['user']) || $_SESSION['user']->role != 'admin') {
      header('Location: ' . APP_URL . '/?notification=permission_denied');
      exit();
    }
  }

  /*
    logout() : void
    This method logs out the user.
  */
  #[NoReturn] public static function logout(): void
  {
    session_destroy();
    header('Location: ' . APP_URL . '/?notification=logout_success');
    exit();
  }

}
