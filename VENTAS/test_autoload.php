<?php
require_once __DIR__ . '/vendor/autoload.php';

use Cloudinary\Cloudinary;

$cloudinary = new Cloudinary([
    'cloud' => [
        'cloud_name' => 'dm8wttrjo',
        'api_key'    => '676383937222143',
        'api_secret' => 'P-fna8U7o0atkjFygofLR5DtW1M',
    ],
]);

if (class_exists('Cloudinary\Cloudinary')) {
    echo "Cloudinary\Cloudinary cargada correctamente<br>";

    // Prueba subir una imagen si existe test.jpg
    $ruta_imagen = __DIR__ . '/app/pruebas/test.jpg';
    if (file_exists($ruta_imagen)) {
        $resultado = $cloudinary->uploadApi()->upload($ruta_imagen);
        echo "Imagen subida correctamente.<br>";
        echo "URL segura: <a href='" . $resultado['secure_url'] . "' target='_blank'>" . $resultado['secure_url'] . "</a>";
    } else {
        echo "No se encontró test.jpg en app/pruebas/";
    }
} else {
    echo "NO se pudo cargar Cloudinary\Cloudinary";
}