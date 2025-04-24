<?php

	namespace app\controllers;
	use app\models\mainModel;

	class loginController extends mainModel{

		/*----------  Controlador iniciar sesion  ----------*/
		public function iniciarSesionControlador(){

			$usuario=$this->limpiarCadena($_POST['login_usuario']);
		    $clave=$this->limpiarCadena($_POST['login_clave']);

		    # Verificando campos obligatorios #
		    if($usuario=="" || $clave==""){
				echo '<article class="message is-danger">
				  <div class="message-body">
				    <strong>Ocurrió un error inesperado</strong><br>
				    No has llenado todos los campos que son obligatorios
				  </div>
				</article>';
		    }else{

			    # Verificando integridad de los datos #
			    if($this->verificarDatos("[a-zA-Z0-9]{4,20}",$usuario)){
					echo '<article class="message is-danger">
					  <div class="message-body">
					    <strong>Ocurrió un error inesperado</strong><br>
					    El USUARIO no coincide con el formato solicitado
					  </div>
					</article>';
			    }else{

			    	# Verificando integridad de los datos #
				    if($this->verificarDatos("[a-zA-Z0-9$@.-]{7,100}",$clave)){
						echo '<article class="message is-danger">
						  <div class="message-body">
						    <strong>Ocurrió un error inesperado</strong><br>
						    La CLAVE no coincide con el formato solicitado
						  </div>
						</article>';
				    }else{

					    # Verificando usuario #
					    $check_usuario=$this->ejecutarConsulta("SELECT * FROM usuario WHERE usuario_usuario='$usuario'");

					    if($check_usuario->rowCount()==1){

					    	$check_usuario=$check_usuario->fetch();

					    	if($check_usuario['usuario_usuario']==$usuario && password_verify($clave,$check_usuario['usuario_clave'])){

					    		$_SESSION['id']=$check_usuario['usuario_id'];
					            $_SESSION['nombre']=$check_usuario['usuario_nombre'];
					            $_SESSION['apellido']=$check_usuario['usuario_apellido'];
					            $_SESSION['usuario']=$check_usuario['usuario_usuario'];
					            $_SESSION['foto']=$check_usuario['usuario_foto'];
					            $_SESSION['caja']=$check_usuario['caja_id'];


					            if(headers_sent()){
					                echo "<script> window.location.href='".APP_URL."dashboard/'; </script>";
					            }else{
					                header("Location: ".APP_URL."dashboard/");
					            }

					    	}else{
					    		echo '<article class="message is-danger">
								  <div class="message-body">
								    <strong>Ocurrió un error inesperado</strong><br>
								    Usuario o clave incorrectos
								  </div>
								</article>';
					    	}

					    }else{
							echo '<article class="message is-danger">
							  <div class="message-body">
							    <strong>Ocurrió un error inesperado</strong><br>
							    Usuario o clave incorrectos
							  </div>
							</article>';
					    }
				    }
			    }
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

