<!DOCTYPE html>
<html lang="es">
<head>
    <?php require_once "./app/views/inc/head.php"; ?>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="app/views/css/home.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">FarmaVida</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto text-center">
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
                            <a class="nav-link btn btn-primary text-white my-2" href="?views=login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link my-2" href="#" id="cart-icon" data-bs-toggle="modal" data-bs-target="#cartModal">
                                <i class="fas fa-shopping-cart"></i> Carrito (<span id="cart-count">0</span>)
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cartModalLabel">Carrito de Compras</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="notification" style="display:none; padding:10px; margin-bottom:10px; background-color:#dff0d8; color:#3c763d; border:1px solid #d6e9c6; border-radius:5px;"></div>
                    <table id="cart-items" class="table table-striped">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario (Bs)</th>
                                <th>Total (Bs)</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                    <p><strong>Total: </strong> <span id="cart-total">0.00 Bs</span></p>
                    <hr>
                    
                    <h5>Información del Cliente</h5>
                    <div class="mb-3">
                        <label for="nombreCliente" class="form-label">Nombre del Cliente</label>
                        <input type="text" class="form-control" id="nombreCliente" required>
                    </div>
                    <div class="mb-3">
                        <label for="correoCliente" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="correoCliente" required>
                    </div>
                    <div class="mb-3">
                        <label for="celularCliente" class="form-label">Número de Celular</label>
                        <input type="text" class="form-control" id="celularCliente" required>
                    </div>
                    <h5>Datos Factura</h5>
                    <div class="mb-3">
                        <label for="razonSocial" class="form-label">NOMBRE/RAZÓN SOCIAL</label>
                        <input type="text" class="form-control" id="razonSocial" required>
                    </div>
                    <div class="mb-3">
                        <label for="nitCliente" class="form-label">NIT/CI/CEX</label>
                        <input type="text" class="form-control" id="nitCliente" required>
                    </div>
                    <h5>Método de Pago</h5>
                    <div class="mb-3">
                        <label for="metodoPago" class="form-label">Selecciona el Método de Pago</label>
                        <div id="metodoPago">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="metodoPago" id="tarjetaCredito" value="tarjetaCredito" required>
                                <label class="form-check-label" for="tarjetaCredito">
                                    <i class="fas fa-credit-card" style="font-size: 40px;"></i><br>
                                    Tarjeta de Crédito
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="metodoPago" id="qrPago" value="qrPago">
                                <label class="form-check-label" for="qrPago">
                                    <i class="fas fa-qrcode" style="font-size: 40px;"></i><br>
                                    QR
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="metodoPago" id="efectivo" value="efectivo">
                                <label class="form-check-label" for="efectivo">
                                    <i class="fas fa-money-bill-wave" style="font-size: 40px;"></i><br>
                                    Efectivo
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button id="clear-cart" type="button" class="btn btn-danger">Vaciar Carrito</button>
                    <button id="procederPago" type="button" class="btn btn-success">Proceder al Pago</button>
                </div>
            </div>
        </div>
    </div>

    <div id="main-content" class="container mt-5 pt-5">
        <h1>Bienvenido a FarmaVida</h11.5
        <p style="font-size: 2rem; font-weight: bold; text-align: left; color: #333; margin: 20px 0;">
            ¡Compra lo que necesites las 24 horas del día!
        </p>

        <h2 id="nosotros">Nuestra tienda y lo más importante nuestros clientes</h2>

        <div class="my-4 px-3 py-3 bg-light rounded">

            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active"> <!-- Agrega la clase 'active' aquí -->
                        <img src="./app/views/img/sliders/dentro2.jpg" class="d-block w-100" alt="Imagen 1">
                    </div>
                    
                    <div class="carousel-item">
                        <img src="./app/views/img/sliders/clientes.jpg" class="d-block w-100" alt="Imagen 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        
                <!-- Sección de Visión y Misión -->
                <section class="vision-mision-section">
                    <div class="card-vis-mis">
                        <div class="card-content">
                            <h3 style="font-size: 1.5rem; font-weight: bold; text-align: center; margin-bottom: 10px; color: #333;">
                                Visión
                            </h3>
                            <p style="font-size: 1rem; line-height: 1.5; text-align: justify; color: #666; margin-bottom: 15px;">
                                “Ser la farmacia de referencia en el barrio, reconocida por nuestra atención cercana, confiabilidad y compromiso con la salud de nuestros vecinos.”
                            </p>
                        </div>
                    </div>
                    <div class="card-vis-mis">
                        <div class="card-content">
                            <h3 style="font-size: 1.5rem; font-weight: bold; text-align: center; margin-bottom: 10px; color: #333;">
                                Misión
                            </h3>
                            <p style="font-size: 1rem; line-height: 1.5; text-align: justify; color: #666; margin-bottom: 15px;">
                                “Somos FarmaVida, trabajamos unidos generando experiencias memorables que ayudan a las familias a llevar una vida feliz y saludable. Proveer medicamentos y productos de salud de alta calidad, ofreciendo un servicio personalizado y accesible para mejorar el bienestar de nuestra comunidad.”
                            </p>
                        </div>
                    </div>
                </section>
        <!-- Sección del Logo con animación al hacer scroll -->
        <section class="logo-section my-5">
            <div class="logo-container">
                <img src="./app/views/fotos/logo.png" alt="Logo FarmaVida" class="logo-animado" id="logoAnimado">
            </div>
        </section>        

        <!-- Sección de Slogan con animación -->
        <section class="slogan-section my-4">
            <div class="slogan-container">
                <span class="slogan-text">
                    Cuidamos de ti y de tu familia, <span class="slogan-highlight">siempre cerca</span>, <span class="slogan-highlight">siempre confiables</span>.
                </span>
            </div>
        </section>

        <!--Seccion de descuento-->
        <section class="promo-section">
            <div class="promo-left">
                <img src="./app/views/fotos/farma.png" alt="Imagen adaptable">
            </div>
            <div class="promo-right">
                <h2>Descuentos en FarmaVida</h2>
                <p style="font-size: 2.5vw; font-weight: bold; text-align: center; color: #333; margin: 20px 0;">
                    ¡Llegó el momento de ahorrar!
                </p>
                <a href="" id="openCalendarModal" data-bs-toggle="modal" data-bs-target="#calendarModal" style="font-size: 1.5vw;">
                    Abrir Calendario
                </a>
            </div>
        </section>

        <div class="modal fade" id="calendarModal" tabindex="-1" aria-labelledby="calendarModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="calendarModalLabel">Ofertas Semanales</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="calendar-container">
                            <div class="calendar-header">
                                <div class="calendar-day">Lunes</div>
                                <div class="calendar-day">Martes</div>
                                <div class="calendar-day">Miércoles</div>
                                <div class="calendar-day">Jueves</div>
                                <div class="calendar-day">Viernes</div>
                                <div class="calendar-day">Sábado</div>
                            </div>
                            <div class="calendar-body">
                                <div class="calendar-offer">
                                    <img src="./app/views/img/ofertas/1.png" alt="Oferta Lunes">
                                    <p>Lunes</p>
                                </div>
                                <div class="calendar-offer">
                                    <img src="./app/views/img/ofertas/6.png" alt="Oferta Martes">
                                    <p>Martes</p>
                                </div>
                                <div class="calendar-offer">
                                    <img src="./app/views/img/ofertas/2.png" alt="Oferta Miércoles">
                                    <p>Miércoles</p>
                                </div>
                                <div class="calendar-offer">
                                    <img src="./app/views/img/ofertas/3.png" alt="Oferta Jueves">
                                    <p>Jueves</p>
                                </div>
                                <div class="calendar-offer">
                                    <img src="./app/views/img/ofertas/4.png" alt="Oferta Viernes">
                                    <p>Viernes</p>
                                </div>
                                <div class="calendar-offer">
                                    <img src="./app/views/img/ofertas/5.png" alt="Oferta Sábado">
                                    <p>Sábado</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <h1>Nuestros Productos</h1>

        <!-- Sección de productos -->
        <div class="row" id="perfumes">
            <?php
            use app\controllers\productController;

            $productController = new productController();

            $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
            $productosPorPagina = 32;

            $products = $productController->obtenerProductos($pagina, $productosPorPagina);
            $totalProductos = $productController->contarProductos();
            $totalPaginas = ceil($totalProductos / $productosPorPagina);

            
            if (!empty($products)): ?>
                <?php foreach ($products as $product): ?>
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <?php 
                            
                            $imagePath = './app/views/productos/' . htmlspecialchars($product['producto_foto']);
                            if (!empty($product['producto_foto']) && file_exists($imagePath)): ?>
                                <img src="<?= $imagePath ?>" class="card-img-top" alt="Foto del producto">
                            <?php else: ?>
                                <img src="./app/views/img/productos/default.jpg" class="card-img-top" alt="Foto del producto">
                            <?php endif; ?>
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 1.2rem; font-weight: bold; margin-bottom: 10px; color: #333;"><?= htmlspecialchars($product['producto_nombre']) ?></h5>
                                <p class="card-text" style="font-size: 1.2rem; font-weight: bold; margin-bottom: 10px; color: #333;"><strong>Marca: </strong> <?= htmlspecialchars($product['producto_marca']) ?></p>
                                <p class="card-text" style="font-size: 1rem; color: #666; margin-bottom: 10px;"><strong>Modelo: </strong> <?= htmlspecialchars($product['producto_modelo']) ?></p>
                                <p class="card-text" style="font-size: 1rem; color: #666; margin-bottom: 10px;"><strong>Presentacion: </strong> <?= htmlspecialchars($product['producto_modelo']) ?></p>
                                <p class="card-text" style="font-size: 1rem; color: #666; margin-bottom: 10px;" ><strong>Precio: </strong><?= number_format((float)$product['producto_precio_venta'], 2, '.', '') ?> Bs</p>
                                <button class="btn btn-primary add-to-cart-btn" data-product-id="<?= $product['producto_id'] ?>" 
                                        data-product-name="<?= htmlspecialchars($product['producto_nombre']) ?>"
                                        data-product-price="<?= number_format((float)$product['producto_precio_venta'], 2, '.', '') ?>">
                                    Añadir al carrito
                                </button>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>No hay productos disponibles en este momento.</p>
            <?php endif; ?>
        </div>
    </div>

    <!-- paginación --> 
