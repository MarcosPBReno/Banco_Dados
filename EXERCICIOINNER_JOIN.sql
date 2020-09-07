create database exercicioinnerjoin;

use exercicioinnerjoin;

create table Cliente (
cpf integer,
nome varchar(60),
dtNasc date);


create table Modelo(
codMod integer,
Desc_2 varchar(40));


create table Patio(
num integer,
ender varchar(40),
capacidade integer);

create table Veiculo(
placa varchar(8),
Modelo_codMod integer,
Cliente_cpf integer,
cor varchar(20));

create table Estaciona(
cod integer,
Patio_num integer,
Veiculo_placa varchar(8),
dtEntrada varchar (10),
dtSaida varchar(10),
hsEntrada varchar(10),
hsSaida varchar(10));

-- 3. Exiba a placa e o nome dos donos de todos os veiculos.
 SELECT v.placa, c.nome FROM Veiculo v INNER JOIN Cliente c ON v.Cliente_cpf = c.cpf; 

-- 4. Exiba o CPF e o nome do cliente que possui o veiculo de placa JJJ-2020.
 SELECT c.cpf, c.nome FROM Veiculo v INNER JOIN Cliente c ON v.Cliente_cpf = c.cpf WHERE v.placa = 'JJJ-2020'; 

-- 5. Exiba a placa e a cor do veiculo que possui o código de estacionamento 1.
 SELECT v.placa, v.cor FROM Veiculo v INNER JOIN estaciona e ON e.Veiculo_placa = v.placa WHERE e.cod = 1; 


-- 6. Exiba o endereço, a data de entrada e de saida dos estacionamentos do veculo de placa JEG-1010.
 SELECT p.ender, e.dtEntrada, e.dtSaida FROM Patio p INNER JOIN Estaciona e ON p.num = e.Patio_num WHERE e.Veiculo_placa = 'JEG-1010'; 


-- 7. Exiba a quantidade de vezes os veculos de cor verde estacionaram. 
SELECT count(e.cod) AS Quantidade FROM Veiculo v INNER JOIN Estaciona e ON v.placa = e.Veiculo_placa WHERE v.cor = 'verde'; 


-- 8. Liste todos os clientes que possuem carro de modelo 1.
 SELECT c.nome FROM Veiculo v INNER JOIN Cliente c ON c.cpf = v.Cliente_cpf WHERE v.Modelo_codMod = 1; 


-- 9. Liste as placas, os horarios de entrada e saida dos veiculos de cor verde.
 SELECT v.placa, e.hsEntrada, e.hsSaida FROM Veiculo v INNER JOIN Estaciona e ON v.placa = e.Veiculo_placa WHERE v.cor = 'verde'; 


-- 10. Liste todos os estacionamentos do veculo de placa JJJ-2020.
 SELECT e.cod,e.dtEntrada, e.dtSaida, e.hsEntrada, e.hsSaida FROM Veiculo v INNER JOIN Estaciona e ON v.placa = e.Veiculo_placa WHERE v.placa = 'JJJ-2020'; 


-- 11. Exiba o nome do cliente que possui o veculo cujo cdigo do estacionamento 2.
 SELECT c.nome FROM Cliente c INNER JOIN Veiculo v ON c.cpf = v.Cliente_cpf INNER JOIN Estaciona e ON v.placa = e.Veiculo_placa WHERE e.cod = 2; 


-- 12. Exiba o CPF do cliente que possui o veculo cujo cdigo do estacionamento 3.
 SELECT c.cpf FROM Cliente c INNER JOIN Veiculo v ON c.cpf = v.Cliente_cpf INNER JOIN Estaciona e ON v.placa = e.Veiculo_placa WHERE e.cod = 3; 

-- 13. Exiba a descrio do modelo do veculo cujo codigo do estacionamento 2.//
 SELECT m.descricao FROM Modelo m INNER JOIN Veiculo v ON m.codMod = v.Modelo_codMod INNER JOIN Estaciona e ON v.placa = e.Veiculo_placa WHERE e.cod = 2; 


-- 14 Exiba a placa, o nome dos donos e a descrio dos os modelos de todos os veculos.
 SELECT v.placa, c.nome, m.descricao FROM Modelo m INNER JOIN Veiculo v ON m.codMod = v.Modelo_codMod INNER JOIN Cliente c ON c.cpf = v.Cliente_cpf;







