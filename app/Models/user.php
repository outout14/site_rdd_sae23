<?php

/*
  User Model
*/

require_once __DIR__ . '/../../Core/app/mysqlConnector.php';
require_once __DIR__ . '/resetToken.php';

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
  public string $promotion;
  public int $promotion_year;
  public int $family_count; // If 0, no family
  public string $company; // If work in a company

  public int $display_on_map;
  public int $display_in_list;
  public int $has_paid = 0; // If the user has paid for the event
  public int $confirmed;
  public string $status;
  public string $role;

  public function __construct($id = 0, $lastname = "", $firstname = "", $email = "", $password = "", $phone_number = "", $city = "", $family_count=0, $company="", $promotion="", $promotion_year=0, $display_in_list = 0, $display_on_map = 0, $confirmed = 0, $status = "student", $role = "user") {
    $this->id = $id;
    $this->lastname = $lastname;
    $this->firstname = $firstname;
    $this->email = $email;
    $this->password = $password;
    $this->phone_number = $phone_number;
    $this->city = $city;
    $this->family_count = $family_count;
    $this->company = $company;
    $this->promotion = $promotion;
    $this->promotion_year = $promotion_year;
    $this->display_on_map = $display_on_map;
    $this->display_in_list = $display_in_list;
    $this->confirmed = $confirmed;
    $this->status = $status;
    $this->role = $role;
  }
  private function create(): void{
    /* INSERT INTO DATABASE */
    global $mysqlConnection;
    $query = "INSERT INTO users (lastname, firstname, email, password, phone_number, city, family_count, company, promotion, promotion_year, display_in_list, display_on_map, confirmed, status, role) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    $stmt = $mysqlConnection->prepare($query);
    // Pass variables to the statement
    $stmt->bind_param("ssssssisssiiiss", $this->lastname, $this->firstname, $this->email, $this->password, $this->phone_number, $this->city, $this->family_count, $this->company, $this->promotion, $this->promotion_year, $this->display_in_list, $this->display_on_map, $this->confirmed, $this->status, $this->role);
    $stmt->execute();

    /* GET ID */
    $this->id = $mysqlConnection->insert_id;
    $stmt->close();
  }

  public function get($identifier): bool {
    /* GET USER FROM DATABASE */
    global $mysqlConnection;

    if (filter_var($identifier, FILTER_VALIDATE_EMAIL)) {
      // Get user by email
      $query = "SELECT * FROM users WHERE email = ?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt->bind_param("s", $identifier);
    } else {
      // Get user by id
      $query = "SELECT * FROM users WHERE id = ?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt->bind_param("i", $identifier);
    }

    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    $response = $result->fetch_assoc();

    if ($response == null) {
      return false;
    }

    // Assign result to properties
    $this->assignSQLdata($response);
    return true;
  }

  public function updatePassword($password): void {
    /* UPDATE PASSWORD IN DATABASE */
    global $mysqlConnection;
    $password = password_hash($password, PASSWORD_DEFAULT);
    $query = "UPDATE users SET password = ? WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("si", $password, $this->id);
    $stmt->execute();
    $stmt->close();
  }

  public function update($id, $lastname, $firstname, $email, $password, $phone_number, $city, $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, $confirmed, $status, $role): void {
    /* UPDATE USER IN DATABASE */
    global $mysqlConnection;
    $query = "UPDATE users SET lastname = ?, firstname = ?, email = ?, password = ?, phone_number = ?, city = ?, family_count = ?, company = ?, promotion = ?, promotion_year = ?, display_in_list = ?, display_on_map = ?, confirmed = ?, status = ?, role = ? WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->bind_param("ssssssisiiiissi", $lastname, $firstname, $email, $password, $phone_number, $city, $family_count, $company, $promotion , $promotion_year, $display_in_list, $display_on_map, $confirmed, $status, $role, $id);
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

  public function confirmEmail(): void {
    /* CONFIRM USER IN DATABASE */
    global $mysqlConnection;
    $query = "UPDATE users SET confirmed = ? WHERE id = ?";
    $stmt = $mysqlConnection->prepare($query);
    $var1 = 1;
    $stmt->bind_param("si", $var1, $this->id);
    $stmt->execute();
    $stmt->close();
  }

  public function isConfirmed(): bool {
    /* CHECK IF USER IS CONFIRMED */
    return $this->confirmed == 1;
  }

  public function verifyPassword($password): bool {
    /* VERIFY PASSWORD */
    return password_verify($password, $this->password);
    exit();
  }

  public static function getAll(): array {
    global $mysqlConnection;
    $query = "SELECT * FROM users";
    $stmt = $mysqlConnection->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    // MAP IT TO user OBJECTS
    $users = [];
    while ($row = $result->fetch_assoc()) {
      $users[] = new User($row['id'], $row['lastname'], $row['firstname'], $row['email'], $row['password'], $row['phone_number'], $row['city'], $row['family_count'], $row['company'], $row['promotion'], $row['promotion_year'], $row['display_in_list'], $row['display_on_map'], $row['confirmed'], $row['status'], $row['role']);
    }
    return $users;
  }

  

  function assignSQLdata($response){
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
    $this->family_count = $response['family_count'];
    $this->company = $response['company'];
    $this->promotion = $response['promotion'];
    $this->promotion_year = $response['promotion_year'];
    $this->display_in_list = $response['display_in_list'];
    $this->has_paid = $response['has_paid'];
  }

  function clearPasswordField(){
    $this->password = "";
  }

  public function sendConfirmationEmail(){
    global $mailManager;
    //Encrypt email to send it as a token
    $encryptedEmailToken = base64_encode(htmlentities(openssl_encrypt($this->email, "AES-128-ECB", MAIL_ENCRYPTION_TOKEN)));
    $encryptedEmailURL = "https://" . $_SERVER['SERVER_NAME'] . APP_URL . "/auth/confirmEmail/" . $encryptedEmailToken;
    $mailManager->sendMail($this->email, "Confirmation de votre compte", "verifyMail.tpl", ["user" => $this, "encryptedEmailURL" => $encryptedEmailURL]);
  }

  public function sendResetPasswordEmail(){
    global $mailManager;
    $resetToken = resetToken::generateToken($this->id);
    $encryptedEmailURL = "https://" . $_SERVER['SERVER_NAME'] . APP_URL . "/home/resetPassword/" . $resetToken;
    $mailManager->sendMail($this->email, "Réinitialisation de votre mot de passe", "resetPassword.tpl", ["user" => $this, "encryptedEmailURL" => $encryptedEmailURL]);
  }

  public static function register($lastname, $firstname, $email, $password, $phone_number, $city, $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, $confirmed, $status, $role): string | User {
    /* CHECK EMAIL & STATUS */
    if($status == "student" or $status == "teacher"){
      $validEmails = [
        "student" => "@gnous.eu", // TODO: Change to @univ-rennes1
        "teacher" => "@univ-rennes1.fr",
      ];
      if(!str_ends_with($email, $validEmails["student"]) && !str_ends_with($email, $validEmails["teacher"])){
        return "Si vous êtes un étudiant, votre email doit se terminer par " . $validEmails["student"] . ". Si vous êtes un enseignant, votre email doit se terminer par " . $validEmails["teacher"];
      } elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return "Email invalide";
      }
    }

    /* PHONE NUMBER CHECK */
    if(str_starts_with($phone_number, "+33")){
      $phone_number = "0" . substr($phone_number, 3);
    }
    if((strlen($phone_number)) == 9){
      $phone_number = "0" . $phone_number;
    }
    if((strlen($phone_number) != 10) or (!is_numeric($phone_number))){
      return "Numéro de téléphone invalide";
    }

    /* FAMILY COUNT CHECK */
    if($family_count < 0){
      return "Nombre de personnes dans le foyer invalide";
    }

    /* PROMOTION CHECK */
    if(strlen($promotion) != 4) {
      return "Promotion invalide";
    }

    $tmpUsr = new User();
    if ($tmpUsr->get($email) != null) {
      return "Email déjà utilisé";
    }

    $user = new User(0, strtolower($lastname), strtolower($firstname), strtolower($email), password_hash($password, PASSWORD_DEFAULT), $phone_number, strtolower($city), $family_count, $company, $promotion, $promotion_year, $display_in_list, $display_on_map, $confirmed, $status, $role);

    /* REGISTER USER */
    $user->create();
    return $user;
  }
}



