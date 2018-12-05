-- Luigi Milagres de Miranda	- Matricula: 5181
-- Matheus Dias de Queiroz 		- Matricula: 5213
-- Tiemy Shibuya Watanabe		- Matricula: 5214

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb`;
USE `mydb`;
-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
    `CPF` INT NOT NULL,
    `Nome` VARCHAR(30),
    `Sexo` VARCHAR(30),
    `Data_Nascimento` DATE,
    `Funcionario` VARCHAR(30),
    PRIMARY KEY (`CPF`)
);
-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
    `Matricula` INT NOT NULL auto_increment,
    `idCargo_Funcionario` int,
    `Email` varchar(45),
    `Sexo` enum('M','F'),
    `Dependente_CPF` INT,
    `Nome` VARCHAR(45),
    `CPF` INT NOT NULL,
    `Endereco` VARCHAR(45),
    `Telefone` VARCHAR(45),
    PRIMARY KEY (`Matricula`),
    FOREIGN KEY (`Dependente_CPF`)
        REFERENCES `mydb`.`Dependente` (`CPF`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (`idCargo_Funcionario`)
        REFERENCES `mydb`.`Cargo` (`idCargo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
    `idCargo` INT NOT NULL,
    `nome_Cargo` varchar(45),
    PRIMARY KEY (`idCargo`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
    `ID_Professor` INT NOT NULL,
    `Funcionario_Matricula` INT,
    PRIMARY KEY (`ID_Professor`),
    FOREIGN KEY (`Funcionario_Matricula`)
        REFERENCES `mydb`.`Funcionario` (`Matricula`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
    `Matricula_Aluno` INT NOT NULL,
    `CPF` VARCHAR(11) NOT NULL,
    `RG` VARCHAR(9),
    `Nome` VARCHAR(45) NOT NULL,
    `Filiacao_Mae` VARCHAR(50),
    `Filiacao_Pai` VARCHAR(50),
    `Data_Nascimento` DATE,
    `Sexo` ENUM('M', 'F'),
    `Endereco` VARCHAR(45),
    `Telefone` VARCHAR(11),
    `Titulo_Eleitor` INT,
    PRIMARY KEY (`Matricula_Aluno`)
);
-- -----------------------------------------------------
-- Table `mydb`.`Instituto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituto` (
    `idInstituto` INT NOT NULL,
    `TipoInstituto` VARCHAR(30),
    PRIMARY KEY (`idInstituto`)
)  ENGINE=INNODB;
-- -----------------------------------------------------
-- Table `mydb`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Periodo` (
    `Ano` INT NOT NULL,
    `Tipo_Periodo` ENUM('0', '1', '2'),
    `periodo_idCurso` INT,
    `periodo_idDisciplina` VARCHAR(6),
    PRIMARY KEY (`Ano`),
    FOREIGN KEY (`periodo_idDisciplina`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas` (
    `Codigo` VARCHAR(6) NOT NULL,
    `Nome` VARCHAR(55),
    `Creditos` INT,
    `CargaHoraria_Teorica` INT,
    `CargaHoraria_Pratica` INT,
    `Status_da_Disciplina` VARCHAR(45),
    `Periodo_Ano` INT NOT NULL,
    PRIMARY KEY (`Codigo` , `Periodo_Ano`),
    FOREIGN KEY (`Periodo_Ano`)
        REFERENCES `mydb`.`Periodo` (`Ano`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
    `ID_Curso` INT NOT NULL,
    `Nome_Curso` varchar(35),
    `Aluno_Matricula_Aluno` INT,
    `Instituto_idInstituto` INT,
    `Disciplinas_Codigo` VARCHAR(6),
    `Disciplinas_Periodo_Ano` INT,
    PRIMARY KEY (`ID_Curso`),
    FOREIGN KEY (`Aluno_Matricula_Aluno`)
        REFERENCES `mydb`.`Aluno` (`Matricula_Aluno`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Instituto_idInstituto`)
        REFERENCES `mydb`.`Instituto` (`idInstituto`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Codigo` , `Disciplinas_Periodo_Ano`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo` , `Periodo_Ano`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Turma` 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
    `Local` VARCHAR(30) NOT NULL,
    `Curso_ID_Curso` varchar(6) not null,
    `Dia` ENUM('Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta'),
    `Horario` VARCHAR(5) DEFAULT '00-00',
    `Tipo` enum('P','T'),
    `Periodo_Ano` INT,
    PRIMARY KEY (`Local`),
    FOREIGN KEY (`Curso_ID_Curso`)
        REFERENCES `mydb`.`Curso` (`ID_Curso`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Periodo_Ano`)
      REFERENCES `mydb`.`Periodo` (`Ano`)
	  ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Matriculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculado` (
    `Aluno_Matricula_Aluno` INT NOT NULL,
    `Disciplinas_Codigo` VARCHAR(6) NOT NULL,
    PRIMARY KEY (`Aluno_Matricula_Aluno` , `Disciplinas_Codigo`),
    FOREIGN KEY (`Aluno_Matricula_Aluno`)
        REFERENCES `mydb`.`Aluno` (`Matricula_Aluno`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Conclui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conclui` (
    `Disciplinas_Codigo` VARCHAR(6) NOT NULL,
    `Aluno_Matricula_Aluno` INT NOT NULL,
    `Nota_Final` INT,
    `Numero_faltas` INT,
    `Situacao_Academica` VARCHAR(45),
    PRIMARY KEY (`Disciplinas_Codigo` , `Aluno_Matricula_Aluno`),
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Aluno_Matricula_Aluno`)
        REFERENCES `mydb`.`Aluno` (`Matricula_Aluno`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`pre_requisito` pra que serve o Disciplinas_Codigo1?
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pre_requisito` (
    `Disciplinas_Codigo` VARCHAR(6) NOT NULL,
    `Disciplinas_Codigo1` VARCHAR(6) NOT NULL,
    `Disciplina_Pre` VARCHAR(45),
    PRIMARY KEY (`Disciplinas_Codigo` , `Disciplinas_Codigo1`),
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Codigo1`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas_has_Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas_has_Turma` (
    `Disciplinas_Codigo` VARCHAR(6) NOT NULL,
    `Disciplinas_Periodo_Ano` INT ,
    `Turma_Local` VARCHAR(30) ,
    `Professor_ID_Professor` INT ,
    `Professor_Funcionario_Matricula` INT,
    PRIMARY KEY (`Disciplinas_Codigo`,`Turma_Local`),
    FOREIGN KEY (`Disciplinas_Codigo` , `Disciplinas_Periodo_Ano`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo` , `Periodo_Ano`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Turma_Local`)
        REFERENCES `mydb`.`Turma` (`Local`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Professor_ID_Professor`)
        REFERENCES `mydb`.`Professor` (`ID_Professor`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (`Professor_Funcionario_Matricula`)
        REFERENCES `mydb`.`Professor` (`Funcionario_Matricula`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
