<?php
namespace app\models;

use PDO;
use PDOException;

class pedidoModel {
    private $db;

    public function __construct() {
        try {
            // Conectar a la base de datos
            $this->db = new PDO('mysql:host=localhost;dbname=proyecto5', 'root', 'root');
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            // Manejar errores de conexión
            echo 'Error de conexión: ' . $e->getMessage();
            exit;
        }
    }

    public function guardarPedido($productos, $total) {
        $query = $this->db->prepare("INSERT INTO pedido (total) VALUES (:total)");
        $query->bindParam(':total', $total, PDO::PARAM_STR);

        if ($query->execute()) {
            $pedidoId = $this->db->lastInsertId(); // Obtener el ID del pedido insertado

            // Insertar los productos asociados al pedido
            foreach ($productos as $producto) {
                $query = $this->db->prepare("INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad) VALUES (:pedido_id, :producto_id, :cantidad)");
                $query->bindParam(':pedido_id', $pedidoId, PDO::PARAM_INT);
                $query->bindParam(':producto_id', $producto['id'], PDO::PARAM_INT);
                $query->bindParam(':cantidad', $producto['cantidad'], PDO::PARAM_INT);
                $query->execute();
            }

            return true;
        } else {
            return false;
        }
    }

    public function obtenerDetallePedido($idPedido) {
        $sql = "SELECT * FROM pedido WHERE id = :idPedido";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(":idPedido", $idPedido, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Método para obtener todos los detalles de pedido
    public function obtenerTodosLosDetallesPedido() {
        $query = $this->db->prepare("SELECT * FROM detalle_pedido");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    // Nuevo método para obtener detalles de pedidos por estado
    public function obtenerDetallesPedidoPorEstado($estado) {
        $query = $this->db->prepare("
            SELECT dp.*
            FROM detalle_pedido dp
            INNER JOIN pedido p ON dp.codigo_pedido = p.codigo_pedido
            WHERE p.estado = :estado
        ");
        $query->bindParam(':estado', $estado, PDO::PARAM_STR);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    // Método para actualizar datos de manera genérica
    public function actualizarDatos($tabla, $datos, $condicion) {
        // Construir la cadena de campos a actualizar
        $campos = "";
        foreach ($datos as $key => $value) {
            $campos .= "$key=:$key,";
        }
        $campos = rtrim($campos, ",");

        // Construir la consulta SQL
        $query = "UPDATE $tabla SET $campos WHERE $condicion";
        $stmt = $this->db->prepare($query);

        // Vincular los valores a los parámetros
        foreach ($datos as $key => $value) {
            $stmt->bindValue(":$key", $value);
        }

        // Ejecutar la consulta
        return $stmt->execute();
    }

}
