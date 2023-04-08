<?php

// This file is used to initialize the application by starting the smarty engine and the database connection.

// Start the session
session_start();

// Load the config file
require_once(__DIR__ . '/../../config/config.php');

// Load the Smarty engine
require_once(__DIR__ . '/../../vendor/smarty/smarty/libs/Smarty.class.php');

// Load the MySQL connector
// require_once(__DIR__ . '/mysqlConnector.php');

// Start the Smarty engine
$smarty = new Smarty();

// Fix md5 issue with Smarty : https://stackoverflow.com/questions/10000000/smarty-security-error-modifier-md5-is-not-allowed
$smarty->assign('APP_URL', APP_URL);

// Start the MySQL connection
// $mysqlConnector = new mysqlConnector();
// $mysqlConnection = $mysqlConnector->connect();

// Set the timezone
date_default_timezone_set(APP_TIMEZONE);

// Set the debug mode
if (APP_DEBUG) {
    $smarty->debugging = true;
    $smarty->caching = false;
    $smarty->cache_lifetime = 120;
}

// Set the environment
if (APP_ENV == 'development') {
    $smarty->force_compile = true;
}

// Set the template directory
$smarty->setTemplateDir(__DIR__ . '/../../app/Views/');
$smarty->setCompileDir(__DIR__ . '/../../app/Views/templates_c/');
$smarty->setCacheDir(__DIR__ . '/../../app/Views/cache/');
$smarty->setConfigDir(__DIR__ . '/../../app/Views/configs/');

// connexionMiddleware.php is used to check if the user is logged in or not.
require_once __DIR__ . '/connexionMiddleware.php';
