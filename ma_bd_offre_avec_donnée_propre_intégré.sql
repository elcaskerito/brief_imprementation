-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ma_bd_offre
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ma_bd_offre
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ma_bd_offre` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ma_bd_offre` ;

-- -----------------------------------------------------
-- Table `ma_bd_offre`.`FOURNISSEUR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ma_bd_offre`.`FOURNISSEUR` (
  `NFournisseur` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NomFournisseur` VARCHAR(45) NOT NULL,
  `AdresseFournisseur` VARCHAR(45) NOT NULL,
  `CodePostale` VARCHAR(45) NOT NULL,
  `Ville_Fournisseur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NFournisseur`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3
COMMENT = 'la table fournisseur ok';


-- -----------------------------------------------------
-- Table `ma_bd_offre`.`produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ma_bd_offre`.`produit` (
  `Nproduit` INT NOT NULL AUTO_INCREMENT,
  `NomProduit` VARCHAR(45) NULL DEFAULT NULL,
  `Prix_unitaire` FLOAT NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Nproduit`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3
COMMENT = 'table produit de notre basse de données ';


-- -----------------------------------------------------
-- Table `ma_bd_offre`.`CONTRAT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ma_bd_offre`.`CONTRAT` (
  `NContrat` INT NOT NULL AUTO_INCREMENT,
  `DateContrat` DATETIME NULL DEFAULT NULL,
  `Quantité_négocié` VARCHAR(45) NULL DEFAULT NULL,
  `signé` VARCHAR(45) NULL DEFAULT NULL,
  `Nfournisseur` INT UNSIGNED NOT NULL,
  `Nproduit` INT NOT NULL,
  PRIMARY KEY (`NContrat`),
  INDEX `fk_fournisseur_depui_contrat_idx` (`Nfournisseur` ASC) VISIBLE,
  INDEX `fk_produit_depuis_contrat_idx` (`Nproduit` ASC) VISIBLE,
  CONSTRAINT `fk_fournisseur_depui_contrat`
    FOREIGN KEY (`Nfournisseur`)
    REFERENCES `ma_bd_offre`.`FOURNISSEUR` (`NFournisseur`),
  CONSTRAINT `fk_produit_depuis_contrat`
    FOREIGN KEY (`Nproduit`)
    REFERENCES `ma_bd_offre`.`produit` (`Nproduit`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3
COMMENT = 'table contrat';


-- -----------------------------------------------------
-- Table `ma_bd_offre`.`OFFRE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ma_bd_offre`.`OFFRE` (
  `NOffre` INT NOT NULL AUTO_INCREMENT,
  `DateCloture` DATETIME NULL DEFAULT NULL,
  `Quantité` INT NULL DEFAULT NULL,
  `Nproduit` INT NOT NULL,
  PRIMARY KEY (`NOffre`),
  INDEX `fk_sur_produit_depuis_offre_idx` (`Nproduit` ASC) VISIBLE,
  CONSTRAINT `fk_sur_produit_depuis_offre`
    FOREIGN KEY (`Nproduit`)
    REFERENCES `ma_bd_offre`.`produit` (`Nproduit`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3
COMMENT = 'ma table offre p....';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
