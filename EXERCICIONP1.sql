-- figura 1 respostas:
-- a) Mostre a média de salários da folha de pagamento.

 select avg(funcionario.salario) from funcionarios;

-- b) Mostre os nomes, a função dos funcionários e o departamento que ele trabalha. Agrupando pelo nome do departamento.

select funcionários.primeiro_Nome, funcionários.segundo_Nome, funcionários.ultimo_Nome, departamentos.nome as Departamento
from funcionários inner join departamentos
on funcionários.codigo_Depto = departamentos.codigo_Depto group by departamentos.nome;


-- c) Mostre os nomes, o endereço, RG e CPF dos funcionários que trabalham no departamento de TI.

 select funcionários.primeiro_Nome, funcionários.endereco, funcionários.rg, funcionários.cpf, departamentos.nome as Departamento
from funcionários inner join departamentos
on funcionários.codigo_Depto = departamentos.codigo_Depto
where departamentos.nome = "TI";



-- d) Mostre o nome e os salários dos funcionários que nasceram entre 01/01/1980 a 31/12/1990.

select primeiro_Nome, salario from funcionários
where data_Nasc between 19800101 and 19901231;



-- Utilize a modelagem (Figura 2) e crie as estruturas SQL para as questões:

-- a) Mostre os nomes dos países e seus continentes.

select name, continent from country;

-- b) Mostre os nomes dos países, região e a população dos países do continente ‘Europe’.

select name, region, population from country
where region like '%europe';

-- c) Mostre a expectativa de vida das pessoas do continente ‘Asia'.

select avg(LifeExpectancy) from country 
where region like "%asia%";

-- d) Crie uma view que mostre os nomes dos países, seu presidente (HeadOfState), tipos de governo (GovernmentForm) e a população dos países do continente ‘South America’ e com
-- população maior que 2000000.

create view vw_InfoPais as
select name, HeadOfState, GovernmentForm, Population from country 
where Population > 2000000 and Region = "South America";

select * from vw_InfoPais;

-- e) Crie uma view que mostre os nomes dos países, tamanho da sua área (surfaceArea) e seu
-- idioma. Exibir somente os países com idioma ‘English’ como oficial. Ordenar pelo tamanho da
-- área (da menor para maior). Mostre também como usar a View.

create view vw_TamanhoNomeIdiomaIngles as
select country.name, country.surfaceArea, countrylanguage.Language
from country inner join countrylanguage
on CountryCode = countrylanguage.CountryCode
where countrylanguage.IsOfficial = "T" and countrylanguage.Language = "English"
group by country.name
order by country.SurfaceArea; 

select * from vw_TamanhoNomeIdiomaIngles;


-- f) Altere a view do exercício anterior para incluir a porcentagem de pessoas que falam o idioma
-- ‘English’ como oficial. Mostre também como usar a View.

alter view vw_TamanhoNomeIdiomaIngles as
select country.name, country.surfaceArea, countrylanguage.Language, countrylanguage.Percentage
from country inner join countrylanguage
on CountryCode = countrylanguage.CountryCode
where countrylanguage.IsOfficial = "T" and countrylanguage.Language = "English"
order by country.SurfaceArea; 

select * from vw_TamanhoNomeIdiomaIngles;
