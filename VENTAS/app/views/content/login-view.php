<div class="main-container">

    <div class="container mt-3" style="position: absolute; top: 10px; left: 10px;">
        <a href="?views=home" class="button is-small is-primary">
            <i class="fas fa-arrow-left"></i> Volver al Inicio
        </a>
    </div>

    <form class="box login" action="" method="POST" autocomplete="off">
        <p class="has-text-centered">
            <i class="fas fa-user-circle fa-5x"></i>
        </p>
        <h5 class="title is-5 has-text-centered">Inicia sesión con tu cuenta</h5>

        <?php
            if (isset($_POST['login_usuario']) && isset($_POST['login_clave'])) {
                $insLogin->iniciarSesionControlador();
            }
        ?>

        <div class="field">
            <label class="label"><i class="fas fa-user-secret"></i> &nbsp; Usuario</label>
            <div class="control">
                <input class="input" type="text" name="login_usuario" pattern="[a-zA-Z0-9]{4,20}" maxlength="20" required>
            </div>
        </div>

        <div class="field">
            <label class="label"><i class="fas fa-key"></i> &nbsp; Clave</label>
            <div class="control">
                <input class="input" type="password" name="login_clave" pattern="[a-zA-Z0-9$@.-]{7,100}" maxlength="100" required>
            </div>
        </div>

        <?php
        // Mostrar el campo de código de verificación si hay intentos fallidos
        if (isset($_SESSION['intentos_fallidos']) && $_SESSION['intentos_fallidos'] >= 3) {
        ?>
        <div class="field">
            <label class="label"><i class="fas fa-shield-alt"></i> &nbsp; Código de Verificación</label>
            <div class="control">
                <input class="input" type="text" name="codigo_verificacion" pattern="[0-9]{6}" maxlength="6" required>
            </div>
        </div>
        <?php } ?>

        <p class="has-text-centered mb-4 mt-3">
            <button type="submit" class="button is-info is-rounded">LOG IN</button>
        </p>

    </form>
</div>
