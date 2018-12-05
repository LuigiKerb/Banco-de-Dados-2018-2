@@ -0,0 +1,351 @@
SET FOREIGN_KEY_CHECKS=0;

insert into Instituto values
	('1', 'Agrarias'),
	('2', 'Engenharias'),
	('3', 'Biologicas'),
	('4', 'Exatas e da terra'),
	('5', 'Humanas'), 
	('6', 'Sociais e aplicadas'),
	('7', 'Saude');

insert into Curso
(`ID_Curso`,`Instituto_idInstituto`,`Nome_Curso`)
 values
	(1,'6','Administração'),
    (3,'1','Agronomia'),
    (4,'3','Ciências Biologicas'),
    (5,'3','Ciência de Alimentos'),
    (6,'2','Engenharia Civil'),
    (7,'2','Engenharia de Produção'),
    (8,'7','Nutrição'),
    (9,'4','Quimica'),
    (10,'4','Sistemas de Informação'),
    (12,'6','Ciências Contabeis');
  
insert into Cargo values
	('1', 'Professor Especialista'),
    ('2', 'Professor Mestre'),
    ('3', 'Professor Doutor'),
    ('4', 'Assessor de Controle e Normas'),
    ('5', 'Assessor de Relações Institucionais '),
    ('6', 'Coordenador Adjunto do NIP'),
    ('7', 'Coordenador de Curso'),
    ('8', 'Coordenador do CAPSI – Apoio Psicopedagogico'),
    ('9', 'Coordenador de Apoio Didatico-Pedagogico '),
    ('10', 'Diretor Acadêmico'),
    ('11', 'Diretor Financeiro'),
    ('12', 'Diretor Geral'),
    ('13', 'Analista de Sistema'),
    ('14', 'Analista Administrativo'),
    ('15', 'Assistente Administrativo'),
    ('16', 'Auxiliar Administrativo'),
    ('17', 'Auxiliar de Bibliotecario'),
    ('18', 'Bibliotecario'),
    ('19', 'Chefe de Seção de Serviços Gerais'),
    ('20', 'Contador'),
    ('21', 'Faxineiro'),
    ('22', 'Inspetor de Sala'),
    ('23', 'Jardineiro'),
    ('24', 'Operador de Sistemas de Informatica'),
    ('25', 'Porteiro'),
    ('26', 'Recepcionista'),
    ('27', 'Secretaria Acadêmica');

insert into Disciplinas
(`Codigo`,`Nome`,`Créditos`,`CargaHoraria_Teorica`,`CargaHoraria_Pratica`,`Periodo_Ano`)
values
('CRP199','Calculo Diferencial e Integral','4','4','0','3'),
('CRP297','Sociologia Geral','4','4','0','3'),
('SIN110','Programação','6','4','2','3'),
('SIN130','Introdução a logica','4','4','0','1'),
('CRP192', 'Iniciação à Estatística','4','4','0','3'),
('CRP298', 'Geometria Analítica e algebra Linear','4','4','0','3'),
('SIN100', 'Tratamento e Analise de Dados/Informações','4','4', '0','2'),
('SIN101', 'Informatica e Sociedade', '2','2','0','2'),
('SIN211', 'Algoritmos e Estruturas de Dados','6','4','2','2'),
('CRP291', 'Inglês I','4','4','0','3'),
('SIN132', 'Matematica Discreta','4','0','4','1'),
('SIN141','Computação Orientada a Objetos','4','4','0','2'),
('SIN222', 'Fundamentos de Sistemas de Informação','4','4','0','2'),
('SIN251', 'Organização de Computadores','4','4','0','2'),
('SIN142', 'Programação Concorrente e Distribuída','2','2','0','2'),
('SIN213', 'Projeto de Algoritmos','6','4','2','2'),
('SIN220', 'Banco de Dados', '4','4','0','2'),
('SIN221', 'Engenharia de Software I','4','4','0','2'),
('SIN252', 'Arquitetura de Computadores','4','4','0','2'),
('SIN131', 'Introdução à Teoria da Computação','4','4','0','1'),
('SIN143', 'Laboratorio de Programação','4','2','2','1'),
('SIN320', 'Laboratorio de Banco de Dados','4','2','2','1'),
('SIN321', 'Engenharia de Software','4','4','0','1'),
('SIN351', 'Sistemas Operacionais','4','4','0','1'),
('ADE104', 'Teoria Geral da Administração', '4', '4','0','3'),
('SIN322', 'Pratica de Gerenciamento de Projetos', '2', '2', '0','2'),
('SIN323', 'Inteligência Artificial','4', '4', '0','2'),
('SIN352', 'Redes de Computadores', '6', '4', '2','2'),
('SIN421', 'Interação HumanoComputador', '4','4','0','2'),
('ADE190', 'Introdução à Economia','4','4','0','3'),
('ADE345', 'Comportamento Organizacional','4','4','0','3'),
('SIN392', 'Introdução ao Processamento Digital de Imagens','4','4','0','1'),
('SIN498', 'Trabalho de Conclusão de Curso I', '0', '0', '14','3'),
('ADE327', 'Empreendedorismo','4','4','0','3'),
('CIC100', 'Contabilidade Geral', '4','4','0','3'),
('SIN480', 'Pesquisa Operacional I','4','4','0','2'),
('SIN496', 'Atividades Complementares','0','0','12','3'),
('SIN499', 'Trabalho de Conclusão de Curso II', '0','0','14','3');