<nav aria-label="Página de navegación">
    <ul class="pagination justify-content-center">
        <!-- Botón de Anterior -->
        <li class="page-item <?= $pagina <= 1 ? 'disabled' : '' ?>">
            <a class="page-link" href="?pagina=<?= max(1, $pagina - 1) ?>#perfumes" aria-label="Anterior">Anterior</a>
        </li>

        <!-- Páginas numeradas -->
        <?php 
        $maxLinks = 7; // Máximo número de páginas a mostrar
        $startPage = max(1, $pagina - floor($maxLinks / 2)); // Inicial
        $endPage = min($totalPaginas, $pagina + floor($maxLinks / 2)); // Final
        
        // Ajustar si hay un espacio en blanco antes de la primera página
        if ($startPage > 1) {
            echo '<li class="page-item"><a class="page-link" href="?pagina=1#perfumes">1</a></li>';
            echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
        }

        // Mostrar las páginas dentro del rango
        for ($i = $startPage; $i <= $endPage; $i++) {
            echo '<li class="page-item ' . ($pagina == $i ? 'active' : '') . '">
                    <a class="page-link" href="?pagina=' . $i . '#perfumes">' . $i . '</a>
                  </li>';
        }

        // Ajustar si hay un espacio en blanco después de la última página
        if ($endPage < $totalPaginas) {
            echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
            echo '<li class="page-item"><a class="page-link" href="?pagina=' . $totalPaginas . '#perfumes">' . $totalPaginas . '</a></li>';
        }
        ?>

        <!-- Botón de Siguiente -->
        <li class="page-item <?= $pagina >= $totalPaginas ? 'disabled' : '' ?>">
            <a class="page-link" href="?pagina=<?= min($totalPaginas, $pagina + 1) ?>#perfumes" aria-label="Siguiente">Siguiente</a>
        </li>
    </ul>
