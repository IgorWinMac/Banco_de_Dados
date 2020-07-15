select * from dependentes;
select * from beneficio;
select * from beneficiofuncionario;


/*3) Listar todas as informações de todos os funcionários*/
select *
from funcionario;

/*4) Listar todas as informações de todos os departamentos*/
select *
from departamento;

/*5) Listar todas as informações de todos os projetos*/
select *
from projeto;

/*6) Listar todas as informações de todos os cargos*/
select *
from cargo;

/*7) Listar o nome de todos os funcionários que tenham cargo com salário base superior a 1000.
Obs: fazer consultas utilizando JOIN e IN*/
select f.nome
from funcionario f inner join cargo c
on f.codcargo = c.codcargo
where c.salariobase > 1000;

select nome
from funcionario
where codcargo in
	(select codcargo
     from cargo
     where salariobase > 1000);


/*8) Listar o nome de todos os funcionários que não possuem dependentes.
Obs: fazer consultas utilizando JOIN, IN e EXISTS.*/
select f.nome
from funcionario f left outer join dependentes d
on f.codfunc = d.codfunc
where d.codfunc is null;

select nome
from funcionario
where codfunc not in
	(select codfunc
     from dependentes);

select nome from funcionario f
where not exists
(select * from dependentes
 where codfunc = f.codfunc);


/*9) Listar, em ordem alfabética decrescente, o nome e o número de dependentes de todos os funcionários
que possuem mais de um dependente.*/
select f.nome, count(d.CodFunc) as nr_dependentes
from funcionario f inner join dependentes d
on f.codfunc = d.codfunc
group by f.nome
having count(d.CodFunc) > 1
order by f.nome desc;


/*10) Listar, em ordem crescente do valor do benefício, o nome e o valor do benefício daqueles
funcionários que possuem algum benefício ativo (situação = ‘1’).*/
select f.nome, b.valor
from funcionario f inner join beneficiofuncionario bf
on f.codfunc = bf.codfunc
inner join beneficio b
on bf.codbeneficio = b.codbeneficio
where bf.SituacaoBeneficio = 1
order by b.valor;


/*11) Listar o nome e o total de horas de projeto de todos os engenheiros com mais de 20 horas de projeto.*/
select f.nome, sum(HorasProjeto)
from funcionario f inner join engenheiro e
on f.CodFunc = e.CodFunc
inner join engenheiroprojeto ep
on e.CodFunc = ep.CodFunc
group by f.nome
having sum(HorasProjeto) > 20;

/*12) Listar o nome e a média de horas de projeto de todos os engenheiros, mesmo que
não estejam alocados em projeto (nesses casos a média será zero).*/
select f.nome, avg(HorasProjeto)
from funcionario f inner join engenheiro e
on f.CodFunc = e.CodFunc
left outer join engenheiroprojeto ep
on e.CodFunc = ep.CodFunc
group by f.nome;


/*13) Listar o nome do engenheiro, a descrição do projeto e as horas trabalhadas pelo engenheiro no projeto.*/
select f.nome, p.Descricao, ep.HorasProjeto
from funcionario f inner join engenheiro e
on f.CodFunc = e.CodFunc
inner join engenheiroprojeto ep
on e.CodFunc = ep.CodFunc
inner join projeto p
on ep.CodProjeto = p.CodProjeto;