insert into pre_requisito
(`Disciplinas_Codigo`,`Disciplina_Pre`)
values
( 'CRP192','CRP191, CRP199'),
( 'CRP298','CRP191, CRP199'),
( 'SIN211','SIN110'),
( 'SIN141','SIN110'),
( 'SIN251','SIN110'),
( 'SIN142','SIN141'),
( 'SIN213','SIN211 e SIN132'),
( 'SIN252','SIN251'),
( 'SIN143','SIN141 e SIN320'),
( 'SIN320','SIN220'),
( 'SIN321','SIN221'),
( 'SIN351','SIN142'),
( 'SIN131','SIN132'),
( 'SIN322','SIN221'),
( 'SIN323','SIN130'),
( 'SIN352','SIN351'),
( 'SIN421','SIN221'),
( 'SIN392','CRP199 e SIN110'),
( 'SIN498','SIN321'),
( 'SIN480','SIN110'),
( 'SIN499','SIN498');

 insert into curso
 (`ID_Curso`,`Disciplinas_Codigo`)
 values
 (10,'CRP199'),(9,'CRP199'),(7,'CRP199'),(6,'CRP199'),
 (12,'CRP297'),(10,'CRP297'),(9,'CRP297'),(8,'CRP297'),(7,'CRP297'),(1,'CRP297'),
 (1,'CRP192'),(3,'CRP192'),(4,'CRP192'),(5,'CRP192'),(6,'CRP192'),(7,'CRP192'),(9,'CRP192'),(10,'CRP192'),(12,'CRP192'),
 (3,'CRP298'),(6,'CRP298'),(7,'CRP298'),(9,'CRP298'),(10,'CRP298'),
 (10,'CRP291'),
 (10,'ADE104'),(12,'ADE104'),(6,'ADE104'),(7,'ADE104'),
 (10,'ADE190'),(12,'ADE190'),(6,'ADE190'),(7,'ADE190'),
 (10,'ADE345'),
 (10,'ADE327'),
 (10,'CIC100'),(7,'CIC100'),(1,'CIC100'),
 (10,'SIN110'),(7,'SIN110'),
 (10,'SIN130'),
 (10,'SIN100'),
 (10,'SIN101'),
 (10,'SIN132'),
 (10,'SIN211'),(7,'SIN211'),
 (10,'SIN141'),
 (10,'SIN222'),
 (10,'SIN251'),
 (10,'SIN142'),
 (10,'SIN213'),
 (10,'SIN220'),
 (10,'SIN221'),
 (10,'SIN252'),
 (10,'SIN131'),
 (10,'SIN143'),
 (10,'SIN320'),
 (10,'SIN321'),
 (10,'SIN351'),
 (10,'SIN322'),
 (10,'SIN323'),
 (10,'SIN352'),
 (10,'SIN421'),
 (10,'SIN392'),
 (10,'SIN498'),
 (10,'SIN480'),
 (10,'SIN496'),
 (10,'SIN499');

insert into Periodo
(`idPeriodo`,`periodo_idCurso`,`periodo_idDisciplina`)
values
(2,10,'SIN110'),
(2,10,'SIN100'),
(2,10,'SIN101'),
(2,10,'SIN142'),
(2,10,'SIN211'),
(2,10,'SIN213'),
(2,10,'SIN220'),
(2,10,'SIN221'),
(2,10,'SIN252'),
(2,10,'SIN322'),
(2,10,'SIN323'),
(2,10,'SIN352'),
(2,10,'SIN393'),
(2,10,'SIN421'),
(2,10,'SIN480'),
(2,10,'SIN499'),
(2,10,'SIN496'),
(2,10,'SIN498');

