<?php
session_start();
require("logica/Persona.php");
require("logica/Proveedor.php");
require "logica/Cliente.php";

$error = false;
$mensaje = "";
$esProveedor = null;

if (isset($_POST["registrar"])) {
    //Primero se debe verificar que el usuario existe o no existe todavia

        // Intentar autenticar como proveedor
    $proveedor = new Proveedor(null, $_POST["nombre"], $_POST["apellido"], $_POST["correo"], md5($_POST["clave"]), $_POST["telefono"], $_POST["direccion"]);

        // Intentar autenticar como cliente
    $cliente = new Cliente(null, $_POST["nombre"], $_POST["apellido"], $_POST["correo"], md5($_POST["clave"]), $_POST["telefono"], $_POST["direccion"]);
        
    if ($proveedor->autenticar() || $cliente->autenticar()) {
        header("Location: iniciarSesion.php?usuarioExiste=true");
        exit;
    }

    //Continuar con el flujo

    ($_POST["rol"] == "proveedor")? $esProveedor = true : $esProveedor = false;

    if (!$proveedor->registrar() || !$cliente->registrar()) {
        $error = true;
    } 

    header("Location: iniciarSesion.php?registro=true");
    exit();
}

require 'head.php';
?>
<body>  
<?php require 'Encabezado.php'; ?>
<div class="container">
    <div class="row mt-5">
        <div class="col-lg-4 col-md-8 col-sm-12 mx-auto">
            <p id="heading">Crea una cuenta</p>
            <form method="post" action="registro.php" class="form">
                <!-- Campos de entrada -->
                <div class="field">
                    <input autocomplete="off" placeholder="Nombres" name="nombre" class="input-field" type="text" required>
                </div>
                <div class="field">
                    <input autocomplete="off" placeholder="Apellidos" name="apellido" class="input-field" type="text" required>
                </div>
                <div class="field">
                    <input autocomplete="off" placeholder="Correo" name="correo" class="input-field" type="email" required>
                </div>
                <div class="field">
                    <input placeholder="Contraseña" name="clave" class="input-field" type="password" required>
                </div>
                <div id="radios" class="mb-3 role-selection">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="proveedor" checked name="rol" value="proveedor"/>
                        <label class="form-check-label" for="proveedor">Proveedor</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="cliente" name="rol" value="cliente"/>
                        <label class="form-check-label" for="cliente">Cliente</label>
                    </div>
                </div>
                <div class="field">
                    <input placeholder="Telefono" name="telefono" class="input-field" type="text" required>
                </div>
                <div class="field">
                    <input placeholder="Direccion" name="direccion" class="input-field" type="text" required>
                </div>
                <div class="btn">
                    <a class="button1" href="iniciarSesion.php">Tengo una cuenta</a>
                    <button type="submit" class="button2" name="registrar">Registrarse</button>
                </div>
                <?php if ($error) { ?>
                    <div class="error">
                        <div class="error__icon">
                            <i class="fa-solid fa-circle-exclamation"></i>
                        </div>
                        <div class="error__title">Error, verifique las credenciales</div>
                    </div>
                <?php } ?>
                <?php if ($mensaje) { ?>
                    <div class="success">
                        <div class="success__icon">
                            <i class="fa-solid fa-check-circle"></i>
                        </div>
                        <div class="success__title"><?php echo htmlspecialchars($mensaje); ?></div>
                    </div>
                <?php } ?>
            </form>
        </div>
    </div>
</div>
</body>
</html>
