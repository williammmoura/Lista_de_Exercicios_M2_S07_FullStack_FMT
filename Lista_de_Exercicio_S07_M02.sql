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

--  Criando a tabela "Jogo";
create table jogo(
	id integer primary key,
	nome varchar (50),
	data_lancamento date,
	plataforma varchar (25),
	genero varchar (15);
	FOREIGN KEY (plataforma_id) REFERENCES Plataforma(id),
  	FOREIGN KEY (genero_id) REFERENCES Genero(id)
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
	FOREIGN KEY (jogo_id) REFERENCES Jogo(id)
	url varchar (500)
);