insert into Turma
(`Curso_Disciplinas_Codigo`,`Local`,`Tipo`,`Dia`,`Horario`)
values
('SIN110','PVA101','T','Segunda','19-21'),
('SIN110','PVA210','T','Quarta','21-23'),
('SIN110','PVA226','P','Quinta','19-21'),
('SIN211','PVA103','T','Segunda','21-23'),
('SIN211','PVA113','T','Quinta','19-21'),
('SIN213','PVA102','T','Segunda','19-21'),
('SIN213','PVA114','T','Quarta','21-23'),
('SIN220','PVA229','T','Segunda','21-23'),
('SIN220','PVA229','T','Sexta','19-21'),
('SIN221','PVA108','T','Segunda','19-21'),
('SIN221','PVA108','T','Quinta','21-23'),
('SIN252','PVA230','T','Segunda','19-21'),
('SIN252','PVA230','T','Quinta','19-21'),
('SIN323','PVA230','T','Quinta','19-21'),
('SIN323','PVA230','T','Sexta','19-21'),
('SIN352','PVA227','T','Terca','21-23'),
('SIN352','PVA227','T','Quinta','21-23'),
('SIN352','PVA227','P','Sexta','19-21'),
('SIN421','PVA230','T','Segunda','19-21'),
('SIN421','PVA230','T','Quarta','21-23'),
('CRP199','PVA113','T','Segunda','19-21'),
('CRP199','PVA218','T','Quarta','21-23'),
('CRP192','PVA103','T','Terca','19-21'),
('CRP192','PVA103','T','Quinta','21-23'),
('CRP291','PVA202','T','Segunda','19-21'),
('CRP291','PVA202','T','Quarta','21-23'),
('CRP297','PVA210','T','Terca','21-23'),
('CRP297','PVA101','T','Sexta','19-21'),
('CRP298','PVA103','T','Segunda','19-21'),
('CRP298','PVA103','T','Quarta','21-23'),
('ADE190','PVA212','T','Terca','19-21'),
('ADE190','PVA212','T','Sexta','21-23'),
('ADE104','PVA108','T','Segunda','21-23'),
('ADE104','PVA108','T','Quinta','19-21'),
('ADE327','PVA228','T','Segunda','21-23'),
('ADE327','PVA228','T','Quinta','19-21');


insert into Funcionario
(`Matricula`,`idCargo_Funcionario`,`Nome`,`atua`,`area`,`Email`,`Sexo`,`CPF`,`RG`,`UF`,
`OrgaoExpedidor`,`Nascimento`,)
values
(default,'3','Adriana Zanella Martinhago','professor','Sistemas de Informação e Banco de Dados',
'adriana.martinhago@ufv.br','F','517077638','517077638','MG','SSP','1988/05/15','3438559325'),
(default,'3','Clausius Duque Gonçalves Reis','professor','Arquitetura de computadores'),
(default,'2','Guilherme de Castro Pena','professor','Algoritmos, Estruturas de Dados e Pesquisa Operacional'),
(default,'2','Guilherme Mendonça Freire','professor','Engenharia de Software'),
(default,'1','Íris Fabiana de Barcelos Tronto','professor','Engenharia de Software'),
(default,'2','João Fernando Mari','professor','Processamento de Imagem e Computação Grafica'),
(default,'3','Liziane Santos Soares','professor','Engenharia de Software'),
(default,'2','Matheus Nohra Haddad','professor','Otimização Combinatoria'),
(default,'3','Pablo Luiz Araújo Munhoz','professor','Pesquisa Operacional'),
(default,'1','Pedro Moises de Sousa','professor','Sistemas inteligentes, Mineração de dados'),
(default,'2','Rachel Carlos Duque Reis','professor','Programação de Computadores'),
(default,'3','Rodrigo Smarzaro da Silva','professor','Sistemas de Informação e Banco de Dados'),
(default,'2','Joelson Antônio dos Santos','professor','Aprendizado de Maquina'),
(default,'1','João Batista Ribeiro','professor','Programação de Computadores e Redes de Computadores'),
(default,'3','Larissa Ferreira Rodrigues','professor','Aprendizado de maquina e Processamento de Imagem'),
(default,'2','Leandro Henrique Furtado Pinto Silva','professor','Engenharia de Software'),
(default,'3','Henrique Peluzio','tecnico','Analista de sistemas');

