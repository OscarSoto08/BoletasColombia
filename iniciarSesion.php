<?php
session_start();
require("logica/Persona.php");
require("logica/Proveedor.php");
require("logica/Cliente.php");

$error = false;

if (isset($_POST["autenticar"])) {
    $correo = $_POST["correo"];
    $clave = md5($_POST["clave"]);

    // Intentar autenticar como proveedor
    $proveedor = new Proveedor(null, null, null, $correo, $clave, null, null);
    if ($proveedor->autenticar()) {
        $_SESSION["id"] = $proveedor->getIdPersona();
        header("Location: sesionProveedor.php");
        exit;
    }

    // Intentar autenticar como cliente
    $cliente = new Cliente(null, null, null, $correo, $clave, null, null);
    if ($cliente->autenticar()) {
        $_SESSION["id"] = $cliente->getIdPersona();
        header("Location: sesionCliente.php");
        exit;
    }

    // Si no se autentica como proveedor ni cliente
    $error = true;
}

require 'head.php';
?>
<body>  
<?php require 'Encabezado.php'; ?>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-lg-4 col-md-6 col-sm-8">
            <p id="heading">Bienvenido de nuevo</p>
            <?php if (isset($_GET["registro"])) { ?>
                <div class="space-y-2 p-4">
                    <div
                        role="alert"
                        class="bg-green-100 dark:bg-green-900 border-l-4 border-green-500 dark:border-green-700 text-gray-900 dark:text-gray-100 p-2 rounded-lg flex items-center transition duration-300 ease-in-out hover:bg-green-200 dark:hover:bg-green-800 transform hover:scale-105"
                    >
                        <i class="fas fa-check-circle h-5 w-5 flex-shrink-0 mr-2 text-green-600"></i>
                        <p class="text-black text-xs font-semibold">¡Éxito! El registro se ha insertado correctamente.</p>
                    </div>
                </div>
            <?php } ?>
            <form method="post" action="iniciarSesion.php" class="form">
                <div class="field">
                    <span class="input-icon">
                        <i class="fas fa-envelope"></i>
                    </span>
                    <input autocomplete="off" placeholder="Correo" name="correo" class="input-field" type="email">
                </div>
                <div class="field">
                    <span class="input-icon">
                        <i class="fas fa-lock"></i>
                    </span>
                    <input placeholder="Contraseña" name="clave" class="input-field" type="password">
                </div>
                <div class="btn">
                    <button type="submit" class="button1" name="autenticar">Ingresar</button>
                    <a class="button2" href="registro.php">Registrarse</a>
                </div>
                <button class="button3">Olvidé mi contraseña</button>
                <!-- Manejo de errores -->
                <?php if ($error) { ?>
                    <div class="error">
                        <div class="error__icon">
                            <i class="fa-solid fa-circle-exclamation"></i>
                        </div>
                        <div class="error__title">Error, verifique las credenciales</div>
                    </div>
                <?php } ?>
                <?php if (isset($_GET["usuarioExiste"])) { ?>
                    <div class="error">
                        <div class="error__icon">
                            <i class="fa-solid fa-circle-exclamation"></i>
                        </div>
                        <div class="error__title">El usuario que ingresaste ya existe</div>
                    </div>
                <?php } ?>
            </form>
        </div>
    </div>
</div>
</body>
</html>
