-- Insertar datos en la tabla Ciudad
INSERT INTO Ciudad (nombre) VALUES
('Bogotá'),
('Medellín'),
('Cali');

-- Insertar datos en la tabla Proveedor
INSERT INTO Proveedor (nombre, apellido, correo, telefono, direccion) VALUES
('Carlos', 'Pérez', 'carlos.perez@eventos.com', '3111234567', 'Calle 123 #45-67, Bogotá'),
('Luisa', 'Gómez', 'luisa.gomez@fiestas.com', '3107654321', 'Carrera 89 #12-45, Medellín'),
('Andrés', 'Rodríguez', 'andres.rodriguez@shows.com', '3002345678', 'Avenida 3 #45-12, Cali');

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (nombre, apellido, correo, telefono, clave) VALUES
('Juan', 'García', 'juan.garcia@gmail.com', '3201234567', 'hashed_password_1'),
('Ana', 'Martínez', 'ana.martinez@hotmail.com', '3129876543', 'hashed_password_2'),
('Pedro', 'Sánchez', 'pedro.sanchez@yahoo.com', '3187654321', 'hashed_password_3');

-- Insertar datos en la tabla Evento
INSERT INTO Evento (nombre, direccion, descripcion, aforo, idCiudad, fecha) VALUES
('Concierto Rock Bogotá', 'Estadio El Campín', 'El mejor concierto de rock del año', 5000, 1, '2024-12-01'),
('Festival de Comida Medellín', 'Parque de las Luces', 'Un festival con los mejores chefs del país', 2000, 2, '2024-11-15'),
('Show de Magia Cali', 'Centro de Convenciones', 'Un espectáculo de magia para toda la familia', 1500, 3, '2024-10-20');

-- Insertar datos en la tabla GestionEventos (Proveedores gestionando eventos)
INSERT INTO GestionEventos (idEvento, idProveedor, rolProveedor) VALUES
(1, 1, 'Organizador'),
(2, 2, 'Promotor'),
(3, 3, 'Coordinador');

-- Insertar datos en la tabla TipoBoleta
INSERT INTO TipoBoleta (nombre) VALUES
('General'),
('VIP'),
('Preferencial');

-- Insertar datos en la tabla BoletaDisponible (boletas disponibles por evento)
INSERT INTO BoletaDisponible (idEvento, idTipoBoleta, precio, reservada) VALUES
(1, 1, 150.00, 0),
(1, 2, 300.00, 0),
(1, 3, 200.00, 0),
(2, 1, 100.00, 0),
(2, 2, 180.00, 0),
(3, 1, 120.00, 0),
(3, 3, 180.00, 0);

-- Insertar datos en la tabla Compra (clientes comprando boletas)
INSERT INTO Compra (idCliente, idEvento, fechaCompra, subtotal, estado) VALUES
(1, 1, '2024-09-15 10:00:00', 300.00, 'PAGADO'),
(2, 2, '2024-09-16 12:00:00', 180.00, 'PENDIENTE'),
(3, 3, '2024-09-17 14:00:00', 120.00, 'CANCELADO');

-- Insertar datos en la tabla Factura
INSERT INTO Factura (fecha, impuestos, total) VALUES
('2024-09-15', 30.00, 330.00),
('2024-09-16', 18.00, 198.00),
('2024-09-17', 12.00, 132.00);

-- Insertar datos en la tabla BoletaVendida (boletas vendidas a los clientes)
INSERT INTO BoletaVendida (precio, nombreReUsuario, idTipoBoleta, idCompra, idFactura) VALUES
(150.00, 'Juan García', 1, 1, 1),
(150.00, 'Ana Martínez', 2, 2, 2),
(120.00, 'Pedro Sánchez', 3, 3, 3);

