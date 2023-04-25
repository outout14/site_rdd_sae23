<?php

/*
  getLogin() : ?object
  This method checks if the user is logged in.
  If so it returns the user object.
  If not it returns null.
*/

require_once __DIR__ . '/../../app/Models/user.php';

function getLoginUser(): ?User
{
  return $_SESSION['user'] ?? null;
}

/*
  checkLoggedIn() : void
  This method checks if the user is logged in.
  If not it redirects the user to the login page.
*/
function checkLoggedIn(): void
{
  if (!isset($_SESSION['user'])) {
    header('Location: ' . APP_URL . '/login');
    exit();
  }
}

/*
 checkUserAdmin() : ?User
  This method checks if the user is logged in and if the user is an admin.
  If so it returns the user object.
  If not it returns null.
*/
function checkUserAdmin(): ?User
{
  if (isset($_SESSION['user']) && $_SESSION['user']->role == 'admin') {
    return $_SESSION['user'];
  } else {
    return null;
  }
}

/*
  logout() : void
  This method logs out the user.
*/
function logout(): void
{
  session_destroy();
  header('Location: ' . APP_URL . '/login');
  exit();
}
