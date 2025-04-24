// dashboards1-view.php

<div class="container is-fluid">
	<h1 class="title">Dashboard de Informes</h1>
  	<div class="columns is-flex is-justify-content-center">
    	<figure class="image is-128x128">
    		<?php
    			if(is_file("./app/views/fotos/".$_SESSION['foto'])){
    				echo '<img class="is-rounded" src="'.APP_URL.'app/views/fotos/'.$_SESSION['foto'].'">';
    			}else{
    				echo '<img class="is-rounded" src="'.APP_URL.'app/views/fotos/default.png">';
    			}
    		?>
		</figure>
  	</div>
  	<div class="columns is-flex is-justify-content-center">
  		<h2 class="subtitle">Bienvenido al Informe <?php echo $_SESSION['nombre']." ".$_SESSION['apellido']; ?>!</h2>
  	</div>
</div>

<div class="container pb-6 pt-6">

	<div class="columns">
		<div class="column">
			<nav class="level is-mobile">
			  	<div class="level-item has-text-centered">
				    <a href="<?php echo APP_URL; ?>cashierList/">
				      	<p class="heading"><i class="fas fa-cash-register fa-fw"></i> &nbsp; Cajas</p>
				      	<p class="title"><?php echo $total_cajas->rowCount(); ?></p>
				    </a>
			  	</div>
			  	<div class="level-item has-text-centered">
			    	<a href="<?php echo APP_URL; ?>userList/">
			      		<p class="heading"><i class="fas fa-users fa-fw"></i> &nbsp; Usuarios</p>
			      		<p class="title"><?php echo $total_usuarios->rowCount(); ?></p>
			    	</a>
			  	</div>
			  	<div class="level-item has-text-centered">
				    <a href="<?php echo APP_URL; ?>clientList/">
				      	<p class="heading"><i class="fas fa-address-book fa-fw"></i> &nbsp; Clientes</p>
				      	<p class="title"><?php echo $total_clientes->rowCount(); ?></p>
				    </a>
			  	</div>
			</nav>
		</div>
	</div>

	<div class="columns pt-6">
		<div class="column">
			<nav class="level is-mobile">
				<div class="level-item has-text-centered">
				    <a href="<?php echo APP_URL; ?>categoryList/">
				      <p class="heading"><i class="fas fa-tags fa-fw"></i> &nbsp; Categorías</p>
				      <p class="title"><?php echo $total_categorias->rowCount(); ?></p>
				    </a>
			  	</div>
			  	<div class="level-item has-text-centered">
				    <a href="<?php echo APP_URL; ?>productList/">
				      	<p class="heading"><i class="fas fa-cubes fa-fw"></i> &nbsp; Productos</p>
				      	<p class="title"><?php echo $total_productos->rowCount(); ?></p>
				    </a>
			  	</div>
			  	<div class="level-item has-text-centered">
			    	<a href="<?php echo APP_URL; ?>saleList/">
			      		<p class="heading"><i class="fas fa-shopping-cart fa-fw"></i> &nbsp; Ventas</p>
			      		<p class="title"><?php echo $total_ventas->rowCount(); ?></p>
			    	</a>
			  	</div>
			</nav>
		</div>
	</div>

</div>

<!-- Informe de Power BI -->
<div class="container">
	<div class="columns is-centered">
		<div class="column is-full">
			<div class="box">
				<h3 class="title is-4 has-text-centered">Informe de Power BI</h3>
				<iframe title="prueba1" width="100%" height="1060" src="https://app.powerbi.com/view?r=eyJrIjoiNWY5ZWViMWMtMjkzNC00OTFlLThhNzEtZmRkNjI4MDk4ZTdkIiwidCI6ImNjMjg2MzNmLTEyYjgtNDZjYi1iYzE1LTk1MWRhZTIzOWI0ZCIsImMiOjR9" frameborder="0" allowFullScreen="true"></iframe>
			</div>
		</div>
	</div>
</div>
