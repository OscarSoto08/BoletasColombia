-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-10-2024 a las 20:53:25
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BoletaDisponible`
--

CREATE TABLE `BoletaDisponible` (
  `idBoletaVendida` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `TipoBoleta_idTipoBoleta` int(11) NOT NULL,
  `reservada` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `BoletaDisponible`
--

INSERT INTO `BoletaDisponible` (`idBoletaVendida`, `precio`, `Evento_idEvento`, `TipoBoleta_idTipoBoleta`, `reservada`) VALUES
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BoletaVendida`
--

CREATE TABLE `BoletaVendida` (
  `idBoletaVendida` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `Compra_idCompra` int(11) NOT NULL,
  `Factura_idFactura` int(11) NOT NULL,
  `TipoBoleta_idTipoBoleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `BoletaVendida`
--

INSERT INTO `BoletaVendida` (`idBoletaVendida`, `precio`, `nombreUsuario`, `Compra_idCompra`, `Factura_idFactura`, `TipoBoleta_idTipoBoleta`) VALUES
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
(4, 'Barranquilla'),
(5, 'Cartagena'),
(6, 'Pereira'),
(7, 'Bucaramanga'),
(8, 'Santa Marta'),
(9, 'Manizales'),
(10, 'Cúcuta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Cliente`
--

INSERT INTO `Cliente` (`idCliente`, `nombre`, `apellido`, `correo`, `clave`, `telefono`, `direccion`) VALUES
(1, 'Antonio', 'Martinez', 'antonio.martinez@email.com', '7e67f95f47e5f810d0b4543a92e56bf1', '3101234567', 'Avenida 1 #1-1'),
(2, 'Lucía', 'Vargas', 'lucia.vargas@email.com', 'a19a40ce3e569e27b9dac3fe53dccc67', '3102345678', 'Avenida 2 #2-2'),
(3, 'Javier', 'Reyes', 'javier.reyes@email.com', '3a49dd80cef77808d84ffb7fd31db48b', '3103456789', 'Avenida 3 #3-3'),
(4, 'Gabriela', 'Salazar', 'gabriela.salazar@email.com', 'c1ad988e29961d3597430721d8c1ccbe', '3104567890', 'Avenida 4 #4-4'),
(5, 'Felipe', 'Cáceres', 'felipe.caceres@email.com', 'ef3eca2fed2fc935472786c176484677', '3105678901', 'Avenida 5 #5-5'),
(6, 'Mariana', 'Figueroa', 'mariana.figueroa@email.com', '5970a2ef95536c42aa34bc746fb48282', '3106789012', 'Avenida 6 #6-6'),
(7, 'Santiago', 'Ortiz', 'santiago.ortiz@email.com', 'fc05c30304f0423bc60a4a2e208aaec0', '3107890123', 'Avenida 7 #7-7'),
(8, 'Camila', 'Pérez', 'camila.perez@email.com', 'acdb6172d2f463d5964fff046ab2e08d', '3108901234', 'Avenida 8 #8-8'),
(9, 'David', 'Luna', 'david.luna@email.com', '1db3a68d4ad0f230214655972154299f', '3109012345', 'Avenida 9 #9-9'),
(10, 'Sara', 'Montoya', 'sara.montoya@email.com', '881bb71e6a1b0382bc7cd21a447d9c5a', '3100123456', 'Avenida 10 #10-10'),
(11, 'Oscar', 'Gonzalez', 'og@cliente.com', '202cb962ac59075b964b07152d234b70', '3135746229', 'Cra 72 #62D-09 Perdomo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Compra`
--

CREATE TABLE `Compra` (
  `idCompra` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `fechaCompra` datetime NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `estado` enum('Completada','Cancelada','Pendiente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Compra`
--

INSERT INTO `Compra` (`idCompra`, `Cliente_idCliente`, `Evento_idEvento`, `fechaCompra`, `subtotal`, `estado`) VALUES
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Evento`
--

CREATE TABLE `Evento` (
  `idEvento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `aforo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Evento`
--

INSERT INTO `Evento` (`idEvento`, `nombre`, `descripcion`, `direccion`, `aforo`, `fecha`, `Ciudad_idCiudad`) VALUES
(1, 'Concierto de Rock', 'Un gran concierto de las mejores bandas de rock.', 'Teatro Nacional', 1000, '2024-11-01', 1),
(2, 'Festival de Música', 'Un festival que reúne a artistas de todo el mundo.', 'Parque Simón Bolívar', 5000, '2024-11-10', 1),
(3, 'Obra de Teatro', 'Una obra teatral que cautivará a todos.', 'Teatro Colón', 300, '2024-11-15', 1),
(4, 'Exposición de Arte', 'Exposición de artistas locales.', 'Centro Cultural', 1500, '2024-11-20', 2),
(5, 'Feria Gastronómica', 'Disfruta de los mejores platos típicos.', 'Parque de la 93', 2000, '2024-11-25', 3),
(6, 'Conferencia Tecnológica', 'Conferencias sobre avances tecnológicos.', 'Auditorio Mayor', 800, '2024-11-30', 4),
(7, 'Maratón', 'Una maratón abierta para todos los corredores.', 'Paseo del Río', 2000, '2024-12-05', 5),
(8, 'Día del Niño', 'Eventos y actividades para los más pequeños.', 'Plaza de la Ciudad', 3000, '2024-12-10', 6),
(9, 'Concierto de Navidad', 'Celebración navideña con música en vivo.', 'Parque Central', 5000, '2024-12-15', 7),
(10, 'Festival de Cine', 'Proyecciones de los mejores cortometrajes.', 'Sala de Cine', 400, '2024-12-20', 8),
(13, 'Feria de las flores', 'Un emocionante carnaval de medellin', 'cra 13 #62bis -80', 5000, '2025-10-26', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `idFactura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `impuestos` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Factura`
--

INSERT INTO `Factura` (`idFactura`, `fecha`, `impuestos`, `total`) VALUES
(1, '2024-10-01', 15000.00, 150000.00),
(2, '2024-10-02', 10000.00, 100000.00),
(3, '2024-10-03', 12000.00, 120000.00),
(4, '2024-10-04', 18000.00, 180000.00),
(5, '2024-10-05', 20000.00, 200000.00),
(6, '2024-10-06', 25000.00, 250000.00),
(7, '2024-10-07', 30000.00, 300000.00),
(8, '2024-10-08', 13000.00, 130000.00),
(9, '2024-10-09', 17000.00, 170000.00),
(10, '2024-10-10', 19000.00, 190000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GestionEventos`
--

CREATE TABLE `GestionEventos` (
  `Evento_idEvento` int(11) NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `rolProveedor` enum('Creador','Gestor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `GestionEventos`
--

INSERT INTO `GestionEventos` (`Evento_idEvento`, `Proveedor_idProveedor`, `rolProveedor`) VALUES
(1, 1, 'Creador'),
(2, 2, 'Gestor'),
(3, 3, 'Creador'),
(4, 4, 'Gestor'),
(5, 5, 'Creador'),
(6, 6, 'Gestor'),
(7, 7, 'Creador'),
(8, 8, 'Gestor'),
(9, 9, 'Creador'),
(10, 10, 'Gestor'),
(13, 12, 'Creador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Proveedor`
--

INSERT INTO `Proveedor` (`idProveedor`, `nombre`, `apellido`, `correo`, `clave`, `telefono`, `direccion`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@email.com', 'eb52fc9a4b3a81a2000a9e774d5aa515', '3001234567', 'Calle 1 #1-1'),
(2, 'María', 'Gómez', 'maria.gomez@email.com', 'b984fe77863037ddeb9be2ad7dfb246e', '3002345678', 'Calle 2 #2-2'),
(3, 'Carlos', 'Rodríguez', 'carlos.rodriguez@email.com', '8cac6cee8223173e9c31d814bdf304b7', '3003456789', 'Calle 3 #3-3'),
(4, 'Laura', 'Martínez', 'laura.martinez@email.com', 'b0c7016de3a569c07fd83c5b107a3ef3', '3004567890', 'Calle 4 #4-4'),
(5, 'Andrés', 'López', 'andres.lopez@email.com', '5a58663fcea66b5133b6f6b67a4d2d5c', '3005678901', 'Calle 5 #5-5'),
(6, 'Sofía', 'Torres', 'sofia.torres@email.com', 'd33102b62a22dc01c99ee2d5bbd175be', '3006789012', 'Calle 6 #6-6'),
(7, 'Felipe', 'Hernández', 'felipe.hernandez@email.com', '28e84fe58c7f81d859657e11b8ccbaf1', '3007890123', 'Calle 7 #7-7'),
(8, 'Isabella', 'Jiménez', 'isabella.jimenez@email.com', 'f3915643882133fd6214a7e71f2632d5', '3008901234', 'Calle 8 #8-8'),
(9, 'Diego', 'Castillo', 'diego.castillo@email.com', 'f5c92f7896adc6ac862277fed6172201', '3009012345', 'Calle 9 #9-9'),
(10, 'Paola', 'Sánchez', 'paola.sanchez@email.com', '462a95add45fb709d0b45e604bd3d114', '3000123456', 'Calle 10 #10-10'),
(12, 'Oscar', 'Gonzalez', 'og@proveedor.com', '202cb962ac59075b964b07152d234b70', '3135746229', 'Cra 72 #62D-09 Perdomo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoBoleta`
--

CREATE TABLE `TipoBoleta` (
  `idTipoBoleta` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `TipoBoleta`
--

INSERT INTO `TipoBoleta` (`idTipoBoleta`, `nombre`) VALUES
(1, 'General'),
(2, 'VIP'),
(3, 'Estudiante'),
(4, 'Niños'),
(5, 'Grupo'),
(6, 'Familiar'),
(7, 'Preferencial'),
(8, 'Lateral'),
(9, 'Balcón'),
(10, 'Palco');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `BoletaDisponible`
--
ALTER TABLE `BoletaDisponible`
  ADD PRIMARY KEY (`idBoletaVendida`),
  ADD KEY `TipoBoleta_idTipoBoleta` (`TipoBoleta_idTipoBoleta`),
  ADD KEY `eventoBoletaDisp` (`Evento_idEvento`);

--
-- Indices de la tabla `BoletaVendida`
--
ALTER TABLE `BoletaVendida`
  ADD PRIMARY KEY (`idBoletaVendida`),
  ADD KEY `Compra_idCompra` (`Compra_idCompra`),
  ADD KEY `Factura_idFactura` (`Factura_idFactura`),
  ADD KEY `TipoBoleta_idTipoBoleta` (`TipoBoleta_idTipoBoleta`);

--
-- Indices de la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`);

--
-- Indices de la tabla `Evento`
--
ALTER TABLE `Evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `Ciudad_idCiudad` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `GestionEventos`
--
ALTER TABLE `GestionEventos`
  ADD PRIMARY KEY (`Evento_idEvento`,`Proveedor_idProveedor`),
  ADD KEY `Proveedor_idProveedor` (`Proveedor_idProveedor`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `TipoBoleta`
--
ALTER TABLE `TipoBoleta`
  ADD PRIMARY KEY (`idTipoBoleta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Ciudad`
--
ALTER TABLE `Ciudad`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `Evento`
--
ALTER TABLE `Evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `Factura`
--
ALTER TABLE `Factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `TipoBoleta`
--
ALTER TABLE `TipoBoleta`
  MODIFY `idTipoBoleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `BoletaDisponible`
--
ALTER TABLE `BoletaDisponible`
  ADD CONSTRAINT `BoletaDisponible_ibfk_1` FOREIGN KEY (`TipoBoleta_idTipoBoleta`) REFERENCES `TipoBoleta` (`idTipoBoleta`),
  ADD CONSTRAINT `eventoBoletaDisp` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`);

--
-- Filtros para la tabla `BoletaVendida`
--
ALTER TABLE `BoletaVendida`
  ADD CONSTRAINT `BoletaVendida_ibfk_1` FOREIGN KEY (`Compra_idCompra`) REFERENCES `Compra` (`idCompra`),
  ADD CONSTRAINT `BoletaVendida_ibfk_2` FOREIGN KEY (`Factura_idFactura`) REFERENCES `Factura` (`idFactura`),
  ADD CONSTRAINT `BoletaVendida_ibfk_3` FOREIGN KEY (`TipoBoleta_idTipoBoleta`) REFERENCES `TipoBoleta` (`idTipoBoleta`);

--
-- Filtros para la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`),
  ADD CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`);

--
-- Filtros para la tabla `Evento`
--
ALTER TABLE `Evento`
  ADD CONSTRAINT `Evento_ibfk_1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `Ciudad` (`idCiudad`);

--
-- Filtros para la tabla `GestionEventos`
--
ALTER TABLE `GestionEventos`
  ADD CONSTRAINT `GestionEventos_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `Evento` (`idEvento`),
  ADD CONSTRAINT `GestionEventos_ibfk_2` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `Proveedor` (`idProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
