
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
<div class="header">
    <h1>Boletas Colombia</h1>
</div>
<nav class="navbar navbar-expand-lg" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="sesionProveedor.php">
            <img id="logo" src="img/icono.png" alt="Logo del negocio Boletas Colombia" class="me-2">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex" id="navbarNav">
            <ul class="navbar-nav mb-2 mb-lg-0 me-auto"> <!-- 'me-auto' para empujar -->
                <li class="nav-item me-3">
                    <a class="nav-link active" aria-current="page" href="evento.php">Eventos</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">Contáctanos</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
            </ul>
            <ul class="navbar-nav"> <!-- Nuevo ul para el dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <?php echo $proveedor -> getNombre() . ' ' . $proveedor -> getApellido(); ?>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="userDropdown">
                        <li><a href="#" class="dropdown-item">Mi cuenta</a></li>
                        <li><a href="#" class="dropdown-item">Configuracion</a></li>
                        <li><a href="index.php?logout=true" class="dropdown-item">Cerrar Sesion</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
