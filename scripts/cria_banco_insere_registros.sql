create database bd_Academico;

use bd_Academico;


/* Criação das tabelas */

Create table if not exists disciplina (
Cod_disc integer not null,
Denominacao varchar(50) not null,
Nivel integer,
Primary key(Cod_disc));

Create table professor (
Cod_prof integer,
Nome varchar(50) not null,
Dt_nasc date,
Primary key(Cod_prof));


Create table aluno (
Matricula integer,
Nome varchar(50) not null,
Sexo char(1) not null,
Idade integer not null,
Curso char(5) not null,
Primary key(matricula));



Create table classe (
Disciplina integer,
Turma integer,
Ano_sem char(6),
Cod_prof integer not null,
Primary key(Disciplina,Turma,Ano_sem),
Foreign key(disciplina) references disciplina (cod_disc) on update cascade,
Foreign key(Cod_prof) references Professor(cod_prof) on delete cascade);


Create table historico (
Matricula integer,
Disciplina integer,
Turma integer not null,
Ano_sem char(6) not null,
Nota decimal(3,1) not null,
Primary key(matricula,disciplina,ano_sem),
Foreign key(matricula) references aluno (matricula) on delete cascade,
Foreign key(disciplina,turma,Ano_sem) references classe (disciplina,turma,Ano_sem) on update cascade);






/* carga de dados em disciplina e aluno */

Insert into disciplina values(46250,'Sistemas de Informação',3);
Insert into disciplina values(46251,'Engenharia de Software I',4);
Insert into disciplina values(46252,'Engenharia de Software II',6);
Insert into disciplina values(46256,'Banco de Dados I',4);
Insert into disciplina values(46257,'Banco de Dados II',6);
Insert into disciplina values(46258,'Modelagem Conceitual de Sistemas',5);
Insert into disciplina values(46266,'Tópicos Especiais em Bancos de Dados',7);
Insert into disciplina values(46267,'Tópicos Especiais em Engenharia de Software I',7);
Insert into disciplina values(46268,'Tópicos Especiais em Engenharia de Software II',8);
Insert into disciplina values(46285,'Engenharia de Software I',4);
Insert into disciplina values(46286,'Banco de Dados I',4);
Insert into aluno values(93106842,'Jovana da Silva','F',26,'2/520');
Insert into aluno values(94103839,'Eduardo da Silva','M',22,'4/601');
Insert into aluno values(94108293,'Marcelo da Silva','M',22,'4/601');
Insert into aluno values(94112046,'Tiago da Silva','M',22,'4/601');
Insert into aluno values(94112192,'Vanessa da Silva','F',23,'4/601');
Insert into aluno values(94201018,'Carla da Silva','F',21,'4/601');
Insert into aluno values(94206067,'Rogério da Silva','M',22,'4/601');
Insert into aluno values(95280018,'Solange da Silva','F',26,'4/601');
Insert into aluno values(95280023,'Marcelo da Silva','M',23,'4/601');
Insert into aluno values(95280027,'Kátia da Silva','F',20,'4/601');
Insert into aluno values(96104543,'Marcos da Silva','M',26,'2/520');

/* carga de dados em professor */

Insert into professor values(1,'Ana Paula','19780304');
Insert into professor values(2,'Yamaguti','19760220');
Insert into professor values(3,'Bastos','19710405');
Insert into professor values(4,'Afonso','19730712');
Insert into professor values(5,'Debora','19821212');
Insert into professor values(6,'Arruda','19800823');
Insert into professor values(7,'Hugo','19701003');
Insert into professor values(8,'Egídio','19770327');
Insert into professor values(9,'Karina','19750313');





/* carga de dados em classe */

