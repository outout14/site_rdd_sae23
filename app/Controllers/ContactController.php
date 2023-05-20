<?php

// Load the bootstrap file
require_once(__DIR__ . '/../../Core/app/bootstraper.php');
require_once(__DIR__ . '/../Models/user.php');


/*
 * ContactController
 * Used for the contact form and the contact page
 */

class ContactController {
  public function sendMessage(): void
  {
    if(Utils::CheckForInputs(array("actionType", "message", "email"))){
      $actionType = htmlentities($_POST["actionType"]);
      if($actionType != "sendMessage"){
        Utils::DisplayJsonError("Requête invalide.");
      }
      $message = htmlentities($_POST["message"]);
      if(!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)){
        Utils::DisplayJsonError("Adresse email invalide.");
      }
      $email = htmlentities($_POST["email"]);
      global $mailManager;
      $mailManager->sendMail(MAIL_REPLYTO, "Nouveau message de " . $email, "newMessage.tpl", ["message" => $message, "email" => $email]);
      Utils::DisplayJsonError("_success");
    } else {
      Utils::DisplayJsonError("Veuillez remplir tous les champs.");
    }
  }
}
