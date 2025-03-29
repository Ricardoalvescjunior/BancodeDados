select  * from funcionarios;

-- 1
select max(salario) as MaxSalario from funcionarios;
-- 2
select min(salario) as MinSalario from funcionarios;
-- 3
select count(id) from funcionarios;
-- 4
select nome, year(data_nascimento) as ano from funcionarios where year(data_nascimento) >= 1990;
-- 5
select avg(salario) as MediaSalario from funcionarios;
-- 6
select substring(nome,1,3) from funcionarios;
-- 7
select count(f.id) as qtFunc, d.nome as Departamentos from funcionarios f join departamentos d on f.departamento_id = d.id group by d.nome;
-- 8
select count(f.id) as qtFunc, d.nome as Cargo from funcionarios f join cargos d on f.departamento_id = d.id group by d.nome;