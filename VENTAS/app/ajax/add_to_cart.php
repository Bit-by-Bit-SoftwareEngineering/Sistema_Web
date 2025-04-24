<?php
session_start();
header('Content-Type: application/json');
use app\controllers\productController;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


// Verificar si se recibió un ID de producto
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['productId'])) {
        $productId = intval($data['productId']);
        
        // Consultar la base de datos para obtener los detalles del producto
        require_once '../config/app.php';  // Ruta según la estructura del proyecto
        require_once '../autoload.php';    // Cargar los modelos necesarios

        
        $productController = new productController();
        $product = $productController->obtenerProductoPorId($productId);

        if ($product) {
            // Verificar si el carrito ya existe en la sesión
            if (!isset($_SESSION['cart'])) {
                $_SESSION['cart'] = [];
            }

            // Añadir el producto al carrito
            $_SESSION['cart'][$productId] = [
                'id' => $productId,
                'name' => $product['producto_nombre'],
                'cantidad' => isset($_SESSION['cart'][$productId]) ? $_SESSION['cart'][$productId]['cantidad'] + 1 : 1,
                'precio' => $product['producto_precio_venta']
            ];

            // Respuesta exitosa
            echo json_encode(['success' => true, 'message' => 'Producto añadido al carrito']);
        } else {
            // Producto no encontrado
            echo json_encode(['success' => false, 'error' => 'Producto no encontrado']);
        }
    } else {
        // Error de ID de producto no proporcionado
        echo json_encode(['success' => false, 'error' => 'ID de producto no proporcionado']);
    }
} else {
    // Método no permitido
    http_response_code(405);
    echo json_encode(['success' => false, 'error' => 'Método no permitido']);
}
