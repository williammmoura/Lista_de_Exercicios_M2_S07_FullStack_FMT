-- Criação da tabela Usuário
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    dt_nascimento DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(20) NOT NULL
);

-- Criação da tabela Genero
CREATE TABLE Genero (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Criação da tabela Plataforma
CREATE TABLE Plataforma (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Criação da tabela Jogo
CREATE TABLE Jogo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_lancamento DATE NOT NULL,
    genero_id INT NOT NULL,
    FOREIGN KEY (genero_id) REFERENCES Genero(id)
);

-- Criação da tabela Jogo_Plataforma
CREATE TABLE Jogo_Plataforma (
    jogo_id INT,
    plataforma_id INT,
    PRIMARY KEY (jogo_id, plataforma_id),
    FOREIGN KEY (jogo_id) REFERENCES Jogo(id),
    FOREIGN KEY (plataforma_id) REFERENCES Plataforma(id)
);

-- Criação da tabela Foto_Jogo
CREATE TABLE Foto_Jogo (
    id SERIAL PRIMARY KEY,
    jogo_id INT NOT NULL,
    url_foto VARCHAR(255) NOT NULL,
    FOREIGN KEY (jogo_id) REFERENCES Jogo(id)
);

-- Criação da tabela Video_Jogo
CREATE TABLE Video_Jogo (
    id SERIAL PRIMARY KEY,
    jogo_id INT NOT NULL,
    url_video VARCHAR(255) NOT NULL,
    FOREIGN KEY (jogo_id) REFERENCES Jogo(id)
);

-- Inserir o jogo "The Sims 4 Base" e seus gêneros na tabela Genero
INSERT INTO Genero (nome) VALUES ('Simulação da Vida Real');

-- Inserir as plataformas na tabela Plataforma (caso ainda não existam)
INSERT INTO Plataforma (nome) VALUES
    ('Playstation 4'),
    ('Playstation 5'),
    ('Desktop');

-- Inserir o jogo "The Sims 4 Base" na tabela Jogo
INSERT INTO Jogo (nome, data_lancamento, genero_id)
VALUES ('The Sims 4 Base', '2023-07-01', 1);

-- Relacionar o jogo "The Sims 4 Base" às plataformas na tabela Jogo_Plataforma
INSERT INTO Jogo_Plataforma (jogo_id, plataforma_id)
SELECT j.id, p.id
FROM Jogo j
CROSS JOIN Plataforma p
WHERE j.nome = 'The Sims 4 Base'
AND p.nome IN ('Playstation 4', 'Playstation 5', 'Desktop');

-- Inserir o usuário "Derpson da Silva" na tabela Usuario
INSERT INTO Usuario (nome, login, senha, email, dt_nascimento, cpf, rg)
VALUES ('Derpson da Silva', 'derpinho', 'derpinho91', 'derpinho91@hotmail.com', '1991-01-01', '123.123.123-12', '4.123.123');