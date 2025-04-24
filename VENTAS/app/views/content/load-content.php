<!-- load-content.php -->
<?php
// Conexión a la base de datos
require 'server.php';

$pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$itemsPorPagina = 10; // Número de elementos por página
$offset = ($pagina - 1) * $itemsPorPagina;

// Consulta para obtener el contenido de la página
$query = "SELECT * FROM tu_tabla LIMIT $itemsPorPagina OFFSET $offset";
$result = mysqli_query($conn, $query);

$contenido = '';
while ($row = mysqli_fetch_assoc($result)) {
    // Genera el contenido HTML para cada elemento
    $contenido .= '<div>' . $row['campo'] . '</div>';
}

echo $contenido;
?>