</nav>

        <!-- Sección de Carrusel de Marcas -->
        <section id="carousel-marcas" class="text-center mt-5">
            <h2>Nuestras Marcas</h2>
            <div class="marcas-carousel-container">
                <div class="marcas-carousel-track">
                <div class="marcas-carousel-item"><img src="./app/views/img/marcas/3m.png" alt="3m"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/bago.png" alt="Bago"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/bayer.png" alt="Salud y Medicamentos"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/Coca.png" alt="Bebidas"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/gnc.png" alt="Cuidado del Hogar"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/huggies.png" alt="Supermercado"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/Inti.png" alt="Laboratorio"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/lasante.png" alt="Cuidado Personal"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/marca1.jpeg" alt="Salud y Medicamentos"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/marca4.jpeg" alt="Accesorios de cuidado"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/marca2.jpeg" alt="Cuidado del Hogar"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/marca6.jpeg" alt="Supermercado"></div>
                    <div class="marcas-carousel-item"><img src="./app/views/img/marcas/scott.png" alt="Laboratorio"></div>
                </div>
            </div>



        <!-- Imagenes de informacion-->
        </section id="informacion-imagenes" class="text-center mt-5">
            <div class="row">
                <div class="info-item">
                    <img src="./app/views/img/iconos/documento.png" alt="Icono Cambios">
                    <h3>Cambios y devoluciones</h3>
                    <p>Revisa Términos y condiciones y Política de privacidad.</p>
                </div>
                <div class="info-item">
                    <img src="./app/views/img/iconos/card.png" alt="Icono Pago">
                    <h3>Formas de Pago</h3>
                    <p>Distintas opciones de pago con total seguridad.</p>
                </div>
                <div class="info-item">
                    <img src="./app/views/img/iconos/certificado.png" alt="Icono Compra Segura">
                    <h3>Compra 100% segura</h3>
                    <p>Tus compras están totalmente protegidas.</p>
                </div>
                <div class="info-item">
                    <img src="./app/views/img/iconos/conversacion.png" alt="Icono Centros de Ayuda">
                    <h3>Contacto</h3>
                    <p>
                        Contáctanos vía WhatsApp: 
                        <a href="https://wa.me/59169240763" target="_blank" style="color: #25D366; text-decoration: none;">
                            (+591) 69240763
                        </a>
                    </p>
                </div>
                <div class="info-item">
                    <img src="./app/views/img/iconos/factura.png" alt="Icono Facturación Electrónica">
                    <h3>Facturación Electrónica</h3>
                    <p>Obtén tu factura electrónica de manera rápida y confiable.</p>
                </div>
            </div>
      <section>


        

        </section>

        <section id="contactos" class="text-center mt-5">
  <h2>Contáctanos</h2>
  <div class="container">
    <div class="row mt-4">
      <!-- Columna izquierda: Formulario de contacto -->
      <div class="col-md-6">
        <div class="contact-form">
          <h3>Formulario de Contacto</h3>
          <form id="contactForm" action="/VENTAS/app/views/content/contact_form_handler.php" method="post">
            <div class="mb-3">
              <label for="name" class="form-label">Nombre</label>
              <input type="text" class="form-control input-square" id="name" name="name" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Correo Electrónico</label>
              <input type="email" class="form-control input-square" id="email" name="email" required>
            </div>
            <div class="mb-3">
              <label for="message" class="form-label">Mensaje</label>
              <textarea class="form-control input-square" id="message" name="message" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary btn-custom">Enviar</button>
          </form>
        </div>
      </div>
      
      <!-- Columna derecha: Mapa -->
      <div class="col-md-6">
        <h3>Encuéntranos en el Mapa</h3>
        <div id="map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2580.553020340078!2d-68.10150236068213!3d-16.505755455933734!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sbo!4v1744822850672!5m2!1ses-419!2sbo" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
      </div>


    </div>
    </div>
  </div>
