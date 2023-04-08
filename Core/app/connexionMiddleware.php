<?php

/*
  getLogin() : ?object
  This method checks if the user is logged in.
  If so it returns the user object.
  If not it returns null.
*/
function getLogin(): ?object
{
  return $_SESSION['user'] ?? null;
}

/*
  checkLogin() : void
  This method checks if the user is logged in.
  If not it redirects the user to the login page.
*/
function checkLogin(): void
{
  if (!isset($_SESSION['user'])) {
    header('Location: ' . APP_URL . '/login');
    exit();
  }
}

/*
 checkAdmin() : ?object
  This method checks if the user is logged in and if the user is an admin.
  If so it returns the user object.
  If not it returns null.
*/
function checkAdmin(): ?object
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
