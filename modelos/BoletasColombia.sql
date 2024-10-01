-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-10-2024 a las 04:59:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `BoletasColombia`
--
CREATE DATABASE BoletasColombia;
USE BoletasColombia;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Boleta`
--

CREATE TABLE `Boleta` (
  `idBoleta` int(11) NOT NULL,
  `Tipo_Boleta_idTipo_Boleta` int(11) NOT NULL,
  `Zona_idZona` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Boleta`
--

INSERT INTO `Boleta` (`idBoleta`, `Tipo_Boleta_idTipo_Boleta`, `Zona_idZona`, `precio`) VALUES
(1, 1, 1, 50000.00),
(2, 2, 2, 100000.00),
(3, 3, 3, 25000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudad`
--

CREATE TABLE `Ciudad` (
  `idCiudad` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Ciudad`
--

INSERT INTO `Ciudad` (`idCiudad`, `nombre`) VALUES
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali'),
(4, 'Cartagena'),
(5, 'Barranquilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Cliente`
--

INSERT INTO `Cliente` (`idCliente`, `nombre`, `apellidos`, `correo`, `clave`, `telefono`, `direccion`, `Ciudad_idCiudad`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 'clave123', '3001234567', 'Calle 123', 1),
(2, 'Ana', 'García', 'ana.garcia@example.com', 'clave456', '3107654321', 'Avenida 45', 2),
(3, 'Luis', 'Martínez', 'luis.martinez@example.com', 'clave789', '3209876543', 'Transversal 78', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Evento`
--

CREATE TABLE `Evento` (
  `idEvento` int(11) NOT NULL,
  `aforo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `direccion` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Evento`
--

INSERT INTO `Evento` (`idEvento`, `aforo`, `nombre`, `descripcion`, `direccion`, `Ciudad_idCiudad`, `fecha`) VALUES
(1, 1000, 'Concierto de Rock', 'Un gran concierto de rock en vivo', 'Parque Simón Bolívar', 1, '2024-11-08'),
(2, 500, 'Festival de Jazz', 'Festival de jazz con artistas internacionales', 'Teatro Mayor', 2, '2027-08-14'),
(3, 300, 'Exposición de Arte', 'Exposición de arte contemporáneo', 'Museo de Arte', 3, '2026-09-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Evento_has_Proveedor`
--

CREATE TABLE `Evento_has_Proveedor` (
  `Evento_idEvento` int(11) NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `rolProveedor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Evento_has_Proveedor`
--

INSERT INTO `Evento_has_Proveedor` (`Evento_idEvento`, `Proveedor_idProveedor`, `rolProveedor`) VALUES
(1, 1, 'Sonido'),
(2, 2, 'Catering');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `idFactura` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total` varchar(45) NOT NULL,
  `idComprador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Factura`
--

INSERT INTO `Factura` (`idFactura`, `subtotal`, `iva`, `total`, `idComprador`) VALUES
(1, 150000.00, 28500.00, '178500.00', 1),
(2, 30000.00, 5700.00, '35700.00', 2),
(3, 60000.00, 11400.00, '71400.00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura_has_Boleta`
--

CREATE TABLE `Factura_has_Boleta` (
  `Factura_idFactura` int(11) NOT NULL,
  `Boleta_idBoleta` int(11) NOT NULL,
  `precioCompra` varchar(45) NOT NULL,
  `idTitular` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Factura_has_Boleta`
--

INSERT INTO `Factura_has_Boleta` (`Factura_idFactura`, `Boleta_idBoleta`, `precioCompra`, `idTitular`, `nombreUsuario`) VALUES
(1, 1, '50000.00', 1, 'Juan Pérez'),
(2, 2, '25000.00', 2, 'Ana García'),
(3, 3, '100000.00', 3, 'Luis Martínez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Proveedor`
--

INSERT INTO `Proveedor` (`idProveedor`, `nombre`, `apellidos`, `correo`, `clave`, `telefono`, `direccion`, `Ciudad_idCiudad`) VALUES
(1, 'Pedro', 'Lopez', 'pedro.lopez@example.com', 'proveedor123', '3001112233', 'Calle 12', 4),
(2, 'Laura', 'Sánchez', 'laura.sanchez@example.com', 'proveedor456', '3102223344', 'Carrera 21', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_Boleta`
--

CREATE TABLE `Tipo_Boleta` (
  `idTipo_Boleta` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Tipo_Boleta`
--

INSERT INTO `Tipo_Boleta` (`idTipo_Boleta`, `tipo`) VALUES
(1, 'General'),
(2, 'VIP'),
(3, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Zona`
--

CREATE TABLE `Zona` (
  `idZona` int(11) NOT NULL,
  `zona` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Zona`
--

INSERT INTO `Zona` (`idZona`, `zona`) VALUES
(1, 'Frente'),
(2, 'Lateral'),
(3, 'Fondo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Boleta`
--
ALTER TABLE `Boleta`
  ADD PRIMARY KEY (`idBoleta`),
  ADD KEY `fk_Boleta_Tipo_Boleta1` (`Tipo_Boleta_idTipo_Boleta`),
  ADD KEY `fk_Boleta_Zona1` (`Zona_idZona`);

--
-- Indices de la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Cliente_Ciudad1` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `Evento`
--
ALTER TABLE `Evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `fk_Evento_Ciudad1` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `Evento_has_Proveedor`
--
ALTER TABLE `Evento_has_Proveedor`
  ADD PRIMARY KEY (`Evento_idEvento`,`Proveedor_idProveedor`),
  ADD KEY `fk_Evento_has_Proveedor_Proveedor1` (`Proveedor_idProveedor`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `fk_Factura_Cliente1` (`idComprador`);

--
-- Indices de la tabla `Factura_has_Boleta`
--
ALTER TABLE `Factura_has_Boleta`
  ADD PRIMARY KEY (`Factura_idFactura`,`Boleta_idBoleta`),
  ADD KEY `fk_Factura_has_Boleta_Boleta1` (`Boleta_idBoleta`),
  ADD KEY `fk_Factura_has_Boleta_Cliente1` (`idTitular`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `fk_Proveedor_Ciudad1` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `Tipo_Boleta`
--
ALTER TABLE `Tipo_Boleta`
  ADD PRIMARY KEY (`idTipo_Boleta`);

--
-- Indices de la tabla `Zona`
--
ALTER TABLE `Zona`
  ADD PRIMARY KEY (`idZona`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Boleta`
--
ALTER TABLE `Boleta`
  ADD CONSTRAINT `fk_Boleta_Tipo_Boleta1` FOREIGN KEY (`Tipo_Boleta_idTipo_Boleta`) REFERENCES `Tipo_Boleta` (`idTipo_Boleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Boleta_Zona1` FOREIGN KEY (`Zona_idZona`) REFERENCES `Zona` (`idZona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `fk_Cliente_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `Ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Evento`
--
ALTER TABLE `Evento`
  ADD CONSTRAINT `fk_Evento_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `Ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Evento_has_Proveedor`
--
ALTER TABLE `Evento_has_Proveedor`
  ADD CONSTRAINT `fk_Evento_has_Proveedor_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_has_Proveedor_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `Proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`idComprador`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Factura_has_Boleta`
--
ALTER TABLE `Factura_has_Boleta`
  ADD CONSTRAINT `fk_Factura_has_Boleta_Boleta1` FOREIGN KEY (`Boleta_idBoleta`) REFERENCES `Boleta` (`idBoleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Factura_has_Boleta_Cliente1` FOREIGN KEY (`idTitular`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_has_Boleta_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `Factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD CONSTRAINT `fk_Proveedor_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `Ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