insert into registro
(funcionario_idFuncionario,email,sexo,cpf,identidade,UFidentidade,orgaoExpedidor,
DataNascimento,cidade,cep,telefone)
values
(2,'clausius@ufv.br','M','674830714','243941985','MG','SSP','1989/02/19',
'3438265593'),
(3,'guilherme.pena@ufv.br','M','463851016','202021592','MG','SSP','1987/06/15',
'3438559356'),
(4,'guilhermemfreire@ufv.br','M','364845533','203094803','MG','SSP','1975/12/09',
'34385593530'),
(5,'irisbarcelos@ufv.br','F','650084502','468565152','MG','SSP','1972/8/21',
'3438559350'),
(6,'joaofmari@gmail.com','M','147327909','374797523','MG','SSP','1987/10/11',
'3438559350'),
(7,'liziane.soares@ufv.br','F','244873569','263898246','MG','SSP','1958/8/14',
'3438559350'),
(8,'mathaddad@gmail.com','M','193500281','500148958','MG','SSP','1985/12/22',
'3438559350'),
(9,'pablo.munhoz@ufv.br','M','926367135','183929913','MG','SSP',' 1974/2/2',
'3438559350'),
(10,'pedromoises@ufv.br','M','358075510','492982004','MG','SSP','1956/6/16',
'3438559350'),
(11,'rachel.reis@ufv.br','F','557542164','404749513','MG','SSP','1970/12/27',
'3438559350'),
(12,'smarzaro@ufv.br','M','804995909','376233643','MG','SSP','1970/10/6',
'3438559350'),
(13,'joelsonn.santos@gmail.com','M','656447916','260190731','MG','SSP','1970/5/29',
'343855935'),
(14,'joao42lbatista@gmail.com','M','047773202','444630442','MG','SSP','1988/2/25',
'343559350'),
(15,'larissa.f.rodrigues@ufv.br','F','265314921','469713823','MG','SSP','1981/5/24',
'343855935'),
(16,'leandro.pinto@ufv.br','M','560122233','355680543','MG','SSP','1970/8/11',
'438559350'),
(17,'hpeluzio@gmail.com','M','120013858','406869194','MG','SSP','1982/8/19',
'3438559350');


insert into Aluno
(`Matricula_Aluno`,`Nome`,`curso_idCurso`,`entrada_curso`,`escola2oGrau`, `CPF`, `email`, `Sexo`)
values
(default,'Matheus Dias',10,2014,'Jose Hugo', '11210428644', 'matheusd@ufv.br', 'M'),
(default,'Luigi Miranda',10,2014,'Jose Hugo', '13654286640', 'luigi.miranda@ufv.br', 'M'),
(default,'Tiemy Shibuya',10,2014,'Jose Hugo', '02211922635', 'tiemy.watanabe@ufv.br', 'F'),
(default,'José Costa',10,2012,'Don Vito', '123456789','jose.costa@ufv.br', 'M'),
(default,'Vinícius Rodrigues',10,2017,'Carlo', '123456666','vini.rodrigues@ufv.br', 'M'),
(default,'Fernanda Maximus',10,2014,'Bonesera', '123456777', 'fernanda.maximus@ufv.br', 'F'),
(default,'Giovanna Marques',10,2015,'Luca', '123455555', 'giovanna.marques@ufv.br', 'F'),
(default,'Nicolas Campos',10,2012,'Jack', '1234562222', 'nicolas.campos@ufv.br', 'M'),
(default,'Bernardo Boaventura',10,2015,'Tom Hagen', '1234561111', 'bernardo.boaventura@ufv.br', 'M'),
(default,'Emanuela Amaral',10,2011,'Sollozo', '123456333', 'emanuela.amaral@ufv.br', 'F'),
(default,'Agnes Menezzes',10,2015,'Tattaglia', '123456444', 'agnes.menezzes@ufv.br', 'F'),
(default,'Wilian Mello',10,2018,'Sonny', '123456456', 'willian.mello@ufv.br', 'M');

insert into registro
(`aluno_matricula`,`email`,`sexo`,`cpf`,`identidade`,`UFidentidade`,`orgaoExpedidor`,
`DataNascimento`,`cidade`,`cep`,`telefone`)
values
 (1,'matheusd@ufv.br','M','11210428644','123456789','MG','SSP','1996/05/08',
 'Carmo do Paranaiba','38840000','99796233'),

(2,'josecosta@ufv.br','M','81905697406','483710027','MS','SSP','1990/12/07',
'agua Clara','79680000','9587632564'),

(3,'viniciusrodrigues@ufv.br','M','66612931108','467466269','PR','SSP','1999/06/07',
'Cornélio Procopio','86300000','439524581'),

(4,'fernandamaximus@ufv.br','F','20903006715','256115687','PA','SSP','1991/07/05',
'Belem','66999000','9198229682'),

(5,'giovanamarques@ufv.br','F','24360782977','110336793','PR','SSP','1997/08/01',
'Curitiba','82999000','419320289'),

(6,'nicolascampos@ufv.br','M','10627663427','337310026','PR','SSP','1991/11/07',
'Curitiba','82999000','4192700778'),
(7,'bernardoboaventura@ufv.br','M','98981048487','110336793','MS','SSP','1991/06/01',
'agua Clara','79680000','679185563'),
(8,'emanuela.amaral@ufv.br','F','56560716341','468238992','MG','SSP','1992/07/05',
'Belo Horizonte','30000000','3197759849'),
(9,'agnesmenezzes@ufv.br','F','38291391440','468238992','MG','SSP','1997/02/11',
'Belo Horizonte','30000000','319683413'),
(10,'heitormello@ufv.br','M','42671546351','294854459','PE','SSP','1994/06/06',
'Recife','50000000','819642161');

