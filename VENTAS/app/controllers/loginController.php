<?php

	namespace app\controllers;
	use app\models\mainModel;
	use app\models\intentosFallidosModel;

	class loginController extends mainModel{

		/*----------  Controlador iniciar sesion  ----------*/
		public function iniciarSesionControlador() {
		    // Iniciar sesión si no está iniciada
		    if (session_status() == PHP_SESSION_NONE) {
		        session_start();
		    }

		    $usuario = $this->limpiarCadena($_POST['login_usuario']);
		    $clave = $this->limpiarCadena($_POST['login_clave']);
		    $codigo_verificacion = isset($_POST['codigo_verificacion']) ? $this->limpiarCadena($_POST['codigo_verificacion']) : null;

		    // Verificar si el usuario existe
		    $check_usuario = $this->ejecutarConsulta("SELECT * FROM usuario WHERE usuario_usuario='$usuario'");
		    if ($check_usuario->rowCount() == 1) {
		        $check_usuario = $check_usuario->fetch();
		        $usuario_id = $check_usuario['usuario_id'];

		        // Verificar si hay intentos fallidos
		        $registro = $this->ejecutarConsulta("SELECT * FROM intentos_fallidos WHERE usuario_id='$usuario_id'");
		        if ($registro->rowCount() == 1) {
		            $registro = $registro->fetch();
		            if ($registro['intentos'] >= 3) {
		                // Validar el código de verificación
		                if ($codigo_verificacion == $registro['codigo_verificacion']) {
		                    // Código válido, reiniciar intentos fallidos
		                    $intentosModel = new intentosFallidosModel();
		                    $intentosModel->eliminarIntentosFallidos($usuario_id);

		                    echo '<article class="message is-success">
		                        <div class="message-body">
		                            Código verificado. Intenta iniciar sesión nuevamente.
		                        </div>
		                    </article>';
		                    return;
		                } else {
		                    echo '<article class="message is-danger">
		                        <div class="message-body">
		                            Código de verificación incorrecto.
		                        </div>
		                    </article>';
		                    return;
		                }
		            }
		        }

		        // Verificar si la contraseña es correcta
		        if (password_verify($clave, $check_usuario['usuario_clave'])) {
		            // Reiniciar intentos fallidos
		            $intentosModel = new intentosFallidosModel();
		            $intentosModel->eliminarIntentosFallidos($usuario_id);

		            // Iniciar sesión
		            $_SESSION['id'] = $check_usuario['usuario_id'];
		            $_SESSION['nombre'] = $check_usuario['usuario_nombre'];
		            $_SESSION['apellido'] = $check_usuario['usuario_apellido'];
		            $_SESSION['usuario'] = $check_usuario['usuario_usuario'];
		            $_SESSION['foto'] = $check_usuario['usuario_foto'];
		            $_SESSION['caja'] = $check_usuario['caja_id'];

		            header("Location: " . APP_URL . "dashboard/");
		            exit();
		        } else {
		            // Registrar intento fallido
		            $this->registrarIntentoFallido($usuario_id);
		            echo '<article class="message is-danger">
		                <div class="message-body">
		                    Usuario o clave incorrectos.
		                </div>
		            </article>';
		        }
		    } else {
		        echo '<article class="message is-danger">
		            <div class="message-body">
		                Usuario o clave incorrectos.
		            </div>
		        </article>';
		    }
		}

		public function registrarIntentoFallido($usuario_id) {
		    $intentosModel = new intentosFallidosModel();

		    // Verificar si ya existe un registro de intentos fallidos para este usuario
		    $registro = $intentosModel->obtenerIntentosFallidos($usuario_id);
		    if ($registro->rowCount() == 1) {
		        $registro = $registro->fetch();
		        $intentos = $registro['intentos'] + 1;

		        // Actualizar intentos fallidos
		        if ($intentos >= 3 && $registro['codigo_verificacion'] === null) {
		            $codigo = rand(100000, 999999);
		            $intentosModel->actualizarIntentosFallidos($usuario_id, $intentos, $codigo);

		            // Obtener el correo del usuario
		            $usuario = $this->ejecutarConsulta("SELECT usuario_email FROM usuario WHERE usuario_id='$usuario_id'")->fetch();
		            $correo = $usuario['usuario_email'];

		            // Enviar el código por correo
		            $asunto = "Código de Verificación - FarmaVida";
		            $mensaje = "Tu código de verificación es: <strong>$codigo</strong>. Por favor, ingrésalo en el sistema para continuar.";
		            if ($this->enviarCorreo($correo, $asunto, $mensaje)) {
		                echo '<article class="message is-info">
		                    <div class="message-body">
		                        Se ha enviado un código de verificación a tu correo.
		                    </div>
		                </article>';
		            } else {
		                echo '<article class="message is-danger">
		                    <div class="message-body">
		                        No se pudo enviar el código de verificación. Intenta nuevamente.
		                    </div>
		                </article>';
		            }
		        } else {
		            $intentosModel->actualizarIntentosFallidos($usuario_id, $intentos);
		        }

		        // Actualizar la variable de sesión
		        $_SESSION['intentos_fallidos'] = $intentos;
		    } else {
		        // Crear un nuevo registro de intentos fallidos
		        $intentosModel->crearIntentoFallido($usuario_id);

		        // Actualizar la variable de sesión
		        $_SESSION['intentos_fallidos'] = 1;
		    }
		}

		/*----------  Controlador cerrar sesion  ----------*/
		public function cerrarSesionControlador(){
			// Destruir todas las variables de sesión
			$_SESSION = array();
		
			// Si se desea destruir la sesión completamente, también se debe destruir la cookie de sesión.
			if (ini_get("session.use_cookies")) {
				$params = session_get_cookie_params();
				setcookie(session_name(), '', time() - 42000,
					$params["path"], $params["domain"],
					$params["secure"], $params["httponly"]
				);
			}
		
			// Destruir la sesión
			session_destroy();

			error_log("Sesión cerrada y cookies eliminadas.");
		
			// Asegúrate de no haber enviado contenido antes de usar header()
			if (!headers_sent()) {
				// En lugar de redirigir directamente al home en cerrarSesionControlador
				header("Location: ".APP_URL);
				exit();
			} else {
				echo "<script> window.location.href='".APP_URL."home/'; </script>";
				exit();
			}
		}
		

	}

