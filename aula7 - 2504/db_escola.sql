CREATE DATABASE db_escola;
USE db_escola;


CREATE TABLE cursos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  duracao_meses INT
);

CREATE TABLE alunos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  idade INT,
  curso_id INT,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);


INSERT INTO cursos (id, nome, duracao_meses)
VALUES 
(1, 'Engenharia de Software', 48),
(2, 'Administração', 36),
(3, 'Arquitetura', 60),
(4, 'Marketing', 24),
(5, 'Direito', 48);


INSERT INTO alunos (id, nome, idade, curso_id)
VALUES 
(1, 'João Silva', 20, 1),
(2, 'Maria Santos', 22, 2),
(3, 'Carlos Oliveira', 25, 1),
(4, 'Ana Pereira', 23, 3),
(5, 'Pedro Costa', 21, 2);



-- Criando usuarios no Database 

CREATE USER 'analista_bi'@'localhost' IDENTIFIED BY 'user1234'; 
CREATE USER 'sistema'@'localhost' IDENTIFIED BY 'user2345'; 


-- Libere os acesso para realizar somente o SELECT nas tabelas cursos e alunos
-- libere os acessos para que o usuario sistema realizei SELECT, UPDATE, DELETE
GRANT SELECT ON db_escola.* TO 'analista_bi'@'localhost';
GRANT SELECT, UPDATE,  DELETE ON db_escola.* TO 'sistema'@'localhost';


-- Crie um usuario novo chamadao sistema_SELECT para realizar SELECT
CREATE USER 'sistema_SELECT'@'localhost' IDENTIFIED BY 'user8888'; 
GRANT SELECT ON db_escola.* TO 'sistema_SELECT'@'localhost';

-- Realize a remoção da permissão SELECT do usuário sistema2
REVOKE SELECT ON db_escola.* FROM 'sistema'@'localhost';