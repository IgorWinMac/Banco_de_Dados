/*3) Listar todas as informações de todos os funcionários */
select * 
from funcionario;

/*4) Listar todas as informações de todos os departamentos */
select * 
from departamento;

/*5) Listar todas as informações de todos os projetos*/
select * 
from projeto;

/*6) Listar todas as informações de todos os cargos*/
select * 
from cargo;

/*7) Listar todas as informações dos funcionários com salário líquido superior a R$1.000,00*/
select * 
from funcionario
where SalarioLiquido > 1000;

/*8) Listar todas as informações dos funcionários nascidos na década de 60*/
select * 
from funcionario
where datanascimento between '1960-01-01' and '1969-12-31';

select * 
from funcionario
where year(datanascimento) between 1960 AND 1969;

/*9) Listar o nome, a data de nascimento e a idade, em anos completos, de todos os funcionários.
Dica: consulte a função TIMESTAMPDIFF.*/
select nome, DataNascimento, timestampdiff(year, datanascimento, curdate()) as idade
from funcionario;

/*10) Listar, sem repetições, os códigos de todos os engenheiros alocados ao projeto de código igual a 1.*/
select distinct CodFunc
from engenheiroprojeto
where CodProjeto = 1;

/*11) Listar o nome do(s) dependente(s) do funcionário de código 2, nascidos a partir de 1990.*/
select Nome
from dependentes
where CodFunc = 2 and DataNascimento >= '1990-01-01';

select Nome
from dependentes
where CodFunc = 2 and year(DataNascimento) >= 1990;


/*12) Listar o nome de todas as formações escolares com gratificação entre 300 e 500, em ordem crescente do nome das formações.*/
select descricao
from formacaoescolar
where GratificacaoFormacao between 300 and 500
order by Descricao;

/*13) Listar o nome de todos os funcionários que começam com a letra ‘M’.*/
select nome
from funcionario
where nome like 'M%';

/*14)	Listar, em ordem decrescente, os nomes dos funcionários admitidos em 1999. */
select Nome 
from funcionario
where year(DataAdmissao) = 1999
order by nome;

/*15) Listar o código de funcionário, o código do departamento de lotação desses funcionários e a data de início dessa lotação, em ordem crescente de código de departamento e ordem decrescente de código do funcionário.*/
select CodFunc, CodDepto, DataInicio
from lotacao
order by CodDepto asc, CodFunc desc;

/*16)	Listar o nome dos funcionários que não são engenheiros na empresa. */

select Nome
from funcionario f left outer join engenheiro e
on f.codfunc = e.codfunc
where e.codfunc is null;

/* 17)	Listar o nome dos engenheiros que não estão alocados em projetos. */

select Nome
from funcionario f inner join engenheiro e
on f.codfunc = e.codfunc
left outer join engenheiroprojeto ep
on e.codfunc = ep.codfunc
where ep.codfunc is null;






