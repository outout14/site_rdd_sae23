<?php

// Load the bootstrap file
use JetBrains\PhpStorm\NoReturn;

require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */

class HomeController {
  private array $menu = [
    'home' => 'Accueil',
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

    $smarty->assign('creators',Utils::GetData(__DIR__ . '/../Data/organisators.json'));

    $smarty->assign('sponsors',Utils::GetData(__DIR__ . '/../Data/sponsors.json'));

    $smarty->assign('organisation',Utils::GetData(__DIR__ . '/../Data/organisation.json'));

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
    } 
    catch (SmartyException $e) {
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

  public function goldbook(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Livre d\'or');

    

    $exemple_de_messages = array(

      "message_1" => array(
        "lastname" => "Ziuzin",
        "firstname" => "Nikita",
        "content" => "Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                      Harum, debitis vel enim numquam expedita mollitia minima 
                      quisquam sit amet rem? Corrupti aspernatur quos tenetur aliquam 
                      voluptatem, iusto repellendus id ea!",
        "date" => "34 février 2021"
      ),

      "message_2" => array(
        "lastname" => "Gramain",
        "firstname" => "Mael",
        "content" => "Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                      Harum, debitis vel enim numquam expedita mollitia minima 
                      quisquam sit amet rem? Corrupti aspernatur quos tenetur aliquam 
                      voluptatem, iusto repellendus id ea!",
        "date" => "-3 decembre 2050"
      ),

      "message_3" => array(
        "lastname" => "Teffene",
        "firstname" => "Alexis",
        "content" => "Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                      Harum, debitis vel enim numquam expedita mollitia minima 
                      quisquam sit amet rem? Corrupti aspernatur quos tenetur aliquam 
                      voluptatem, iusto repellendus id ea!",
        "date" => "17 juillet 2023"
      ),

      "message_4" => array(
        "lastname" => "Cazoulat",
        "firstname" => "Lisa",
        "content" => "Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                      Harum, debitis vel enim numquam expedita mollitia minima 
                      quisquam sit amet rem? Corrupti aspernatur quos tenetur aliquam 
                      voluptatem, iusto repellendus id ea!",
        "date" => "30 septembre 2021"
      ),

      "message_5" => array(
        "lastname" => "Dupont",
        "firstname" => "Jean",
        "content" => "Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                      Harum, debitis vel enim numquam expedita mollitia minima 
                      quisquam sit amet rem? Corrupti aspernatur quos tenetur aliquam 
                      voluptatem, iusto repellendus id ea!",
        "date" => "10 mai 2017"
      ),

      "message_6" => array(
        "lastname" => "Tran",
        "firstname" => "Saction",
        "content" => "Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
                      Harum, debitis vel enim numquam expedita mollitia minima 
                      quisquam sit amet rem? Corrupti aspernatur quos tenetur aliquam 
                      voluptatem, iusto repellendus id ea!",
        "date" => "9 octobre 2013"
      ),

      );

    $smarty->assign('goldbook',$exemple_de_messages);

    try {
      $smarty->display('home/goldbook.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function gallery(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Galerie');

    /*----------------A faire-------------
    Vérifier si il y a pas une photo qui a déjà le même nom
    Donner un nom a sa photo */

    /* Verifie si la photo s'est bien télécharger */
    if (isset($_FILES["photo"]) && $_FILES["photo"]["error"]== UPLOAD_ERR_OK){

      /* On met la photo dans le bon dossier */
      $photo = $_FILES["photo"];
      $name = "";
      for($i=0; $i<5; $i++){
        $name=$name.(string)rand();
      }
      $extension = explode(".", $photo["name"]);
      var_dump($extension);
      $extension = ".".$extension[array_key_last($extension)];
      echo($extension);
      $destination="gallerie/non_valide/".$name.$extension;
      echo($photo["tmp_name"]);

      move_uploaded_file($photo["tmp_name"], $destination);
    }

    $contenu_dossier = scandir("gallerie/valide");

    $smarty->assign('contenu_dossier', $contenu_dossier);

    $smarty->display('home/galerie.tpl');
  }

  public function annuaire(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Annuaire');

    $users = User::getAll();
    /* Boucle qui enleve toute les données inutiles */
    foreach ($users as $user) {
      unset($user->email);
      unset($user->phone_number);
      unset($user->city);
      unset($user -> family_count);
      unset($user -> has_paid);
      unset($user -> role);
}

/* vérifier si luilisateur est conformé 
Faire en sorte de filtrer sans le nome entier*/
    $smarty->assign('traitement',$_POST);
    if(isset($_POST["submit"])){

      if(isset($_POST["name"]) && $_POST["name"]!=""){
        $name = $_POST["name"];
      }
      if(isset($_POST["status"]) && $_POST["status"]!="other"){
        $status = $_POST["status"];
      }
      if(isset($_POST["company"]) && $_POST["company"] ){
        $company = $_POST["company"];
      }
      if (isset($_POST["promotion"]) && $_POST["promotion"] ){
        $promotion = $_POST["promotion"];
      }


      foreach ($users as $user){

        if($user ->display_in_list==0){
          // unset($users[$user]);
        }
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
