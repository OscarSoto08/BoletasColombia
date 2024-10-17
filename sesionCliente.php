<?php include 'head.php'; ?>
<body>

    <?php include 'encabezados/encCliente.php'; ?>
    <!-- Barra de navegación -->
    <nav class="container-fluid">
        <ul>
            <li><strong>Nombre del Negocio</strong></li>
        </ul>
        <ul>
            <li><a href="#catalogo">Catálogo</a></li>
            <li><a href="#perfil">Perfil</a></li>
            <li><a href="#pedidos">Mis Pedidos</a></li>
            <li><a href="#carrito" role="button">Carrito</a></li>
        </ul>
    </nav>

    <!-- Contenido principal -->
    <main class="container">
        <!-- Catálogo de productos -->
        <section id="catalogo">
            <hgroup>
                <h2>Catálogo de Productos</h2>
                <h3>Explora nuestra variedad de productos</h3>
            </hgroup>
            <div class="grid">
                <!-- Producto 1 -->
                <div class="card">
                    <figure>
                        <img src="producto1.jpg" alt="Producto 1">
                        <figcaption><a href="#" target="_blank">Ver detalles</a></figcaption>
                    </figure>
                    <h3>Producto 1</h3>
                    <p>Descripción breve del producto.</p>
                    <button class="btn-primary">Añadir al Carrito</button>
                </div>
                <!-- Producto 2 -->
                <div class="card">
                    <figure>
                        <img src="producto2.jpg" alt="Producto 2">
                        <figcaption><a href="#" target="_blank">Ver detalles</a></figcaption>
                    </figure>
                    <h3>Producto 2</h3>
                    <p>Descripción breve del producto.</p>
                    <button class="btn-primary">Añadir al Carrito</button>
                </div>
            </div>
        </section>

        <!-- Perfil del cliente -->
        <section id="perfil">
            <hgroup>
                <h2>Mi Perfil</h2>
                <h3>Datos personales y preferencias</h3>
            </hgroup>
            <p>Nombre: Juan Pérez</p>
            <p>Email: juanperez@example.com</p>
            <button class="btn-primary">Editar Perfil</button>
        </section>

        <!-- Historial de pedidos -->
        <section id="pedidos">
            <hgroup>
                <h2>Mis Pedidos</h2>
                <h3>Historial de tus compras</h3>
            </hgroup>
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Fecha</th>
                        <th>Monto</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Producto 1</td>
                        <td>12/10/2024</td>
                        <td>$100.00</td>
                        <td>Entregado</td>
                    </tr>
                    <tr>
                        <td>Producto 2</td>
                        <td>01/10/2024</td>
                        <td>$150.00</td>
                        <td>En tránsito</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Carrito de compras -->
        <section id="carrito">
            <hgroup>
                <h2>Mi Carrito</h2>
                <h3>Productos seleccionados</h3>
            </hgroup>
            <p>No tienes productos en tu carrito.</p>
            <button class="btn-primary">Ir a Catálogo</button>
        </section>
    </main>

    <!-- Pie de página -->
    <footer class="container">
        <small><a href="#">Política de Privacidad</a> • <a href="#">Términos y Condiciones</a></small>
    </footer>

</body>
</html>
