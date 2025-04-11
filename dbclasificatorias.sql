-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbclasificatorias
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbclasificatorias` ;

-- -----------------------------------------------------
-- Schema dbclasificatorias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbclasificatorias` DEFAULT CHARACTER SET utf8 ;
USE `dbclasificatorias` ;

-- -----------------------------------------------------
-- Table `dbclasificatorias`.`estadio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbclasificatorias`.`estadio` ;

CREATE TABLE IF NOT EXISTS `dbclasificatorias`.`estadio` (
  `idestadio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `club` VARCHAR(45) NULL,
  PRIMARY KEY (`idestadio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbclasificatorias`.`seleccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbclasificatorias`.`seleccion` ;

CREATE TABLE IF NOT EXISTS `dbclasificatorias`.`seleccion` (
  `idseleccion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `tecnico` VARCHAR(45) NULL,
  `estadio_idestadio` INT NOT NULL,
  PRIMARY KEY (`idseleccion`),
  INDEX `fk_seleccion_estadio1_idx` (`estadio_idestadio` ASC) VISIBLE,
  CONSTRAINT `fk_seleccion_estadio1`
    FOREIGN KEY (`estadio_idestadio`)
    REFERENCES `dbclasificatorias`.`estadio` (`idestadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbclasificatorias`.`jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbclasificatorias`.`jugador` ;

CREATE TABLE IF NOT EXISTS `dbclasificatorias`.`jugador` (
  `idjugador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `edad` INT NULL,
  `posicion` VARCHAR(45) NULL,
  `club` VARCHAR(45) NULL,
  `seleccion` INT NOT NULL,
  PRIMARY KEY (`idjugador`),
  INDEX `fk_jugador_seleccion1_idx` (`seleccion` ASC) VISIBLE,
  CONSTRAINT `fk_jugador_seleccion1`
    FOREIGN KEY (`seleccion`)
    REFERENCES `dbclasificatorias`.`seleccion` (`idseleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbclasificatorias`.`arbitro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbclasificatorias`.`arbitro` ;

CREATE TABLE IF NOT EXISTS `dbclasificatorias`.`arbitro` (
  `idarbitro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idarbitro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbclasificatorias`.`partido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbclasificatorias`.`partido` ;

CREATE TABLE IF NOT EXISTS `dbclasificatorias`.`partido` (
  `idpartido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `numeroJornada` INT NULL,
  `seleccionLocal` INT NOT NULL,
  `seleccionVisitante` INT NOT NULL,
  `arbitro` INT NOT NULL,
  PRIMARY KEY (`idpartido`),
  INDEX `fk_partido_arbitro_idx` (`arbitro` ASC) VISIBLE,
  INDEX `fk_partido_seleccion1_idx` (`seleccionLocal` ASC) VISIBLE,
  INDEX `fk_partido_seleccion2_idx` (`seleccionVisitante` ASC) VISIBLE,
  CONSTRAINT `fk_partido_arbitro`
    FOREIGN KEY (`arbitro`)
    REFERENCES `dbclasificatorias`.`arbitro` (`idarbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_seleccion1`
    FOREIGN KEY (`seleccionLocal`)
    REFERENCES `dbclasificatorias`.`seleccion` (`idseleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_seleccion2`
    FOREIGN KEY (`seleccionVisitante`)
    REFERENCES `dbclasificatorias`.`seleccion` (`idseleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
