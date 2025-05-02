<?php

namespace app\controllers;
use app\models\mainModel;
use app\models\pedidoModel;

class PedidoController extends mainModel{


    /*----------  Controlador registrar pedido  ----------*/
    public function registrarPedidoControlador(){

        # Almacenando datos
        $cliente_id = $this->limpiarCadena($_POST['cliente_id']);
        $productos = $_POST['productos']; // array de productos
        $total = $this->limpiarCadena($_POST['total']);

        # Verificando campos obligatorios
        if ($cliente_id == "" || $total == "" || empty($productos)) {
            $alerta = [
                "tipo" => "simple",
                "titulo" => "Ocurrió un error inesperado",
                "texto" => "No has llenado todos los campos que son obligatorios",
                "icono" => "error"
            ];
            return json_encode($alerta);
            exit();
        }

        # Insertar el pedido
        $pedido_datos_reg = [
            [
                "campo_nombre" => "cliente_id",
                "campo_marcador" => ":ClienteID",
                "campo_valor" => $cliente_id
            ],
            [
                "campo_nombre" => "total",
                "campo_marcador" => ":Total",
                "campo_valor" => $total
            ]
        ];

        $registrar_pedido = $this->guardarDatos("pedido", $pedido_datos_reg);

        if ($registrar_pedido->rowCount() == 1) {
            // Obtener ID del pedido recién registrado
            $pedido_id = $this->ultimoIdInsertado();

            # Registrar productos del pedido
            foreach ($productos as $producto) {
                $producto_datos = [
                    [
                        "campo_nombre" => "pedido_id",
                        "campo_marcador" => ":PedidoID",
                        "campo_valor" => $pedido_id
                    ],
                    [
                        "campo_nombre" => "producto_id",
                        "campo_marcador" => ":ProductoID",
                        "campo_valor" => $producto['id']
                    ],
                    [
                        "campo_nombre" => "cantidad",
                        "campo_marcador" => ":Cantidad",
                        "campo_valor" => $producto['cantidad']
                    ],
                    [
                        "campo_nombre" => "precio",
                        "campo_marcador" => ":Precio",
                        "campo_valor" => $producto['precio']
                    ]
                ];
                $this->guardarDatos("pedido_producto", $producto_datos);
            }

            $alerta = [
                "tipo" => "limpiar",
                "titulo" => "Pedido registrado",
                "texto" => "El pedido ha sido registrado con éxito",
                "icono" => "success"
            ];
        } else {
            $alerta = [
                "tipo" => "simple",
                "titulo" => "Ocurrió un error inesperado",
                "texto" => "No se pudo registrar el pedido, por favor intente nuevamente",
                "icono" => "error"
            ];
        }

        return json_encode($alerta);
    }

    /*----------  Controlador listar pedidos  ----------*/
    public function listarPedidosControlador($pagina, $registros, $url, $busqueda) {
        $pagina = $this->limpiarCadena($pagina);
        $registros = $this->limpiarCadena($registros);
        $url = APP_URL . $this->limpiarCadena($url) . "/";
        $busqueda = $this->limpiarCadena($busqueda);
        $tabla = "";

        $pagina = (isset($pagina) && $pagina > 0) ? (int) $pagina : 1;
        $inicio = ($pagina > 0) ? (($pagina * $registros) - $registros) : 0;

        if ($busqueda != "") {
            $consulta_datos = "SELECT * FROM pedido WHERE nombre_cliente LIKE '%$busqueda%' ORDER BY fecha DESC LIMIT $inicio, $registros";
            $consulta_total = "SELECT COUNT(pedido_id) FROM pedido WHERE nombre_cliente LIKE '%$busqueda%'";
        } else {
            $consulta_datos = "SELECT * FROM pedido ORDER BY fecha DESC LIMIT $inicio, $registros";
            $consulta_total = "SELECT COUNT(pedido_id) FROM pedido";
        }

        $datos = $this->ejecutarConsulta($consulta_datos);
        $datos = $datos->fetchAll();
        $total = $this->ejecutarConsulta($consulta_total)->fetchColumn();
        $numeroPaginas = ceil($total / $registros);

        $tabla .= '
            <div class="table-container">
            <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                <thead>
                    <tr>
                        <th class="has-text-centered">Pedido ID</th>
                        <th class="has-text-centered">Código Pedido</th>
                        <th class="has-text-centered">Fecha</th>
                        <th class="has-text-centered">Nombre Cliente</th>
                        <th class="has-text-centered">Correo Cliente</th>
                        <th class="has-text-centered">Celular Cliente</th>
                        <th class="has-text-centered">Estado</th>
                        <th class="has-text-centered">Método Pago</th>
                        <th class="has-text-centered">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
        ';

        if ($total >= 1 && $pagina <= $numeroPaginas) {
            $contador = $inicio + 1;
            foreach ($datos as $rows) {
                $tabla .= '
                    <tr class="has-text-centered">
                        <td>' . $rows['pedido_id'] . '</td>
                        <td>' . $rows['codigo_pedido'] . '</td>
                        <td>' . $rows['fecha'] . '</td>
                        <td>' . $rows['nombre_cliente'] . '</td>
                        <td>' . $rows['correo_cliente'] . '</td>
                        <td>' . $rows['celular_cliente'] . '</td>
                        <td>
                            <form class="FormularioAjax" action="' . APP_URL . 'app/ajax/pedidoAjax.php" method="POST" autocomplete="off">
                                <input type="hidden" name="modulo_pedido" value="actualizar">
                                <input type="hidden" name="pedido_id" value="' . $rows['pedido_id'] . '">
                                <div class="select is-small">
                                    <select name="estado" required>
                                        <option value="pendiente"' . ($rows['estado'] == 'pendiente' ? ' selected' : '') . '>Pendiente</option>
                                        <option value="comprobado"' . ($rows['estado'] == 'comprobado' ? ' selected' : '') . '>Comprobado</option>
                                        <option value="completado"' . ($rows['estado'] == 'completado' ? ' selected' : '') . '>Completado</option>
                                    </select>
                                </div>
                                <button type="submit" class="button is-info is-small" title="Actualizar Estado">
                                    <i class="fas fa-sync-alt"></i>
                                </button>
                            </form>
                        </td>
                        <td>' . $rows['metodo_pago'] . '</td>
                        <td>
                            <form class="FormularioAjax" action="' . APP_URL . 'app/ajax/pedidoAjax.php" method="POST" autocomplete="off">
                                <input type="hidden" name="modulo_pedido" value="eliminar">
                                <input type="hidden" name="pedido_id" value="' . $rows['pedido_id'] . '">
                                <button type="submit" class="button is-danger is-small" title="Eliminar Pedido">
                                    <i class="far fa-trash-alt fa-fw"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                ';
                $contador++;
            }
        } else {
            $tabla .= '<tr class="has-text-centered"><td colspan="11">No hay pedidos registrados</td></tr>';
        }

        $tabla .= '</tbody></table></div>';

        ### Paginacion ###
        if ($total > 0 && $pagina <= $numeroPaginas) {
            $tabla .= '<p class="has-text-right">Mostrando pedidos del <strong>' . ($inicio + 1) . '</strong> al <strong>' . ($contador - 1) . '</strong> de un total de <strong>' . $total . '</strong></p>';
            $tabla .= $this->paginadorTablas($pagina, $numeroPaginas, $url, 7);
        }

        return $tabla;
    }


