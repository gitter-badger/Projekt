-- MySQL Script generated by MySQL Workbench
-- 04/16/15 09:25:40
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Nasza baza.

-- -----------------------------------------------------
-- Schema mydb
--
-- Nasza baza.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Uzytkownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Uzytkownicy` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(45) NOT NULL,
  `Haslo` VARCHAR(45) NOT NULL,
  `Imie` VARCHAR(45) NOT NULL,
  `Nazwisko` VARCHAR(45) NOT NULL,
  `Plec` VARCHAR(45) NOT NULL,
  `Data_urodzenia` DATE NOT NULL,
  `Miejsce_zamieszkania` VARCHAR(45) NOT NULL,
  `Adres_email` VARCHAR(45) NOT NULL,
  `Data_zalozenia_konta` DATE NOT NULL,
  `Wypelnione_ankiety` INT NOT NULL,
  `Zamieszczone_ankiety` INT NOT NULL,
  `Administrator` TINYINT(1) NOT NULL,
  `Ankietowany` TINYINT(1) NOT NULL,
  `Ankietujacy` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Wykresy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Wykresy` (
  `idWykresy` INT NOT NULL AUTO_INCREMENT,
  `Kolumnowy` VARCHAR(45) NULL,
  `Liniowy` VARCHAR(45) NULL,
  `Slupkowy` VARCHAR(45) NULL,
  PRIMARY KEY (`idWykresy`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ankiety`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ankiety` (
  `idAnkiety` INT NOT NULL AUTO_INCREMENT,
  `Rodzaj_pytania` VARCHAR(45) NOT NULL,
  `Typ_ankiety` VARCHAR(45) NOT NULL,
  `Anonimowosc` TINYINT(1) NOT NULL,
  `Wstep` VARCHAR(45) NOT NULL,
  `Uzytkownicy_idUsers` INT NOT NULL,
  `Wykresy_idWykresy` INT NOT NULL,
  PRIMARY KEY (`idAnkiety`, `Uzytkownicy_idUsers`, `Wykresy_idWykresy`),
  INDEX `fk_Ankiety_Użytkownicy_idx` (`Uzytkownicy_idUsers` ASC),
  INDEX `fk_Ankiety_Wykresy1_idx` (`Wykresy_idWykresy` ASC),
  CONSTRAINT `fk_Ankiety_Użytkownicy`
    FOREIGN KEY (`Uzytkownicy_idUsers`)
    REFERENCES `mydb`.`Uzytkownicy` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ankiety_Wykresy1`
    FOREIGN KEY (`Wykresy_idWykresy`)
    REFERENCES `mydb`.`Wykresy` (`idWykresy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pytania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pytania` (
  `idPytania` INT NOT NULL AUTO_INCREMENT,
  `Tresc_pytania_1` VARCHAR(45) NULL,
  `Odpowiedz_1` VARCHAR(45) NULL,
  `Tresc_pytania_2` VARCHAR(45) NULL,
  `Odpowiedz_2` VARCHAR(45) NULL,
  `Tresc_pytania_3` VARCHAR(45) NULL,
  `Odpowiedz_3` VARCHAR(45) NULL,
  `Tresc_pytania_4` VARCHAR(45) NULL,
  `Odpowiedź 4` VARCHAR(45) NULL,
  `Treść pytania 5` VARCHAR(45) NULL,
  `Odpowiedz_5` VARCHAR(45) NULL,
  `Tresc_pytania_6` VARCHAR(45) NULL,
  `Odpowiedz_6` VARCHAR(45) NULL,
  `Tresc_pytania_7` VARCHAR(45) NULL,
  `Odpowiedź 7` VARCHAR(45) NULL,
  `Tresc_pytania_8` VARCHAR(45) NULL,
  `Odpowiedz_8` VARCHAR(45) NULL,
  `Treść pytania 9` VARCHAR(45) NULL,
  `Odpowiedz_9` VARCHAR(45) NULL,
  `Tresc_pytania_10` VARCHAR(45) NULL,
  `Odpowiedz_10` VARCHAR(45) NULL,
  `Ankiety_idAnkiety` INT NOT NULL,
  `Ankiety_Uzytkownicy_idUsers` INT NOT NULL,
  PRIMARY KEY (`idPytania`, `Ankiety_idAnkiety`, `Ankiety_Uzytkownicy_idUsers`),
  INDEX `fk_Pytania_Ankiety1_idx` (`Ankiety_idAnkiety` ASC, `Ankiety_Uzytkownicy_idUsers` ASC),
  CONSTRAINT `fk_Pytania_Ankiety1`
    FOREIGN KEY (`Ankiety_idAnkiety` , `Ankiety_Uzytkownicy_idUsers`)
    REFERENCES `mydb`.`Ankiety` (`idAnkiety` , `Uzytkownicy_idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zaproszenia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zaproszenia` (
  `idZaproszenia` INT NOT NULL AUTO_INCREMENT,
  `Tytul_ankiety` VARCHAR(45) NOT NULL,
  `Cel_ankiety` VARCHAR(45) NOT NULL,
  `Krotki_opis` VARCHAR(45) NOT NULL,
  `idAnkiety` VARCHAR(45) NOT NULL,
  `Ankiety_idAnkiety` INT NOT NULL,
  `Ankiety_Uzytkownicy_idUsers` INT NOT NULL,
  `Ankiety_Wykresy_idWykresy` INT NOT NULL,
  PRIMARY KEY (`idZaproszenia`, `Ankiety_idAnkiety`, `Ankiety_Uzytkownicy_idUsers`, `Ankiety_Wykresy_idWykresy`),
  INDEX `fk_Zaproszenia_Ankiety1_idx` (`Ankiety_idAnkiety` ASC, `Ankiety_Uzytkownicy_idUsers` ASC, `Ankiety_Wykresy_idWykresy` ASC),
  CONSTRAINT `fk_Zaproszenia_Ankiety1`
    FOREIGN KEY (`Ankiety_idAnkiety` , `Ankiety_Uzytkownicy_idUsers` , `Ankiety_Wykresy_idWykresy`)
    REFERENCES `mydb`.`Ankiety` (`idAnkiety` , `Uzytkownicy_idUsers` , `Wykresy_idWykresy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
