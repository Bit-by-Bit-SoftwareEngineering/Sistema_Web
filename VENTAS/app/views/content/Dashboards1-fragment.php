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
<div class="box">
    <label for="gauge-mes-select"><strong>Selecciona el mes:</strong></label>
    <select id="gauge-mes-select" class="select is-small" style="width:auto;display:inline-block;">
        <?php
        $meses = [
            1 => 'Enero', 2 => 'Febrero', 3 => 'Marzo', 4 => 'Abril',
            5 => 'Mayo', 6 => 'Junio', 7 => 'Julio', 8 => 'Agosto',
            9 => 'Septiembre', 10 => 'Octubre', 11 => 'Noviembre', 12 => 'Diciembre'
        ];
        $anioActual = date('Y');
        $mesActual = date('n');
        for ($i = 1; $i <= 12; $i++) {
            $selected = ($i == $mesActual) ? 'selected' : '';
            echo "<option value=\"$i\" $selected>{$meses[$i]} $anioActual</option>";
        }
        ?>
    </select>
    <br>
    <canvas id="gaugeChart" width="300" height="300" style="display:block;margin:auto;"></canvas>
    <div id="gauge-value" style="text-align:center;font-size:1.5em;margin-top:10px;"></div>
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

<script type="text/javascript">
function renderGaugeChart(mes, anio) {
    if (window.gaugeChartInstance) {
        window.gaugeChartInstance.destroy();
    }
    $.getJSON("app/ajax/gaugeAjax.php", { mes: mes, anio: anio }, function(res) {
        var total = res.total || 0;
        var max = res.max || 1000;
        window.gaugeChartInstance = new Chart(document.getElementById('gaugeChart'), {
            type: 'doughnut',
            data: {
                labels: ['Ventas', 'Resto'],
                datasets: [{
                    data: [total, Math.max(0, max - total)],
                    backgroundColor: ['#2196f3', '#2c2f3a'],
                    borderWidth: 10,
                    circumference: 270,
                    rotation: 225,
                    cutout: '70%'
                }]
            },
            options: {
                plugins: {
                    legend: { display: false },
                    title: { display: true, text: 'Ventas del mes seleccionado' }
                }
            }
        });
        $('#gauge-value').text('Total ventas: $' + total);
    });
}

function inicializarGaugeChart() {
    var $select = $('#gauge-mes-select');
    var mes = $select.val();
    var anio = new Date().getFullYear();
    renderGaugeChart(mes, anio);

    $select.off('change').on('change', function() {
        var mes = $(this).val();
        renderGaugeChart(mes, anio);
    });
}

function renderDashboardCharts() {
    // Ventas por periodo
    var ventasPorPeriodo = <?php echo json_encode($ventasPorPeriodo); ?>;
    console.log("ventasPorPeriodo", ventasPorPeriodo);
    new Chart(document.getElementById('ventasPorPeriodo'), {
        type: 'bar',
        data: {
            labels: ventasPorPeriodo.length ? ventasPorPeriodo.map(v => v.periodo) : ['Sin datos'],
            datasets: ventasPorPeriodo.length
                ? [{
                    label: 'Ventas',
                    data: ventasPorPeriodo.map(v => v.total),
                    backgroundColor: 'rgba(54, 162, 235, 0.5)'
                }]
                : [{
                    label: 'Sin datos',
                    data: [0],
                    backgroundColor: 'rgba(200, 200, 200, 0.5)'
                }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Ventas por Periodo'
                }
            }
        }
    });

    // Productos más vendidos
    var productosMasVendidos = <?php echo json_encode($productosMasVendidos); ?>;
    console.log("productosMasVendidos", productosMasVendidos);
    new Chart(document.getElementById('productosMasVendidos'), {
        type: 'bar',
        data: {
            labels: productosMasVendidos.length ? productosMasVendidos.map(p => p.producto_nombre) : ['Sin datos'],
            datasets: productosMasVendidos.length
                ? [{
                    label: 'Cantidad',
                    data: productosMasVendidos.map(p => p.cantidad),
                    backgroundColor: 'rgba(255, 99, 132, 0.5)'
                }]
                : [{
                    label: 'Sin datos',
                    data: [0],
                    backgroundColor: 'rgba(200, 200, 200, 0.5)'
                }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Productos Más Vendidos'
                }
            }
        }
    });

    // Clientes por periodo
    var clientesPorPeriodo = <?php echo json_encode($clientesPorPeriodo); ?>;
    console.log("clientesPorPeriodo", clientesPorPeriodo);
    new Chart(document.getElementById('clientesPorPeriodo'), {
        type: 'line',
        data: {
            labels: clientesPorPeriodo.length ? clientesPorPeriodo.map(c => c.periodo) : ['Sin datos'],
            datasets: clientesPorPeriodo.length
                ? [{
                    label: 'Clientes',
                    data: clientesPorPeriodo.map(c => c.total),
                    backgroundColor: 'rgba(75, 192, 192, 0.5)'
                }]
                : [{
                    label: 'Sin datos',
                    data: [0],
                    backgroundColor: 'rgba(200, 200, 200, 0.5)'
                }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Clientes por Periodo'
                }
            }
        }
    });

    // Stock por categoría
    var stockPorCategoria = <?php echo json_encode($stockPorCategoria); ?>;
    console.log("stockPorCategoria", stockPorCategoria);
    new Chart(document.getElementById('stockPorCategoria'), {
        type: 'pie',
        data: {
            labels: stockPorCategoria.length ? stockPorCategoria.map(s => s.categoria_nombre) : ['Sin datos'],
            datasets: stockPorCategoria.length
                ? [{
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
                : [{
                    label: 'Sin datos',
                    data: [0],
                    backgroundColor: ['rgba(200, 200, 200, 0.5)']
                }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Stock por Categoría'
                }
            }
        }
    });

    inicializarGaugeChart();
}

</script>