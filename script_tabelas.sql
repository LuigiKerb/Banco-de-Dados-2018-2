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
)ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
    `Matricula` INT NOT NULL auto_increment,
    `idCargo_Funcionario` int,
    `Email` varchar(45),
    `Sexo` enum('M','F'),
    `Nascimento` date,
    `Dependente_CPF` INT,
    `Nome` VARCHAR(45),
    `RG` VARCHAR(45),
	`UF` ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'),
    `OrgaoExpedidor` VARCHAR(5),
    `CPF` INT NOT NULL,
    `Endereco` VARCHAR(45),
    `Telefone` VARCHAR(45),
    `atua` ENUM('professor', 'tecnico'),
    `area` VARCHAR(80),  
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
    `professorCurso` INT,
    PRIMARY KEY (`ID_Professor`),
    FOREIGN KEY (`Funcionario_Matricula`)
        REFERENCES `mydb`.`Funcionario` (`Matricula`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`professorCurso`)
        REFERENCES `mydb`.`Curso` (`ID_Curso`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
    `Matricula_Aluno` INT AUTO_INCREMENT NOT NULL,
    `Aluno_ID_Curso` INT,
    `CPF` VARCHAR(11) NOT NULL,
    `RG` VARCHAR(9),
    `Nome` VARCHAR(45) NOT NULL,
    `Filiacao_Mae` VARCHAR(50),
    `Filiacao_Pai` VARCHAR(50),
    `Data_Nascimento` DATE,
    `Sexo` ENUM('M', 'F'),
    `Endereco` VARCHAR(45),
    `Titulo_Eleitor` INT,
    `escola2oGrau` VARCHAR(45),
    `entrada_curso` VARCHAR(4),
    `email` VARCHAR(45),
    `UFidentidade` ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'),
    `orgaoExpedidor` VARCHAR(5),
    `cidade` VARCHAR(45),
    `cep` VARCHAR(8),
    `telefone` VARCHAR(12),
    PRIMARY KEY (`Matricula_Aluno`),
    FOREIGN KEY (`Aluno_ID_Curso`)
        REFERENCES `mydb`.`Curso` (`ID_Curso`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

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
    `idPeriodo` ENUM('0','1','2','3'),
    `periodo_ID_Curso` INT,
    `periodo_idDisciplina` VARCHAR(6),
    `anoPeriodo` YEAR,
    FOREIGN KEY (`periodo_idDisciplina`)
        REFERENCES `mydb`.`Disciplina` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`periodo_ID_Curso`)
        REFERENCES `mydb`.`Curso` (`ID_Curso`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas` (
    `idDisciplina` VARCHAR(6),
    `Nome` VARCHAR(65),
    `Creditos` INT,
    `CargaHoraria_Teorica` INT,
    `CargaHoraria_Pratica` INT,
    `semestreOfertado` enum('0','1','2','3'),
    `Status_da_Disciplina` enum('Obrigatoria','Optativa'),
    FOREIGN KEY (`idDisciplina`)
        REFERENCES `mydb`.`Disciplina` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
    `ID_Curso` INT NOT NULL,
    `Nome_Curso` VARCHAR(35),
    `Instituto_idInstituto` INT,
    PRIMARY KEY (`ID_Curso`),
    FOREIGN KEY (`Instituto_idInstituto`)
        REFERENCES `mydb`.`Instituto` (`idInstituto`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`disciplina_has_curso`
-- (`curso_idCurso`,`disciplina_idDisciplina`)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`disciplina_has_curso` (
    `curso_ID_Curso` INT,
    `disciplina_Codigo` VARCHAR(6),
    FOREIGN KEY (`curso_ID_Curso`)
        REFERENCES `mydb`.`Curso` (`ID_Curso`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`disciplina_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`idDisciplina`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Turma` 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
    `Local` VARCHAR(6) NOT NULL,
    `Turma_idDisciplina` VARCHAR(6),
    `Dia` ENUM('Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta'),
    `Horario` VARCHAR(5) DEFAULT '00-00',
    `Tipo` ENUM('P', 'T'),
    `Periodo_Ano` YEAR,
    PRIMARY KEY (`Local`,`Dia`,`Horario`),
    FOREIGN KEY (`Turma_idDisciplina`)
        REFERENCES `mydb`.`Disciplinas` (`idDisciplina`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

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
        REFERENCES `mydb`.`Disciplinas` (`idDisciplina`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

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
        REFERENCES `mydb`.`Disciplinas` (`idDisciplina`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Aluno_Matricula_Aluno`)
        REFERENCES `mydb`.`Aluno` (`Matricula_Aluno`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`pre_requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pre_requisito` (
    `Disciplinas_Codigo` VARCHAR(6) NOT NULL,
    `Disciplina_Pre` VARCHAR(45),
    PRIMARY KEY (`Disciplinas_Codigo`),
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`idDisciplina`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas_has_Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas_has_Turma` (
    `Disciplinas_Codigo` VARCHAR(6),
    `Disciplinas_Periodo_Ano` INT ,
    `Turma_Local` VARCHAR(30) ,
    `Professor_ID_Professor` INT ,
    `Professor_Funcionario_Matricula` INT,
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`idDisciplina`)
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
)ENGINE=INNODB;
