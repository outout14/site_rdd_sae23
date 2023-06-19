<?php

// This file is used to initialize the application by starting the smarty engine and the database connection.

// connexionMiddleware.php is used to check if the user is logged in or not.
require_once __DIR__ . '/connexionMiddleware.php';

// Start the session
session_start();

// Load the config file
require_once(__DIR__ . '/../../config/config.php');

// Load utils
require_once(__DIR__ . '/utils.php');

// Load the Smarty engine
require_once(__DIR__ . '/../../vendor/autoload.php');

// Load the MySQL connector
// require_once(__DIR__ . '/mysqlConnector.php');

// Start the Smarty engine
$smarty = new Smarty();

// Fix md5 issue with Smarty : https://stackoverflow.com/questions/10000000/smarty-security-error-modifier-md5-is-not-allowed
$smarty->assign('APP_URL', APP_URL);
$smarty->assign('HCAPTCHA_SITEKEY', HCAPTCHA_SITEKEY);
$smarty->assign('HCAPTCHA_KEY', HCAPTCHA_KEY);

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

$smarty->registerPlugin('modifier', 'capitalize', 'fixUTF8capizalize');

// Custom modifier function
function fixUTF8capizalize($lastname)
{
    // Unescape the string
    $lastname = html_entity_decode($lastname, ENT_QUOTES, 'UTF-8');
    // Capitalize the string
    $lastname = mb_convert_case($lastname, MB_CASE_TITLE, "UTF-8");
    // Escape the string
    $lastname = htmlentities($lastname, ENT_QUOTES, 'UTF-8');
    // Return the string
    return $lastname;
}

// notificationManager.php is used to manage the notifications.
require_once __DIR__ . '/notificationManager.php';

// mailManager.php is used to manage the mails.
require_once __DIR__ . '/mailManager.php';
$mailManager = new MailManager();
