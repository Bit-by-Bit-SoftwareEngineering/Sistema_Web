<?php
require_once __DIR__ . '/../../config/cloudinary.php';

use Cloudinary\Uploader;

try {
    // Cambia el nombre si tu imagen no se llama test.jpg
    $ruta_imagen = __DIR__ . '/test.jpg';

    if (!file_exists($ruta_imagen)) {
        die("No se encontró la imagen de prueba en: $ruta_imagen");
    }

    $resultado = Uploader::upload($ruta_imagen);
    echo "Imagen subida correctamente.<br>";
    echo "URL segura: <a href='" . $resultado['secure_url'] . "' target='_blank'>" . $resultado['secure_url'] . "</a>";
} catch (Exception $e) {
    echo "Error al subir la imagen: " . $e->getMessage();
}
?>