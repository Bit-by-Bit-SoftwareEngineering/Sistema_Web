<?php
require_once "../../config/app.php";
require_once "../../autoload.php";

$periodo = isset($_GET['periodo']) ? $_GET['periodo'] : 'mes';

// Llama al controlador y prepara las variables para el periodo solicitado
$dashboard = new \app\controllers\dashboardController();
$dashboard->mostrarDashboard1(true, $periodo);

// Incluye solo el fragmento dinámico
require_once __DIR__ . '/../views/content/Dashboards1-fragment.php';