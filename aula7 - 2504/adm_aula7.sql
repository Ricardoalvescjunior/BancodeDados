CREATE DATABASE adm_aula7;
USE adm_aula7;

CREATE TABLE vendas (
id_venda BIGINT NOT NULL,
nome_cliente VARCHAR(50),
item_pedido VARCHAR(50),
qt BIGINT,
valor FLOAT
);

ALTER TABLE vendas
MODIFY COLUMN id_venda primary key;

    
INSERT INTO vendas (id_venda, nome_cliente, item_pedido, qt, valor)
VALUES 
(1, 'Alice Oliveira', 'Tênis', 2, 160.50),
(2, 'Angela Carla', 'Calça', 3, 189.20),
(3, 'Vinicius Ribeiro', 'Meia', 3, 29.50),
(4, 'Ricardo Ferreira', 'Notebook', 1, 1989.20),
(5, 'Fabricio Carreiro', 'Celular', 1, 1650.20);


UPDATE vendas
SET item_pedido = "Panela"
WHERE id_venda = 2;


DELETE FROM vendas WHERE id_venda = 4;


UPDATE vendas
SET item_pedido = "Panela"
WHERE valor = 2000.00;


