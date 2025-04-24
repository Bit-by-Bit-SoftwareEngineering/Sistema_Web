<?php
// filepath: c:\xampp\htdocs\VENTAS\prueba_correo.php

require_once __DIR__ . '/../models/mainModel.php';

use app\models\mainModel;

// Crear una instancia de mainModel
$mainModel = new mainModel();

// Probar el envío de correo
$resultado = $mainModel->enviarCorreo(
    'andres.urquidi@ucb.edu.bo', // Cambia por un correo válido
    'Prueba de correo',
    '<p>Este es un correo de prueba enviado desde <strong>FarmaVida</strong>.</p>'
);

// Mostrar el resultado
if ($resultado) {
    echo "Correo enviado correctamente.";
} else {
    echo "Error al enviar el correo.";
}