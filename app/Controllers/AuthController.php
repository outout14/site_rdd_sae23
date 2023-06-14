<?php

// Load the bootstrap file
use JetBrains\PhpStorm\NoReturn;

require_once(__DIR__ . '/../../Core/app/bootstraper.php');

/*
 * Auth Controller
 * This file is used to handle the authentification.
 */

function shouldNotBeLoggedIn(): void
{
  if(isset($_SESSION["user"])) {
    Utils::DisplayJsonError("Vous êtes déjà connecté.");
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
    if (isset($_POST)) {
      if (isset($_POST["actionType"]) && $_POST["actionType"] == "login") {
        if (isset($_POST["email"]) && isset($_POST["password"])) {
          $captcha = Utils::hCaptcha($_POST["h-captcha-response"]);
          if(!$captcha){
            Utils::DisplayJsonError("Captcha invalide.");
          }
          // Validate the email
          $email = htmlentities($_POST["email"]);
          $password = htmlentities($_POST["password"]);

          $user = new User();
          if ($user->get($email)) {
            if ($user->verifyPassword($password)) {
              if ($user->isConfirmed()) {
                $user->clearPasswordField(); // Remove the password from the user object to avoid security issues
                $_SESSION["user"] = $user;
                Utils::DisplayJsonError('_success'); // No error
              } else {
                Utils::DisplayJsonError('Votre compte n\'a pas encore été confirmé. Veuillez vérifier vos emails.');
              }
            } else {
              Utils::DisplayJsonError('Mot de passe incorrect');
            }
          } else {
            Utils::DisplayJsonError('Identifiants incorrects');
          }
        } else {
          Utils::DisplayJsonError('Veuillez remplir tous les champs');
        }
      }
    } else {
      Utils::DisplayJsonError('Veuillez remplir tous les champs');
    }
  }

  private function handleRegistration($lastname, $firstname, $email, $password, $password_confirm, $phone_number, $city, $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, $confirmed, $status): User|string
  {
    if ($password == $password_confirm) {
      if (($display_on_map == 1 && $city != "") || $display_on_map == 0) {
        $checkUsr = new User();
        if ($checkUsr->get($email)) {
          return "L'adresse email est déjà utilisée.";
        } else {
          return User::register($lastname, $firstname, $email, $password, $phone_number, $city, $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, $confirmed, $status, "user"); // No error
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
  #[NoReturn] public function register(): void
  {
    shouldNotBeLoggedIn();

    if (isset($_POST["actionType"]) && $_POST["actionType"] == "register") {
      if (Utils::CheckForInputs(array("email", "password", "confirmpassword", "firstname", "lastname", "status"))) {
        $captcha = Utils::hCaptcha($_POST["h-captcha-response"]);
        if(!$captcha){
          Utils::DisplayJsonError("Captcha invalide.");
        }
        $firstname = strtolower(htmlspecialchars($_POST["firstname"]));
        $lastname = strtolower(htmlspecialchars($_POST["lastname"]));
        $status = htmlspecialchars($_POST["status"]);

        $status = ($status == "student" || $status == "teacher" || $status == "oldstudent" || $status == "other") ? $status : "student";
        $promotion_year = 0;  
        // If oldstudent, check if promotion_year and is int
        if ($status == "oldstudent") {
          if (isset($_POST["oldpromotion"])) {
            $promotion_year = htmlspecialchars($_POST["oldpromotion"]);
            if (!is_numeric($promotion_year)) {
              Utils::DisplayJsonError("L'année de promotion doit être un nombre.");
            }
          } else {
            Utils::DisplayJsonError("L'année de promotion doit être renseignée dans le cas où vous êtes un ancien élève.");
          }
        }
        $promotion = $_POST["promotion"] ?? "XXXX";
        if ($promotion == null && $status == "student") {
          Utils::DisplayJsonError("La promotion doit être renseignée dans le cas où vous êtes un élève.");
        }

        $phone_number = "0123456789";
        $email = strtolower(filter_var($_POST["email"], FILTER_SANITIZE_EMAIL));
        // Regex to check if the email is valid
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
          Utils::DisplayJsonError("L'adresse email n'est pas valide.");
        }

        $password = htmlspecialchars($_POST["password"]);
        if(strlen($password) < 8) {
          Utils::DisplayJsonError("Le mot de passe doit contenir au moins 8 caractères.");
        }
        $password_confirm = htmlspecialchars($_POST["confirmpassword"]);
        $display_on_map = isset($_POST["display_on_map"]) ? 1 : 0;
        $display_in_list = isset($_POST["displayed_in_list"]) ? 1 : 0;
        $company = isset($_POST["company"]) ? htmlspecialchars($_POST["company"]) : "";

        // Check if family family_comes, then family_count = 0, else use family_count value and check for it to be an int
        $family_comes = isset($_POST["family_comes"]) ? 1 : 0;
        $family_count = ($family_comes == 1) ? 0 : htmlspecialchars($_POST["family_count"]);
        if ($family_comes == 1) {
          $family_count = 0;
        } else {
          if (!is_numeric($family_count)) {
            Utils::DisplayJsonError("Le nombre de personnes doit être un nombre.");
          }
        }

        $city = isset($_POST["city"]) ? htmlspecialchars($_POST["city"]) : "";

        $user = $this->handleRegistration($lastname, $firstname, $email, $password, $password_confirm, $phone_number, $city, $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, false, $status);
        if (gettype($user) == "object") {
          $user->sendConfirmationEmail();
          Utils::DisplayJsonError("_success");
        } else {
          Utils::DisplayJsonError($user);
        }
      }
      else {
        Utils::DisplayJsonError("Veuillez remplir tous les champs...");
      }
    }
    Utils::DisplayJsonError("Veuillez remplir tous les champs !");
  }

  /**
   * Display the logout page.
   */
  #[NoReturn] public function logout(): void
  {
    connexionMiddleware::logout();
  }

  /*
   * Handle the forgot password page.
   * Return a json response.
   */
  #[NoReturn] public function forgotPassword(): void
  {
    shouldNotBeLoggedIn();

    if (Utils::CheckForInputs(array("token", "password", "password_confirm"))){
      $tokenObj = new resetToken();
      if ($tokenObj->verify($_POST["token"])) {
        $password = htmlspecialchars($_POST["password"]);
        $password_confirm = htmlspecialchars($_POST["password_confirm"]);
        if ($password == $password_confirm) {
          $user = new User();
          $user->get($tokenObj->getUserId());
          $user->updatePassword($password);
          Utils::DisplayJsonError("_success"); // No error
        } else {
          Utils::DisplayJsonError("Les mots de passe ne correspondent pas.");
        }
      } else {
        Utils::DisplayJsonError("Le token n'est pas valide.");
      }
    }
    else {
      Utils::DisplayJsonError("Veuillez remplir tous les champs.");
    }
  }

  /*
   * Request a reset password email.
   * Return a json response.
   */
  #[NoReturn] public function askResetPassword(): void{
    // If the user has submitted the form
    if (isset($_POST["actionType"]) && $_POST["actionType"] == "forgotPassword") {
      if (isset($_POST["email"])) {
        $email = htmlspecialchars($_POST["email"]);
        $user = new User();
        if ($user->get($email)) {
          // Check if the user has already requested a reset password email
          $tokenObj = new resetToken();
          if ($tokenObj->getFromUserID($user->id)) {
            $tokenObj->delete();
          }

          $user->sendResetPasswordEmail();
          Utils::DisplayJsonError("_success"); // No error
        } else {
          Utils::DisplayJsonError("Aucun utilisateur n'a été trouvé avec cette adresse email.");
        }
      } else {
        Utils::DisplayJsonError("Veuillez remplir tous les champs.");
      }
    }
    Utils::DisplayJsonError("Veuillez remplir tous les champs.");
  }

  /**
   * Link to confirm the email.
   */
  #[NoReturn] public function confirmEmail($token=""): void
  {
    if($token == "") {
      header('Location: ' . APP_URL . '/?notification=tokenNotFound');
      exit();
    }
    global $smarty;

    $email = htmlspecialchars(openssl_decrypt(base64_decode($token), "AES-128-ECB", MAIL_ENCRYPTION_TOKEN));
    $user = new User();
    if($user->get($email)) {
      if ($user->isConfirmed()) {
        header('Location: ' . APP_URL . '/?notification=tokenAlreadyUsed');
      } else {
        $user->confirmEmail();
        header('Location: ' . APP_URL . '/?notification=tokenSuccess');
      }
    } else {
      header('Location: ' . APP_URL . '/?notification=userNotFound');
    }
    exit();
  }
}


