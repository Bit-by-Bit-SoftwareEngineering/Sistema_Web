<?php
// Ajusta la ruta según la estructura real de tu proyecto
require_once 'C:/xampp/htdocs/VENTAS/config/server.php';

// Obtener datos JSON del cuerpo de la solicitud
$data = json_decode(file_get_contents('php://input'), true);

// Verificar que los datos se recibieron correctamente
if (!isset($data['cliente']) || !isset($data['carrito'])) {
    echo json_encode(['success' => false, 'message' => 'Datos incompletos.']);
    exit();
}

$cliente = $data['cliente'];
$carrito = $data['carrito'];

// Preparar conexión a la base de datos
$conn = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

// Verificar conexión
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Error en la conexión a la base de datos.']);
    exit();
}

// Iniciar transacción
$conn->begin_transaction();

try {
    // Generar un código de pedido único
    $codigo_pedido = 'PED' . date('YmdHis');

    // Definir valores adicionales para el pedido
    $estado = 'pendiente';
    $metodo_pago = isset($cliente['metodo_pago']) ? $cliente['metodo_pago'] : null;
    $razon_social = isset($cliente['razon_social']) ? $cliente['razon_social'] : null;
    $nit_cliente = isset($cliente['nit']) ? $cliente['nit'] : null;

    // Insertar datos del pedido
    $stmt = $conn->prepare("INSERT INTO pedido (codigo_pedido, fecha, nombre_cliente, correo_cliente, celular_cliente, estado, metodo_pago, razon_social, nit_cliente) VALUES (?, NOW(), ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssss", $codigo_pedido, $cliente['nombre'], $cliente['correo'], $cliente['celular'], $estado, $metodo_pago, $razon_social, $nit_cliente);
    $stmt->execute();
    $pedidoId = $stmt->insert_id;
    $stmt->close();

    // Insertar productos del carrito
    $stmt = $conn->prepare("INSERT INTO detalle_pedido (codigo_pedido, cantidad, producto_nombre, precio, fecha) VALUES (?, ?, ?, ?, NOW())");
    foreach ($carrito as $item) {
        $stmt->bind_param("sisd", $codigo_pedido, $item['cantidad'], $item['nombre'], $item['precio']);
        $stmt->execute();
    }
    $stmt->close();

    // Confirmar transacción
    $conn->commit();
    echo json_encode(['success' => true, 'message' => 'Pedido procesado exitosamente.']);
} catch (Exception $e) {
    // Revertir transacción en caso de error
    $conn->rollback();
    echo json_encode(['success' => false, 'message' => 'Error al procesar el pedido: ' . $e->getMessage()]);
}

// Cerrar conexión
$conn->close();
?>
