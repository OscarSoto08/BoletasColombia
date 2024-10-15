<?php
session_start();
require ("logica/Persona.php");
require ("logica/Proveedor.php");
$error = false;
if(isset($_POST["autenticar"])){
    $proveedor = new Proveedor(null, null, null, $_POST["correo"], $_POST["clave"], null, null);
    if($proveedor -> autenticar()){
        $_SESSION["id"] = $proveedor -> getIdPersona();
        header("Location: sesionProveedor.php");     
    }else{
        $error = true;
    }    
}
?>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boletas Colombia</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
     <link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php
	require 'Encabezado.php';
?>
<div class="container">
		<div class="row mt-5">
			<div class="col-4"></div>
			<div class="col-4">
				<div class="card border-primary">
					<div class="card-header text-bg-info">
						<h4>Iniciar Sesion</h4>
					</div>
					<div class="card-body">
						<form method="post" action="iniciarSesion.php" >
							<div class="mb-3">
								<input type="email" name="correo" class="form-control" placeholder="Correo" >
							</div>
							<div class="mb-3">
								<input type="password" name="clave" class="form-control" placeholder="Clave">
							</div>
							<button type="submit" name="autenticar" class="btn btn-primary">Iniciar Sesion</button>
							<?php if($error){ ?>
                            <div class="alert alert-danger mt-3" role="alert">
                            	Error de correo o clave
							</div>    
							<?php } ?>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>