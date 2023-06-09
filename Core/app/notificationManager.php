<?php

// NotificationManager.php
// This file is used to manage notifications.

if (isset($_GET["notification"])) {
  $notification = $_GET["notification"];
  $notificationManager = new NotificationManager();
  $notificationManager->getNotification($notification);
}

class NotificationManager
{
  public function getNotification($notification): void
  {
    switch ($notification) {
      case 'userAdded': {
          $notification = array(
            'type' => 'success',
            'message' => 'L\'utilisateur a bien été ajouté.'
          );
          break;
        }
      case 'userEdited': {
          $notification = array(
            'type' => 'success',
            'message' => 'L\'utilisateur a bien été modifié.'
          );
          break;
        }
      case 'userDeleted': {
          $notification = array(
            'type' => 'success',
            'message' => 'L\'utilisateur a bien été supprimé.'
          );
          break;
        }
      case 'userPaid': {
          $notification = array(
            'type' => 'success',
            'message' => 'L\'utilisateur a payé.'
          );
          break;
        }
      case 'userNotFound': {
          $notification = array(
            'type' => 'danger',
            'message' => 'L\'utilisateur n\'a pas été trouvé.'
          );
          break;
        }
      case 'entryDeleted': {
          $notification = array(
            'type' => 'success',
            'message' => 'L\'entrée a bien été supprimée.'
          );
          break;
        }
      case 'entryEdited': {
          $notification = array(
            'type' => 'success',
            'message' => 'L\'entrée a bien été modifiée.'
          );
          break;
        }
      case 'tokenNotFound': {
          $notification = array(
            'type' => 'danger',
            'message' => 'Le token n\'a pas été trouvé.'
          );
          break;
        }
      case 'tokenAlreadyUsed': {
          $notification = array(
            'type' => 'danger',
            'message' => 'Le token a déjà été utilisé.'
          );
          break;
        }
      case 'tokenSuccess': {
          $notification = array(
            'type' => 'success',
            'message' => 'Le token a fonctionné.'
          );
          break;
        }
      case 'invalidPassword': {
          $notification = array(
            'type' => 'danger',
            'message' => 'Le mot de passe est invalide.'
          );
          break;
        }
      case 'profilUpdated': {
          $notification = array(
            'type' => 'success',
            'message' => 'Le profil a bien été mis à jour.'
          );
          break;
        }
      case 'login_required': {
          $notification = array(
            'type' => 'danger',
            'message' => 'Vous devez être connecté pour accéder à cette page.'
          );
          break;
        }
      case 'permission_denied': {
          $notification = array(
            'type' => 'danger',
            'message' => 'Vous n\'avez pas les permissions pour accéder à cette page.'
          );
          break;
        }
      case 'logout_success': {
          $notification = array(
            'type' => 'success',
            'message' => 'Vous avez bien été déconnecté.'
          );
          break;
        }
      case 'login_success': {
          $notification = array(
            'type' => 'success',
            'message' => 'Vous avez bien été connecté.'
          );
          break;
        }
      case 'forgot_password': {
          $notification = array(
            'type' => 'success',
            'message' => 'Un email vous a été envoyé.'
          );
          break;
        }
      case 'register_success': {
          $notification = array(
            'type' => 'success',
            'message' => 'Vous avez bien été enregistré.'
          );
          break;
        }
      case 'new_password': {
          $notification = array(
            'type' => 'success',
            'message' => 'Votre mot de passe a bien été modifié.'
          );
          break;
        }
      case 'contact_sent': {
          $notification = array(
            'type' => 'success',
            'message' => 'Votre message a bien été envoyé.'
          );
          break;
        }
      default: {
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