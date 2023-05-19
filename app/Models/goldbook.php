<?php
/*
  User Model
*/

require_once __DIR__ . '/../../Core/app/mysqlConnector.php';
require_once __DIR__ . '/resetToken.php';

$mysqlConnector = new mysqlConnector();
$mysqlConnection = $mysqlConnector->connect();

class goldbook {
    public int $id;
    public string $title;
    public string $content;
    public string $author;
    public string $date;


    public function __construct($id=0, $title = "Titre", $content = "Contenu", $author="auteur", $date=""){
        $this->id = $id;
        $this->title = $title;
        $this->content = $content;
        $this->author = $author;
        $this->date = $date;
    }

}