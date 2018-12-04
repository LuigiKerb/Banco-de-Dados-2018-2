-- Luigi Miranda 			- Matricula:
-- Matheus Dias de Queiroz 	- Matricula: 5213
-- Tiemy 					- Matricula:
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb`;
USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependente` (
    `CPF` INT NOT NULL,
    `Nome` VARCHAR(30) NULL,
    `Sexo` VARCHAR(30) NULL,
    `Data_Nascimento` DATE NULL,
    `Funcionario` VARCHAR(30) NULL,
    PRIMARY KEY (`CPF`)
);
-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
    `Matricula` INT NOT NULL,
    `Dependente_CPF` INT NOT NULL,
    `Nome` VARCHAR(45),
    `CPF` INT NOT NULL,
    `Endereço` VARCHAR(45) NOT NULL,
    `Telefone` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`Matricula` , `Dependente_CPF`),
    FOREIGN KEY (`Dependente_CPF`)
        REFERENCES `mydb`.`Dependente` (`CPF`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;
-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
    `idCargo` INT NOT NULL,
    `Funcionario_Matricula` INT NOT NULL,
    `Funcionario_Dependente_CPF` INT NOT NULL,
    PRIMARY KEY (`idCargo` , `Funcionario_Matricula` , `Funcionario_Dependente_CPF`),
    FOREIGN KEY (`Funcionario_Matricula` , `Funcionario_Dependente_CPF`)
        REFERENCES `mydb`.`Funcionario` (`Matricula` , `Dependente_CPF`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
    `ID_Professor` INT NOT NULL,
    `Funcionario_Matricula` INT NOT NULL,
    `Funcionario_Dependente_CPF` INT NOT NULL,
    PRIMARY KEY (`ID_Professor` , `Funcionario_Matricula` , `Funcionario_Dependente_CPF`),
    FOREIGN KEY (`Funcionario_Matricula` , `Funcionario_Dependente_CPF`)
        REFERENCES `mydb`.`Funcionario` (`Matricula` , `Dependente_CPF`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
    `Matricula_A` INT NOT NULL,
    `CPF` VARCHAR(45) NOT NULL,
    `RG` INT NOT NULL,
    `Nome` VARCHAR(30) NOT NULL,
    `Filiação` VARCHAR(50),
    `Data_Nascimento` DATE,
    `Sexo` VARCHAR(30),
    `Endereço` VARCHAR(30),
    `Telefone` INT,
    `Titulo_Eleitor` INT,
    PRIMARY KEY (`Matricula_A`)
);
-- -----------------------------------------------------
-- Table `mydb`.`Instituto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituto` (
    `idInstituto` INT NOT NULL,
    `TipoInstituto` VARCHAR(30) NULL,
    PRIMARY KEY (`idInstituto`)
)  ENGINE=INNODB;
-- -----------------------------------------------------
-- Table `mydb`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Periodo` (
    `Ano` INT NOT NULL,
    `Tipo_Periodo` INT NULL,
    `periodo_idCurso` INT NOT NULL,
	`periodo_idDisciplina` VARCHAR(30),
    PRIMARY KEY (`Ano`)
);
-- -----------------------------------------------------
-- Table `mydb`.`Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplinas` (
    `Codigo` VARCHAR(20) NOT NULL,
    `Nome` VARCHAR(30) NULL,
    `Creditos` INT NULL,
    `CargaHoraria_Teorica` INT NULL,
    `CargaHoraria_Pratica` INT NULL,
    `Status_da_Disciplina` VARCHAR(45) NULL,
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
    `Aluno_Matricula_A` INT NULL,
    `Instituto_idInstituto` INT NOT NULL,
    `Disciplinas_Codigo` VARCHAR(20) NOT NULL,
    `Disciplinas_Periodo_Ano` INT NOT NULL,
    PRIMARY KEY (`ID_Curso`),
    FOREIGN KEY (`Aluno_Matricula_A`)
        REFERENCES `mydb`.`Aluno` (`Matricula_A`)
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
    `Dia` DATE NULL,
    `Horario` INT NULL,
    PRIMARY KEY (`Local`)
);
-- -----------------------------------------------------
-- Table `mydb`.`Matriculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculado` (
    `Aluno_Matricula_A` INT NOT NULL,
    `Disciplinas_Codigo` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`Aluno_Matricula_A` , `Disciplinas_Codigo`),
    FOREIGN KEY (`Aluno_Matricula_A`)
        REFERENCES `mydb`.`Aluno` (`Matricula_A`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`Conclui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conclui` (
    `Disciplinas_Codigo` VARCHAR(20) NOT NULL,
    `Aluno_Matricula_A` INT NOT NULL,
    `Nota_Final` INT NULL,
    `Numero_faltas` INT NULL,
    `Situacao_Academica` VARCHAR(45) NULL,
    PRIMARY KEY (`Disciplinas_Codigo` , `Aluno_Matricula_A`),
    FOREIGN KEY (`Disciplinas_Codigo`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Aluno_Matricula_A`)
        REFERENCES `mydb`.`Aluno` (`Matricula_A`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- -----------------------------------------------------
-- Table `mydb`.`pre-requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pre-requisito` (
    `Disciplinas_Codigo` VARCHAR(20) not NULL,
    `Disciplinas_Codigo1` VARCHAR(20) not NULL,
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
    `Disciplinas_Codigo` VARCHAR(20) NOT NULL,
    `Disciplinas_Periodo_Ano` INT NOT NULL,
    `Turma_Local` VARCHAR(30) NOT NULL,
    `Professor_ID_Professor` INT NOT NULL,
    `Professor_Funcionario_Matricula` INT NOT NULL,
    `Professor_Funcionario_Dependente_CPF` INT NOT NULL,
    PRIMARY KEY (`Disciplinas_Codigo` , `Disciplinas_Periodo_Ano` , `Turma_Local` , `Professor_ID_Professor` , `Professor_Funcionario_Matricula` , `Professor_Funcionario_Dependente_CPF`),
    FOREIGN KEY (`Disciplinas_Codigo` , `Disciplinas_Periodo_Ano`)
        REFERENCES `mydb`.`Disciplinas` (`Codigo` , `Periodo_Ano`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Turma_Local`)
        REFERENCES `mydb`.`Turma` (`Local`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`Professor_ID_Professor` , `Professor_Funcionario_Matricula` , `Professor_Funcionario_Dependente_CPF`)
        REFERENCES `mydb`.`Professor` (`ID_Professor` , `Funcionario_Matricula` , `Funcionario_Dependente_CPF`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
