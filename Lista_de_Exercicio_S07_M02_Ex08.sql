create table Usuario (
  id_usuario integer PRIMARY KEY,
  nome_usuario varchar(100)
);

create table Viagem (
  id_viagem integer PRIMARY KEY,
  destino varchar(100),
  data_viagem date,
  valor_passagem decimal(10,2)
);

create table Reserva (
  id_usuario integer,
  id_viagem integer,
  data_reserva date,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_viagem) REFERENCES Viagem(id_viagem)
);

INSERT INTO Usuario (id_usuario, nome_usuario)
VALUES
  (1, 'João'),
  (2, 'Maria'),
  (3, 'Pedro'),
  (4, 'Ana');
 
INSERT INTO Viagem (id_viagem, destino, data_viagem, valor_passagem)
VALUES
  (1, 'Nova York', '2023-07-10', 1500.00),
  (2, 'Paris', '2023-07-15', 2000.00),
  (3, 'Tóquio', '2023-07-20', 2500.00),
  (4, 'Londres', '2023-07-25', 1800.00);

INSERT INTO Reserva (id_usuario, id_viagem, data_reserva)
VALUES
  (1, 1, '2023-07-05'),
  (1, 2, '2023-07-08'),
  (2, 1, '2023-07-10'),
  (3, 3, '2023-07-15'),
  (4, 2, '2023-07-18'),
  (4, 4, '2023-07-22');

SELECT u.nome_usuario, SUM(v.valor_passagem) AS total_gasto
FROM Usuario u
JOIN Reserva r ON u.id_usuario = r.id_usuario
JOIN Viagem v ON r.id_viagem = v.id_viagem
WHERE EXTRACT(MONTH FROM r.data_reserva) = 7
GROUP BY u.nome_usuario
ORDER BY total_gasto DESC;