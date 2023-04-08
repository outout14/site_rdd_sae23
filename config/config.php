<?php

/*
    Config file for the application.
    This file is loaded by the application and is used to set the configuration
    for the application.
*/

// Constants
define('APP_NAME', 'Site RDD');
define('APP_VERSION', '0.0.1');
define('APP_URL', '/site_rdd_sae23/public/'); // URL to the application
define('APP_TIMEZONE', 'UTC');

// Debug mode / environment
define('APP_ENV', 'development');
define('APP_DEBUG', true);

// Database
define('MYSQL_HOST', 'localhost');
define('MYSQL_USER', 'root');
define('MYSQL_PASSWORD', '');
define('MYSQL_DATABASE', 'myapp');
define('MYSQL_PORT', 3306);
define('MYSQL_CHARSET', 'utf8mb4');

// SMTP
define('SMTP_HOST', 'mail.gnous.eu');
define('SMTP_PORT', 587);
define('SMTP_USERNAME', 'rdd@enpls.org');
define('SMTP_PASSWORD', 'rdd123456');
define('SMTP_ENCRYPTION', 'tls');
