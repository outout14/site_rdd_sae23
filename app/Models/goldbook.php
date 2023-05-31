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
    public User $author;
    public string $date;
    public string $is_validate;


    public function __construct($id=0, $title = "Titre", $content = "Contenu", $author="auteur", $date="", $is_validate=""){
        $this->id = $id;
        $this->title = $title;
        $this->content = $content;
        $this->author = $author;
        $this->date = $date;
        $this->is_validate=$is_validate;
    }

    public function push(): void{
      /* INSERT INTO DATABASE */
      global $mysqlConnection;
      $query = "INSERT INTO goldbook (title, content, author, date, is_validate) VALUES (?,?,?,?,?)";
      $stmt = $mysqlConnection->prepare($query);
      // Pass variables to the statement
      $stmt->bind_param("ssisi", $this->title, $this->content, $this->author->id, $this->date, $this->is_validate);
      $stmt->execute();
  
      /* GET ID */
      $this->id = $mysqlConnection->insert_id;
      $stmt->close();
    }

    static function lister($verif): array{
      global $mysqlConnection;
      $query = "SELECT users.lastname, users.firstname, goldbook.content, goldbook.title, goldbook.date FROM goldbook INNER JOIN users ON goldbook.author = users.id WHERE is_validate=?;";
      $stmt = $mysqlConnection->prepare($query);
      $stmt -> bind_param("i", $verif);
      $stmt->execute();
      $result = $stmt->get_result();
      $stmt->close();
      while ($row = $result->fetch_assoc()) {
        $contenue[] = new goldbook(0, $row["title"], $row["content"], new user(0, $row["lastname"], $row["firstname"]), $row["date"] );
      }
      if(!isset($contenue)){
        return array();
      }
      return $contenue;
    }

}