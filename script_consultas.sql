-- -----------------------------------------------------
-- 1. Lista dos Cursos da UFV-CRP
-- -----------------------------------------------------
SELECT 
   Nome_Curso
FROM
    Curso;
-- -----------------------------------------------------
-- 2. Lista dos Cursos, por Instituto
-- -----------------------------------------------------
SELECT 
    c.Nome_Curso AS 'Curso',
    c.Instituto_idInstituto AS 'Instituto'
FROM
    Curso c
        JOIN
    Instituto i ON i.idInstituto = c.Instituto_idInstituto
ORDER BY Instituto_idInstituto;

 
-- -----------------------------------------------------
-- 3. Lista das disciplinas obrigatórias de um curso ordenadas pelo período em que são
-- oferecidas
-- -----------------------------------------------------
SELECT DISTINCT
    d.idDisciplina as 'Código',
    d.Nome AS 'Disciplina',
    semestreOfertado AS 'Semestre Ofertado'
FROM
    Disciplinas d
        JOIN
    disciplina_has_curso dc on idDisciplina = disciplina_Codigo
WHERE
    Status_da_Disciplina = 'Obrigatoria'
ORDER BY semestreOfertado;

-- -----------------------------------------------------
-- 4. Lista dos Professores, por Curso
-- -----------------------------------------------------
SELECT 
    f.Nome AS 'Professor', p.professorCurso AS 'Curso'
FROM
    Funcionario f
        JOIN
    Professor p ON Matricula = ID_Professor
WHERE
    idCargo_Funcionario IN (1 , 2, 3)
ORDER BY professorCurso;


-- -----------------------------------------------------
-- 5. Lista de alunos, por curso, contendo matrícula, nome, email e ano de entrada na
-- UFV.
-- -----------------------------------------------------
SELECT 
    Matricula_aluno AS 'matricula',
    Nome,
    email,
    entrada_curso AS 'Ano de entrada'
FROM
    Aluno
ORDER BY Aluno_ID_Curso;

-- -----------------------------------------------------
-- 6. Lista das disciplinas e seus pré-requisitos
-- -----------------------------------------------------
SELECT 
    d.idDisciplina as 'Código disciplina',
    d.Nome AS 'Disciplina',
    p.Disciplina_Pre AS 'Pré-requisito'
FROM
    Disciplinas d
        JOIN
    pre_requisito p on d.idDisciplina = p.Disciplinas_Codigo;
    
-- -----------------------------------------------------
-- 7. Número de alunos, por disciplina, para um determinado período letivo
-- -----------------------------------------------------
SELECT 
    COUNT(*), d.idDisciplina, semestreOfertado
FROM
    Disciplinas
WHERE
    semestreOfertado = '2';
-- -----------------------------------------------------
-- 8. Lista de disciplinas e respectivos períodos em que foi cursada e resultados para um
-- determinado aluno (como se fosse o histórico escolar)
-- -----------------------------------------------------
SELECT
	a.Nome, d.Nome
FROM Aluno AS a
		JOIN
	Disciplinas AS d;

-- -----------------------------------------------------
-- 9. Lista de disciplinas obrigatórias que um determinado aluno ainda falta fazer
-- -----------------------------------------------------
SELECT 
    d.Nome
FROM
    Disciplinas AS d,
    Matriculado AS m,
    Conclui AS c
WHERE
    d.Status_da_Disciplina = 'obrigatoria'
        AND c.Disciplinas_Codigo <> d.Codigo
        AND m.Disciplina_codigo <> d.Codigo
-- -----------------------------------------------------
-- 10. Lista de disciplinas, por período letivo, por curso, contendo o número total de
-- alunos, número de aprovados, número de reprovados, % de alunos aprovados, % de
-- alunos reprovados
-- -----------------------------------------------------
