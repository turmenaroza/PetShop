CREATE DATABASE Petshop_db;
USE Petshop_db;

CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf CHAR(11) UNIQUE NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE pet (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  nome VARCHAR(80) NOT NULL,
  especie ENUM('cachorro','gato','ave','roedor','reptil','outro') NOT NULL,
  porte   ENUM('mini','pequeno','medio','grande','gigante') NOT NULL,
  nascimento DATE NOT NULL,
  CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE servico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  preco DECIMAL(10,2) NOT NULL CHECK (preco > 0),
  duracao_min INT NOT NULL CHECK (duracao_min > 0)
);

CREATE TABLE agendamento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pet_id INT NOT NULL,
  servico_id INT NOT NULL,
  data_hora DATETIME NOT NULL,
  status ENUM('agendado','concluido','cancelado') NOT NULL,
  observacoes VARCHAR(255),
  CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id),
  CONSTRAINT fk_servico_id FOREIGN KEY (servico_id) REFERENCES servico(id)
);