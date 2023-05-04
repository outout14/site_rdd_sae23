<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

/*
 * Auth Controller
 * This file is used to handle the authentification.
 */

function shouldNotBeLoggedIn(): void {
  if(isset($_SESSION["user"])){
    header('Location: ' . APP_URL . '/?notification=already_logged_in');
    exit();
  }
}

class AuthController
{
  /**
   * Display the login page.
   */
  public function login(): void
  {
    shouldNotBeLoggedIn();
    global $smarty;
    if(isset($_POST)){
      if(isset($_POST["action"]) && $_POST["action"] == "login") {
        if(isset($_POST["email"]) && isset($_POST["password"])){
          // Validate the email
          $email = htmlentities($_POST["email"]);
          $password = htmlentities($_POST["password"]);

          $user = new User();

          if($user->get($email)){
            if($user->verifyPassword($password)){
              if($user->isConfirmed()){
                $user->clearPasswordField(); // Remove the password from the user object to avoid security issues
                $_SESSION["user"] = $user;
                header('Location: ' . APP_URL . '/?notification=login_success');
              }
              else {
                $smarty->assign('error', 'Votre compte n\'a pas encore été confirmé. Veuillez vérifier vos emails.');
              }
            } else {
              $smarty->assign('error', 'Identifiants incorrects');
            }
          } else {
            $smarty->assign('error', 'Identifiants incorrects');
          }
        } else {
          $smarty->assign('error', 'Veuillez remplir tous les champs');
        }
      }
    }
    $smarty->display('auth/login.tpl');
  }

  private function handleRegistration($lastname, $firstname, $email, $password, $phone_number, $city, $display_on_map, $status, $password_confirm): User|string
  {
    if ($password == $password_confirm) {
      if (($display_on_map == 1 && $city != "") || $display_on_map == 0) {
        $checkUsr = new User();
        if ($checkUsr->get($email)) {
          return "L'adresse email est déjà utilisée.";
          } else {
          $password = password_hash($password, PASSWORD_DEFAULT);
          return User::register($lastname, $firstname, $email, $password, $phone_number, $city, $display_on_map, 0, $status); // No error
        }
      } else {
        return "Si vous souhaitez être affiché sur la carte, veuillez renseigner votre ville.";
      }
    } else {
      return "Les mots de passe ne correspondent pas.";
    }
  }

  /**
   * Display the register page.
   */
  public function register(): void
  {
    shouldNotBeLoggedIn();
    global $smarty;


    if (isset($_POST["action"]) && $_POST["action"] == "register") {
      print_r($_POST);
      if (Utils::CheckForInputs(array("email", "password", "password_confirm", "firstname", "lastname", "status"))) {
        $firstname = strtolower(htmlspecialchars($_POST["firstname"]));
        $lastname = strtolower(htmlspecialchars($_POST["lastname"]));
        $status = htmlspecialchars($_POST["status"]);
        $status = ($status == "student" || $status == "teacher" || $status == "oldstudent") ? $status : "student";
        $phone_number = htmlspecialchars($_POST["phone_number"]);
        $email = strtolower(filter_var($_POST["email"], FILTER_SANITIZE_EMAIL));
        $password = htmlspecialchars($_POST["password"]);
        $password_confirm = htmlspecialchars($_POST["password_confirm"]);
        $display_on_map = isset($_POST["display_on_map"]) ? 1 : 0;
        $city = isset($_POST["city"]) ? htmlspecialchars($_POST["city"]) : "";

        $user = $this->handleRegistration($lastname, $firstname, $email, $password, $phone_number, $city, $display_on_map, $status, $password_confirm);
        if (gettype($user) == "object"){
          $user->sendConfirmationEmail();
          header('Location: ' . APP_URL . '/?notification=register_success');
        } else {
          $smarty->assign('error', $user);
        }

      }
    }
    $smarty->display('auth/register.tpl');
  }

  /**
   * Display the logout page.
   */
  public function logout(): void
  {
    connexionMiddleware::logout();
  }

  /*
   * Display the forgot password page.
   */
  public function forgotPassword($token="noreset"): void
  {
    shouldNotBeLoggedIn();
    global $smarty;

    if($token != "noreset"){
      $tokenObj = new resetToken();

      if($tokenObj->verify($token)){
        if(isset($_POST["action"]) && $_POST["action"] == "resetPassword"){
          if(isset($_POST["password"]) && isset($_POST["password_confirm"])){
            $password = htmlspecialchars($_POST["password"]);
            $password_confirm = htmlspecialchars($_POST["password_confirm"]);
            if($password == $password_confirm){
              $user = new User();
              $user->get($tokenObj->getUserId());
              $user->updatePassword($password);
              header('Location: ' . APP_URL . '/auth/login?notification=reset_password_success');
            } else {
              $smarty->assign('error', 'Les mots de passe ne correspondent pas.');
            }
          } else {
            $smarty->assign('error', 'Veuillez remplir tous les champs.');
          }
        }
        $smarty->assign('token', $token);
        $smarty->display('auth/forgotPassword_AFTER_TOKEN.tpl');
      } else {
        $smarty->assign('error', 'Lien invalide.');
        $smarty->display('auth/forgotPassword_BEFORE_TOKEN.tpl');
      }
    } else {
      // If the user has submitted the form
      if(isset($_POST["action"]) && $_POST["action"] == "forgotPassword"){
        if(isset($_POST["email"])){
          $email = htmlspecialchars($_POST["email"]);
          $user = new User();
          if($user->get($email)){
            // Check if the user has already requested a reset password email
            $tokenObj = new resetToken();
            if($tokenObj->getFromUserID($user->id)){
              $tokenObj->delete();
            }

            $user->sendResetPasswordEmail();
            header('Location: ' . APP_URL . '/?notification=reset_password_email_sent');
          } else {
            $smarty->assign('error', 'Aucun compte n\'est associé à cette adresse email.');
          }
        } else {
          $smarty->assign('error', 'Veuillez remplir tous les champs.');
        }
      }

      // Template
      $smarty->display('auth/forgotPassword_BEFORE_TOKEN.tpl');
    }
  }

  /**
   * Link to confirm the email.
   */
  public function confirmEmail($token): void
  {
    global $smarty;

    $email = htmlspecialchars(openssl_decrypt($token, "AES-128-ECB", MAIL_ENCRYPTION_TOKEN));
    $user = new User();
    if($user->get($email)) {
      if ($user->isConfirmed()) {
        header('Location: ' . APP_URL . '/?notification=already_confirmed');
      } else {
        $user->confirmEmail();
        header('Location: ' . APP_URL . '/?notification=confirm_success');
      }
    } else {
      header('Location: ' . APP_URL . '/?notification=userNotFound');
    }
    exit();
  }
}


