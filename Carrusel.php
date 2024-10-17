<div class="container mt-4">
        <h2 class="text-center mb-4">TOP Eventos</h2>
        
        <!-- Carrusel -->
        <div id="carrusel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-inner">
                <?php 
                for( $i = 0; $i < 5; $i++ ){ ?>
                <div class="carousel-item <?php if($i == 0){ echo "active"; }?>">
                    <img src="<?php echo $ArrayEventos[$i] -> getImagen(); ?>" class="d-block w-100" alt="Destacado">
                    <div class="carousel-caption d-none d-md-block">
                        <h5><?php echo $ArrayEventos[$i] -> getNombre(); ?></h5>
                    </div>
                </div>
                <?php } ?>
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