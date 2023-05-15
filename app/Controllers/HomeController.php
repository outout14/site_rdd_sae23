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

class HomeController {
  /**
   * Display the home page.
   */
  public function home(): void
  {
    global $smarty;

    $smarty->assign('notification',"Vous avez un nouveau message!");
    
    $creators = getCreators();
    $smarty->assign('creators',$creators);

    $sponsors = getSponsors();
    $smarty->assign('sponsors',$sponsors);

    $organisation = getOrganisation();
    $smarty->assign('organisation',$organisation);

    $smarty->assign('pagename',"Génération R&T");
    $smarty->display('home/index.tpl');
  }

  // Inscription page

  public function inscription(): void
  {
    global $smarty;

    $smarty->assign('notification',"Vous avez un nouveau message!");

    $smarty->assign('pagename',"Inscription");
    $smarty->display('home/inscription.tpl');
  }

  public function test(): void
  {
    global $smarty;

    $smarty->assign('notification',"Vous avez un nouveau message!");

    $smarty->assign('pagename',"Inscription");
    $smarty->display('home/changepassword.tpl');
  }

  public function gallerie(): void
  {
    global $smarty;

    $smarty->assign('pagename',"Gallerie");
    $smarty->display('home/gallerie.tpl');
  }

  public function vue2(): void
  {
    global $smarty;
    $utilisateur = new User(1, 'Doe', 'John', 'john@doe.fr', 'password', '0606060606', 'Paris', 'true');
    $smarty->display('home/vue2.tpl');
  }
}
