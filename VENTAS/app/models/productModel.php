<?php
namespace app\models;

use PDO;

class productModel {
    private $db;

    public function __construct() {
        try {
            // Conectar a la base de datos
            $this->db = new PDO('mysql:host=localhost;dbname=proyecto5', 'root', '');
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            // Manejar errores de conexión
            echo 'Error de conexión: ' . $e->getMessage();
            exit;
        }
    }

    public function obtenerProductos() {
        try {
            // Preparar y ejecutar la consulta
            $stmt = $this->db->prepare("SELECT producto_id, producto_nombre, producto_precio_venta, producto_foto, producto_marca, producto_modelo FROM producto");
            $stmt->execute();
            // Devolver los resultados
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            // Manejar errores de consulta
            echo 'Error en la consulta: ' . $e->getMessage();
            return [];
        }
    }
    public function obtenerProductoPorId($id) {
        try {
            // Preparar y ejecutar la consulta
            $stmt = $this->db->prepare("SELECT producto_id, producto_nombre, producto_precio_venta FROM producto WHERE producto_id = :id");
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            // Manejar errores de consulta
            echo 'Error en la consulta: ' . $e->getMessage();
            return false;
        }
    }
    
}
