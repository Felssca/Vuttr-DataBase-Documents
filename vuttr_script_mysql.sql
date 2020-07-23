-- MySQL Script generated by MySQL Workbench
-- Fri Jul 17 17:17:36 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vuttr
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `vuttr` ;

-- -----------------------------------------------------
-- Schema vuttr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vuttr` DEFAULT CHARACTER SET utf8 ;
USE `vuttr` ;

-- -----------------------------------------------------
-- Table `vuttr`.`vuttr_main`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vuttr`.`vuttr_main` ;

CREATE TABLE IF NOT EXISTS `vuttr`.`vuttr_main` (
  `id_vuttr` INT NOT NULL AUTO_INCREMENT,
  `txt_title` VARCHAR(200) NOT NULL,
  `txt_link` VARCHAR(200) NOT NULL,
  `txt_description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_vuttr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vuttr`.`vuttr_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vuttr`.`vuttr_tags` ;

CREATE TABLE IF NOT EXISTS `vuttr`.`vuttr_tags` (
  `id_tags` INT NOT NULL,
  `txt_tags_description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_tags`),
  UNIQUE INDEX `id_tags_UNIQUE` (`id_tags` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vuttr`.`vuttr_main_tags_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vuttr`.`vuttr_main_tags_list` ;

CREATE TABLE IF NOT EXISTS `vuttr`.`vuttr_main_tags_list` (
  `id_tags_list` INT NOT NULL AUTO_INCREMENT,
  `fk_vuttr_main` INT NOT NULL,
  `fk_vuttr_tags` INT NOT NULL,
  PRIMARY KEY (`id_tags_list`),
  UNIQUE INDEX `id_tags_list_UNIQUE` (`id_tags_list` ASC) VISIBLE,
  INDEX `fk_vuttr_idx` (`fk_vuttr_main` ASC) VISIBLE,
  INDEX `fk_vuttr_tags_idx` (`fk_vuttr_tags` ASC) VISIBLE,
  CONSTRAINT `fk_vuttr_main`
    FOREIGN KEY (`fk_vuttr_main`)
    REFERENCES `vuttr`.`vuttr_main` (`id_vuttr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuttr_tags`
    FOREIGN KEY (`fk_vuttr_tags`)
    REFERENCES `vuttr`.`vuttr_tags` (`id_tags`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vuttr`.`vuttr_security_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vuttr`.`vuttr_security_users` ;

CREATE TABLE IF NOT EXISTS `vuttr`.`vuttr_security_users` (
  `id_security_users` INT NOT NULL AUTO_INCREMENT,
  `txt_name` VARCHAR(200) NOT NULL,
  `txt_email` VARCHAR(200) NOT NULL,
  `txt_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_security_users`),
  UNIQUE INDEX `id_security_profiles_UNIQUE` (`id_security_users` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vuttr`.`vuttr_security_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vuttr`.`vuttr_security_profiles` ;

CREATE TABLE IF NOT EXISTS `vuttr`.`vuttr_security_profiles` (
  `id_security_profiles` INT NOT NULL,
  `txt_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_security_profiles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vuttr`.`vuttr_security_users_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vuttr`.`vuttr_security_users_profiles` ;

CREATE TABLE IF NOT EXISTS `vuttr`.`vuttr_security_users_profiles` (
  `id_security_users_profiles` INT NOT NULL AUTO_INCREMENT,
  `fk_security_users` INT NOT NULL,
  `fk_sercurity_profiles` INT NOT NULL,
  PRIMARY KEY (`id_security_users_profiles`),
  UNIQUE INDEX `id_security_users_profiles_UNIQUE` (`id_security_users_profiles` ASC) VISIBLE,
  INDEX `fk_security_users_idx` (`fk_security_users` ASC) VISIBLE,
  INDEX `fk_security_profiles_idx` (`fk_sercurity_profiles` ASC) VISIBLE,
  CONSTRAINT `fk_security_users`
    FOREIGN KEY (`fk_security_users`)
    REFERENCES `vuttr`.`vuttr_security_users` (`id_security_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_security_profiles`
    FOREIGN KEY (`fk_sercurity_profiles`)
    REFERENCES `vuttr`.`vuttr_security_profiles` (`id_security_profiles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
