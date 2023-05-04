<?php
require "config/config.php";

// Load the bootstrap file
require_once(__DIR__ . '/Core/app/bootstraper.php');

// Create the user table

function migrateUserDB(): void {
  global $mysqlConnection;
  $query = "CREATE TABLE IF NOT EXISTS users (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(30) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    city VARCHAR(30) NOT NULL,
    display_on_map BOOLEAN NOT NULL DEFAULT false,
    confirmed BOOLEAN NOT NULL DEFAULT false,
    status VARCHAR(30) NOT NULL DEFAULT 'student',
    role VARCHAR(30) NOT NULL DEFAULT 'user',
    passwordResetToken VARCHAR(255) DEFAULT NULL
  )";
  $stmt = $mysqlConnection->prepare($query);
  $stmt->execute();
  $stmt->close();
}

//migrateUserDB();

function migrateTokenDB(): void {
  global $mysqlConnection;
  $query = "CREATE TABLE IF NOT EXISTS reset_tokens (
      id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      token VARCHAR(64) NOT NULL,
      user_id INT(6) NOT NULL,
      expiration_date DATETIME NOT NULL
    )";
  $mysqlConnection->query($query);
}
migrateTokenDB();
