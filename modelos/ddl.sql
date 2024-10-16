-- SQL para el sistema de gestión de boletas y eventos
-- Incluyendo tablas relacionadas: BoletaDisponible, BoletaVendida, Ciudad, Cliente, Compra, Evento, Factura, TipoBoleta

CREATE DATABASE BoletasColombia;
USE BoletasColombia;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Crear la tabla Ciudad
CREATE TABLE `Ciudad` (
  `idCiudad` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Evento
CREATE TABLE `Evento` (
  `idEvento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `aforo` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `Ciudad_idCiudad` INT(11) NOT NULL,
  PRIMARY KEY (`idEvento`),
  FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `Ciudad`(`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Cliente
CREATE TABLE `Cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `clave` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(45) DEFAULT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Factura
CREATE TABLE `Factura` (
  `idFactura` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `impuestos` DECIMAL(10,2) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla TipoBoleta
CREATE TABLE `TipoBoleta` (
  `idTipoBoleta` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoBoleta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla BoletaDisponible
CREATE TABLE `BoletaDisponible` (
  `idBoletaDisponible` INT(11) NOT NULL AUTO_INCREMENT,
  `precio` DECIMAL(10,2) NOT NULL,
  `Evento_idEvento` INT(11) NOT NULL,
  `TipoBoleta_idTipoBoleta` INT(11) NOT NULL,
  `reservada` TINYINT(1) NOT NULL DEFAULT 0, -- 0: no reservada, 1: reservada
  PRIMARY KEY (`idBoletaDisponible`),
  FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento`(`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`TipoBoleta_idTipoBoleta`) REFERENCES `TipoBoleta`(`idTipoBoleta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Compra
CREATE TABLE `Compra` (
  `idCompra` INT(11) NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` INT(11) NOT NULL,
  `Evento_idEvento` INT(11) NOT NULL,
  `fechaCompra` DATETIME NOT NULL,
  `subtotal` DECIMAL(10,2) NOT NULL,
  `estado` ENUM('Completada','Cancelada','Pendiente') NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`idCompra`),
  FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente`(`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento`(`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla BoletaVendida
CREATE TABLE `BoletaVendida` (
  `idBoletaVendida` INT(11) NOT NULL AUTO_INCREMENT,
  `precio` DECIMAL(10,2) NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `Compra_idCompra` INT(11) NOT NULL,
  `Factura_idFactura` INT(11) NOT NULL,
  `TipoBoleta_idTipoBoleta` INT(11) NOT NULL,
  PRIMARY KEY (`idBoletaVendida`),
  FOREIGN KEY (`Compra_idCompra`) REFERENCES `Compra`(`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Factura_idFactura`) REFERENCES `Factura`(`idFactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`TipoBoleta_idTipoBoleta`) REFERENCES `TipoBoleta`(`idTipoBoleta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;