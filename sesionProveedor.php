<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proveedor</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom CSS -->
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/profile.css">
</head>
<body>
    <?php require ("encProveedor.php");?>
	<div class="container mt-5">
        <p>Bienvenido Proveedor <?php echo $proveedor -> getNombre() . " " . $proveedor -> getApellido() ?></p>
	</div>
</body>
</html>