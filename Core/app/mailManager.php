<?php

/*
 * mailManager.php
 * Manage mail sending with PHPMailer
 */

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class mailManager {
  private PHPMailer $mail;
  public function __construct() {
    //Server settings
    $this->mail = new PHPMailer(APP_DEBUG);

    #$this->mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
    $this->mail->isSMTP();                                            //Send using SMTP
    $this->mail->Host       = SMTP_HOST;                     //Set the SMTP server to send through
    $this->mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $this->mail->Username   = SMTP_USERNAME;                     //SMTP username
    $this->mail->Password   = SMTP_PASSWORD;                               //SMTP password
    $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
    $this->mail->Port       = 465;
    $this->mail->CharSet = 'UTF-8'; // Fix UTF-8 issue
  }

  public function sendMail(string $to, string $subject, string $template_file, array $args = []): bool {
    try {
      //Recipients
      $this->mail->setFrom(SMTP_USERNAME, MAIL_AUTHOR);
      $this->mail->addAddress($to);     //Add a recipient
      $this->mail->addReplyTo(MAIL_REPLYTO, MAIL_REPLYTO_NAME);

      //Content
      $this->mail->isHTML();                                  //Set email format to HTML
      $this->mail->Subject = $subject;
      // Load smarty template
      global $smarty;
      $smarty->assign("args", $args);

      $body = $smarty->fetch("mail/" . $template_file);
      //DIsplay smarty template
      $this->mail->Body = $body;
      $this->mail->AltBody = 'This email is in HTML format; if you see this, your email client does not support HTML. Please contact ' . MAIL_REPLYTO . ' for more information.';
      $this->mail->send();
      return true;
    } catch (Exception) {
      echo "Message could not be sent. Mailer Error: {$this->mail->ErrorInfo}";
      return false;
    }
  }
}
