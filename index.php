<!DOCTYPE html>
<html lang="en">
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
    <?php require 'Encabezado.php';?>
    <!-- Barra de Navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
        <a class="navbar-brand" href="#">Boletas Colombia</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ingresar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contacto</a>
                </li>
            </ul>
        </div>
    </nav>


    <h2 class="text-center mb-4">TOP Eventos</h2>
    
    <!-- Carrusel -->
    <div id="carrusel" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <p class="text-center mt-3 fs-3">Destacado 1</p>
                <img src="img/icono.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <p class="text-center mt-3 fs-3">Destacado 2</p>
                <img src="img/icono.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <p class="text-center mt-3 fs-3">Destacado 3</p>
                <img src="img/icono.png" class="d-block w-100" alt="...">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carrusel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carrusel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Contenedor Principal -->
    <div class="container mt-4">
        <h2 class="text-center mb-4">Eventos disponibles</h2>
        <div class="row">
            <?php 
                include 'logica/Evento.php';
                $evento = new Evento();
                $ArrayEventos = $evento->consultarTodos();
                foreach ($ArrayEventos as $eventoAct) {
            ?>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="https://i.ibb.co/C2Kbgx6/icono.png" class="card-img-top" alt="Producto 1">
                        <div class="card-body d-flex align-center flex-column">
                            <h5 class="card-title text-center">
                                <?php echo $eventoAct -> getNombre(); ?>
                            </h5>
                            <h6 class="mb-3 text-center">
                                <i><?php echo $eventoAct -> getdireccion();?></i>
                            </h6>
                            <p class="card-text">Fecha: 
                                <?php echo $eventoAct -> getFecha(); ?>
                            </p>
                            <p class="card-text">Aforo: 
                                <?php echo $eventoAct -> getAforo(); ?>
                            </p>
                            <button class="btn btn-primary">Más detalles</button>
                        </div>
                    </div>
                </div>
            <?php
                }
            ?>
        </div>
    </div>
</body>
</html>
