-- Criando a tabela "Ator";
create table Ator(
	id integer primary key,
	nome_ator varchar(100),
	dt_nascimento date,
	altura decimal,
	peso decimal
);

-- Criando a tabela "Filme";
create table Filme(
	id integer primary key,
	nome_filme varchar(150),
	duracao_do_filme integer
);

-- Criando a tabela "Genero_Filme";
create table Genero_Filme(
	id integer primary key,
	filme_id integer
);

-- Inserção de dados nas tabelas:
-- Ator
INSERT INTO Ator (id, nome_ator, dt_nascimento, altura, peso)
values (1, 'Nome do Ator 1', '1990-01-01', 1.75, 70),
       (2, 'Nome do Ator 2', '1995-02-02', 1.80, 80),
       (3, 'Nome Ator 3', '1997-05-02', 1.70, 65);

-- Filme
insert into Filme (id, nome_filme, duracao_do_filme)
values 
	(1, 'NomeFilme 01', 30),
	(2, 'NomeFilme 02', 120),
	(3, 'NomeFilme 03', 60);

-- Genero
insert into Genero_Filme (id, filme_id)
values (1, 1),
       (2, 2),
       (3, 3);


-- Selecionar as colunas "nome_filme" e "duracao_do_filme".
SELECT nome_filme, duracao_do_filme
FROM Filme
WHERE nome_filme LIKE '%Ação'
ORDER BY duracao_do_filme;