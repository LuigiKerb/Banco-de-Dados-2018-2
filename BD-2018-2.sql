-- MySQL Script generated by MySQL Workbench
-- Mon Dec  3 20:43:32 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(30) NULL,
  `Sexo` VARCHAR(30) NULL,
  `Data_Nascimento` DATE NULL,
  `Funcionário` VARCHAR(30) NULL,
  PRIMARY KEY (`CPF`));


-- -----------------------------------------------------
-- Table `mydb`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionário` (
  `Matrícula` INT NOT NULL,
  `Nome` CHAR NOT NULL,
  `CPF` INT NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45),
  `Dependente_CPF` INT NULL,
  PRIMARY KEY (`Matrícula`, `Dependente_CPF`),
    FOREIGN KEY (`Dependente_CPF`)
    REFERENCES `mydb`.`Dependente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Técnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Técnico` (
  `ID_Tecnico` INT NOT NULL,
  `Funcionário_Matrícula` INT NOT NULL,
  `Funcionário_Dependente_CPF` INT NOT NULL,
  PRIMARY KEY (`ID_Tecnico`, `Funcionário_Matrícula`, `Funcionário_Dependente_CPF`),
    FOREIGN KEY (`Funcionário_Matrícula` , `Funcionário_Dependente_CPF`)
    REFERENCES `mydb`.`Funcionário` (`Matrícula` , `Dependente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `ID_Professor` INT NOT NULL,
  `Funcionário_Matrícula` INT NOT NULL,
  `Funcionário_Dependente_CPF` INT NOT NULL,
  PRIMARY KEY (`ID_Professor`, `Funcionário_Matrícula`, `Funcionário_Dependente_CPF`),
   FOREIGN KEY (`Funcionário_Matrícula` , `Funcionário_Dependente_CPF`)
    REFERENCES `mydb`.`Funcionário` (`Matrícula` , `Dependente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `idCargo` INT NOT NULL,
  `Funcionário_Matrícula` INT NULL,
  `Funcionário_Dependente_CPF` INT NULL,
  PRIMARY KEY (`idCargo`, `Funcionário_Matrícula`, `Funcionário_Dependente_CPF`),
    FOREIGN KEY (`Funcionário_Matrícula` , `Funcionário_Dependente_CPF`)
    REFERENCES `mydb`.`Funcionário` (`Matrícula` , `Dependente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `ID_Professor` INT NOT NULL,
  `Funcionário_Matrícula` INT NOT NULL,
  `Funcionário_Dependente_CPF` INT NOT NULL,
  PRIMARY KEY (`ID_Professor`, `Funcionário_Matrícula`, `Funcionário_Dependente_CPF`),
    FOREIGN KEY (`Funcionário_Matrícula` , `Funcionário_Dependente_CPF`)
    REFERENCES `mydb`.`Funcionário` (`Matrícula` , `Dependente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Técnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Técnico` (
  `ID_Tecnico` INT NOT NULL,
  `Funcionário_Matrícula` INT NOT NULL,
  `Funcionário_Dependente_CPF` INT NOT NULL,
  PRIMARY KEY (`ID_Tecnico`, `Funcionário_Matrícula`, `Funcionário_Dependente_CPF`),
    FOREIGN KEY (`Funcionário_Matrícula` , `Funcionário_Dependente_CPF`)
    REFERENCES `mydb`.`Funcionário` (`Matrícula` , `Dependente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `Matrícula_A` INT NOT NULL,
  `Nome` VARCHAR(30) NULL,
  `Filiação` VARCHAR(50) NULL,
  `Data_Nascimento` DATE NULL,
  `Sexo` VARCHAR(30) NULL,
  `Endereço` VARCHAR(30) NULL,
  `Telefone` INT NULL,
  `Titulo_Eleitor` INT NULL,
  `RG` INT NULL,
  PRIMARY KEY (`Matrícula_A`));


-- -----------------------------------------------------
-- Table `mydb`.`Instituto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituto` (
  `idInstituto` INT NOT NULL,
  `TipoInstituto` VARCHAR(30) NULL,
  PRIMARY KEY (`idInstituto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Periodo` (
  `Ano` INT NOT NULL,
  PRIMARY KEY (`Ano`));


-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas` (
  `Código` VARCHAR(20) NOT NULL,
  `Nome` VARCHAR(30) NULL,
  `Créditos` INT NULL,
  `CargaHoraria_Teorica` INT NULL,
  `CargaHoraria_Prática` INT NULL,
  `Periodo_Ano` INT NOT NULL,
  PRIMARY KEY (`Código`, `Periodo_Ano`),
    FOREIGN KEY (`Periodo_Ano`)
    REFERENCES `mydb`.`Periodo` (`Ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `ID_Curso`  NOT NULL,
  `Aluno_Matrícula_A` INT NULL,
  `Instituto_idInstituto` INT NOT NULL,
  `Disciplinas_Código` VARCHAR(20) NOT NULL,
  `Disciplinas_Periodo_Ano` INT NOT NULL,
  PRIMARY KEY (`ID_Curso`, `Aluno_Matrícula_A`, `Instituto_idInstituto`, `Disciplinas_Código`, `Disciplinas_Periodo_Ano`),
    FOREIGN KEY (`Aluno_Matrícula_A`)
    REFERENCES `mydb`.`Aluno` (`Matrícula_A`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Instituto_idInstituto`)
    REFERENCES `mydb`.`Instituto` (`idInstituto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Código` , `Disciplinas_Periodo_Ano`)
    REFERENCES `mydb`.`Disciplinas` (`Código` , `Periodo_Ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
  `Local` VARCHAR(30) NOT NULL,
  `Dia` DATE NULL,
  `Horário` INT NULL,
  PRIMARY KEY (`Local`));


-- -----------------------------------------------------
-- Table `mydb`.`Matriculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculado` (
  `Aluno_Matrícula_A` INT NOT NULL,
  `Disciplinas_Código` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Aluno_Matrícula_A`, `Disciplinas_Código`),
    FOREIGN KEY (`Aluno_Matrícula_A`)
    REFERENCES `mydb`.`Aluno` (`Matrícula_A`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Código`)
    REFERENCES `mydb`.`Disciplinas` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Conclui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conclui` (
  `Disciplinas_Código` VARCHAR(20) NULL,
  `Aluno_Matrícula_A` INT NULL,
  `Nota_Final` INT NULL,
  `Numero_faltas` INT NULL,
  `Situacao_Academica` VARCHAR(45) NULL,
  PRIMARY KEY (`Disciplinas_Código`, `Aluno_Matrícula_A`),
    FOREIGN KEY (`Disciplinas_Código`)
    REFERENCES `mydb`.`Disciplinas` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Aluno_Matrícula_A`)
    REFERENCES `mydb`.`Aluno` (`Matrícula_A`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas_has_Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas_has_Disciplinas` (
  `Disciplinas_Código` VARCHAR(20) NULL,
  `Disciplinas_Código1` VARCHAR(20) NULL,
  PRIMARY KEY (`Disciplinas_Código`, `Disciplinas_Código1`),
    FOREIGN KEY (`Disciplinas_Código`)
    REFERENCES `mydb`.`Disciplinas` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Código1`)
    REFERENCES `mydb`.`Disciplinas` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas_has_Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas_has_Turma` (
  `Disciplinas_Código` VARCHAR(20) NOT NULL,
  `Disciplinas_Periodo_Ano` INT NOT NULL,
  `Turma_Local` VARCHAR(30) NOT NULL,
  `Professor_ID_Professor` INT NOT NULL,
  `Professor_Funcionário_Matrícula` INT NOT NULL,
  `Professor_Funcionário_Dependente_CPF` INT NOT NULL,
  PRIMARY KEY (`Disciplinas_Código`, `Disciplinas_Periodo_Ano`, `Turma_Local`, `Professor_ID_Professor`, `Professor_Funcionário_Matrícula`, `Professor_Funcionário_Dependente_CPF`),
    FOREIGN KEY (`Disciplinas_Código` , `Disciplinas_Periodo_Ano`)
    REFERENCES `mydb`.`Disciplinas` (`Código` , `Periodo_Ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Turma_Local`)
    REFERENCES `mydb`.`Turma` (`Local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Professor_ID_Professor` , `Professor_Funcionário_Matrícula` , `Professor_Funcionário_Dependente_CPF`)
    REFERENCES `mydb`.`Professor` (`ID_Professor` , `Funcionário_Matrícula` , `Funcionário_Dependente_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;