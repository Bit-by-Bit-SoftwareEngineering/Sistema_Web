<div class="container pb-6 pt-6">
    <?php
        use app\controllers\PedidoController;
        $insPedido = new PedidoController();
    ?>
    <div class="columns">
        <!-- Sidebar con opciones -->
        <div class="column is-one-third">
            <h2 class="title has-text-centered">Opciones</h2>
            <button onclick="cargarPedidos('todos')" class="button is-link is-inverted is-fullwidth">Ver Todos</button>
            <button onclick="cargarPedidos('comprobados')" class="button is-link is-inverted is-fullwidth">Ver Comprobados</button>
            <button onclick="cargarPedidos('pendientes')" class="button is-link is-inverted is-fullwidth">Ver Pendientes</button>
            <button onclick="cargarPedidos('completados')" class="button is-link is-inverted is-fullwidth">Ver Completados</button>
        </div>

        <!-- Tabla de detalles de pedidos -->
        <div class="column pb-6">
            <h2 class="title has-text-centered">Detalles de Todos los Pedidos</h2>
            <div id="tabla-pedidos">
                <?php
                    $tipo_pedido = isset($url[1]) ? $url[1] : 'todos';
                    echo $insPedido->listarTodosLosDetallesPedidoControlador($tipo_pedido);
                ?>
            </div>
        </div>
    </div>
</div>

<script>
    function cargarPedidos(estado) {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "<?php echo APP_URL; ?>app/ajax/pedidoAjax.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("tabla-pedidos").innerHTML = xhr.responseText;
            }
        };
        xhr.send("estado=" + estado);
    }
</script>
