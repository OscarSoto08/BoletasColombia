<?php
include ("logica/Ciudad.php");
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
<?php include ("encProveedor.php");?>
<div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <h2>Tus Eventos</h2>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Dirección</th>
                            <th>Aforo</th>
                            <th>Fecha</th>
                            <th>Ciudad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Juan</td>
                            <td>Evento al aire libre</td>
                            <td>Calle 54 sur #33a - 89</td>
                            <td>33</td>
                            <td>30/12/2000</td>
                            <td>Bogotá</td>
                        </tr>
                        <tr>
                        <td>1</td>
                            <td>Juan</td>
                            <td>Evento al aire libre</td>
                            <td>Calle 54 sur #33a - 89</td>
                            <td>33</td>
                            <td>30/12/2000</td>
                            <td>Bogotá</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- Columna derecha con formulario -->
            <div class="col-md-4">
                <h2>Formulario</h2>
                <form>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción">
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
                    </div>
                    <div class="mb-3">
                        <label for="aforo" class="form-label">Aforo</label>
                        <input type="number" class="form-control" id="aforo" name="aforo" placeholder="Aforo">
                    </div>
                    <div class="mb-3">
                        <label for="fecha" class="form-label">Fecha</label>
                        <input type="date" class="form-control" id="fecha" name="fecha">
                    </div>
                    <div class="mb-3">
                        <label for="ciudad" class="form-label">Ciudad</label>
                        <select name="ciudad" id="ciudad" class="form-control">
                            <?php
                                $ciudad = new Ciudad();
                                $ciudades = $ciudad->consultarTodos();
                                echo "Hollas";
                                foreach ($ciudades as $ciudad){
                                    echo "<option value=".$ciudad->getIdCiudad().">".$ciudad->getNombre()."</option>";
                                }
                            ?>
                        <select>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>