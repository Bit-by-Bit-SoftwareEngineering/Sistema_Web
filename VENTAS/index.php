<?php

// Cargar configuraciones y autoload
require_once "./config/app.php";
require_once "./autoload.php";

// Iniciar sesión
require_once "./app/views/inc/session_start.php";

// Verificar si se solicitó una vista específica
if (isset($_GET['views'])) {
    $url = explode("/", $_GET['views']);
    $vistaSolicitada = $url[0];
} else {
    // Si no se solicitó ninguna vista, cargar la vista de inicio (home)
    $vistaSolicitada = "home";
}

// Asegúrate de que las declaraciones use estén al inicio del archivo
use app\controllers\viewsController;
use app\controllers\loginController;

$insLogin = new loginController();
$viewsController = new viewsController();

// Obtener la vista que se va a cargar
$vista = $viewsController->obtenerVistasControlador($vistaSolicitada);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <?php require_once "./app/views/inc/head.php"; ?>
</head>
<body>

<?php
// Si la vista es "home" o "logOut", cargar la vista correspondiente
if ($vistaSolicitada === "home") {
    // Cargar el home (portal web)
    require_once "./app/views/content/home-view.php";
} elseif ($vista === "logOut") {
    // Redirigir al logout-view.php sin incluir los elementos del sistema
    require_once "./app/views/content/logOut-view.php";
} elseif ($vista === "login" || $vista === "404") {
    // Si la vista es login o 404, cargar esas vistas específicas
    require_once "./app/views/content/" . $vista . "-view.php";
} else {
    // --- CAMBIO PARA DASHBOARD ---
    if ($vistaSolicitada === "Dashboards1") {
        $dashboard = new \app\controllers\dashboardController();
        $dashboard->mostrarDashboard1(true); // Solo preparar variables
        $vista = "./app/views/content/Dashboards1-view.php";
    }
    // --- FIN CAMBIO ---
    ?>
    <main class="page-container">
        <?php
        // Verificar si la sesión está iniciada correctamente, si no, redirigir a la vista de logout
        if ((!isset($_SESSION['id']) || $_SESSION['id'] == "") || (!isset($_SESSION['usuario']) || $_SESSION['usuario'] == "")) {
            // Cerrar sesión y redirigir a la vista de logout
            $insLogin->cerrarSesionControlador();
            header("Location: ".APP_URL."logOut/");
            exit();
        }
        // Cargar el menú lateral y el contenido del sistema
        require_once "./app/views/inc/navlateral.php";
        ?>
        <section class="full-width pageContent scroll" id="pageContent">
            <?php
            // Cargar la barra de navegación superior, el contenido solicitado, y el pie de página
            require_once "./app/views/inc/navbar.php";
            require_once $vista;
            require_once "./app/views/inc/footer.php";
            ?>
        </section>
    </main>

    <?php
}
?>

<!-- Scripts -->
<?php require_once "./app/views/inc/script.php"; ?>

</body>
</html>