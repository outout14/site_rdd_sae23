<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');

/*
 * Auth Controller
 * This file is used to handle the authentification.
 */

function displayJsonError($error): void
{
  header('Content-Type: application/json');
  echo json_encode(array("error" => $error));
  exit();
}

function shouldNotBeLoggedIn(): void
{
  if(isset($_SESSION["user"])) {
    displayJsonError("Vous êtes déjà connecté.");
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
          // Validate the email
          $email = htmlentities($_POST["email"]);
          $password = htmlentities($_POST["password"]);

          $user = new User();

          if ($user->get($email)) {
            if ($user->verifyPassword($password)) {
              if ($user->isConfirmed()) {
                $user->clearPasswordField(); // Remove the password from the user object to avoid security issues
                $_SESSION["user"] = $user;
                displayJsonError('_success'); // No error
                exit();
              } else {
                displayJsonError('Votre compte n\'a pas encore été confirmé. Veuillez vérifier vos emails.');
              }
            } else {
              displayJsonError('Identifiants incorrects');
            }
          } else {
            displayJsonError('Identifiants incorrects');
          }
        } else {
          displayJsonError('Veuillez remplir tous les champs');
        }
      }
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
          $password = password_hash($password, PASSWORD_DEFAULT);
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
  public function register(): void
  {
    shouldNotBeLoggedIn();

    if (isset($_POST["actionType"]) && $_POST["actionType"] == "register") {
      print_r($_POST);
      if (Utils::CheckForInputs(array("email", "password", "confirmpassword", "firstname", "lastname", "status"))) {
        $firstname = strtolower(htmlspecialchars($_POST["firstname"]));
        $lastname = strtolower(htmlspecialchars($_POST["lastname"]));
        $status = htmlspecialchars($_POST["status"]);

        $status = ($status == "student" || $status == "teacher" || $status == "oldstudent") ? $status : "student";
        $promotion_year = 0;
        // If oldstudent, check if promotion_year and is int
        if ($status == "oldstudent") {
          if (isset($_POST["oldpromotion"])) {
            $promotion_year = htmlspecialchars($_POST["oldpromotion"]);
            if (!is_numeric($promotion_year)) {
              displayJsonError("L'année de promotion doit être un nombre.");
            }
          } else {
            displayJsonError("L'année de promotion doit être renseignée dans le cas où vous êtes un ancien élève.");
          }
        }
        $promotion = $_POST["promotion"] ?? null;
        if ($promotion == null && $status == "student") {
          displayJsonError("La promotion doit être renseignée dans le cas où vous êtes un élève.");
        }

        $phone_number = htmlspecialchars($_POST["phone_number"]);
        $email = strtolower(filter_var($_POST["email"], FILTER_SANITIZE_EMAIL));
        $password = htmlspecialchars($_POST["password"]);
        if(strlen($password) < 8) {
          displayJsonError("Le mot de passe doit contenir au moins 8 caractères.");
        }
        $password_confirm = htmlspecialchars($_POST["confirmpassword"]);
        $display_on_map = isset($_POST["display_on_map"]) ? 1 : 0;
        $display_in_list = isset($_POST["display_in_list"]) ? 1 : 0;
        $company = isset($_POST["company"]) ? htmlspecialchars($_POST["company"]) : "";

        // Check if family family_comes, then family_count = 0, else use family_count value and check for it to be an int
        $family_comes = isset($_POST["family_comes"]) ? 1 : 0;
        $family_count = ($family_comes == 1) ? 0 : htmlspecialchars($_POST["family_count"]);
        if ($family_comes == 1) {
          $family_count = 0;
        } else {
          if (!is_numeric($family_count)) {
            displayJsonError("Le nombre de personnes doit être un nombre.");
          }
        }

        $city = isset($_POST["city"]) ? htmlspecialchars($_POST["city"]) : "";

        $user = $this->handleRegistration($lastname, $firstname, $email, $password, $password_confirm, $phone_number, $city, $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, false, $status);
        if (gettype($user) == "object") {
          $user->sendConfirmationEmail();
          header('Location: ' . APP_URL . '/?notification=register_success');
        } else {
          displayJsonError($user);
        }

      }
    }
    displayJsonError("Veuillez remplir tous les champs.");
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
  public function forgotPassword($token = "noreset"): void
  {
    shouldNotBeLoggedIn();
    global $smarty;

    if ($token != "noreset") {
      $tokenObj = new resetToken();

      if ($tokenObj->verify($token)) {
        if (isset($_POST["actionType"]) && $_POST["actionType"] == "resetPassword") {
          if (isset($_POST["password"]) && isset($_POST["password_confirm"])) {
            $password = htmlspecialchars($_POST["password"]);
            $password_confirm = htmlspecialchars($_POST["password_confirm"]);
            if ($password == $password_confirm) {
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
            displayJsonError("_success"); // No error
          } else {
            displayJsonError("Aucun utilisateur n'a été trouvé avec cette adresse email.");
          }
        } else {
          displayJsonError("Veuillez remplir tous les champs.");
        }
      }
    }
    echo json_encode(array("error"=>"Veuillez remplir tous les champs."));
    exit();
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


