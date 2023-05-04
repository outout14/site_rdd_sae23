<?php

// NotificationManager.php
// This file is used to manage notifications.

if(isset($_GET["notification"])) {
  $notification = $_GET["notification"];
  $notificationManager = new NotificationManager();
  $notificationManager->getNotification($notification);
}

class NotificationManager
{
  public function getNotification($notification): void
  {
    switch ($notification) {
      case 'userAdded':
      {
        $notification = array(
          'type' => 'success',
          'message' => 'L\'utilisateur a bien été créé.'
        );
        break;
      }
      case 'userEdited':
      {
        $notification = array(
          'type' => 'success',
          'message' => 'L\'utilisateur a bien été modifié.'
        );
        break;
      }
      case 'userDeleted':
      {
        $notification = array(
          'type' => 'success',
          'message' => 'L\'utilisateur a bien été supprimé.'
        );
        break;
      }
      case 'userNotFound':
      {
        $notification = array(
          'type' => 'danger',
          'message' => 'L\'utilisateur n\'a pas été trouvé.'
        );
        break;
      }
      case 'login_required':
      {
        $notification = array(
          'type' => 'danger',
          'message' => 'Vous devez être connecté pour accéder à cette page.'
        );
        break;
      }
      case 'logout_success':
      {
        $notification = array(
          'type' => 'success',
          'message' => 'Vous avez bien été déconnecté.'
        );
        break;
      }
      case 'confirm_success' :
      {
        $notification = array(
          'type' => 'success',
          'message' => 'Votre compte a bien été confirmé.'
        );
        break;
      }
      case 'already_confirmed' :
      {
        $notification = array(
          'type' => 'danger',
          'message' => 'Votre compte a déjà été confirmé.'
        );
        break;
      }
      default :
      {
        $notification = array(
          'type' => 'danger',
          'message' => 'Une erreur est survenue.'
        );
        break;
      }
    }
    global $smarty;
    $smarty->assign('notification', $notification);
  }
}
