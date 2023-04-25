<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

/*
 * redirectIfNotAuthorized : void
 */
function redirectIfNotAuthorized(): void
{
  if (!checkUserAdmin()) {
    header('Location: ' . APP_URL . '/login');
    exit();
  }
}

/*
 * smartyPassDefaultVariables : void
 * This function is used to pass default variables to the smarty engine.
 */
function smartyPassDefaultVariables($menu, $currentPage): void {
  global $smarty;
  $smarty->assign('menu', $menu);
  $smarty->assign('currentPage', $currentPage);
}

/*
 * AdminController
 * This file is used to handle the admin page.
 */

class AdminController
{
  private array $menu = [
    'home' => 'Accueil',
    'users' => 'Utilisateurs',
    'goldbook' => 'Livre d\'Or',
    'pictures' => 'Photos',
  ];

  /**
   * Display the admin page.
   */
  public function home(): void
  {
    //redirectIfNotAuthorized();

    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Accueil');
    $smarty->display('admin/index.tpl');
  }

  public function users(): void
  {
    //redirectIfNotAuthorized();

    if(isset($_POST)) {
      if (isset($_POST['action'])) {
        if ($_POST['action'] == 'addUser') {
          $_POST['display_on_map'] = isset($_POST['display_on_map']) && $_POST['display_on_map'] === 'on' ? 1 : 0;
          $_POST['confirmed'] = isset($_POST['confirmed']) && $_POST['confirmed'] === 'on' ? 1 : 0;
          if(!isset($_POST['status'])) $_POST['status'] = "student";
          if(!isset($_POST['role'])) $_POST['role'] = 'user';
          $user = new User($_POST['lastname'], $_POST['firstname'], $_POST['email'], $_POST['password'], $_POST['phone_number'], $_POST['city'], $_POST['display_on_map'], $_POST['confirmed'], $_POST['status'], $_POST['role']);
          $user->create();
          header('Location: ' . APP_URL . '/admin/users?notification=userAdded');
        }
      }
    }

    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Utilisateurs');
    $smarty->assign('users', User::getAllUsers());
    $smarty->display('admin/users.tpl');
  }

  public function user_edit($userID): void {
    $user = new User();
    if($user->get($userID) == null) {
      header('Location: ' . APP_URL . '/admin/users');
      exit();
    }

    if(isset($_POST)) {
      if (isset($_POST['action'])) {
        if ($_POST['action'] == 'editUser') {
          // Fix checkbox on/off
          $_POST['display_on_map'] = isset($_POST['display_on_map']) && $_POST['display_on_map'] === 'on' ? 1 : 0;
          $_POST['confirmed'] = isset($_POST['confirmed']) && $_POST['confirmed'] === 'on' ? 1 : 0;
          if(!isset($_POST['status'])) $_POST['status'] = "student";
          if(!isset($_POST['role'])) $_POST['role'] = 'user';

          $user->update($_POST["id"], $_POST['lastname'], $_POST['firstname'], $_POST['email'],  $_POST['phone_number'], $_POST['city'], $_POST['display_on_map'], $_POST['confirmed'], $_POST['status'], $_POST['role']);
          header('Location: ' . APP_URL . '/admin/users?notification=userEdited');
        }
      }
    }

    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Utilisateurs');
    $smarty->assign('user', $user);
    $smarty->display('admin/user_edit.tpl');
  }

  public function user_delete($userID): void {
    $user = new User();
    if($user->get($userID) == null) {
      header('Location: ' . APP_URL . '/admin/users');
      exit();
    }

    $user->delete($userID);
    header('Location: ' . APP_URL . '/admin/users?notification=userDeleted');
  }
}
