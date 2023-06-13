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
    'gestionjson' =>'Gestionnaire json'
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
    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Photos');
    // Additional logic for the guestbook page
    // ...
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

  public function gestionjson(): void
  {
    if(isset($_GET["file"])){
      if(isset($_GET["delete"])){
        // SUPPRIMER
        $data = Utils::GetData(__DIR__ . '/../Data/' . $_GET["file"]); 
        unset($data[$_GET["delete"]]);
        $data = json_encode($data, JSON_PRETTY_PRINT);
        fwrite(fopen(__DIR__ . '/../Data/' . $_GET["file"], "w"), $data);
        header("Location: /admin/gestionjson?notification=entryDeleted");
      }
    }
    global $smarty;
    smartyPassDefaultVariables($this->menu, 'Gestionnaire json');
    try {
      // Récupérer les fichier JSON 
      $smarty->assign('json_organisators', Utils::GetData(__DIR__ . '/../Data/organisators.json'));
      $smarty->assign('json_organisation', Utils::GetData(__DIR__ . '/../Data/organisation.json'));
      $smarty->assign('json_sponsors', Utils::GetData(__DIR__ . '/../Data/sponsors.json'));


      $smarty->display('admin/listeJSON.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function modifyjson($file, $id){
    global $smarty;
    if(isset($_POST["file"])){
      print_r($_POST);
      
      $data = Utils::GetData(__DIR__ . '/../Data/' . $_POST["file"]); 

      $to_edit = $data[$id]; 
      $data[$id]=$to_edit;

      $data = json_encode($data, JSON_PRETTY_PRINT);
      file_put_contents(__DIR__ . '/../Data/' . $_GET["file"], $data);
      header("Location: /admin/gestionjson?notification=entryEdited");
      exit();
    }
    smartyPassDefaultVariables($this->menu, 'Gestionnaire json');
    $smarty->assign('url_id', $id); 
    $smarty->assign('url_file', $file); 

    $smarty->assign('donnees_json', Utils::GetData(__DIR__ . '/../Data/' . $file)[$id]);

    $smarty->display('admin/json_edit.tpl');
  }
}