Insert into classe values(46250,'128','1997/2',1);
Insert into classe values(46250,'128','1998/1',1);
Insert into classe values(46250,'128','1998/2',1);
Insert into classe values(46250,'128','1999/1',1);
Insert into classe values(46250,'128','1999/2',1);
Insert into classe values(46250,'128','2000/1',1);
Insert into classe values(46250,'138','1999/1',1);
Insert into classe values(46250,'138','2000/1',1);
Insert into classe values(46251,'128','1998/1',2);
Insert into classe values(46251,'128','1998/2',2);
Insert into classe values(46251,'128','1999/2',3);
Insert into classe values(46251,'128','2000/1',3);
Insert into classe values(46251,'138','1998/1',3);
Insert into classe values(46251,'138','1999/2',2);
Insert into classe values(46251,'138','2000/1',2);
Insert into classe values(46252,'128','1999/1',4);
Insert into classe values(46252,'128','1999/2',4);
Insert into classe values(46252,'128','2000/1',4);
Insert into classe values(46256,'128','1998/1',9);
Insert into classe values(46256,'128','1998/2',9);
Insert into classe values(46256,'128','1999/1',9);
Insert into classe values(46256,'128','1999/2',9);
Insert into classe values(46256,'128','2000/1',9);
Insert into classe values(46256,'138','1999/1',5);
Insert into classe values(46256,'138','1999/2',5);
Insert into classe values(46256,'138','2000/1',5);
Insert into classe values(46257,'128','1998/2',6);
Insert into classe values(46257,'128','1999/1',6);
Insert into classe values(46257,'128','1999/2',6);
Insert into classe values(46257,'128','2000/1',6);
Insert into classe values(46258,'128','1998/2',7);
Insert into classe values(46258,'128','1999/1',7);
Insert into classe values(46258,'128','2000/1',7);
Insert into classe values(46266,'128','1999/2',7);
Insert into classe values(46266,'128','2000/1',8);
Insert into classe values(46267,'128','1999/2',8);


/* carga de dados em historico */
Insert into historico values(94108293,46250,'128','1997/2',6);
Insert into historico values(94112046,46250,'128','1997/2',6);
Insert into historico values(94112192,46250,'128','1997/2',8);
Insert into historico values(94103839,46250,'128','1998/1',9);
Insert into historico values(95280023,46250,'128','1998/1',9);
Insert into historico values(93106842,46250,'128','1998/2',8);
Insert into historico values(94206067,46250,'128','1998/2',9);
Insert into historico values(94201018,46250,'128','1999/1',8);
Insert into historico values(95280018,46250,'138','1999/1',9);
Insert into historico values(95280027,46250,'128','1999/1',4);
Insert into historico values(95280027,46250,'128','1999/2',7);
Insert into historico values(94108293,46251,'138','1998/1',6);
Insert into historico values(94112046,46251,'128','1998/1',5);
Insert into historico values(94112192,46251,'128','1998/1',7);
Insert into historico values(94103839,46251,'128','1998/2',6);
Insert into historico values(94201018,46251,'128','1999/2',8);
Insert into historico values(94206067,46251,'138','1999/2',8);
Insert into historico values(94108293,46252,'128','1999/1',9);
Insert into historico values(94112046,46252,'128','1999/2',9);
Insert into historico values(94112192,46252,'128','1999/2',8);
Insert into historico values(94108293,46256,'128','1998/1',8);
Insert into historico values(94112046,46256,'128','1998/1',8);
Insert into historico values(94112192,46256,'128','1998/1',3);
Insert into historico values(94103839,46256,'128','1998/2',5);
Insert into historico values(94112192,46256,'128','1998/2',7);
Insert into historico values(93106842,46256,'138','1999/1',7);
Insert into historico values(94206067,46256,'138','1999/1',9);
Insert into historico values(95280023,46256,'128','1999/1',7);
Insert into historico values(94201018,46256,'138','1999/2',8);
Insert into historico values(95280018,46256,'128','1999/2',8);
Insert into historico values(94108293,46257,'128','1999/1',7);
Insert into historico values(94112046,46257,'128','1999/1',9);
Insert into historico values(94112192,46257,'128','1999/2',6);
Insert into historico values(94108293,46257,'128','1998/2',8);
Insert into historico values(94112046,46257,'128','1998/2',7);
Insert into historico values(94103839,46257,'128','1999/1',7);


