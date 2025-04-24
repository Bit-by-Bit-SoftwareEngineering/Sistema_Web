<?php

    const DB_SERVER = "localhost"; 
    const DB_NAME = "proyecto5";
    const DB_USER = "root"; 
    const DB_PASS = 'root'; // Si tienes una contraseña para tu usuario root, colócala aquí

	$conn = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

	if (!$conn) {
		die("Conexión fallida: " . mysqli_connect_error());
	}

?>