<div class="container">
    <h1 class="title">Listado de Pedidos</h1>
    <div class="box">
        <form action="<?php echo APP_URL; ?>pedidoBuscar/" method="POST" autocomplete="off">
            <div class="field has-addons">
                <div class="control is-expanded">
                    <input class="input" type="text" name="buscar" placeholder="Buscar pedidos...">
                </div>
                <div class="control">
                    <button class="button is-info" type="submit">Buscar</button>
                </div>
            </div>
        </form>
    </div>

    <?php
        require_once "./app/controllers/PedidoController.php";
        use app\controllers\PedidoController;

        $pedidoController = new PedidoController();
        echo $pedidoController->listarPedidosControlador(1, 10, "pedidos", "");
    ?>

    <!-- Formulario para actualizar estado -->
    <form class="FormularioAjax" action="<?php echo APP_URL; ?>pedidoActualizarEstado/" method="POST">
        <div class="field">
            <label class="label">ID Pedido</label>
            <div class="control">
                <input class="input" type="number" name="idPedido" placeholder="ID del pedido" required>
            </div>
        </div>
        <div class="field">
            <label class="label">Nuevo Estado</label>
            <div class="control">
                <div class="select">
                    <select name="nuevoEstado" required>
                        <option value="Pendiente">Pendiente</option>
                        <option value="En Proceso">En Proceso</option>
                        <option value="Completado">Completado</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="field">
            <div class="control">
                <button class="button is-success" type="submit">Actualizar Estado</button>
            </div>
        </div>
    </form>
</div>
