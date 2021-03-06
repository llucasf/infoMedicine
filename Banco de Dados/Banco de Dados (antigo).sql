-- MySQL Script generated by MySQL Workbench
-- 05/30/17 11:23:54
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema infomedicine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema infomedicine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `infomedicine` DEFAULT CHARACTER SET utf8 ;
USE `infomedicine` ;

-- -----------------------------------------------------
-- Table `infomedicine`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `infomedicine`.`fabricante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `imagem` VARCHAR(100) NULL,
  `contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `infomedicine`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `infomedicine`.`medicamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `codigodebarras` VARCHAR(20) NULL,
  `descricao` TEXT NOT NULL,
  `imagem` VARCHAR(100) NULL,
  `fabricante` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medicamento_fabricante_idx` (`fabricante` ASC),
  CONSTRAINT `fk_medicamento_fabricante`
    FOREIGN KEY (`fabricante`)
    REFERENCES `infomedicine`.`fabricante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `infomedicine`.`principioativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `infomedicine`.`principioativo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `descricao` TEXT NOT NULL,
  `imagem` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `infomedicine`.`contraindicacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `infomedicine`.`contraindicacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `imagem` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `infomedicine`.`medicamento_has_principioativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `infomedicine`.`medicamento_has_principioativo` (
  `medicamento` INT NOT NULL,
  `principioativo` INT NOT NULL,
  PRIMARY KEY (`medicamento`, `principioativo`),
  INDEX `fk_medicamento_has_principioativo_principioativo1_idx` (`principioativo` ASC),
  INDEX `fk_medicamento_has_principioativo_medicamento1_idx` (`medicamento` ASC),
  CONSTRAINT `fk_medicamento_has_principioativo_medicamento1`
    FOREIGN KEY (`medicamento`)
    REFERENCES `infomedicine`.`medicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicamento_has_principioativo_principioativo1`
    FOREIGN KEY (`principioativo`)
    REFERENCES `infomedicine`.`principioativo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `infomedicine`.`medicamento_has_contraindicacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `infomedicine`.`medicamento_has_contraindicacao` (
  `medicamento` INT NOT NULL,
  `contraindicacao` INT NOT NULL,
  PRIMARY KEY (`medicamento`, `contraindicacao`),
  INDEX `fk_medicamento_has_contraindicacao_contraindicacao1_idx` (`contraindicacao` ASC),
  INDEX `fk_medicamento_has_contraindicacao_medicamento1_idx` (`medicamento` ASC),
  CONSTRAINT `fk_medicamento_has_contraindicacao_medicamento1`
    FOREIGN KEY (`medicamento`)
    REFERENCES `infomedicine`.`medicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicamento_has_contraindicacao_contraindicacao1`
    FOREIGN KEY (`contraindicacao`)
    REFERENCES `infomedicine`.`contraindicacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
