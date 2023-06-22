-- Criando a tabela "Usuario";
create table Usuario (
	id_usuario integer primary key,
  	nome_usuario VARCHAR(255)
);

-- Criando a tabela "Produto";
create table Produto (
  	id_produto integer primary key,
  	nome_produto VARCHAR(255)
);

-- Criando a tabela "Venda";
create table Venda (
  	id_usuario integer,
  	id_produto integer,
  	valor_produto DECIMAL(10, 2),
  	quantidade_produto integer,
  	dt_compra DATE,
  	FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  	FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Incerção de dados nas tabelas:
INSERT INTO Usuario (id_usuario, nome_usuario)
VALUES 
  	(1, 'William'),
  	(2, 'Caroline'),
  	(3, 'Maggie');

INSERT INTO Produto (id_produto, nome_produto)
VALUES
  	(1, 'Camiseta'),
  	(2, 'Calça'),
  	(3, 'Sapato');

INSERT INTO Venda (id_usuario, id_produto, valor_produto, quantidade_produto, dt_compra)
VALUES
  	(1, 1, 29.99, 2, '2022-11-01'),
  	(2, 2, 59.99, 1, '2023-06-15'),
  	(3, 3, 79.99, 3, '2023-11-10');
  	
-- Obter a lista dos usuários que mais gastaram no mês da 
--Black Friday, independentemente do ano.
SELECT Usuario.nome_usuario, SUM(Venda.valor_produto) AS valor_total_gasto
FROM Usuario
JOIN Venda ON Usuario.id_usuario = Venda.id_usuario
-- A cláusula WHERE filtra os registros para incluir apenas 
--as vendas realizadas no mês de novembro.
WHERE EXTRACT(MONTH FROM Venda.dt_compra) = 11 -- Mês da Black Friday (Novembro)
GROUP BY Usuario.nome_usuario
ORDER BY valor_total_gasto DESC;