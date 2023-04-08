<?php

/*
  MySQL Connector
  This file is used to connect to the MySQL database.
*/

// Load the config file
require_once(__DIR__ . '/../../config/config.php');

/*
  MySQL Connector class
  This class is used to connect to the MySQL database.

  Arguments : None
  Returns   : MySQLi connection object
*/
class mysqlConnector {
  private string $host;
  private string $user;
  private string $password;
  private string $database;
  private int $port;
  private string $charset;


  public function __construct() {
    $this->host = MYSQL_HOST;
    $this->user = MYSQL_USER;
    $this->password = MYSQL_PASSWORD;
    $this->database = MYSQL_DATABASE;
    $this->port = MYSQL_PORT;
    $this->charset = MYSQL_CHARSET;
  }

  public function connect() {
    $this->connection = new mysqli($this->host, $this->user, $this->password, $this->database, $this->port);

    if ($this->connection->connect_error) {
      die('Connection failed: ' . $this->connection->connect_error);
    }

    $this->connection->set_charset($this->charset);

    return $this->connection;
  }
}
