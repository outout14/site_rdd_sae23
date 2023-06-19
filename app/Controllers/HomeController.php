<?php

// Load the bootstrap file
use JetBrains\PhpStorm\NoReturn;

require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');
require_once(__DIR__ . '/../Models/goldbook.php');

/*
 * HomeController
 * This file is used to handle the home page.
 */

class HomeController {
  private array $menu = [
    'home' => 'Accueil',
    //'gallery' => 'Galerie', TODO : Add gallery
    //'goldbook' => 'Livre d\'or', TODO : Add goldbook
    //'annuaire' => 'Annuaire', TODO : Add annuaire
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
    connexionMiddleware::shouldBeLoggedIn();
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Livre d\'or');

    /* Il faut vérifier que l'utilisateur écrit pas plusieurs fois*/

    if(isset($_POST["submit"])){
      $content = $_POST["message"];
      $date = date("Y-m-d");
      $message = new goldbook(0, $content, connexionMiddleware::getLoginUser(), $date);
      $message->push();
    }

    $content_db = goldbook::lister(1);
    $smarty->assign('goldbook',$content_db);

    $validate_form = goldbook::verif(connexionMiddleware::getLoginUser()->id);
    $smarty->assign('already_sent_message',$validate_form);

    try {
      $smarty->display('home/goldbook.tpl');
    } catch (SmartyException $e) {
    }
  }

  public function gallery(): void
  {
    connexionMiddleware::shouldBeLoggedIn();
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Galerie');

    /* Verifie si la photo s'est bien télécharger */
    if (isset($_FILES["photo"]) && $_FILES["photo"]["error"]== UPLOAD_ERR_OK){
      /* On met la photo dans le bon dossier */
      $photo = $_FILES["photo"];
      $date = date("Y_m_Y_H_i_s");
      $name = $date;
      for($i=0; $i<5; $i++){
        $name=$name.(string)rand();
      }
      $extension = explode(".", $photo["name"]);
      $extension = ".".$extension[array_key_last($extension)];

      if($extension != ".jpg" && $extension != ".png" && $extension != ".jpeg"){
        $smarty->assign('error',"Le format de la photo n'est pas bon");
        header("Location: ". APP_URL ."/home/gallery/?notification=format_photo_mauvaise");
        exit();
      }
      else{
        $verifyImg = getimagesize($photo["tmp_name"]);
        // On enleve les caractères spéciaux
        $name = preg_replace('/[^A-Za-z0-9\-]/', '', $name);
        $destination="gallerie/non_valide/".$name.$extension;
        move_uploaded_file($photo["tmp_name"], $destination);
      }
    }

    $contenu_dossier = scandir("gallerie/valide");
    $smarty->assign('contenu_dossier', $contenu_dossier);
    $smarty->display('home/galerie.tpl');
  }

  public function annuaire(): void
  {
    connexionMiddleware::shouldBeLoggedIn();
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Annuaire');

    $users = User::getUsers_annuaire();

    /* vérifier si luilisateur est conformé 
    Faire en sorte de filtrer sans le nom entier*/
    $smarty->assign('traitement',$_POST);

    $tab_param_form = array(0,0,0,0);
    if(isset($_POST["submit"])){

      if(isset($_POST["name"]) && $_POST["name"]!=null){
        $name = htmlentities($_POST["name"]);
        $tab_param_form[0]=$name;
      }
      if(isset($_POST["status"]) && $_POST["status"]!="Tous"){
        $tab_param_form[1]=htmlentities($_POST["status"]);
      }
      if(isset($_POST["company"]) && $_POST["company"]!=null){
        $company = htmlentities($_POST["company"]);
        $tab_param_form[2]=$company;
      }
      if (isset($_POST["promotion"]) && $_POST["promotion"]!=null){
        $tab_param_form[3]=htmlentities($_POST["promotion"]);
      }


      $users_filtre_name=array();
      foreach($users as $cle => $user){

        //le nom est selectionné
        if($tab_param_form[0]!=0){
          if(strtolower($user-> firstname) !=strtolower($tab_param_form[0]) && strtolower($user -> lastname) != strtolower($tab_param_form[0])){
            unset($users[$cle]);
          }
          else{
              array_push($users_filtre_name, $users[$cle]);
              unset($users[$cle]);
          }
        }
        else{
          array_push($users_filtre_name, $users[$cle]);
          unset($users[$cle]);
        }
      }

      $users=$users_filtre_name;
      $users_filtre_status = array();
      if(count($users)!=0){

        foreach($users as $cle=>$user){

          //le statut est selectionné
          if($tab_param_form[1]!=0){
            if($user -> status !=$tab_param_form[1]){
              if($tab_param_form[1]!="Tous"){
                unset($users[$cle]);
              }
            }
            else{
                array_push($users_filtre_status, $users[$cle]);
                unset($users[$cle]);
            }
          }
          else{
            array_push($users_filtre_status, $users[$cle]);
            unset($users[$cle]);
          }
        }  
      }

      $users=$users_filtre_status;
      $users_filtre_company = array();

      if(count($users)!=0){

        foreach($users as $cle=>$user){

          //entreprise selectionnee
          if($tab_param_form[2]!=0){
            if(array_key_exists($cle, $users)){
              if(strtolower($user -> company) !=strtolower($tab_param_form[2])){
                unset($users[$cle]);
              }
              else{
                array_push($users_filtre_company, $users[$cle]);
                unset($users[$cle]);
              }
            }
          }
          else{
            array_push($users_filtre_company, $users[$cle]);
            unset($users[$cle]);
          }
        }  
      }

      $users=$users_filtre_company;
      $users_filtre_promo = array();

      if(count($users)!=0){

        foreach($users as $cle=>$user){
        
          //promotion entree
          if($tab_param_form[3]!=0){
            if($user -> promotion !=$tab_param_form[3]){
              unset($users[$cle]);
            }
            else{
              array_push($users_filtre_promo, $users[$cle]);
              unset($users[$cle]);
            }
          }
          else{
            array_push($users_filtre_promo, $users[$cle]);
            unset($users[$cle]);
          }
        }
      }
     
      $smarty->assign('users', $users_filtre_promo);
    }
    else{
      $smarty->assign('users', User::getUsers_annuaire());
    }

    $smarty->display('home/users.tpl');
  }
  public function pagenotfound(): void
  {
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, '404 not found');

    $smarty->display('home/pagenotfound.tpl');
  }

  public function personalspace($update = false): void
  {
    connexionMiddleware::shouldBeLoggedIn();
    if($update){
      $user = connexionMiddleware::getLoginUser();

      if(isset($_POST["displayed_in_list"]) and $_POST["displayed_in_list"] == "true" and $user->display_in_list == 0){
        $user->setDisplayInList(1);
      } else if($user->display_in_list == 1){
        $user->setDisplayInList(0);
      }

      if(isset($_POST["password"]) && $_POST["password"]!=""){
        if($_POST["password"] == $_POST["confirmpassword"]){
          $user->updatePassword($_POST["password"]);
        } else {
          header("Location: " . APP_URL . "/home/personalspace?notification=invalidPassword");
        }
      }

      header("Location: " . APP_URL . "/home/personalspace?notification=profilUpdated");
    }
    global $smarty;
    Utils::SmartyGeneralValues("home", $this->menu, 'Espace Personnel');

    $smarty->display('home/personalspace.tpl');
  }
}
