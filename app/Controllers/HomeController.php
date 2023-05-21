<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */

function getData($path) {
  return json_decode(file_get_contents($path), true);
}

function addCreator($name, $surname, $role, $link) {
  $path = APP_URL . "/assets/images/creators/creator_" . strtolower($name) . ".png";

  $template = <<<TEMPL
      <div class="organisator-wrapper">
          <div class="avatar-lg">
              <a href="$link">
                  <img src="$path" alt="$name" class="avatar-img">
              </a>
          </div>

          <div class="organisator-description mt-1">
              <p class="text-center fw-bold">$name $surname</p>
              <div class="separation-bar-sm m-auto bg-dark"></div>
              <p class="text-center fw-bold">$role</p>
          </div>
      </div>
      TEMPL;

  return $template;
}

function getCreators() {
  $organisators = getData(__DIR__ . '/../Data/organisators.json');
  $result = array();

  foreach(array_keys($organisators) as $organisator) {
      array_push($result, addCreator($organisators[$organisator]["firstname"],$organisators[$organisator]["lastname"],$organisators[$organisator]["task"],$organisators[$organisator]["link"]));
  }

  $result = implode("",$result);

  return $result.$result;
}

function addSponsor($name, $link) {
  $path = APP_URL . "/assets/images/sponsors/" . strtolower($name) . ".png";

  $template = <<<TEMPL
      <div class="col d-flex justify-content-center align-items-center">
          <a href="$link"><img src="$path" alt="$name" class="sponsor-img"></a>
      </div>
      TEMPL;

  return $template;
}

function getSponsors() {
  $sponsors = getData(__DIR__ . '/../Data/sponsors.json');
  $result = array();

  foreach(array_keys($sponsors) as $sponsor) {
      array_push($result, addSponsor($sponsors[$sponsor]["name"],$sponsors[$sponsor]["link"]));
  }

  return implode("",$result);
}

function getOrganisation() {
  return getData(__DIR__ . '/../Data/organisation.json');
}

function getUsers($users): void
{
  header('Content-Type: application/json');
  echo json_encode($users);
  exit();
}

class HomeController {
  private array $menu = [
    'home' => 'Accueil',
    'register' => 'Inscription',
    'gallery' => 'Galerie',
    'goldbook' => 'Livre d\'or',
    'annuaire' => 'Annuaire',
  ];
  /**
   * Display the home page.
   */
  public function home(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Accueil');

    $creators = getCreators();
    $smarty->assign('creators',$creators);

    $sponsors = getSponsors();
    $smarty->assign('sponsors',$sponsors);

    $organisation = getOrganisation();
    $smarty->assign('organisation',$organisation);

    $smarty->display('home/index.tpl');
  }

  // Inscription page

  public function register(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');

    $smarty->display('home/inscription.tpl');
  }

  public function resetPassword($token=""): void
  {
    if($token==""){
      header("Location: " . APP_URL);
      exit();
    }
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Mot de passe oublié');
    $smarty->assign('token', $token);
    $smarty->display('home/resetPassword.tpl');
  }

  public function golddbook(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');

    $smarty->display('home/inscription.tpl');
  }

  public function gallery(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Galerie');
    
    $smarty->display('home/galerie.tpl');
  }

  public function annuaire(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Annuaire');

    $smarty->assign('traitement',$_POST);
    if(isset($_POST["submit"])){
      $users = User::getAll();

      if($_POST["name"]!=""){
        $name = $_POST["name"];
      }
      if($_POST["status"]!="other"){
        $status = $_POST["status"];
      }
      if($_POST["company"]){
        $company = $_POST["company"];
      }

      $promotion = $_POST["promotion"];

      foreach ($users as $user){
        if(isset($name) && $user -> firstname !=$name){
          unset($users[$user -> id]);
        }
        if(isset($status) && $user -> status != $status){
          unset($users[$user -> id]);
        }
        if(isset($company) && $user -> company != $company){
          unset($users[$user -> id]);
        }
        if(isset($promotion) && $user -> promotion != $promotion){
          unset($users[$user -> id]);
        }
      }

      $smarty->assign('users', $users);
    }
    else{
      $smarty->assign('users', User::getAll());
    }

    $smarty->display('home/users.tpl');
  }
  public function pagenotfound(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, '404 not found');

    $smarty->display('home/pagenotfound.tpl');
  }
}
