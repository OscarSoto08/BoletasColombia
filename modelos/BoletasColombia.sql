
-- Schema BoletasColombia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BoletasColombia` ;
USE `BoletasColombia` ;

-- -----------------------------------------------------
-- Table `BoletasColombia`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Ciudad` (
  `idCiudad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCiudad`));


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `BoletasColombia`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Factura` (
  `idFactura` INT NOT NULL,
  `subtotal` DECIMAL(10,2) NOT NULL,
  `iva` DECIMAL(10,2) NOT NULL,
  `total` VARCHAR(45) NOT NULL,
  `idComprador` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  CONSTRAINT `fk_Factura_Cliente1`
    FOREIGN KEY (`idComprador`)
    REFERENCES `BoletasColombia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idProveedor`),
  CONSTRAINT `fk_Proveedor_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `BoletasColombia`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Evento` (
  `idEvento` INT NOT NULL,
  `aforo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idEvento`),
  CONSTRAINT `fk_Evento_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `BoletasColombia`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Tipo_Boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Tipo_Boleta` (
  `idTipo_Boleta` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Boleta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Zona` (
  `idZona` INT NOT NULL,
  `zona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idZona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Boleta` (
  `idBoleta` INT NOT NULL,
  `Tipo_Boleta_idTipo_Boleta` INT NOT NULL,
  `Zona_idZona` INT NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idBoleta`),
  CONSTRAINT `fk_Boleta_Tipo_Boleta1`
    FOREIGN KEY (`Tipo_Boleta_idTipo_Boleta`)
    REFERENCES `BoletasColombia`.`Tipo_Boleta` (`idTipo_Boleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Boleta_Zona1`
    FOREIGN KEY (`Zona_idZona`)
    REFERENCES `BoletasColombia`.`Zona` (`idZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Factura_has_Boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Factura_has_Boleta` (
  `Factura_idFactura` INT NOT NULL,
  `Boleta_idBoleta` INT NOT NULL,
  `precioCompra` VARCHAR(45) NOT NULL,
  `idTitular` INT NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Factura_idFactura`, `Boleta_idBoleta`),
  CONSTRAINT `fk_Factura_has_Boleta_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `BoletasColombia`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Boleta_Boleta1`
    FOREIGN KEY (`Boleta_idBoleta`)
    REFERENCES `BoletasColombia`.`Boleta` (`idBoleta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Factura_has_Boleta_Cliente1`
    FOREIGN KEY (`idTitular`)
    REFERENCES `BoletasColombia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoletasColombia`.`Evento_has_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BoletasColombia`.`Evento_has_Proveedor` (
  `Evento_idEvento` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `rolProveedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Evento_idEvento`, `Proveedor_idProveedor`),
  CONSTRAINT `fk_Evento_has_Proveedor_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `BoletasColombia`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Proveedor_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `BoletasColombia`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;
