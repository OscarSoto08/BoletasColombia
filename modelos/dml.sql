-- v1.2

-- Insertar datos en la tabla Ciudad
INSERT INTO Ciudad (nombre) VALUES 
('Bogotá'),
('Medellín'),
('Cali'),
('Barranquilla'),
('Cartagena'),
('Pereira'),
('Bucaramanga'),
('Santa Marta'),
('Manizales'),
('Cúcuta');

-- Insertar datos en la tabla Proveedor
INSERT INTO Proveedor (nombre, apellido, correo, clave, telefono, direccion) VALUES 
('Juan', 'Pérez', 'juan.perez@email.com', 'clave123', '3001234567', 'Calle 1 #1-1'),
('María', 'Gómez', 'maria.gomez@email.com', 'clave456', '3002345678', 'Calle 2 #2-2'),
('Carlos', 'Rodríguez', 'carlos.rodriguez@email.com', 'clave789', '3003456789', 'Calle 3 #3-3'),
('Laura', 'Martínez', 'laura.martinez@email.com', 'clave101', '3004567890', 'Calle 4 #4-4'),
('Andrés', 'López', 'andres.lopez@email.com', 'clave102', '3005678901', 'Calle 5 #5-5'),
('Sofía', 'Torres', 'sofia.torres@email.com', 'clave103', '3006789012', 'Calle 6 #6-6'),
('Felipe', 'Hernández', 'felipe.hernandez@email.com', 'clave104', '3007890123', 'Calle 7 #7-7'),
('Isabella', 'Jiménez', 'isabella.jimenez@email.com', 'clave105', '3008901234', 'Calle 8 #8-8'),
('Diego', 'Castillo', 'diego.castillo@email.com', 'clave106', '3009012345', 'Calle 9 #9-9'),
('Paola', 'Sánchez', 'paola.sanchez@email.com', 'clave107', '3000123456', 'Calle 10 #10-10');

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (nombre, apellido, correo, clave, telefono, direccion) VALUES 
('Antonio', 'Martinez', 'antonio.martinez@email.com', 'clave201', '3101234567', 'Avenida 1 #1-1'),
('Lucía', 'Vargas', 'lucia.vargas@email.com', 'clave202', '3102345678', 'Avenida 2 #2-2'),
('Javier', 'Reyes', 'javier.reyes@email.com', 'clave203', '3103456789', 'Avenida 3 #3-3'),
('Gabriela', 'Salazar', 'gabriela.salazar@email.com', 'clave204', '3104567890', 'Avenida 4 #4-4'),
('Felipe', 'Cáceres', 'felipe.caceres@email.com', 'clave205', '3105678901', 'Avenida 5 #5-5'),
('Mariana', 'Figueroa', 'mariana.figueroa@email.com', 'clave206', '3106789012', 'Avenida 6 #6-6'),
('Santiago', 'Ortiz', 'santiago.ortiz@email.com', 'clave207', '3107890123', 'Avenida 7 #7-7'),
('Camila', 'Pérez', 'camila.perez@email.com', 'clave208', '3108901234', 'Avenida 8 #8-8'),
('David', 'Luna', 'david.luna@email.com', 'clave209', '3109012345', 'Avenida 9 #9-9'),
('Sara', 'Montoya', 'sara.montoya@email.com', 'clave210', '3100123456', 'Avenida 10 #10-10');

-- Insertar datos en la tabla TipoBoleta
INSERT INTO TipoBoleta (nombre) VALUES 
('General'),
('VIP'),
('Estudiante'),
('Niños'),
('Grupo'),
('Familiar'),
('Preferencial'),
('Lateral'),
('Balcón'),
('Palco');

-- Insertar datos en la tabla Factura
INSERT INTO Factura (fecha, impuestos, total) VALUES 
('2024-10-01', 15000.00, 150000.00),
('2024-10-02', 10000.00, 100000.00),
('2024-10-03', 12000.00, 120000.00),
('2024-10-04', 18000.00, 180000.00),
('2024-10-05', 20000.00, 200000.00),
('2024-10-06', 25000.00, 250000.00),
('2024-10-07', 30000.00, 300000.00),
('2024-10-08', 13000.00, 130000.00),
('2024-10-09', 17000.00, 170000.00),
('2024-10-10', 19000.00, 190000.00);

