<?php

// Load the bootstrap file
use JetBrains\PhpStorm\NoReturn;

require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */

function getData($path) {
  return json_decode(file_get_contents($path), true);
}

function addCreator($name, $surname, $role, $link): string
{
  $path = APP_URL . "/assets/images/creators/creator_" . strtolower($name) . ".png";

  return <<<TEMPL
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
}

function getCreators(): string
{
  $organisators = getData(__DIR__ . '/../Data/organisators.json');
  $result = array();

  foreach(array_keys($organisators) as $organisator) {
      $result[] = addCreator($organisators[$organisator]["firstname"], $organisators[$organisator]["lastname"], $organisators[$organisator]["task"], $organisators[$organisator]["link"]);
  }

  $result = implode("",$result);

  return $result.$result;
}

function addSponsor($name, $link): string
{
  $path = APP_URL . "/assets/images/sponsors/" . strtolower($name) . ".png";

  return <<<TEMPL
      <div class="col d-flex justify-content-center align-items-center">
          <a href="$link"><img src="$path" alt="$name" class="sponsor-img"></a>
      </div>
      TEMPL;
}

function getSponsors(): string
{
  $sponsors = getData(__DIR__ . '/../Data/sponsors.json');
  $result = array();

  foreach(array_keys($sponsors) as $sponsor) {
      $result[] = addSponsor($sponsors[$sponsor]["name"], $sponsors[$sponsor]["link"]);
  }

  return implode("",$result);
}

function getOrganisation() {
  return getData(__DIR__ . '/../Data/organisation.json');
}

#[NoReturn] function getUsers($users): void
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

    try {
      $smarty->display('home/index.tpl');
    } catch (SmartyException $e) {
    }
  }

  // Inscription page

  public function register(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');

    try {
      $smarty->display('home/inscription.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function resetPassword($token=""): void
  {
    if($token==""){
      header("Location: " . APP_URL . "/home");
      exit();
    }
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Mot de passe oublié');
    $smarty->assign('token', $token);
    try {
      $smarty->display('home/resetPassword.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function golddbook(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Inscription');

    try {
      $smarty->display('home/inscription.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function gallery(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Galerie');

    try {
      $smarty->display('home/galerie.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function annuaire(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Annuaire');

    try {
      $smarty->display('home/users.tpl');
    } catch (SmartyException $e) {
    }
  }
  public function pagenotfound(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, '404 not found');

    $smarty->display('home/pagenotfound.tpl');
  }
}
