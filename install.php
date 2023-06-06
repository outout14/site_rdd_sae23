<?php
require "config/config.php";

// Load the bootstrap file
require_once(__DIR__ . '/Core/app/bootstraper.php');

echo("<p>IF YOU WANTED TO RECREATE TABLES (THERE MIGHT BE AN ERROR) : <a href='install.php?reset'>CLICK HERE</a></p>");

if(isset($_GET["reset"])){
  global $mysqlConnection;
  $tables = ["users", "reset_tokens"];
  foreach ($tables as $table) {
    $query = "DROP TABLE IF EXISTS $table;";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->execute();
    $stmt->close();
    echo("DONE : CLEAR TABLE $table<br>");
  }
}
// Create the user table

function migrateUserDB(): void {
  global $mysqlConnection;
  $query = "CREATE TABLE `users` (
  `id` int(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `city` varchar(30) NOT NULL,
  `display_on_map` tinyint(1) NOT NULL DEFAULT 0,
  `display_in_list` tinyint(1) NOT NULL DEFAULT 0,
  `has_paid` tinyint(1) NOT NULL DEFAULT 0,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(30) NOT NULL DEFAULT 'student',
  `role` varchar(30) NOT NULL DEFAULT 'user',
  `promotion` varchar(4) NOT NULL,
  `family_count` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `promotion_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";
  $stmt = $mysqlConnection->prepare($query);
  $stmt->execute();
  $stmt->close();
}

try {
  migrateUserDB();
  echo("<p>DONE : RUN USER DB MIGRATION</p>");
} catch (Exception $e) {
  echo("<p>ERROR : RUN USER DB MIGRATION</p>");
}

function migrateTokenDB(): void {
  global $mysqlConnection;
  $query = "CREATE TABLE reset_tokens (
      id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      token VARCHAR(64) NOT NULL,
      user_id INT(6) NOT NULL,
      expiration_date DATETIME NOT NULL
    )";
  $mysqlConnection->query($query);
}

try {
  migrateTokenDB();
  echo("<p>DONE : RUN TOKEN DB MIGRATION</p>");
} catch (Exception $e) {
  echo("<p>ERROR : RUN TOKEN DB MIGRATION</p>");
}

function migrateGoldbookDB(): void {
  global $mysqlConnection;
  $query = "CREATE TABLE `goldbook` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `date` date NOT NULL,
  `is_validate` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
";
  $mysqlConnection->query($query);
}

try {
  migrateGoldbookDB();
  echo("<p>DONE : RUN GOLDBOOK DB MIGRATION</p>");
} catch (Exception $e) {
  echo("<p>ERROR : RUN GOLDBOOK DB MIGRATION</p>");
}
