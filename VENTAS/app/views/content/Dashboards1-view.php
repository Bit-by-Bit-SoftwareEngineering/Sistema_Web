<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Estadístico</title>
    <link rel="stylesheet" href="<?php echo APP_URL; ?>app/views/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bulma.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bulma.min.js"></script>
</head>
<body>
<div class="container is-fluid">
    <h1 class="title">Dashboard Estadístico</h1>

    <!-- Filtros de periodo -->
    <div class="buttons">
        <?php
        $periodos = ['semana'=>'Semana','mes'=>'Mes','bimestre'=>'Bimestre','trimestre'=>'Trimestre','semestre'=>'Semestre','anual'=>'Anual'];
        $periodoActual = isset($_GET['periodo']) ? $_GET['periodo'] : 'mes';
        foreach($periodos as $key=>$label){
            $active = ($key == $periodoActual) ? 'is-primary' : '';
            echo "<a href='?periodo=$key' class='button $active'>$label</a>";
        }
        ?>
    </div>

    <!-- Cards informativas -->
    <div class="columns">
        <div class="column">
            <div class="box has-text-centered">
                <p class="heading">Ventas</p>
                <p class="title"><?php echo $totalVentas; ?></p>
            </div>
        </div>
        <div class="column">
            <div class="box has-text-centered">
                <p class="heading">Clientes</p>
                <p class="title"><?php echo $totalClientes; ?></p>
            </div>
        </div>
        <div class="column">
            <div class="box has-text-centered">
                <p class="heading">Productos</p>
                <p class="title"><?php echo $totalProductos; ?></p>
            </div>
        </div>
        <div class="column">
            <div class="box has-text-centered">
                <p class="heading">Pedidos</p>
                <p class="title"><?php echo $totalPedidos; ?></p>
            </div>
        </div>
    </div>

    <!-- Gráficos -->
    <div class="columns">
        <div class="column is-half">
            <div class="box">
                <canvas id="ventasPorPeriodo"></canvas>
            </div>
        </div>
        <div class="column is-half">
            <div class="box">
                <canvas id="productosMasVendidos"></canvas>
            </div>
        </div>
    </div>
    <div class="columns">
        <div class="column is-half">
            <div class="box">
                <canvas id="clientesPorPeriodo"></canvas>
            </div>
        </div>
        <div class="column is-half">
            <div class="box">
                <canvas id="stockPorCategoria"></canvas>
            </div>
        </div>
    </div>

    <!-- Tablas dinámicas -->
    <div class="box">
        <h2 class="subtitle">Productos</h2>
        <table id="tablaProductos" class="table is-striped is-fullwidth">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Stock</th>
                    <th>Precio Venta</th>
                    <th>Categoría</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($productos as $prod): ?>
                <tr>
                    <td><?= $prod['producto_id'] ?></td>
                    <td><?= $prod['producto_codigo'] ?></td>
                    <td><?= $prod['producto_nombre'] ?></td>
                    <td><?= $prod['producto_stock_total'] ?></td>
                    <td><?= $prod['producto_precio_venta'] ?></td>
                    <td><?= $prod['categoria_nombre'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="box">
        <h2 class="subtitle">Ventas</h2>
        <table id="tablaVentas" class="table is-striped is-fullwidth">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Fecha</th>
                    <th>Cliente</th>
                    <th>Vendedor</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($ventas as $venta): ?>
                <tr>
                    <td><?= $venta['venta_id'] ?></td>
                    <td><?= $venta['venta_codigo'] ?></td>
                    <td><?= $venta['venta_fecha'] ?></td>
                    <td><?= $venta['cliente_nombre'].' '.$venta['cliente_apellido'] ?></td>
                    <td><?= $venta['usuario_nombre'].' '.$venta['usuario_apellido'] ?></td>
                    <td><?= $venta['venta_total'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="box">
        <h2 class="subtitle">Clientes</h2>
        <table id="tablaClientes" class="table is-striped is-fullwidth">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Documento</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Fecha Registro</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($clientes as $cli): ?>
                <tr>
                    <td><?= $cli['cliente_id'] ?></td>
                    <td><?= $cli['cliente_tipo_documento'].' '.$cli['cliente_numero_documento'] ?></td>
                    <td><?= $cli['cliente_nombre'].' '.$cli['cliente_apellido'] ?></td>
                    <td><?= $cli['cliente_email'] ?></td>
                    <td><?= $cli['fecha_registro'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="box">
        <h2 class="subtitle">Pedidos</h2>
        <table id="tablaPedidos" class="table is-striped is-fullwidth">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Fecha</th>
                    <th>Cliente</th>
                    <th>Correo</th>
                    <th>Celular</th>
                    <th>Estado</th>
                    <th>Método Pago</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($pedidos as $ped): ?>
                <tr>
                    <td><?= $ped['pedido_id'] ?></td>
                    <td><?= $ped['codigo_pedido'] ?></td>
                    <td><?= $ped['fecha'] ?></td>
                    <td><?= $ped['nombre_cliente'] ?></td>
                    <td><?= $ped['correo_cliente'] ?></td>
                    <td><?= $ped['celular_cliente'] ?></td>
                    <td><?= $ped['estado'] ?></td>
                    <td><?= $ped['metodo_pago'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Chart.js - Ventas por periodo
    const ventasPorPeriodo = <?php echo json_encode($ventasPorPeriodo); ?>;
    new Chart(document.getElementById('ventasPorPeriodo'), {
        type: 'bar',
        data: {
            labels: ventasPorPeriodo.map(v => v.periodo),
            datasets: [{
                label: 'Ventas',
                data: ventasPorPeriodo.map(v => v.total),
                backgroundColor: 'rgba(54, 162, 235, 0.5)'
            }]
        }
    });

    // Chart.js - Productos más vendidos
    const productosMasVendidos = <?php echo json_encode($productosMasVendidos); ?>;
    new Chart(document.getElementById('productosMasVendidos'), {
        type: 'bar',
        data: {
            labels: productosMasVendidos.map(p => p.producto_nombre),
            datasets: [{
                label: 'Cantidad',
                data: productosMasVendidos.map(p => p.cantidad),
                backgroundColor: 'rgba(255, 99, 132, 0.5)'
            }]
        }
    });

    // Chart.js - Clientes por periodo
    const clientesPorPeriodo = <?php echo json_encode($clientesPorPeriodo); ?>;
    new Chart(document.getElementById('clientesPorPeriodo'), {
        type: 'line',
        data: {
            labels: clientesPorPeriodo.map(c => c.periodo),
            datasets: [{
                label: 'Clientes',
                data: clientesPorPeriodo.map(c => c.total),
                backgroundColor: 'rgba(75, 192, 192, 0.5)'
            }]
        }
    });

    // Chart.js - Stock por categoría
    const stockPorCategoria = <?php echo json_encode($stockPorCategoria); ?>;
    new Chart(document.getElementById('stockPorCategoria'), {
        type: 'pie',
        data: {
            labels: stockPorCategoria.map(s => s.categoria_nombre),
            datasets: [{
                label: 'Stock',
                data: stockPorCategoria.map(s => s.stock),
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)'
                ]
            }]
        }
    });

    // DataTables
    $(document).ready(function() {
        $('#tablaProductos').DataTable();
        $('#tablaVentas').DataTable();
        $('#tablaClientes').DataTable();
        $('#tablaPedidos').DataTable();
    });
</script>
</body>
</html>
