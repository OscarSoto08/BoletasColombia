<?php
    session_start();
    if(!isset($_SESSION["id"])){
        header("Location: iniciarSesion.php");
    }
    $id = $_SESSION["id"];
    require ("logica/Persona.php");
    require ("logica/Proveedor.php");
    $proveedor = new Proveedor($id);
    $proveedor -> consultar();
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proveedor</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
     <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php require ("encProveedor.php");?>
	<div class="container">
		<div class="row mb-3">
			<div class="col">
				<div class="card border-primary">
					<div class="card-header text-bg-info">
						<h4>Proveedores</h4>
					</div>
					<div class="card-body">
						<p>Bienvenido Proveedor <?php echo $proveedor -> getNombre() . " " . $proveedor -> getApellido() ?></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>