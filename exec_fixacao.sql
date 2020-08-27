create database exerc_fixacao;

use exerc_fixacao;

create table funcionarios(
codigo_func int not null,
codigo_depto int primary key,
primeiro_Nome varchar(20) not null,
segundo_Nome varchar(20),
ultimo_nome varchar(20),
data_Nasc date not null,
cpf varchar(14) unique not null,
rg varchar(13) not null,
endereco varchar(60)not null,
cep varchar(10)not null,
cidade varchar(30) default "Itapira",
fone_Res varchar(14)not null,
fone_Cel varchar(15),
funcao varchar(30),
salario decimal(8,2));

create table departamentos(
codigo_depto int primary key not null,
nome varchar(30) not null,
localizacao varchar(30));

select primeiro_Nome and ultimo_Nome from funcionarios order by ultimo_Nome;

select*from funcionarios order by cidade;

select*from funcionarios where salario > 1000 order by primeiro_Nome, segundo_Nome, ultimo_nome;

select data_Nasc primeiro_Nome from funcionarios order by data_Nasc desc, primeiro_Nome;

select ultimo_Nome, primeiro_Nome, segundo_Nome, fone, endereco, cidade from funcionarios order by ultimo_Nome, primeiro_Nome, segundo_Nome;

select sum(salario) total from funcionarios;

select count(funcionarios) as total from funcionarios;

select avg(salario) as media from funcionarios;

select primeiro_Nome from funcionarios where cidade= "Itapira" and funcao="Recepcionista";


