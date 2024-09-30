-- Insertar datos en la tabla Ciudad
INSERT INTO `Ciudad` (idCiudad, nombre) VALUES 
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali'),
(4, 'Cartagena'),
(5, 'Barranquilla');

-- Insertar datos en la tabla Cliente
INSERT INTO `Cliente` (idCliente, nombre, apellidos, correo, clave, telefono, direccion, Ciudad_idCiudad) VALUES 
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 'clave123', '3001234567', 'Calle 123', 1),
(2, 'Ana', 'García', 'ana.garcia@example.com', 'clave456', '3107654321', 'Avenida 45', 2),
(3, 'Luis', 'Martínez', 'luis.martinez@example.com', 'clave789', '3209876543', 'Transversal 78', 3);

-- Insertar datos en la tabla Proveedor
INSERT INTO `Proveedor` (idProveedor, nombre, apellidos, correo, clave, telefono, direccion, Ciudad_idCiudad) VALUES 
(1, 'Pedro', 'Lopez', 'pedro.lopez@example.com', 'proveedor123', '3001112233', 'Calle 12', 4),
(2, 'Laura', 'Sánchez', 'laura.sanchez@example.com', 'proveedor456', '3102223344', 'Carrera 21', 5);

-- Insertar datos en la tabla Evento
INSERT INTO `Evento` (idEvento, aforo, nombre, descripcion, direccion, Ciudad_idCiudad) VALUES 
(1, 1000, 'Concierto de Rock', 'Un gran concierto de rock en vivo', 'Parque Simón Bolívar', 1),
(2, 500, 'Festival de Jazz', 'Festival de jazz con artistas internacionales', 'Teatro Mayor', 2),
(3, 300, 'Exposición de Arte', 'Exposición de arte contemporáneo', 'Museo de Arte', 3);

-- Insertar datos en la tabla Tipo_Boleta
INSERT INTO `Tipo_Boleta` (idTipo_Boleta, tipo) VALUES 
(1, 'General'),
(2, 'VIP'),
(3, 'Estudiante');

-- Insertar datos en la tabla Zona
INSERT INTO `Zona` (idZona, zona) VALUES 
(1, 'Frente'),
(2, 'Lateral'),
(3, 'Fondo');

-- Insertar datos en la tabla Boleta
INSERT INTO `Boleta` (idBoleta, Tipo_Boleta_idTipo_Boleta, Zona_idZona, precio) VALUES 
(1, 1, 1, 50000.00),
(2, 2, 2, 100000.00),
(3, 3, 3, 25000.00);

-- Insertar datos en la tabla Factura
INSERT INTO `Factura` (idFactura, subtotal, iva, total, idComprador) VALUES 
(1, 150000.00, 28500.00, '178500.00', 1),
(2, 30000.00, 5700.00, '35700.00', 2),
(3, 60000.00, 11400.00, '71400.00', 3);

-- Insertar datos en la tabla Factura_has_Boleta
INSERT INTO `Factura_has_Boleta` (Factura_idFactura, Boleta_idBoleta, precioCompra, idTitular, nombreUsuario) VALUES 
(1, 1, '50000.00', 1, 'Juan Pérez'),
(2, 2, '25000.00', 2, 'Ana García'),
(3, 3, '100000.00', 3, 'Luis Martínez');

-- Insertar datos en la tabla Evento_has_Proveedor
INSERT INTO `Evento_has_Proveedor` (Evento_idEvento, Proveedor_idProveedor, rolProveedor) VALUES 
(1, 1, 'Sonido'),
(2, 2, 'Catering');
