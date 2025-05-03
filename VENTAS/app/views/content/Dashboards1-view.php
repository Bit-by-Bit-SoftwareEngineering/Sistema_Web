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
            echo "<button id='boton-$key' class='button periodo-boton $active' onclick=\"cambiarPeriodo('$key')\">$label</button>";
        }
        ?>
    </div>

    <!-- Contenido dinámico -->
    <div id="dashboard-dinamico">
        <?php require __DIR__ . '/Dashboards1-fragment.php'; ?>
    </div>
</div>

<script>
$(document).ready(function () {
    // Renderizar los gráficos al cargar la página
    if (typeof renderDashboardCharts === "function") {
        renderDashboardCharts();
    }

    // Inicializar DataTables al cargar la página
    $('#tablaProductos').DataTable();
    $('#tablaVentas').DataTable();
    $('#tablaClientes').DataTable();
    $('#tablaPedidos').DataTable();
});

function cambiarPeriodo(periodo) {
    // Actualizar el estado visual del botón seleccionado
    $(".periodo-boton").removeClass("is-primary");
    $(`#boton-${periodo}`).addClass("is-primary");

    // Realizar la solicitud AJAX
    $.ajax({
        url: "<?php echo APP_URL; ?>app/ajax/dashboardAjax.php",
        method: "GET",
        data: { periodo: periodo },
        success: function(respuesta) {
            $("#dashboard-dinamico").html(respuesta);

            // Re-inicializar DataTables después de cargar el contenido dinámico
            $('#tablaProductos').DataTable();
            $('#tablaVentas').DataTable();
            $('#tablaClientes').DataTable();
            $('#tablaPedidos').DataTable();

            // Llama a la función de renderizado de gráficos
            if (typeof renderDashboardCharts === "function") {
                renderDashboardCharts();
            }
        }
    });
}
</script>
</body>
</html>
