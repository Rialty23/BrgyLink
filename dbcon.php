<?php
//echo $_SERVER['REQUEST_URI']; 
error_reporting(0);
$hostname = 'localhost';
$dbname   = 'bmis';
$username = 'root';
$password = '';
global $db_connection;
$db_connection = mysqli_connect($hostname, $username, $password) or die('Connection to Database Server is failed, perhaps the service is down!');
$db = mysqli_select_db($db_connection, $dbname);


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once __DIR__ . '/email/PHPMailer/Exception.php';
require_once __DIR__ . '/email/PHPMailer/PHPMailer.php';
require_once __DIR__ . '/email/PHPMailer/SMTP.php';


function sendEmail(array $params = [])
{
    $defaults = [
        'email' => null,
        'subject' => null,
        'title' => null,
        'message' => null,
    ];

    $data = array_merge($defaults, $params);

    if (empty($data['email'])) {
        echo 'Email address is required.';
        return false;
    }

    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'penta2914@gmail.com';
        $mail->Password = 'nwbqujopyocvrumg';
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        $mail->setFrom('penta2914@gmail.com', 'BARANGAYLINK: A WEB - BASED INFORMATION SYSTEM Automated Email');
        $mail->addAddress($data['email']);

        $mail->isHTML(true);
        $mail->Subject = $data['subject'];
        $htmlMessage = "<h3>{$data['title']}</h3><p>{$data['message']}</p>";
        $mail->Body = $htmlMessage;

        $mail->send();

        // Just return the values for testing or response
        return [
            'email' => $data['email'],
            'subject' => $data['subject'],
            'title' => $data['title'],
            'message' => $data['message']
        ];
    } catch (Exception $e) {
        return [
            'success' => false,
            'error' => $mail->ErrorInfo
        ];
    }
}
