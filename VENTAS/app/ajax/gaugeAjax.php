<?php

require_once "../../config/app.php";
require_once "../views/inc/session_start.php";
require_once "../../autoload.php";

use app\controllers\saleController;

// Obtener año y mes desde la petición AJAX, o usar el mes actual por defecto
$anio = isset($_GET['anio']) ? intval($_GET['anio']) : date('Y');
$mes = isset($_GET['mes']) ? intval($_GET['mes']) : date('n');

$saleCtrl = new saleController();
$total = $saleCtrl->obtenerVentasPorMes($anio, $mes);

// Puedes ajustar el máximo según tu realidad, aquí fijo a 1000 para el gauge
$max = 1000;

echo json_encode([
    'total' => $total,
    'max' => $max
]);