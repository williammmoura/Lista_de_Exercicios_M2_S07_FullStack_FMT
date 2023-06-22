-- Criando a tabela "País";
create table Pais (
  	id_pais INT PRIMARY KEY,
  	nome_pais VARCHAR(100),
  	continente VARCHAR(100)
);

-- Criando a tabela "Estado";
create table Estado (
  	id_estado INT PRIMARY KEY,
  	id_pais INT,
  	nome_estado VARCHAR(100),
  	FOREIGN KEY (id_pais) REFERENCES Pais(id_pais)
);

-- Criando a tabela "Cidade";
create table Cidade (
  	id_cidade INT PRIMARY KEY,
  	nome_cidade VARCHAR(100),
  	id_estado INT,
  	capital VARCHAR(5),
  	qtd_populacao INT,
  	FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

-- Inserindo dados nas tabelas:
INSERT INTO Pais (id_pais, nome_pais, continente) VALUES
(1, 'Brasil', 'América do Sul'),
(2, 'Estados Unidos', 'América do Norte'),
(3, 'Canadá', 'América do Norte'),
(4, 'México', 'América do Norte'),
(5, 'Argentina', 'América do Sul'),
(6, 'Colômbia', 'América do Sul'),
(7, 'Peru', 'América do Sul'),
(8, 'Costa Rica', 'América Central'),
(9, 'Panamá', 'América Central'),
(10, 'Honduras', 'América Central');

INSERT INTO Estado (id_estado, id_pais, nome_estado) VALUES
(1, 1, 'São Paulo'),
(2, 1, 'Rio de Janeiro'),
(3, 2, 'Califórnia'),
(4, 2, 'Nova York'),
(5, 3, 'Ontário'),
(6, 4, 'Cidade do México'),
(7, 5, 'Buenos Aires'),
(8, 6, 'Bogotá'),
(9, 7, 'Lima'),
(10, 8, 'San José');

INSERT INTO Cidade (id_cidade, nome_cidade, id_estado, capital, qtd_populacao) VALUES
(1, 'São Paulo', 1, 'True', 12345678),
(2, 'Rio de Janeiro', 2, 'True', 9876543),
(3, 'Los Angeles', 3, 'False', 4567890),
(4, 'Nova York', 4, 'True', 8765432),
(5, 'Toronto', 5, 'True', 6543210),
(6, 'Cidade do México', 6, 'True', 9876543),
(7, 'Buenos Aires', 7, 'True', 8765432),
(8, 'Bogotá', 8, 'True', 5432109),
(9, 'Lima', 9, 'True', 4321098),
(10, 'San José', 10, 'True', 3210987);

-- Selecionando nome do país, nome do estado e nome da cidade 
--de todas as capitais que possuem uma população acima de 500 
--mil habitantes, cujos estados têm nomes que começam com
--"São", "Santo", "San" ou "Saint" em países da América (Améri-
--ca do Norte, América Central e América do Sul).
SELECT p.nome_pais, e.nome_estado, c.nome_cidade
FROM Cidade c
JOIN Estado e ON c.id_estado = e.id_estado
JOIN Pais p ON e.id_pais = p.id_pais
WHERE c.capital = 'True' 
  	AND c.qtd_populacao > 500000
  	AND (e.nome_estado LIKE 'São%' OR e.nome_estado LIKE 'Santo%' OR e.nome_estado LIKE 'San%' OR e.nome_estado LIKE 'Saint%')
  	AND p.continente IN ('América do Norte', 'América Central', 'América do Sul')
ORDER BY p.nome_pais, e.nome_estado, c.nome_cidade;

SELECT p.nome_pais, SUM(c.qtd_populacao) AS populacao_total
FROM Pais p
JOIN Estado e ON p.id_pais = e.id_pais
JOIN Cidade c ON e.id_estado = c.id_estado
GROUP BY p.nome_pais
HAVING SUM(c.qtd_populacao) > (
    SELECT SUM(c2.qtd_populacao)
    FROM Cidade c2
    JOIN Estado e2 ON c2.id_estado = e2.id_estado
    JOIN Pais p2 ON e2.id_pais = p2.id_pais
    WHERE p2.nome_pais = 'Espanha'
);

