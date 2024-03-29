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
    public string $content;
    public User $author;
    public string $date;
    public int $is_validate;


    public function __construct($id=0, $content = "Contenu", $author="auteur", $date="", $is_validate=0){
        $this->id = $id;
        $this->content = $content;
        $this->author = $author;
        $this->date = $date;
        $this->is_validate=$is_validate;
    }

    public function push(): void{
      /* INSERT INTO DATABASE */
      global $mysqlConnection;
      $query = "INSERT INTO goldbook (content, author, date, is_validate) VALUES (?,?,?,?)";
      $stmt = $mysqlConnection->prepare($query);
      // Pass variables to the statement
      $stmt->bind_param("sisi", $this->content, $this->author->id, $this->date, $this->is_validate);
      $stmt->execute();
  
      /* GET ID */
      $this->id = $mysqlConnection->insert_id;
      $stmt->close();
    }

    static function lister($verif): array{
      global $mysqlConnection;
      $query = "SELECT goldbook.id, users.lastname, users.firstname, goldbook.content, goldbook.date, goldbook.is_validate FROM goldbook INNER JOIN users ON goldbook.author = users.id WHERE is_validate=?;";
      $stmt = $mysqlConnection->prepare($query);
      $stmt -> bind_param("i", $verif);
      $stmt->execute();
      $result = $stmt->get_result();
      $stmt->close();
      while ($row = $result->fetch_assoc()) {
        $contenue[] = new goldbook($row["id"], $row["content"], new user(0, $row["lastname"], $row["firstname"]), $row["date"], $row["is_validate"] );
      }
      if(!isset($contenue)){
        return array();
      }
      return $contenue;
    }

    static function validate($id): void{
      global $mysqlConnection;
      $query = "UPDATE goldbook SET is_validate=1 WHERE id=?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt -> bind_param("i", $id);
      $stmt->execute();
      $stmt->close();
    }

    static function delete($id): void{
      global $mysqlConnection;
      $query = "DELETE FROM goldbook WHERE id=?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt -> bind_param("i", $id);
      $stmt->execute();
      $stmt->close();
    }
    

    static function verif($id): string{
      global $mysqlConnection;
      $query = "SELECT * FROM goldbook WHERE author=?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt -> bind_param("i", $id);
      $stmt->execute();
      $result = $stmt->get_result();
      $stmt->close();
      $row = $result->fetch_assoc();
      if($result->num_rows==0){
        return "notsent";
      }
      else{
        if($row["is_validate"]==1){
          return "sent";
        }
        else{
          return "unvalid";
        }
      }
    }
}
