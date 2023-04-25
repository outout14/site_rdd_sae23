<?php

/*
  User Model
*/

require_once __DIR__ . '/../../Core/app/mysqlConnector.php';

$mysqlConnector = new mysqlConnector();
$mysqlConnection = $mysqlConnector->connect();

class User {
  public int $id;
  public string $lastname;
  public string $firstname;
  public string $email;
  private string $password;
  public string $phone_number;
  public string $city;
  public bool $display_on_map;
  public bool $confirmed;
  public string $status;
  public string $role;

  public function __construct($id = null, $lastname = null, $firstname = null, $email = null, $password = null, $phone_number = null, $city = null, $display_on_map = false, $confirmed = false, $status = "student", $role = "user") {
    $this->id = $id;
    $this->lastname = $lastname;
    $this->firstname = $firstname;
    $this->email = $email;
    $this->password = $password;
    $this->phone_number = $phone_number;
    $this->city = $city;
    $this->display_on_map = $display_on_map;
    $this->confirmed = $confirmed;
    $this->status = $status;
    $this->role = $role;
  }
  public function create(): void{
    /* INSERT INTO DATABASE */
    global $mysqlConnection;
    $query = "INSERT INTO users (lastname, firstname, email, password, phone_number, city, display_on_map, confirmed, status, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("ssssssssss", $this->lastname, $this->firstname, $this->email, $this->password, $this->phone_number, $this->city, $this->display_on_map, $this->confirmed, $this->status, $this->role);
    $stmt->execute();

    /* GET ID */
    $this->id = $mysqlConnection->insert_id;
    $stmt->close();
  }

  public function get($id): bool {
    /* GET USER FROM DATABASE */
    global $mysqlConnection;
    $query = "SELECT * FROM users WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    $response = $result->fetch_assoc();

    if ($response == null) {
      return false;
    }

    // Assign result to properties
    $this->id = $response['id'];
    $this->lastname = $response['lastname'];
    $this->firstname = $response['firstname'];
    $this->email = $response['email'];
    $this->password = $response['password'];
    $this->phone_number = $response['phone_number'];
    $this->city = $response['city'];
    $this->display_on_map = $response['display_on_map'];
    $this->confirmed = $response['confirmed'];
    $this->status = $response['status'];
    $this->role = $response['role'];
    return true;
  }

  public function updatePassword($id, $password): void {
    /* UPDATE PASSWORD IN DATABASE */
    global $mysqlConnection;
    $query = "UPDATE users SET password = ? WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("si", $password, $id);
    $stmt->execute();
    $stmt->close();
  }

  public function update($id, $lastname, $firstname, $email, $phone_number, $city, $display_on_map, $confirmed, $status, $role): void {
    /* UPDATE USER IN DATABASE */
    global $mysqlConnection;
    $query = "UPDATE users SET lastname = ?, firstname = ?, email = ?, phone_number = ?, city = ?, display_on_map = ?, confirmed = ?, status = ?, role = ? WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("sssssssssi", $lastname, $firstname, $email, $phone_number, $city, $display_on_map, $confirmed, $status, $role, $id);
    $stmt->execute();
    $stmt->close();
  }

  public function delete($id): void {
    /* DELETE USER FROM DATABASE */
    global $mysqlConnection;
    $query = "DELETE FROM users WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
  }

  public function confirm($id): void {
    /* CONFIRM USER IN DATABASE */
    global $mysqlConnection;
    $query = "UPDATE users SET confirmed = ? WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $var1 = "true";
    $stmt->bind_param("si", $var1, $id);
    $stmt->execute();
    $stmt->close();
  }

  public function verifyPassword($password): bool {
    /* VERIFY PASSWORD */
    return password_verify($password, $this->password);
  }

  public static function getAllUsers(): array {
    global $mysqlConnection;
    $query = "SELECT * FROM users";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    // MAP IT TO user OBJECTS
    $users = [];
    while ($row = $result->fetch_assoc()) {
      $users[] = new User($row['id'], $row['lastname'], $row['firstname'], $row['email'], $row['password'], $row['phone_number'], $row['city'], $row['display_on_map'], $row['confirmed'], $row['status'], $row['role']);
    }
    return $users;
  }

  public function checkEmailCompliance($email): bool {
    if($this->status == "student") {
      if(!preg_match("\b[A-Za-z0-9._%+-]+@etudiant\.univ-rennes1\.fr\b", $email)) {
        return false;
      }
    }
    return true;
  }
}


function migrate(): void {
  /*
    Create the users table
  */
  global $mysqlConnection;
  $query = "CREATE TABLE users (
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
    role VARCHAR(30) NOT NULL DEFAULT 'user'
  )";
  $stmt = $mysqlConnection->prepare($query);
  $stmt->execute();
  $stmt->close();
}
