CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
	);

CREATE TABLE barbeiro (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
	);

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL UNIQUE,
    barbeiro_id INT NOT NULL REFERENCES barbeiro(id) ON DELETE CASCADE
);

CREATE TABLE agendamento (
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    barbeiro_id INT NOT NULL REFERENCES barbeiro(id) ON DELETE CASCADE,
    cliente_id INT NOT NULL REFERENCES cliente(id) ON DELETE CASCADE
	);

INSERT INTO usuario (nome, cpf, senha) VALUES
('Beatriz Lima', '944.555.666-77', 'senha123'),
('Rafael Costa', '955.666.777-88', 'senha456'),
('Juliana Alves', '966.777.888-99', 'senha789');

INSERT INTO barbeiro (nome, cpf, senha) VALUES
('karateka', '444.555.666-77', 'senha123'),
('IAGOOO', '555.666.777-88', 'senha456'),
('Mariazinha', '666.777.888-99', 'senha789');

INSERT INTO cliente (nome, cpf, barbeiro_id) VALUES
('Ana Maria', '111.111.111-11', 1),
('Laboratório de Inovação', '677.667.677-67', 2),
('Sala de Reuniões 01', '131.131.131-98', 3);

INSERT INTO agendamento (data_hora, barbeiro_id, cliente_id) VALUES
('2026-12-10 14:00:00', 1, 1),
('2026-12-08 09:30:00', 2, 2),
('2026-12-09 16:00:00', 3, 3);