<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . "/../Models/goldbook.php");

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
          $err = $user->register (htmlentities($_POST['lastname']), htmlentities($_POST['firstname']), htmlentities($_POST['email']), htmlentities($_POST['password']), htmlentities($_POST['phone_number']), htmlentities($_POST['city']), htmlentities($_POST['family_count']), htmlentities($_POST['company']), htmlentities($_POST['promotion']), htmlentities($_POST['promotion_year']), htmlentities($_POST['display_in_list']), htmlentities($_POST['display_on_map']), htmlentities($_POST['confirmed']), htmlentities($_POST['status']), htmlentities($_POST['role']));
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

    if(isset($_GET["search"])){
      $search = htmlentities($_GET["search"]);
      $smarty->assign('searchQuery', $search);
      $smarty->assign('users', User::getByFilter($search));
    } else {
      $smarty->assign('searchQuery', "");
      $smarty->assign('users', User::getAll());
    }
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
          $user->update(htmlentities($_POST['id']), htmlentities($_POST['lastname']), htmlentities($_POST['firstname']), htmlentities($_POST['email']), htmlentities($_POST['phone_number']), htmlentities($_POST['city']), htmlentities($_POST['family_count']), htmlentities($_POST['company']), htmlentities($_POST['promotion']), htmlentities($_POST['promotion_year']), htmlentities($_POST['display_in_list']), htmlentities($_POST['display_on_map']), htmlentities($_POST['confirmed']), htmlentities($_POST['status']), htmlentities($_POST['role']));
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
  if (isset($_GET["validate"])) {
    $id = htmlentities($_GET["validate"]);
    goldbook::validate($id);
  } else if (isset($_GET["nonvalidate"])) {
    $id = htmlentities($_GET["nonvalidate"]);
    goldbook::delete($id);
  }

  global $smarty;
  smartyPassDefaultVariables($this->menu, 'Livre d\'Or');

  $searchQuery = isset($_GET["search"]) ? htmlentities($_GET["search"]) : "";
  $content_db = goldbook::lister(0);
  $smarty->assign('goldbook', $content_db);
  $smarty->assign('searchQuery1', $searchQuery); 
  $smarty->display('admin/goldbook.tpl');
}



