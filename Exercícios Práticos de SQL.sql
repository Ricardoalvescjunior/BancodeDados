CREATE DATABASE escola;
USE escola;

			-- Tabela de Alunos
CREATE TABLE alunos (
	id_aluno int primary key,
	nome VARCHAR(100),
    data_nascimento DATE,
    email VARCHAR(100)
);

			-- Tabela de Cursos
CREATE TABLE cursos (
	id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    carga_horario INT
);

			-- Tabela de Matrículas
CREATE TABLE matriculas (
	id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    foreign key (id_aluno) references alunos(id_aluno),
    foreign key (id_curso) references cursos(id_curso)
);

			-- Adicionar coluna telefone
ALTER TABLE alunos ADD telefone VARCHAR(20);

			-- Alterar nome da coluna
ALTER TABLE cursos CHANGE carga_horario carga_horaria SMALLINT;

			-- Modificar tipo da coluna carga horaria
ALTER TABLE cursos MODIFY carga_horaria SMALLINT;

			-- Excluindo tabela
DROP TABLE matriculas;
    
			-- Recriando tabela
CREATE TABLE matriculas (
	id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);
	
			-- Inserir Registros
	-- Inserir Alunos
INSERT INTO alunos (id_aluno, nome, data_nascimento, email, telefone)
VALUES
(1, 'Ana Souza', '2000-05-10', 'ana@gmail.com', '11999998888'),
(2, 'Carlos Lima', '1999-11-22', 'carlos@gmail.com', '1199999777');

	-- Inserir cursos
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES
(101, 'lógica de Programação', 60),
(102, 'Banco de Dados', 80);

	-- Inserir Matriculas
INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES
(1001, 1, 101, '2024-03-10'),
(1002, 2, 102, '2024-03-12');

	-- Atualizand o telefone
UPDATE alunos SET telefone = '11994648569' WHERE id_aluno = 1;

	-- Destivando SafeMod do MySQL
SET SQL_SAFE_UPDATES = 0;

	-- Removendo a Matricula associada
DELETE FROM matriculas WHERE id_curso = 'lógica de Programação';
    
	-- Removendo Cursos
DELETE FROM cursos WHERE id_curso = 'lógica de Programação';

	-- Reinserindo o curs deletado
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES (103, 'Lógica de Programação', 75);

			-- Consultas no SQL
	-- Todos os Alunos
SELECT * FROM	alunos;

	-- Todos os curso com mais de 70 horas
SELECT * FROM cursos WHERE carga_horaria > 70;

	-- Matriculas feitas após 01/03/20204
SELECT * FROM matriculas WHERE data_matricula > '2024-03-01';

			-- lista os nomes dos alunos
SELECT nome, data_nascimento FROM alunos;

			-- Lista de cursos por carga horaria
SELECT * FROM cursos ORDER BY carga_horaria DESC;

			-- Exibir o nome dos alunos e quais cursos estão matriculados
SELECT a.nome AS Aluno, c.nome_curso AS Curso
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON c.id_curso = m.id_curso;

			-- DESAFIO
	-- Nome do Aluno
SELECT nome FROM alunos;

	-- Nome do Curso
SELECT nome_curso FROM cursos;
	
    -- Idade dos alunos (em anos)
SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS Idade FROM alunos;

	-- Data de Matrícula
SELECT a.nome AS aluno, c.nome_curso AS curso, m.data_matricula 
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON c.id_curso = m.id_curso;
