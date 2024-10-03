create database BoletasCol;
use BoletasCol;
-- Crear la tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    clave VARCHAR(255) NOT NULL -- Para almacenar contraseñas encriptadas
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear la tabla Ciudad
CREATE TABLE Ciudad (
    idCiudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL
);

-- Crear la tabla Evento
CREATE TABLE Evento (
    idEvento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    aforo INT NOT NULL,
    idCiudad INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad)
);

-- Crear la tabla GestionEventos (antiguo Crear_o_Gestionar)
CREATE TABLE GestionEventos (
    idEvento INT NOT NULL,
    idProveedor INT NOT NULL,
    rolProveedor VARCHAR(45) NOT NULL,
    PRIMARY KEY (idEvento, idProveedor),
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

-- Crear la tabla TipoBoleta
CREATE TABLE TipoBoleta (
    idTipoBoleta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL
);

-- Crear la tabla BoletaDisponible
CREATE TABLE BoletaDisponible (
    idBoletaDisponible INT AUTO_INCREMENT PRIMARY KEY,
    idEvento INT NOT NULL,
    idTipoBoleta INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    reservada TINYINT DEFAULT 0 NOT NULL, -- Indicador de si la boleta ha sido reservada
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
    FOREIGN KEY (idTipoBoleta) REFERENCES TipoBoleta(idTipoBoleta)
);

-- Crear la tabla Compra
CREATE TABLE Compra (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idEvento INT NOT NULL,
    fechaCompra DATETIME NOT NULL, -- Cambiamos a un tipo de dato de fecha adecuado
    subtotal DECIMAL(10, 2) NOT NULL, -- Subtotal debe ser numérico
    estado ENUM('PENDIENTE', 'PAGADO', 'CANCELADO') NOT NULL, -- Mantiene ENUM para estado
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento)
);

-- Crear la tabla Factura
CREATE TABLE Factura (
    idFactura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL, -- Cambiado a tipo DATE
    impuestos DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

-- Crear la tabla BoletaVendida
CREATE TABLE BoletaVendida (
    idBoleta INT AUTO_INCREMENT PRIMARY KEY,
    precio DECIMAL(10, 2) NOT NULL,
    nombreReUsuario VARCHAR(45) NOT NULL, -- El nombre del usuario que usará la boleta
    idTipoBoleta INT NOT NULL,
    idCompra INT NOT NULL,
    idFactura INT NOT NULL,
    FOREIGN KEY (idTipoBoleta) REFERENCES TipoBoleta(idTipoBoleta),
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idFactura) REFERENCES Factura(idFactura)
);

