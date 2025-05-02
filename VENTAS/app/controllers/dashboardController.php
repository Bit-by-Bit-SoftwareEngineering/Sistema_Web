<?php

namespace app\controllers;

class dashboardController {

    public function mostrarDashboard1($soloVariables = false) {
        // Instanciar controladores
        $saleCtrl = new \app\controllers\saleController();
        $productCtrl = new \app\controllers\productController();
        $clientCtrl = new \app\controllers\clientController();
        $pedidoCtrl = new \app\controllers\PedidoController();

        // Filtro de periodo (GET o por defecto 'mes')
        $periodo = isset($_GET['periodo']) ? $_GET['periodo'] : 'mes';

        // Datos para gráficos
        $ventasPorPeriodo = $saleCtrl->obtenerVentasPorPeriodo($periodo);
        $productosMasVendidos = $saleCtrl->obtenerProductosMasVendidosPorPeriodo($periodo, 10);
        $clientesPorPeriodo = $clientCtrl->obtenerClientesPorPeriodo($periodo);
        $stockPorCategoria = $productCtrl->obtenerStockPorCategoria();
        $productosVendidos = $saleCtrl->obtenerProductosVendidosPorPeriodo($periodo);

        // Datos para tablas
        $productos = $productCtrl->obtenerTodosLosProductos();
        $ventas = $saleCtrl->obtenerTodasLasVentas();
        $clientes = $clientCtrl->obtenerTodosLosClientes();
        $pedidos = $pedidoCtrl->obtenerTodosLosPedidos();

        // Cards informativas
        $totalVentas = count($ventas);
        $totalClientes = count($clientes);
        $totalProductos = count($productos);
        $totalPedidos = count($pedidos);

        // Hacer disponibles todas las variables en el scope global
        foreach ([
            'ventasPorPeriodo' => $ventasPorPeriodo,
            'productosMasVendidos' => $productosMasVendidos,
            'clientesPorPeriodo' => $clientesPorPeriodo,
            'stockPorCategoria' => $stockPorCategoria,
            'productosVendidos' => $productosVendidos,
            'productos' => $productos,
            'ventas' => $ventas,
            'clientes' => $clientes,
            'pedidos' => $pedidos,
            'totalVentas' => $totalVentas,
            'totalClientes' => $totalClientes,
            'totalProductos' => $totalProductos,
            'totalPedidos' => $totalPedidos
        ] as $k => $v) {
            $GLOBALS[$k] = $v;
        }

        // NO incluyas la vista aquí si $soloVariables es true
        if (!$soloVariables) {
            require_once './app/views/content/Dashboards1-view.php';
        }
    }
}