-- Insertar datos en la tabla Evento
INSERT INTO Evento (nombre, descripcion, direccion, aforo, fecha, Ciudad_idCiudad) VALUES 
('Concierto de Rock', 'Un gran concierto de las mejores bandas de rock.', 'Teatro Nacional', 1000, '2024-11-01', 1),
('Festival de Música', 'Un festival que reúne a artistas de todo el mundo.', 'Parque Simón Bolívar', 5000, '2024-11-10', 1),
('Obra de Teatro', 'Una obra teatral que cautivará a todos.', 'Teatro Colón', 300, '2024-11-15', 1),
('Exposición de Arte', 'Exposición de artistas locales.', 'Centro Cultural', 1500, '2024-11-20', 2),
('Feria Gastronómica', 'Disfruta de los mejores platos típicos.', 'Parque de la 93', 2000, '2024-11-25', 3),
('Conferencia Tecnológica', 'Conferencias sobre avances tecnológicos.', 'Auditorio Mayor', 800, '2024-11-30', 4),
('Maratón', 'Una maratón abierta para todos los corredores.', 'Paseo del Río', 2000, '2024-12-05', 5),
('Día del Niño', 'Eventos y actividades para los más pequeños.', 'Plaza de la Ciudad', 3000, '2024-12-10', 6),
('Concierto de Navidad', 'Celebración navideña con música en vivo.', 'Parque Central', 5000, '2024-12-15', 7),
('Festival de Cine', 'Proyecciones de los mejores cortometrajes.', 'Sala de Cine', 400, '2024-12-20', 8);

-- Insertar datos en la tabla GestionEventos
INSERT INTO GestionEventos (Evento_idEvento, Proveedor_idProveedor, rolProveedor) VALUES 
(1, 1, 'Creador'),
(2, 2, 'Gestor'),
(3, 3, 'Creador'),
(4, 4, 'Gestor'),
(5, 5, 'Creador'),
(6, 6, 'Gestor'),
(7, 7, 'Creador'),
(8, 8, 'Gestor'),
(9, 9, 'Creador'),
(10, 10, 'Gestor');

-- Insertar datos en la tabla Compra
INSERT INTO Compra (idCompra, Cliente_idCliente, Evento_idEvento, fechaCompra, subtotal, estado) VALUES 
(1, 1, 1, '2024-10-01 10:00:00', 200.00, 'Completada'),
(2, 2, 2, '2024-10-02 11:00:00', 150.00, 'Pendiente'),
(3, 3, 3, '2024-10-03 12:00:00', 100.00, 'Completada'),
(4, 4, 4, '2024-10-04 13:00:00', 300.00, 'Cancelada'),
(5, 5, 5, '2024-10-05 14:00:00', 250.00, 'Completada'),
(6, 6, 6, '2024-10-06 15:00:00', 400.00, 'Pendiente'),
(7, 7, 7, '2024-10-07 16:00:00', 500.00, 'Completada'),
(8, 8, 8, '2024-10-08 17:00:00', 350.00, 'Cancelada'),
(9, 9, 9, '2024-10-09 18:00:00', 600.00, 'Completada'),
(10, 10, 10, '2024-10-10 19:00:00', 450.00, 'Pendiente');


-- Insertar datos en la tabla BoletaVendida
INSERT INTO BoletaVendida (idBoletaVendida, precio, nombreUsuario, Compra_idCompra, Factura_idFactura, TipoBoleta_idTipoBoleta) VALUES 
(1, 100.00, 'Antonio Martinez', 1, 1, 1),
(2, 150.00, 'Lucía Vargas', 2, 2, 2),
(3, 80.00, 'Javier Reyes', 3, 3, 3),
(4, 120.00, 'Gabriela Salazar', 4, 4, 4),
(5, 200.00, 'Felipe Cáceres', 5, 5, 5),
(6, 90.00, 'Mariana Figueroa', 6, 6, 6),
(7, 300.00, 'Santiago Ortiz', 7, 7, 7),
(8, 250.00, 'Camila Pérez', 8, 8, 8),
(9, 400.00, 'David Luna', 9, 9, 9),
(10, 350.00, 'Sara Montoya', 10, 10, 10);

-- Insertar datos en la tabla BoletaDisponible
INSERT INTO BoletaDisponible (idBoletaVendida, precio, Evento_idEvento, TipoBoleta_idTipoBoleta, reservada) VALUES 
(1, 100.00, 1, 1, 0),
(2, 150.00, 2, 2, 0),
(3, 80.00, 3, 3, 1),
(4, 120.00, 4, 4, 0),
(5, 200.00, 5, 5, 1),
(6, 90.00, 6, 6, 0),
(7, 300.00, 7, 7, 1),
(8, 250.00, 8, 8, 0),
(9, 400.00, 9, 9, 1),
(10, 350.00, 10, 10, 0);

