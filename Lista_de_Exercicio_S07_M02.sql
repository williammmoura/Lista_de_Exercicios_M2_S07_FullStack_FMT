--  Criando a tabela "Usuario";
create table Usuario(
	id integer primary key,
	nome varchar(50),
	login varchar(100),
	senha varchar (100),
	email varchar (100),
	dt_nascimento date,
	cpf varchar(11),
	rg integer
);

--  Criando a tabela "Genero";
create table Genero(
	id integer primary key,
	nome varchar (50)
);

--  Criando a tabela "Plataforma";
create table Plataforma(
	id integer primary key,
	nome varchar (50)
);

--  Criando a tabela "Jogo";
create table jogo(
	id integer primary key,
	nome varchar (50),
	data_lancamento date,
	plataforma_id integer,
	genero_id integer,
	FOREIGN KEY (plataforma_id) REFERENCES Plataforma(id),
  	FOREIGN KEY (genero_id) REFERENCES Genero(id)
);

-- Criação da tabela "Usuario_Jogo";
create table Usuario_Jogo(
  usuario_id INT,
  jogo_id INT,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
  FOREIGN KEY (jogo_id) REFERENCES Jogo(id),
  PRIMARY KEY (usuario_id, jogo_id)
);

--  Criando a tabela "Foto";
create table Foto(
	id integer primary key,
	jogo_id integer,
	FOREIGN KEY (jogo_id) REFERENCES Jogo(id),
	url varchar (500)
);

--  Criando a tabela "Video";
create table Video(
	id integer primary key,
	jogo_id integer,
	FOREIGN KEY (jogo_id) REFERENCES Jogo(id),
	url varchar (500)
);

-- Inserir a plataforma "Playstation 4" na tabela Plataforma
INSERT INTO Plataforma (id, nome)
VALUES (1, 'Playstation 4');

-- Inserir a plataforma "Playstation 5" na tabela Plataforma
INSERT INTO Plataforma (id, nome)
VALUES (2, 'Playstation 5');

-- Inserir a plataforma "Desktop" na tabela Plataforma
INSERT INTO Plataforma (id, nome)
VALUES (3, 'Desktop');

-- Inserir o gênero "Simulação da Vida Real" na tabela Genero
INSERT INTO Genero (id, nome)
VALUES (1, 'Simulação da Vida Real');

-- Adicionar o jogo "The Sims 4 Base" à tabela Jogo
INSERT INTO Jogo (id, nome, data_lancamento, plataforma_id, genero_id)
VALUES (1, 'The Sims 4 Base', '2023-01-01', 
        (SELECT id FROM Plataforma WHERE nome = 'Playstation 4'),
        (SELECT id FROM Genero WHERE nome = 'Simulação da Vida Real'));

-- Criar o usuário "Derpson da Silva"
INSERT INTO Usuario (id, nome, login, senha, email, dt_nascimento, cpf, rg)
VALUES (1, 'Derpson da Silva', 'derpinho', 'derpinho91', 'derpinho91@hotmail.com', '1991-01-01', '123.123.123-12', '4.123.123');

-- Adicionar o jogo "The Sims 4 Base" à biblioteca do usuário "Derpson da Silva"
INSERT INTO Usuario_Jogo (usuario_id, jogo_id)
VALUES (1, 1);

