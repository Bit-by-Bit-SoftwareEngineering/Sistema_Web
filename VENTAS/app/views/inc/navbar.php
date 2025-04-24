<?php
global $vistaSolicitada;
?>
<?php if ($vistaSolicitada === "home") : ?>
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="#">FarmaVida</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#nosotros">Nosotros</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#perfumes">Productos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#contactos">Contáctanos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-primary" href="?views=login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" id="cart-icon" data-bs-toggle="modal" data-bs-target="#cartModal">
                    <i class="fas fa-shopping-cart"></i> Carrito (<span id="cart-count">0</span>)
                </a>
            </li>
        </ul>
    </div>
</nav>
<?php endif; ?>

<div class="full-width navBar">
    <div class="full-width navBar-options">
        <i class="fas fa-exchange-alt fa-fw" id="btn-menu"></i> 
        <nav class="navBar-options-list">
            <ul class="list-unstyle">
                <li class="text-condensedLight noLink" >
                    <a class="btn-exit" href="<?php echo APP_URL."logOut/"; ?>" >
                        <i class="fas fa-power-off"></i>
                    </a>
                </li>
                <li class="text-condensedLight noLink" >
                    <small><?php echo $_SESSION['usuario']; ?></small>
                </li>
                <li class="noLink">
                    <?php
                        if(is_file("./app/views/fotos/".$_SESSION['foto'])){
                            echo '<img class="is-rounded img-responsive" src="'.APP_URL.'app/views/fotos/'.$_SESSION['foto'].'">';
                        }else{
                            echo '<img class="is-rounded img-responsive" src="'.APP_URL.'app/views/fotos/default.png">';
                        }
                    ?>
                </li>
            </ul>
        </nav>
    </div>
</div>