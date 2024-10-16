<?php


include ("encProveedor.php");
if (isset($_POST["nombre"],$_POST["descripcion"],$_POST["direccion"],$_POST["aforo"],$_POST["fecha"],$_POST["ciudad"])){
    $evento = new Evento(null,$_POST["nombre"],$_POST["descripcion"],$_POST["direccion"],$_POST["aforo"],$_POST["fecha"],$_POST["ciudad"]);
    $evento->regisEven($_SESSION["id"]);
}
if (isset($_POST["idAct"],$_POST["nombreAct"],$_POST["descripcionAct"],$_POST["direccionAct"],$_POST["aforoAct"],$_POST["fechaAct"],$_POST["ciudadAct"])){
    $evento = new Evento($_POST["idAct"],$_POST["nombreAct"],$_POST["descripcionAct"],$_POST["direccionAct"],$_POST["aforoAct"],$_POST["fechaAct"],$_POST["ciudadAct"]);
    $evento->actEven();
}


if(isset($_POST["idOp"])){
    $evento = new Evento($_POST["idOp"]);
    $evento -> eliminarEvento();
}
require 'head.php'; ?>

<body>    
<link rel="stylesheet" href="css/profile.css">
<div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <h2 class="mx-auto my-3">Lista de eventos</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Dirección</th>
                            <th>Aforo</th>
                            <th>Fecha</th>
                            <th>Ciudad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $evento = new Evento();
                            $ArrayEventos = $evento->consPorIdProv($idProv);
                            foreach ($ArrayEventos as $eventoAct) {
                                
                                echo "<tr>
                                           <td>".$eventoAct->getIdEvento()."</td> 
                                           <td>".$eventoAct->getNombre()."</td>
                                           <td>".$eventoAct->getDescripcion()."</td>
                                           <td>".$eventoAct->getdireccion()."</td>
                                           <td>".$eventoAct->getAforo()."</td>
                                           <td>".$eventoAct->getFecha()."</td>
                                           <td>".$eventoAct->getCiudad()->getNombre()."</td>
                                           <td><button class='btn btn-sm btn-primary'>Editar</button>
                                           <form action='evento.php' method='post'>
                                                <input type='hidden' name='idOp' value='".$eventoAct->getIdEvento()."'>
                                                <button type='submit'class='btn btn-sm btn-primary'>Eliminar</button>
                                           </form>
                                           <form action='evento.php' method='post'>
                                                <input type='hidden' name='idAct' value='".$eventoAct->getIdEvento()."'>
                                                <button type='submit'class='btn btn-sm btn-primary'>Actualizar</button>
                                           </form>
                                           </td>
                                           </td> 
                                      </tr>";
                            }
                        ?>
                    </tbody>
                </table>
            </div>
            
            <!-- Columna derecha con formulario -->
            <div class="col-md-4">
                <h2 class="my-3">Panel de control de Eventos</h2>
                <form action="evento.php" method="post">
                    <?php
                        if(isset($_POST["idAct"])){
                            $evento = new Evento($_POST["idAct"]);
                            $evento = $evento -> consultarEveId();
                        
                    ?>
                        <input type="hidden" value="<?php echo $evento->getIdEvento(); ?>" name="idAct">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" value="<?php echo $evento->getNombre(); ?>" class="form-control" id="nombre" name="nombreAct" placeholder="Nombre">
                        </div>
                        <div class="mb-3">
                            <label for="descripcion" class="form-label">Descripción</label>
                            <input type="text" value="<?php echo $evento->getDescripcion(); ?>" class="form-control" id="descripcion" name="descripcionAct" placeholder="Descripción">
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" value="<?php echo $evento->getdireccion(); ?>" class="form-control" id="direccion" name="direccionAct" placeholder="Dirección">
                        </div>
                        <div class="mb-3">
                            <label for="aforo" class="form-label">Aforo</label>
                            <input type="number" value="<?php echo $evento->getAforo(); ?>" class="form-control" id="aforo" name="aforoAct" placeholder="Aforo">
                        </div>
                        <div class="mb-3">
                            <label for="fecha" class="form-label">Fecha</label>
                            <input type="date" value="<?php echo $evento->getFecha(); ?>" class="form-control" id="fecha" name="fechaAct">
                        </div>
                        <div class="mb-3">
                            <label for="ciudad" class="form-label">Ciudad</label>
                            <select name="ciudadAct" id="ciudad" class="form-control">
                                <?php
                                    $ciudad = new Ciudad();
                                    $ciudades = $ciudad->consultarTodos();
                                    foreach ($ciudades as $ciudad){
                                        if($ciudad->getIdCiudad() == $evento->getCiudad()){
                                            echo "<option value=".$ciudad->getIdCiudad()." class='form-control' selected>".$ciudad->getNombre()."</option>";
                                        }else{
                                            echo "<option value=".$ciudad->getIdCiudad()." class='form-control'>".$ciudad->getNombre()."</option>";
                                        }
                                        
                                    }
                                ?>
                            <select>
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    <?php
                        }else{
                    ?>
                    
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
                                    foreach ($ciudades as $ciudad){
                                        echo "<option value=".$ciudad->getIdCiudad()." class='form-control'>".$ciudad->getNombre()."</option>";
                                    }
                                ?>
                            <select>
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    <?php
                        }
                    ?>
                </form>
            </div>
        </div>
    </div>
</body>
</html>