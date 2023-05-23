<?php

  class resetToken {
    private int $id;
    private string $token;
    private int $user_id;
    private string $expiration_date;

    public function __constructor($id = 0, $token = "", $user_id = 0, $expiration_date = "") {
      $this->id = $id;
      $this->token = $token;
      $this->user_id = $user_id;
      $this->expiration_date = $expiration_date;
    }

    static public function generateToken($user_id): string {
      $resetToken = new resetToken();
      $resetToken->token = bin2hex(random_bytes(32));
      $resetToken->user_id = $user_id;
      $resetToken->expiration_date = date("Y-m-d H:i:s", strtotime("+10 minutes"));
      $resetToken->create();
      return $resetToken->token;
    }

    private function create(): void{
      global $mysqlConnection;
      $query = "INSERT INTO reset_tokens (token, user_id, expiration_date) VALUES (?, ?, ?)";
      $stmt = $mysqlConnection->prepare($query);
      $stmt->bind_param("sis", $this->token, $this->user_id, $this->expiration_date);
      $stmt->execute();
      $this->id = $mysqlConnection->insert_id;
      $stmt->close();
    }

    public function delete(): bool {
      global $mysqlConnection;
      $query = "DELETE FROM reset_tokens WHERE id = ?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt->bind_param("i", $this->id);
      $stmt->execute();
      $stmt->close();
      return true;
    }

    public function getFromUserID($userId): bool {
      global $mysqlConnection;
      $query = "SELECT * FROM reset_tokens WHERE user_id = ?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt->bind_param("i", $userId);
      $stmt->execute();
      $result = $stmt->get_result();
      $stmt->close();
      if ($result->num_rows === 0) {
        return false;
      } else {
        $row = $result->fetch_assoc();
        $this->id = $row["id"];
        $this->token = $row["token"];
        $this->user_id = $row["user_id"];
        $this->expiration_date = $row["expiration_date"];
        return true;
      }
    }

    public function verify($token): bool {
      global $mysqlConnection;
      $query = "SELECT * FROM reset_tokens WHERE token = ?";
      $stmt = $mysqlConnection->prepare($query);
      $stmt->bind_param("s", $token);
      $stmt->execute();
      $result = $stmt->get_result();
      $stmt->close();
      if ($result->num_rows === 0) {
        return false;
      } else {
        $row = $result->fetch_assoc();
        $this->expiration_date = $row["expiration_date"];
        $this->id = $row["id"];
        // Check if the token has expired (more than 10 minutes)
        if(strtotime($this->expiration_date) < strtotime(date("Y-m-d H:i:s"))){
          $this->delete();
          return false;
        }

        $this->token = $row["token"];
        $this->user_id = $row["user_id"];

        #$this->drop(); // Drop token after verification
        return true;
      }
    }

    public function getUserId(): int {
      return $this->user_id;
    }

  }

