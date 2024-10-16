<!DOCTYPE html>
<html lang="es">
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
        require 'Carrusel.php';
        session_start();
        if(isset($_GET['logout'])){
            session_destroy();
        }
    ?>

        <h2 class="text-center mb-4">Eventos disponibles</h2>
        <div class="row">
            <?php 
                include 'logica/Evento.php';
                $evento = new Evento();
                $ArrayEventos = $evento->consultarTodos();
                foreach ($ArrayEventos as $eventoAct) {
            ?>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://i.ibb.co/C2Kbgx6/icono.png" class="card-img-top" alt="<?php echo $eventoAct->getNombre(); ?>">
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title text-center"><?php echo '<h2>' . $eventoAct->getNombre() . '</h2>'; ?></h5>
                            <h6 class="mb-3 text-center"><i><?php echo $eventoAct->getdireccion(); ?></i></h6>
                            <p class="card-text">Fecha: <?php echo $eventoAct->getFecha(); ?></p>
                            <p class="card-text">Aforo: <?php echo $eventoAct->getAforo(); ?></p>
                            <button class="btn btn-primary">Más detalles</button>
                        </div>
                    </div>
                </div>
            <?php
                }
            ?>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Boletas Colombia. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
