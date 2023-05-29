<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

connexionMiddleware::shouldBeAdmin();

/*
 * smartyPassDefaultVariables : void
 * This function is used to pass default variables to the smarty engine.
 */
function smartyPassDefaultVariables($menu, $currentPage): void {
  global $smarty;
  $smarty->assign('menu', Utils::GenerateMenu('admin', $menu));
  $smarty->assign('currentPage', $currentPage);
  $smarty->assign('sessionUser', connexionMiddleware::getLoginUser());
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
    'galery' => 'Photos',
  ];

  /**
   * Display the admin page.
   */
  public function home(): void
  {
    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Accueil');
    try {
      $smarty->display('admin/index.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function users(): void
  {
    if(isset($_POST)) {
      if (isset($_POST['action'])) {
        if ($_POST['action'] == 'addUser') {
          $_POST['display_on_map'] = isset($_POST['display_on_map']) && $_POST['display_on_map'] === 'on' ? 1 : 0;
          $_POST['confirmed'] = isset($_POST['confirmed']) && $_POST['confirmed'] === 'on' ? 1 : 0;
          if(!isset($_POST['status'])) $_POST['status'] = "student";
          if(!isset($_POST['role'])) $_POST['role'] = 'user';
          $user = new User();
          $err = $user->register ($_POST['lastname'], $_POST['firstname'], $_POST['email'], $_POST['password'], $_POST['phone_number'], $_POST['city'], $_POST['family_count'], $_POST['company'], $_POST['promotion'], $_POST['promotion_year'], $_POST['display_in_list'], $_POST['display_on_map'], $_POST['confirmed'], $_POST['status'], $_POST['role']);
          if (gettype($err) == "object") {
            header('Location: ' . APP_URL . '/admin/users?notification=userAdded');
          } else {
            header('Location: ' . APP_URL . '/admin/users?notification=error');
          }
        }
      }
    }

    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Utilisateurs');
    $smarty->assign('users', User::getAll());
    try {
      $smarty->display('admin/users.tpl');
    } catch (SmartyException $e) {
    }
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

          $user->update($_POST["id"], $_POST['lastname'], $_POST['firstname'], $_POST['email'], $_POST['password'], $_POST['phone_number'], $_POST['city'], $_POST['family_count'], $_POST['company'], $_POST['promotion'], $_POST['promotion_year'], $_POST['display_in_list'], $_POST['display_on_map'], $_POST['confirmed'], $_POST['status'], $_POST['role']);
          header('Location: ' . APP_URL . '/admin/users?notification=userEdited');
        }
      }
    }

    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Utilisateurs');
    $smarty->assign('user', $user);
    try {
      $smarty->display('admin/user_edit.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function goldbook(): void
{
    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Livre d\'Or');
    // Additional logic for the guestbook page
    // ...
    $smarty->display('admin/goldbook.tpl');
}
public function galery(): void
{
  if(isset($_GET["validate"])){
    rename("gallerie/non_valide/".$_GET["validate"], "gallerie/valide/".$_GET["validate"]);
  } else if(isset($_GET["nonvalidate"])){
    unlink("gallerie/non_valide/".$_GET["nonvalidate"]);
  }
    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Photos');
    
    $contenu_dossier = scandir("gallerie/non_valide");

    $smarty->assign('contenu_dossier', $contenu_dossier);
    $smarty->display('admin/galery.tpl');
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