public function galery(): void
{
  if(isset($_GET["validate"])){
    $_GET["validate"] = htmlentities($_GET["validate"]);
    rename("gallerie/non_valide/".$_GET["validate"], "gallerie/valide/".$_GET["validate"]);
  } else if(isset($_GET["nonvalidate"])){
    $_GET["nonvalidate"] = htmlentities($_GET["nonvalidate"]);
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

  public function user_paid($userID): void {
    $user = new User();
    if($user->get($userID) == null) {
      header('Location: ' . APP_URL . '/admin/users');
      exit();
    }
    echo $userID;

    $user->confirmPayment($userID);

    header('Location: ' . APP_URL . '/admin/users?notification=userPaid');
  }

  public function gestionjson(): void
  {

    if(isset($_GET["file"])){
      if(isset($_GET["delete"])){
        // SUPPRIMER
        $_GET["file"] = htmlentities($_GET["file"]);
        $data = Utils::GetData(__DIR__ . '/../Data/' . $_GET["file"]);
        unset($data[$_GET["delete"]]);
        $data = json_encode($data, JSON_PRETTY_PRINT);
        fwrite(fopen(__DIR__ . '/../Data/' . $_GET["file"], "w"), $data);
        header("Location:"  . APP_URL . "/admin/gestionjson?notification=entryDeleted");
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
      $_POST["file"] = htmlentities($_POST["file"]);
      $data = Utils::GetData(__DIR__ . '/../Data/' . $_POST["file"]);

      $to_edit = $data[htmlentities($id)];
      foreach ($_POST as $key => $value) {
        if($key != "file" && $key != "photos"){
          $to_edit[$key] = $value;
        }
      }

      if(isset($_FILES['photos']) && !empty($_FILES['photos']['name'])){
        
        if($_POST["file"] == "organisators.json"){
          $cheminPhoto = __DIR__ . '/../../public/assets/images/creators/creator_' . strtolower($id) . '.png';
        } else if ($_POST["file"] == "sponsors.json"){
          $cheminPhoto = __DIR__ . '/../../public/assets/images/sponsors/' . strtolower($id) . '.png';
        }
        $extension = explode(".", $_FILES['photos']['name']);
        $extension = $extension[count($extension) - 1];
        if($extension == "png"){
          if($_FILES['photos']['size'] < 1000000){

            unlink($cheminPhoto);
            move_uploaded_file($_FILES['photos']['tmp_name'], $cheminPhoto);
          } else {
            header("Location: "  . APP_URL . "/admin/gestionjson?notification=entryNotEdited&reason=photoTooBig");
            exit();
          }
        } else {
          header("Location: "  . APP_URL . "/admin/gestionjson?notification=entryNotEdited&reason=photoNotPng");
          exit();
        }
      }

      $data[$id] = $to_edit;

      $data = json_encode($data, JSON_PRETTY_PRINT);
      $fileopen = fopen(__DIR__ . '/../Data/' . $file, "w");
      if($fileopen !== false){
        fwrite($fileopen,$data);
        fclose($fileopen);
        header("Location: "  . APP_URL . "/admin/gestionjson?notification=entryEdited");
        exit();
      }
      else {
        header("Location: "  . APP_URL . "/admin/gestionjson?notification=entryNotEdited");
        exit();
      }
    }

    smartyPassDefaultVariables($this->menu, 'Gestionnaire json');
    $smarty->assign('url_id', $id);
    $smarty->assign('url_file', $file);

    $donnees_json = Utils::GetData(__DIR__ . '/../Data/' . $file)[$id];
    if(is_array($donnees_json) && array_key_exists('photos', $donnees_json)){
        unset($donnees_json['photos']);
    }
    $smarty->assign('donnees_json', $donnees_json);

    $smarty->display('admin/json_edit.tpl');
}

public function addJson($file)
{
    global $smarty;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data = Utils::GetData(__DIR__ . '/../Data/' . $file);

        if ($file == 'organisators.json') {
            $firstname = isset($_POST["firstname"]) ? htmlentities($_POST["firstname"]) : "";
            $lastname = isset($_POST["lastname"]) ? htmlentities($_POST["lastname"]) : "";
            $task = isset($_POST["task"]) ? htmlentities($_POST["task"]) : "";

            $newId = uniqid();
            $newUser = array(
                "firstname" => $firstname,
                "lastname" => $lastname,
                "task" => $task
            );
        } elseif ($file == 'sponsors.json') {
            $name = isset($_POST["name"]) ? htmlentities($_POST["name"]) : "";

            $newId = uniqid();
            $newSponsor = array(
                "name" => $name
            );
        } elseif ($file == 'organisation.json') {
            $key = isset($_POST["key"]) ? htmlentities($_POST["key"]) : "";
            $value = isset($_POST["value"]) ? htmlentities($_POST["value"]) : "";

            $newId = uniqid();
            $newData = array(
                $key => $value
            );
        }

        if (isset($_POST["link"])) {
            $link = htmlentities($_POST["link"]);
            if ($file == 'organisators.json') {
                $newUser["link"] = $link;
            } elseif ($file == 'sponsors.json') {
                $newSponsor["link"] = $link;
            }
        }

        if (isset($_FILES["photo"]) && $_FILES["photo"]["error"] === 0) {
            $photoName = $_FILES["photo"]["name"];
            $photoTmpName = $_FILES["photo"]["tmp_name"];
            $photoPath = __DIR__ . '/../Data/Photos/' . $photoName;

            if (move_uploaded_file($photoTmpName, $photoPath)) {
                if ($file == 'organisators.json') {
                    $newUser["photo"] = $photoName;
                } elseif ($file == 'sponsors.json') {
                    $newSponsor["photo"] = $photoName;
                }
            }
        }

        if ($file == 'organisators.json') {
            $data[$newId] = $newUser;
        } elseif ($file == 'sponsors.json') {
            $data[$newId] = $newSponsor;
        } elseif ($file == 'organisation.json') {
            $data = array_merge($data, $newData);
        }

        $jsonData = json_encode($data, JSON_PRETTY_PRINT);

        $fileOpen = fopen(__DIR__ . '/../Data/' . $file, "w");
        if ($fileOpen !== false) {
            fwrite($fileOpen, $jsonData);
            fclose($fileOpen);
            header("Location: " . APP_URL . "/admin/gestionjson?notification=entryAdded");
            exit();
        } else {
            header("Location: " . APP_URL . "/admin/gestionjson?notification=entryNotAdded");
            exit();
        }
    } else {
      $url_id = isset($_GET['url_id']) ? $_GET['url_id'] : '';
      $smarty->assign('url_id', $url_id);
      $smarty->assign('file', $file);
      $smarty->display('admin/json_ADD.tpl');
  }
}

public function addOrga($file)
{
    global $smarty;

    if (isset($_POST["firstname"]) && isset($_POST["lastname"]) && isset($_POST["task"]) && isset($_POST["link"])) {
        $firstname = htmlentities($_POST["firstname"]);
        $lastname = htmlentities($_POST["lastname"]);
        $task = htmlentities($_POST["task"]);
        $link = htmlentities($_POST["link"]);

        $data = Utils::GetData(__DIR__ . '/../Data/' . $file);

        $newId = uniqid();
        $newUser = array(
            "firstname" => $firstname,
            "lastname" => $lastname,
            "task" => $task,
            "link" => $link
        );
        $data[$newId] = $newUser;

        $jsonData = json_encode($data, JSON_PRETTY_PRINT);

        $fileOpen = fopen(__DIR__ . '/../Data/' . $file, "w");
        if ($fileOpen !== false) {
            fwrite($fileOpen, $jsonData);
            fclose($fileOpen);
            header("Location: " . APP_URL . "/admin/gestionjson?notification=entryAdded");
            exit();
        } else {
            echo "Failed to write the file.";
            exit();
        }
    }

    smartyPassDefaultVariables($this->menu, 'Gestionnaire json');
    $smarty->assign('url_file', $file);

    $smarty->display('admin/json_edit.tpl');
    
}




}


