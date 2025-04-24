<?php

require_once "../../config/app.php";
require_once "../views/inc/session_start.php";
require_once "../../autoload.php";

use app\controllers\PedidoController;

header("Content-Type: application/json");

if (isset($_POST['estado'])) {
    $insPedido = new PedidoController();
    $estado = $_POST['estado'];

    // Llama a un método para listar los pedidos según el estado seleccionado
    echo $insPedido->listarTodosLosDetallesPedidoControlador($estado);
    exit();

} 
if (isset($_POST['modulo_pedido'])) {
    $insPedido = new PedidoController();

    /* Actualizar pedido */
    if ($_POST['modulo_pedido'] == "actualizar") {
        echo $insPedido->actualizarPedidoControlador();
        exit();
    }

    /* Eliminar pedido */
    if ($_POST['modulo_pedido'] == "eliminar") {
        echo $insPedido->eliminarPedidoControlador();
        exit();
    }
}

// Respuesta en caso de acceso no autorizado o solicitudes inválidas
echo json_encode(["error" => "Acceso no autorizado"]);
session_destroy();
header("Location: " . APP_URL . "login/");