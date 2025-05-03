<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__ . '/../../../vendor/autoload.php';

// Cargar configuración SMTP
$smtp = require __DIR__ . '/../../../config/smtp_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $mensaje = htmlspecialchars($_POST['message']);

    $mail = new PHPMailer(true);

    try {
        // Configuración SMTP
        $mail->isSMTP();
        $mail->Host = $smtp['host'];
        $mail->SMTPAuth = true;
        $mail->Username = $smtp['username'];
        $mail->Password = $smtp['password'];
        $mail->SMTPSecure = $smtp['encryption'];
        $mail->Port = $smtp['port'];

        $mail->setFrom($smtp['from_email'], $smtp['from_name']);
        $mail->addAddress($smtp['from_email'], $smtp['from_name']);
        $mail->addReplyTo($email, $nombre);

        $mail->Subject = 'Nuevo mensaje de contacto desde FarmaVida';
        $mail->Body = "Nombre: $nombre\nCorreo: $email\nMensaje:\n$mensaje";
        $mail->CharSet = 'UTF-8';

        $mail->send();
        echo "<script>alert('Mensaje enviado correctamente.');window.location.href='?views=home#contactos';</script>";
    } catch (Exception $e) {
        echo "<script>alert('Error al enviar el mensaje: {$mail->ErrorInfo}');window.location.href='?views=home#contactos';</script>";
    }
} else {
    header("Location: ?views=home#contactos");
    exit();
}
?>