    /*----------  Controlador actualizar estado del pedido  ----------*/
    public function actualizarPedidoControlador() {
        $pedido_id = isset($_POST['pedido_id']) ? $_POST['pedido_id'] : null;
        $estado = isset($_POST['estado']) ? $_POST['estado'] : null;
    
        if (is_null($pedido_id) || is_null($estado)) {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "Datos incompletos. No se pudo actualizar el pedido.",
                "icono" => "error"
            ]);
        }
    
        // Preparar datos para actualizar
        $pedido_datos_up = [
            "estado" => $estado
        ];
        $condicion = "pedido_id='$pedido_id'";
    
        if ($this->actualizarDatos("pedido", $pedido_datos_up, $condicion)) {
            return json_encode([
                "tipo" => "recargar",
                "titulo" => "Pedido Actualizado",
                "texto" => "El estado del pedido se actualizó correctamente.",
                "icono" => "success"
            ]);
        } else {
            return json_encode([
                "tipo" => "simple",
                "titulo" => "Error",
                "texto" => "No se pudo actualizar el estado del pedido. Inténtelo nuevamente.",
                "icono" => "error"
            ]);
        }
    }

    /*----------  Controlador eliminar pedido  ----------*/
    public function eliminarPedidoControlador(){
        // ... (método existente o ajustado según necesidades)
    }

    /*----------  Función para obtener el último ID insertado  ----------*/
    protected function ultimoIdInsertado(){
        return $this->conectar()->lastInsertId();
    }

    // Método para listar todos los detalles de pedido
    public function listarTodosLosDetallesPedidoControlador($tipo = 'todos') {
        $modelo = new pedidoModel();
    
        // Realizar consulta en base al tipo de pedido
        switch ($tipo) {
            case 'comprobados':
                $detalles = $modelo->obtenerDetallesPedidoPorEstado('comprobado');
                break;
            case 'pendientes':
                $detalles = $modelo->obtenerDetallesPedidoPorEstado('pendiente');
                break;
            case 'completados':
                $detalles = $modelo->obtenerDetallesPedidoPorEstado('completado');
                break;
            default:
                $detalles = $modelo->obtenerTodosLosDetallesPedido();
        }
    
        $html = '<table class="table is-fullwidth is-striped">';
        $html .= '<thead>
                    <tr>
                        <th>ID</th>
                        <th>Código Pedido</th>
                        <th>Cantidad</th>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Fecha</th>
                    </tr>
                  </thead>
                  <tbody>';
    
        foreach ($detalles as $detalle) {
            $html .= '<tr>
                        <td>' . htmlspecialchars($detalle['detalle_id']) . '</td>
                        <td>' . htmlspecialchars($detalle['codigo_pedido']) . '</td>
                        <td>' . htmlspecialchars($detalle['cantidad']) . '</td>
                        <td>' . htmlspecialchars($detalle['producto_nombre']) . '</td>
                        <td>' . htmlspecialchars(number_format($detalle['precio'], 2)) . '</td>
                        <td>' . htmlspecialchars($detalle['fecha']) . '</td>
                      </tr>';
        }
    
        $html .= '</tbody></table>';
        return $html;
    }
    
    
    
    public function mostrarDetallesPedido($pedido) {
        echo '<table>';
        echo '<tr><th>ID</th><th>Producto</th><th>Cantidad</th><th>Estado</th></tr>';
        echo '<tr>';
        echo '<td>' . $pedido['id'] . '</td>';
        echo '<td>' . $pedido['producto'] . '</td>';
        echo '<td>' . $pedido['cantidad'] . '</td>';
        echo '<td>' . $pedido['estado'] . '</td>';
        echo '</tr>';
        echo '</table>';
    }

    public function obtenerTodosLosPedidos() {
        $sql = $this->ejecutarConsulta("
            SELECT pedido_id, codigo_pedido, fecha, nombre_cliente, correo_cliente, celular_cliente, estado, metodo_pago
            FROM pedido
            ORDER BY fecha DESC
        ");
        return $sql->fetchAll(\PDO::FETCH_ASSOC);
    }
    

}
?>
