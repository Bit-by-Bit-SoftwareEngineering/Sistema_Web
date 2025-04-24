<?php
namespace app\controllers;

session_start();

class cartController {
    
    public function addToCart($productId) {
        // Verifica si el ID del producto llegó
        if (!$productId) {
            return ['success' => false, 'error' => 'No se recibió el ID del producto'];
        }

        // Inicializar el carrito si no existe
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }

        // Verificar si el producto ya está en el carrito
        $productoYaEnCarrito = false;
        foreach ($_SESSION['cart'] as &$producto) {
            if ($producto['id'] == $productId) {
                // Incrementar la cantidad si el producto ya está en el carrito
                $producto['cantidad'] += 1;
                $productoYaEnCarrito = true;
                break;
            }
        }

        // Si el producto no está en el carrito, buscarlo en la base de datos
        if (!$productoYaEnCarrito) {
            // Cargar el modelo de producto
            require_once '../models/productModel.php';
            $productModel = new \app\models\productModel();
            $producto = $productModel->obtenerProductoPorId($productId);

            if ($producto) {
                $_SESSION['cart'][] = [
                    'id' => $producto['producto_id'],
                    'nombre' => $producto['producto_nombre'],
                    'precio' => $producto['producto_precio_venta'],
                    'cantidad' => 1,
                ];
            } else {
                return ['success' => false, 'error' => 'Producto no encontrado'];
            }
        }

        return ['success' => true, 'cart' => $_SESSION['cart']];
    }
}