</section>  


        <div class="gallery">
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/1.jpeg" alt="1">
                    <figcaption class="gallery-caption">Variedad de Analgesicos, de diferentes laboratorios</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/2.jpeg" alt="2">
                    <figcaption class="gallery-caption">Corticoides para dolores musculares</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/3.png" alt="3">
                    <figcaption class="gallery-caption">shampoos para infantes</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/4.jpg" alt="4">
                    <figcaption class="gallery-caption">Pañales</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/5.jpg" alt="5">
                    <figcaption class="gallery-caption">Chupones</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/8.jpg" alt="6">
                    <figcaption class="gallery-caption">Enjuage Bucal</figcaption>
                </figure>
            </div>
        </div>
        <div class="gallery">
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/10.jpg" alt="10">
                    <figcaption class="gallery-caption">Agua para desmaquillarse</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/11.jpg" alt="11">
                    <figcaption class="gallery-caption">Crema de cara Elvive</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/12.jpg" alt="12">
                    <figcaption class="gallery-caption">Paracetamol Laboratorio Chile</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/13.jpg" alt="13">
                    <figcaption class="gallery-caption">Ibuprofeno en Jarabe</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/14.jpg" alt="14">
                    <figcaption class="gallery-caption">Papel Higienico</figcaption>
                </figure>
            </div>
            <div class="card">
                <figure>
                    <img src="app/views/img/galeria/15.jpg" alt="15">
                    <figcaption class="gallery-caption">Ambientador de Baño</figcaption>
                </figure>
            </div>
        </div>

    </div>

    <!-- Footer -->
     <footer>
        <div class = "ondas">
            <div class = "onda" id = "onda1"></div>
            <div class = "onda" id = "onda2"></div>
            <div class = "onda" id = "onda3"></div>
            <div class = "onda" id = "onda4"></div>
        </div>
        <ul class="rrss_icon">
            <li><a href="https://es-la.facebook.com/"><ion-icon name="logo-facebook"></ion-icon></a></li>
            <li><a href="https://www.instagram.com/"><ion-icon name="logo-instagram"></ion-icon></a></li>
            <li><a href="https://x.com/"><ion-icon name="logo-twitter"></ion-icon></a></li>

        </ul>
        <ul class = "menu_footer">
            <li><a href="">Nosotros</a></li>
            <li><a href="">Productos</a></li>
            <li><a href="">Contáctanos</a></li>
            <li><a href="">Login</a></li>
            <li><a href="">Carrito</a></li>
        </ul>
        <p>©2024 FarmaVida | Todos los Derechos Reservados</p>
     </footer>
     <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
     <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            const cartCountElement = document.getElementById('cart-count');
            const cartTableBody = document.querySelector('#cart-items tbody');
            const cartTotalSpan = document.querySelector('#cart-total');
            const notificationElement = document.getElementById('notification');

            function showNotification(message) {
                notificationElement.textContent = message;
                notificationElement.style.display = 'block';
                setTimeout(() => {
                    notificationElement.style.display = 'none';
                }, 2000);
            }

            function updateCartTable() {
                cartTableBody.innerHTML = '';
                let total = 0;
                cart.forEach((item, index) => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${item.name}</td>
                        <td>
                            <img src="./app/views/img/iconos/signo-menos.png" alt="Disminuir" style="cursor:pointer; width:20px;" onclick="decreaseQuantity(${index})">
                            ${item.quantity}
                            <img src="./app/views/img/iconos/mas.png" alt="Aumentar" style="cursor:pointer; width:20px;" onclick="increaseQuantity(${index})">
                        </td>
                        <td>${item.price.toFixed(2)} Bs</td>
                        <td>${(item.price * item.quantity).toFixed(2)} Bs</td>
                        <td><img src="./app/views/img/iconos/eliminar.png" alt="Eliminar" style="cursor:pointer; width:20px;" onclick="removeFromCart(${index})"></td>
                    `;
                    cartTableBody.appendChild(row);
                    total += item.price * item.quantity;
                });
                cartTotalSpan.textContent = total.toFixed(2) + ' Bs';
                const totalItems = cart.reduce((total, item) => total + item.quantity, 0);
                cartCountElement.textContent = totalItems;
                localStorage.setItem('cart', JSON.stringify(cart));
            }

            function addToCart(productId, productName, productPrice) {
                const existingProductIndex = cart.findIndex(item => item.id === productId);
                if (existingProductIndex > -1) {
                    cart[existingProductIndex].quantity++;
                    showNotification(`Se aumentó la cantidad de ${productName}.`);
                } else {
                    cart.push({ id: productId, name: productName, price: parseFloat(productPrice), quantity: 1 });
                    showNotification(`${productName} añadido al carrito.`);
                }
                updateCartTable();
            }

            function increaseQuantity(index) {
                cart[index].quantity++;
                updateCartTable();
                showNotification(`Se aumentó la cantidad de ${cart[index].name}.`);
            }

            function decreaseQuantity(index) {
                if (cart[index].quantity > 1) {
                    cart[index].quantity--;
                    updateCartTable();
                    showNotification(`Se disminuyó la cantidad de ${cart[index].name}.`);
                } else {
                    removeFromCart(index);
                }
            }

            function removeFromCart(index) {
                const removedItem = cart[index];
                cart.splice(index, 1);
                updateCartTable();
                showNotification(`Se eliminó ${removedItem.name} del carrito.`);
            }

            // Expone las funciones para el uso en los atributos `onclick` de los elementos
            window.increaseQuantity = increaseQuantity;
            window.decreaseQuantity = decreaseQuantity;
            window.removeFromCart = removeFromCart;

            document.querySelectorAll('.add-to-cart-btn').forEach(button => {
                button.addEventListener('click', () => {
                    const productId = button.getAttribute('data-product-id');
                    const productName = button.getAttribute('data-product-name');
                    const productPrice = button.getAttribute('data-product-price');
                    addToCart(productId, productName, productPrice);
                });
            });

            document.querySelector('#clear-cart').addEventListener('click', () => {
                cart.length = 0;
                updateCartTable();
                showNotification("Se vació el carrito.");
            });

            document.querySelector('#procederPago').addEventListener('click', () => {
                const clienteInfo = {
                    nombre: document.querySelector('#nombreCliente').value,
                    correo: document.querySelector('#correoCliente').value,
                    celular: document.querySelector('#celularCliente').value,
                    razonSocial: document.querySelector('#razonSocial').value,
                    nit: document.querySelector('#nitCliente').value,
                    metodo_pago: document.querySelector('input[name="metodoPago"]:checked') ?  
                        document.querySelector('input[name="metodoPago"]:checked').value : null
                };

                if (!clienteInfo.nombre || !clienteInfo.correo || !clienteInfo.celular || !clienteInfo.razonSocial || !clienteInfo.nit || !clienteInfo.metodo_pago) {
                    alert("Por favor, rellena todos los campos de información del cliente.");
                    return;
                }

                if (cart.length === 0) {
                    alert("El carrito está vacío.");
                    return;
                }

                const cartData = cart.map(item => ({
                    nombre: item.name,
                    cantidad: item.quantity,
                    precio: item.price
                }));

                fetch('app/controllers/procesarPedido.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        cliente: clienteInfo,
                        carrito: cartData
                    })
                })
                .then(response => response.text()) 
                .then(text => {
                    try {
                        const data = JSON.parse(text);
                        if (data.success) {
                            alert("Pedido procesado con éxito.");
                            cart.length = 0;
                            updateCartTable();
                            document.querySelector('#nombreCliente').value = '';
                            document.querySelector('#correoCliente').value = '';
                            document.querySelector('#celularCliente').value = '';
                            document.querySelector('#razonSocial').value = '';
                            document.querySelector('#nitCliente').value = '';
                            document.querySelector('#metodoPago').value = '';
                        } else {
                            alert("Hubo un error al procesar el pedido: " + data.message);
                        }
                    } catch (e) {
                        alert("Error en la respuesta del servidor: " + text);
                        console.error('Error:', e);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Hubo un error al procesar el pedido.");
                });
            });

            // Load cart items on page load
            updateCartTable();
        });

        document.addEventListener('DOMContentLoaded', function() {
            const track = document.querySelector('.marcas-carousel-track');
            const items = document.querySelectorAll('.marcas-carousel-item');
            const itemWidth = items[0].offsetWidth + parseInt(getComputedStyle(items[0]).marginRight);
            const totalItems = items.length;
            
            for (let i = 0; i < totalItems; i++) {
                const clone = items[i].cloneNode(true);
                track.appendChild(clone);
            }

            let offset = 0;
            const speed = 0.5; 
            const resetPoint = itemWidth * totalItems; 

            function scrollCarousel() {
                offset += speed;

                
                if (offset >= resetPoint) {
                    
                    offset = 0;
                    track.appendChild(track.firstElementChild); 
                }

                track.style.transform = `translateX(-${offset}px)`;

                requestAnimationFrame(scrollCarousel);
            }

            scrollCarousel();
        });

        document.addEventListener('DOMContentLoaded', () => {
            const calendarOffers = document.querySelectorAll('.calendar-offer img');

            // Crear un contenedor para la imagen ampliada
            const enlargedImageContainer = document.createElement('div');
            enlargedImageContainer.style.position = 'fixed';
            enlargedImageContainer.style.top = '0';
            enlargedImageContainer.style.left = '0';
            enlargedImageContainer.style.width = '100vw';
            enlargedImageContainer.style.height = '100vh';
            enlargedImageContainer.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
            enlargedImageContainer.style.display = 'none';
            enlargedImageContainer.style.alignItems = 'center';
            enlargedImageContainer.style.justifyContent = 'center';
            enlargedImageContainer.style.zIndex = '1100'; // Asegúrate de que sea mayor que el modal
            document.body.appendChild(enlargedImageContainer);

            const enlargedImage = document.createElement('img');
            enlargedImage.style.maxWidth = '90%';
            enlargedImage.style.maxHeight = '90%';
            enlargedImage.style.borderRadius = '10px';
            enlargedImageContainer.appendChild(enlargedImage);

            calendarOffers.forEach(img => {
                img.addEventListener('click', () => {
                    // Mostrar la imagen ampliada
                    enlargedImage.src = img.src;
                    enlargedImageContainer.style.display = 'flex';
                });
            });

            // Cerrar la imagen ampliada al hacer clic fuera de ella
            enlargedImageContainer.addEventListener('click', () => {
                enlargedImageContainer.style.display = 'none';
            });
        });

        document.addEventListener('DOMContentLoaded', () => {
            const openCalendarModal = document.getElementById('openCalendarModal');

            // Previene el desplazamiento hacia la parte superior al abrir el modal
            openCalendarModal.addEventListener('click', (event) => {
                event.preventDefault(); // Previene el comportamiento predeterminado
            });

            // Asegúrate de que el modal se enfoque correctamente al abrir
            const calendarModal = document.getElementById('calendarModal');
            calendarModal.addEventListener('shown.bs.modal', () => {
                calendarModal.focus();
            });

            // Opcional: Mantén el foco en el botón que abrió el modal al cerrarlo
            calendarModal.addEventListener('hidden.bs.modal', () => {
                openCalendarModal.focus();
            });
        });

        // ...otros scripts...

        document.addEventListener('DOMContentLoaded', () => {
            const logo = document.getElementById('logoAnimado');
            if ('IntersectionObserver' in window && logo) {
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            logo.classList.add('visible');
                        }
                    });
                }, { threshold: 0.5 });
                observer.observe(logo);
            } else if (logo) {
                // Fallback: mostrar el logo si no hay IntersectionObserver
                logo.classList.add('visible');
            }
        });

    </script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactForm');
    form.addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(form);

        fetch(form.action, {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(text => {
            // Busca si el texto contiene "Mensaje enviado correctamente"
            if (text.includes('Mensaje enviado correctamente')) {
                Swal.fire({
                    icon: 'success',
                    title: '¡Mensaje enviado!',
                    text: 'Tu mensaje fue enviado correctamente. Pronto nos pondremos en contacto contigo.',
                    confirmButtonColor: '#3085d6'
                });
                form.reset();
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Hubo un error al enviar el mensaje. Intenta nuevamente.',
                    confirmButtonColor: '#d33'
                });
            }
        })
        .catch(() => {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'No se pudo conectar con el servidor.',
                confirmButtonColor: '#d33'
            });
        });
    });
});
</script>

</body>
</html>
