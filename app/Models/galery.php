<?php
/*
    Galery Model
*/

require_once __DIR__ . '/../../Core/app/mysqlConnector.php';
require_once __DIR__ . '/resetToken.php';

$mysqlConnector = new mysqlConnector();
$mysqlConnection = $mysqlConnector->connect();

class galerie {
    public int $id;
    public string $date;
    public string $author;
    public string $filename;
    public bool $validate;

    public function __construct($id=0, $date="", $author="auteur", $filename="", $validate=false){
        $this->id = $id;
        $this->date = $date;
        $this->author = $author;
        $this->filename = $filename;
        $this->validate = $validate;
    }
}

?>