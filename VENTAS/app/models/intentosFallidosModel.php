<?php
// filepath: c:\xampp\htdocs\VENTAS\app\models\intentosFallidosModel.php

namespace app\models;

use app\models\mainModel;

class intentosFallidosModel extends mainModel {

    // Obtener registro de intentos fallidos por usuario
    public function obtenerIntentosFallidos($usuario_id) {
        return $this->ejecutarConsulta("SELECT * FROM intentos_fallidos WHERE usuario_id='$usuario_id'");
    }

    // Crear un nuevo registro de intentos fallidos
    public function crearIntentoFallido($usuario_id) {
        return $this->ejecutarConsulta("INSERT INTO intentos_fallidos (usuario_id, intentos) VALUES ('$usuario_id', 1)");
    }

    // Actualizar intentos fallidos
    public function actualizarIntentosFallidos($usuario_id, $intentos, $codigo = null) {
        $codigo_sql = $codigo ? ", codigo_verificacion='$codigo', estado='pendiente'" : "";
        return $this->ejecutarConsulta("UPDATE intentos_fallidos SET intentos='$intentos', fecha_hora=NOW() $codigo_sql WHERE usuario_id='$usuario_id'");
    }

    // Eliminar intentos fallidos (por ejemplo, después de un código verificado)
    public function eliminarIntentosFallidos($usuario_id) {
        return $this->ejecutarConsulta("DELETE FROM intentos_fallidos WHERE usuario_id='$usuario_id'");
    }
}