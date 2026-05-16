<?php
include('../dbcon.php'); // Adjust path if needed
require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';
$subject = "Test Subject";
$title   = "Notification Title";
$body_   = "This is a test email message.";

$response = sendEmail([
    'email' => "darrencelzo77@gmail.com",
    'subject' => $subject,
    'title' => $title,
    'message' => $body_,
]);

if (isset($response['success']) && $response['success'] === false) {
    echo "Email failed: " . $response['error'];
} else {
    echo "Email sent successfully to " . $response['email'];
}
