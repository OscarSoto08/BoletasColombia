CREATE DATABASE BoletasColombia;
USE BoletasColombia;

-- primero tablas independientes
-- Tabla ciudad
CREATE TABLE Ciudad(
	idCiudad int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(45) not null
);

-- Tabla proveedor
CREATE TABLE Proveedor(
	idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(45) not null,
    apellido varchar(45) not null,
    correo varchar(100) not null,
    clave varchar(255) not null,
    telefono varchar(45)  null,
    direccion varchar(100) not null
);

-- Tabla Cliente
CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(45) not null,
    apellido varchar(45)not null,
    correo varchar(100) not null,
    clave varchar(255) not null,
    telefono varchar(45) null,
    direccion varchar(100) not null
);

-- Tipo Boleta
CREATE TABLE TipoBoleta(
    idTipoBoleta int primary key AUTO_INCREMENT,
    nombre varchar(45) not null
);

-- Tabla Factura
CREATE TABLE Factura(
    idFactura int primary key AUTO_INCREMENT,
    fecha date not null,
    impuestos decimal(10,2) not null,
    total decimal(10,2) not null
);

-- Tabla Evento
CREATE TABLE Evento(
    idEvento int primary key AUTO_INCREMENT,
    nombre varchar(45) not null,
    descripcion text not null,
    direccion varchar(45) not null,
    aforo int not null,
    fecha date not null,
    Ciudad_idCiudad int not null,
	
    foreign key(Ciudad_idCiudad) references Ciudad(idCiudad)
);


-- Relacion de evento y proveedor
CREATE TABLE GestionEventos(
    Evento_idEvento int,
	Proveedor_idProveedor int,
    rolProveedor enum('Creador','Gestor') not null,
    
    primary key(Evento_idEvento, Proveedor_idProveedor),
    foreign key(Evento_idEvento) references Evento(idEvento),
	foreign key(Proveedor_idProveedor) references Proveedor(idProveedor)
);


-- tabla compra 
CREATE TABLE Compra(
    idCompra int,
	Cliente_idCliente int not null,
    Evento_idEvento int not null,
    fechaCompra datetime not null,
    subtotal decimal(10,2) not null,
    estado enum('Completada', 'Pendiente', 'Cancelada') not null,
    
    primary key(idCompra),
    foreign key(Cliente_idCliente) references Cliente(idCliente),
	foreign key(Evento_idEvento) references Evento(idEvento)
);

-- las boletassss

create table BoletaVendida(
    idBoletaVendida int primary key,
    precio decimal(10,2) not null,
    nombreUsuario varchar(45) not null,
    Compra_idCompra int not null,
    Factura_idFactura int not null,
    TipoBoleta_idTipoBoleta int not null,
    
    foreign key(Compra_idCompra) references Compra(idCompra),
    foreign key(Factura_idFactura) references Factura(idFactura),
    foreign key(TipoBoleta_idTipoBoleta) references TipoBoleta(idTipoBoleta)
);


create table BoletaDisponible(
    idBoletaVendida int primary key,
    precio decimal(10,2) not null,
    Evento_idEvento int not null,
    TipoBoleta_idTipoBoleta int not null,
    reservada tinyint not null,
    
    foreign key(TipoBoleta_idTipoBoleta) references TipoBoleta(idTipoBoleta)
);
