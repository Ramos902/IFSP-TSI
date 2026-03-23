drop database if exists loja_web;

-- Criar database
CREATE SCHEMA IF NOT EXISTS loja_web DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;

-- selecionar database para uso
use loja_web;

-- tabelas independentes
-- Criar tabela CLIENTE
CREATE TABLE IF NOT EXISTS loja_web.cliente (
  idCliente INT NOT NULL AUTO_INCREMENT,
  nome_usuario VARCHAR(15) NOT NULL,
  e_mail_cliente VARCHAR(30) NOT NULL,
  nome VARCHAR(30) NOT NULL,
  telefone_residencial VARCHAR(11) NOT NULL,
  telefone_celular VARCHAR(11) NOT NULL,
  cpf varchar(11) NOT NULL,
  telefone_comercial VARCHAR(11) NOT NULL,
  PRIMARY KEY (idCliente)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela Funcionario
CREATE TABLE IF NOT EXISTS loja_web.funcionario (
  idfuncionario INT NOT NULL AUTO_INCREMENT,  
  usuario VARCHAR(15) NOT NULL,
  salario decimal(8,2) NOT NULL,
  senha VARCHAR(10) NOT NULL,
  PRIMARY KEY (idFuncionario)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela Forma de pagamento
CREATE TABLE IF NOT EXISTS loja_web.forma_pagto (
  idfrmpagto INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  taxa_juros DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (idFrmPagto)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela Fotos dos produto
CREATE TABLE IF NOT EXISTS loja_web.imagens (
  idImagem INT NOT NULL AUTO_INCREMENT,
  imagem LONGTEXT,
  PRIMARY KEY (idImagem)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela Fabricante dos produtos
CREATE TABLE IF NOT EXISTS loja_web.fabricante (
  idfabricante INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  PRIMARY KEY (idFabricante)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela Categoria dos produtos
CREATE TABLE IF NOT EXISTS loja_web.categoria (
  idcategoria INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  PRIMARY KEY (idCategoria)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- FIM adequando os comadnos para character set e collate
-- alterações na estrutura do banco de dados
use loja_web;
ALTER TABLE cliente MODIFY nome VARCHAR(100);
alter table cliente add column rg varchar(9) not null after cpf;
alter table cliente add column dtnasc date;

-- insertes nas entidades independentes
use loja_web;
-- entidade cliente
INSERT INTO cliente (nome_usuario,e_mail_cliente,nome,telefone_residencial,telefone_celular,cpf,rg,telefone_comercial, dtnasc) 
VALUES ('gumball', 'gumball@elmore.com', 'Gumball Watterson', '1234567890', '9876543210', '12345678901', '123456789', '1122334455', '2025-03-10');

INSERT INTO cliente (nome_usuario,e_mail_cliente,nome,telefone_residencial,telefone_celular,cpf,rg,telefone_comercial, dtnasc) 
VALUES ('darwin', 'darwin@elmore.com', 'Darwin Watterson', '2233445566', '9988776655', '23456789012', '987654321', '5566778899', '2025-05-11');

INSERT INTO cliente (nome_usuario, e_mail_cliente, nome, telefone_residencial, telefone_celular, cpf, rg,telefone_comercial)
VALUES ('nicole', 'nicolewatterson@email.com', 'Nicole Watterson', '1133224455', '11987654321', '12345678900','233445' ,'1155667788');

INSERT INTO cliente (nome_usuario, e_mail_cliente,nome,telefone_residencial,telefone_celular,cpf,rg,telefone_comercial)
VALUES ('lukeskywalker','luke.skywalker@tatooine.com','Luke Skywalker','1134567890','11987654321','12345678901','1234','1145678901');

INSERT INTO cliente (nome_usuario, e_mail_cliente,nome,telefone_residencial,telefone_celular,cpf,rg,telefone_comercial)
values('leiaorgana','leia.organa@alderaan.gov','Leia Organa','1134567891','11987654322','12345678902','4321','1145678902');

-- entidade funcionario
INSERT INTO funcionario(usuario,salario,senha) 
VALUES ('nicole', 1234.55 ,'12345');

INSERT INTO funcionario(usuario,salario,senha) 
VALUES ('richard', 1034.89 ,'54321');

INSERT INTO funcionario (usuario, salario, senha) 
VALUES ('hansolo', 8500.00, 'millennium');

INSERT INTO funcionario (usuario, salario, senha) 
VALUES ('chewbacca', 7200.50, 'arrrrrrgh');

INSERT INTO funcionario (usuario, salario, senha) 
VALUES ('r2d2', 6500.00, 'beepboop');

-- entidade formade pagamento
insert into forma_pagto(nome,taxa_juros) values('Cartão Débito', 1.05);
insert into forma_pagto(nome,taxa_juros) values('Cartão Crédito', 1.35);
insert into forma_pagto(nome,taxa_juros) values('Dinheiro', 0.00);

-- entidades fabricante
INSERT INTO fabricante(nome) VALUES ('Elmore Industries');
INSERT INTO fabricante(nome) VALUES ('Watterson Tech');
INSERT INTO fabricante (nome)  VALUES ('Incom Corporation');

-- entidade categoria
insert into categoria(nome) values('Laticinios');
insert into categoria(nome) values('Confeitaria');
insert into categoria(nome) values('Cereais');
INSERT INTO categoria (nome) VALUES ('Naves Espaciais');
INSERT INTO categoria (nome)  VALUES ('Sabres de Luz');

-- entidade Imagens
insert into imagens(imagem) values('caminho da imagem 1');
insert into imagens(imagem) values('caminho da imagem 2');
insert into imagens(imagem) values('caminho da imagem 3');

-- tabelas dependentes
-- Criar tabela ENDERECO
CREATE TABLE IF NOT EXISTS loja_web.endereco (
  idendereco INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(3) NOT NULL,
  logradouro VARCHAR(30) NOT NULL,
  bairro VARCHAR(20) NOT NULL,  
  cep varchar(7) NOT NULL,
  cidade VARCHAR(30) NOT NULL,
  uf VARCHAR(2) NOT NULL,
  complemento VARCHAR(50) NOT NULL,  
  idcliente INT NOT NULL,
  PRIMARY KEY (idendereco),
  CONSTRAINT fk_cliente_endereco
    FOREIGN KEY (idcliente)
    REFERENCES loja_web.cliente (idcliente)
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela PEDIDO do Cleinte e endereço de entrega
CREATE TABLE IF NOT EXISTS loja_web.pedido (
  pedido_codigo INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  valor_frete DECIMAL(8,2) NOT NULL,
  data_entrega_prevista DATETIME NOT NULL,
  situacao VARCHAR(20) NOT NULL,
  desconto DECIMAL(8,2) NOT NULL,
  VLR_TOTAL DECIMAL(15,2) NOT NULL,
  data_pagamento DATETIME,
  data_validade DATETIME NOT NULL,
  numero_NF INT NOT NULL,
  data_emissao_NF DATETIME NOT NULL,
  idcliente INT NOT NULL,
  idendereco INT NOT NULL,
  idfuncionario INT NOT NULL,
  idfrmpagto INT NOT NULL,
  PRIMARY KEY (pedido_codigo),
  CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (idcliente)
    REFERENCES loja_web.cliente (idcliente),
  CONSTRAINT fk_pedido_endereco
    FOREIGN KEY (idendereco)
    REFERENCES loja_web.endereco (idendereco),	
  CONSTRAINT fk_pedido_funcionario
    FOREIGN KEY (idfuncionario)
    REFERENCES loja_web.funcionario (idfuncionario),
  CONSTRAINT fk_pedido_frmpagto
    FOREIGN KEY (idfrmpagto)
    REFERENCES loja_web.forma_pagto (idfrmpagto)		
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela Produtos
CREATE TABLE IF NOT EXISTS loja_web.produto (
  idproduto INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  preco DECIMAL(15,2) NOT NULL,
  quantidade INT NOT NULL,
  idimagem INT NOT NULL,
  idfabricante INT NOT NULL,
  idcategoria INT NOT NULL,
  PRIMARY KEY (idproduto),  
  CONSTRAINT fk_produto_imagem
    FOREIGN KEY (idimagem)
    REFERENCES loja_web.imagens (idimagem),   
  CONSTRAINT fk_produto_fabricante
    FOREIGN KEY (idfabricante)
    REFERENCES loja_web.fabricante (idfabricante),  
  CONSTRAINT fk_produto_categoria
    FOREIGN KEY (idcategoria)
    REFERENCES loja_web.categoria (idcategoria)	
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- Criar tabela dos produtos que fazem parte do pedido
CREATE TABLE IF NOT EXISTS loja_web.item_pedido (
  iditempedido INT NOT NULL AUTO_INCREMENT,
  quantidade_venda INT NOT NULL,
  preco_venda DECIMAL(15,2) NOT NULL,
  idproduto INT NOT NULL,
  pedido_codigo INT NOT NULL,
  PRIMARY KEY (iditempedido),  
  CONSTRAINT fk_produto_pedido_produto
    FOREIGN KEY (idproduto)
    REFERENCES loja_web.produto (idproduto),
  CONSTRAINT fk_produto_pedido_pedido
    FOREIGN KEY (pedido_codigo)
    REFERENCES loja_web.pedido (pedido_codigo)	
) ENGINE = InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci;

-- inserts nas entidades com dependencia
-- entidade endereço
INSERT INTO endereco(tipo,logradouro,bairro,cep,cidade,uf,complemento,idcliente) 
VALUES ('RES', 'Rua Elmore', 'Centro', 1234567, 'Elmore', 'EL', 'Casa azul ao lado do parque', 1);

INSERT INTO endereco(tipo,logradouro,bairro,cep,cidade,uf,complemento,idcliente) 
VALUES ('COM', 'Avenida Principal', 'Industrial', 7654321, 'Elmore', 'EL', 'Próximo ao shopping', 2);

-- entidade pedido
INSERT INTO pedido(data_hora,valor_frete,data_entrega_prevista,situacao,desconto,vlr_total,data_pagamento,data_validade, numero_NF, data_emissao_NF,idcliente,idendereco,idfuncionario,idfrmpagto)
VALUES ('2025-02-15 14:30:00', 20.00, '2025-02-20 18:00:00', 'Confirmado', 5.00, 53.63,'2025-02-16 12:00:00', '2025-03-15 23:59:59', 12345, '2025-02-15 15:00:00', 1, 1, 1, 1);

INSERT INTO pedido(data_hora,valor_frete,data_entrega_prevista,situacao,desconto,vlr_total,data_pagamento,data_validade,numero_NF, data_emissao_NF,idcliente,idendereco,idfuncionario,idfrmpagto)
VALUES ('2025-02-16 10:45:00', 15.50, '2025-02-22 16:00:00', 'Em Processamento', 10.00, 87.12, '2025-02-17 09:30:00', '2025-03-20 23:59:59', 12346, '2025-02-16 11:00:00', 2, 2, 2, 2);

-- entidade produto
INSERT INTO produto(nome,descricao,preco,quantidade,idImagem,idfabricante,idcategoria) 
VALUES ('Muffin de Banana', 'Doce caseiro com canela', 5.99, 50, 1, 1, 1);

INSERT INTO produto(nome,descricao,preco,quantidade,idImagem,idfabricante,idcategoria) 
VALUES  ('Suco Natural', 'Suco de laranja fresco', 7.50, 30, 2, 2, 2);

-- entidade item_pedido
INSERT INTO item_pedido(quantidade_venda,preco_venda,idproduto,pedido_codigo) 
VALUES (2, 5.99, 1, 1);

INSERT INTO item_pedido(quantidade_venda,preco_venda,idproduto,pedido_codigo) 
VALUES (1, 7.50, 2, 1);

INSERT INTO item_pedido(quantidade_venda,preco_venda,idproduto,pedido_codigo) 
VALUES (3, 10.99, 1, 2);

INSERT INTO item_pedido(quantidade_venda,preco_venda,idproduto,pedido_codigo) 
VALUES (2, 15.50, 2, 2);

-- carga de dados
USE loja_web;

INSERT INTO cliente (idCliente, nome_usuario, e_mail_cliente, nome, telefone_residencial, telefone_celular, cpf, rg, telefone_comercial, dtnasc) VALUES
(100, 'lukesky', 'luke.skywalker@tatooine.com', 'Luke Skywalker', '1122334455', '11987654321', '12345678901', 'MG1234567', '1133445566', '1977-05-25'),
(101, 'leiaorg', 'leia.organa@alderaan.gov', 'Leia Organa', '1122334456', '11987654322', '12345678902', 'MG1234568', '1133445567', '1977-05-25'),
(102, 'hansolo', 'han.solo@millennium.com', 'Han Solo', '1122334457', '11987654323', '12345678903', 'MG1234569', '1133445568', '1970-11-22'),
(103, 'darthvader', 'anakin@empire.gov', 'Darth Vader', '1122334458', '11987654324', '12345678904', 'MG1234570', '1133445569', '1965-03-15'),
(104, 'yoda', 'yoda@dagobah.sw', 'Mestre Yoda', '1122334459', '11987654325', '12345678905', 'MG1234571', '1133445570', '1650-01-01'),

(105, 'tonystark', 'tony@starkindustries.com', 'Tony Stark', '1122334460', '11987654326', '12345678906', 'MG1234572', '1133445571', '1970-05-29'),
(106, 'capamerica', 'steve.rogers@avengers.gov', 'Steve Rogers', '1122334461', '11987654327', '12345678907', 'MG1234573', '1133445572', '1918-07-04'),
(107, 'thorodinson', 'thor@asgard.com', 'Thor Odinson', '1122334462', '11987654328', '12345678908', 'MG1234574', '1133445573', '0950-01-01'),
(108, 'blackwidow', 'natasha@shield.gov', 'Natasha Romanoff', '1122334463', '11987654329', '12345678909', 'MG1234575', '1133445574', '1984-11-22'),
(109, 'hulkbuster', 'bruce.banner@gamma.com', 'Bruce Banner', '1122334464', '11987654330', '12345678910', 'MG1234576', '1133445575', '1969-12-18'),

(110, 'pica_pau', 'woody@pica-pau.com', 'Pica-Pau', '1122334465', '11987654331', '12345678911', 'MG1234577', '1133445576', '1940-11-25'),
(111, 'zejacare', 'ze.jacare@pantano.com', 'Zé Jacaré', '1122334466', '11987654332', '12345678912', 'MG1234578', '1133445577', '1961-03-01'),
(112, 'meany', 'srta.meany@vizinha.com', 'Srta. Meany', '1122334467', '11987654333', '12345678913', 'MG1234579', '1133445578', '1950-08-15'),

(113, 'mrmagoo', 'quincy@magoo.com', 'Mr. Magoo', '1122334468', '11987654334', '12345678914', 'MG1234580', '1133445579', '1949-01-01'),
(114, 'mcord', 'mcord@assistente.com', 'Mc Cord', '1122334469', '11987654335', '12345678915', 'MG1234581', '1133445580', '1950-05-20'),

(115, 'optimus', 'optimus@autobots.com', 'Optimus Prime', '1122334470', '11987654336', '12345678916', 'MG1234582', '1133445581', '1984-09-17'),
(116, 'bumblebee', 'bumblebee@autobots.com', 'Bumblebee', '1122334471', '11987654337', '12345678917', 'MG1234583', '1133445582', '1984-09-17'),
(117, 'megatron', 'megatron@decepticons.com', 'Megatron', '1122334472', '11987654338', '12345678918', 'MG1234584', '1133445583', '1984-09-17'),

(118, 'dipper', 'dipper@pines.com', 'Dipper Pines', '1122334473', '11987654339', '12345678919', 'MG1234585', '1133445584', '1999-08-31'),
(119, 'mabel', 'mabel@pines.com', 'Mabel Pines', '1122334474', '11987654340', '12345678920', 'MG1234586', '1133445585', '1999-08-31'),
(120, 'stem', 'stan@pines.com', 'Stanley Pines', '1122334475', '11987654341', '12345678921', 'MG1234587', '1133445586', '1950-06-15'),

(121, 'neo', 'neo@matrix.com', 'Thomas Anderson', '1122334476', '11987654342', '12345678922', 'MG1234588', '1133445587', '1971-09-13'),
(122, 'trinity', 'trinity@zion.gov', 'Trinity', '1122334477', '11987654343', '12345678923', 'MG1234589', '1133445588', '1973-08-21'),
(123, 'morpheus', 'morpheus@nebuchadnezzar.com', 'Morpheus', '1122334478', '11987654344', '12345678924', 'MG1234590', '1133445589', '1960-07-30'),

(124, 'gumball', 'gumball@elmore.com', 'Gumball Watterson', '1122334479', '11987654345', '12345678925', 'MG1234591', '1133445590', '2005-03-10'),
(125, 'darwin', 'darwin@elmore.com', 'Darwin Watterson', '1122334480', '11987654346', '12345678926', 'MG1234592', '1133445591', '2005-05-11'),
(126, 'nicole', 'nicole@elmore.com', 'Nicole Watterson', '1122334481', '11987654347', '12345678927', 'MG1234593', '1133445592', '1975-12-01'),
(127, 'richard', 'richard@elmore.com', 'Richard Watterson', '1122334482', '11987654348', '12345678928', 'MG1234594', '1133445593', '1970-07-20'),
(128, 'bobesponja', 'spongebob@fendodomar.com', 'Bob Esponja', '1122334483', '11987654349', '12345678929', 'MG1234595', '1133445594', '1999-05-01'),
(129, 'patrick', 'patrick@fendodomar.com', 'Patrick Estrela', '1122334484', '11987654350', '12345678930', 'MG1234596', '1133445595', '1999-05-01');

-- Endereços (alguns clientes com múltiplos endereços)
INSERT INTO endereco (idendereco, tipo, logradouro, bairro, cep, cidade, uf, complemento, idcliente) VALUES
(100, 'RES', 'Rua Tatooine 123', 'Deserto', '1234567', 'Mos Eisley', 'TS', 'Casa de Tia Beru', 100),
(101, 'COM', 'Avenida dos Jedi 456', 'Templo', '1234568', 'Mos Eisley', 'TS', 'Hangar Millennium', 100),
(102, 'RES', 'Palácio Real 789', 'Centro', '2345678', 'Alderaan', 'AL', 'Ala Real', 101),
(103, 'COM', 'Base da Resistência 321', 'Militar', '2345679', 'D Qar', 'DQ', 'Sala de Comando', 101),
(104, 'RES', 'Malibu Point 10880', 'Beira Mar', '3456789', 'Malibu', 'CA', 'Mansão Stark', 105),
(105, 'COM', 'Stark Tower', 'Midtown', '3456790', 'Nova York', 'NY', 'Andar Penthouse', 105),
(106, 'COM', 'Complexo dos Vingadores', 'Secreto', '3456791', 'Nova York', 'NY', 'Base Subterrânea', 105),
(107, 'RES', 'Rua Asgard 999', 'Reino Dourado', '4567890', 'Asgard', 'AS', 'Palácio de Odin', 107),
(108, 'RES', 'Floresta de Pica-Pau 222', 'Arvoredo', '5678901', 'Pica-Paulândia', 'PP', 'Casa na Árvore', 110),
(109, 'RES', 'Avenida dos Transformers 333', 'Cybertron', '6789012', 'Autobot City', 'AC', 'Base Autobot', 115),
(110, 'RES', 'Mystery Shack 777', 'Floresta', '7890123', 'Gravity Falls', 'OR', 'Cabana do Mistério', 120),
(111, 'RES', 'Nebuchadnezzar Dock', 'Zion', '8901234', 'Zion', 'ZI', 'Nave Principal', 121),
(112, 'RES', 'Rua da Fenda do Biquini 125', 'Fundo do Mar', '9012345', 'Fenda do Biquini', 'PB', 'Abacaxi', 128),
(113, 'RES', 'Rua dos Vingadores 444', 'Stark Tower', '0123456', 'Nova York', 'NY', 'Apartamento 15A', 106),
(114, 'RES', 'Laboratório Gamma 555', 'Universidade', '1123456', 'Culver', 'VA', 'Lab Secreto', 109),
(115, 'RES', 'Pantano do Zé 666', 'Alagado', '2123456', 'Pântano', 'PT', 'Casa Submersa', 111),
(116, 'RES', 'Matrix Central 888', 'Machine City', '3123456', 'Matrix', 'MT', 'Ap 303', 121),
(117, 'RES', 'Rua Elmore 111', 'Subúrbio', '4123456', 'Elmore', 'EL', 'Casa Colorida', 124),
(118, 'RES', 'Rua Elmore 112', 'Subúrbio', '5123456', 'Elmore', 'EL', 'Casa ao Lado', 125),
(119, 'RES', 'Rua Elmore 113', 'Subúrbio', '6123456', 'Elmore', 'EL', 'Casa Principal', 126);

INSERT INTO funcionario (idfuncionario, usuario, salario, senha) VALUES
(100, 'jarvis', 15000.00, 'stark123'),
(101, 'friday', 14500.00, 'ai456'),
(102, 'chewbacca', 12000.00, 'arrrrgh'),
(103, 'c3po', 11000.00, 'protocol'),
(104, 'nickfury', 18000.00, 'shield789'),
(105, 'pepper', 16000.00, 'potts123'),
(106, 'wong', 13000.00, 'kamartaj'),
(107, 'mariahill', 14000.00, 'shield456'),
(108, 'happy', 12500.00, 'hogan123'),
(109, 'vision', 17000.00, 'mindstone');

INSERT INTO forma_pagto (idfrmpagto, nome, taxa_juros) VALUES
(100, 'Cartão Débito', 1.02),
(101, 'Cartão Crédito', 1.25),
(102, 'PIX', 1.00),
(103, 'Boleto', 1.08),
(104, 'Crediário Loja', 1.35);

INSERT INTO fabricante (idfabricante, nome) VALUES
(100, 'Stark Industries'),
(101, 'Wayne Enterprises'),
(102, 'Oscorp'),
(103, 'Cybertron Labs'),
(104, 'Jedi Artifacts'),
(105, 'S.H.I.E.L.D. Tech'),
(106, 'Pym Technologies'),
(107, 'Wakanda Design Group'),
(108, 'Baxter Building'),
(109, 'LexCorp');

INSERT INTO categoria (idcategoria, nome) VALUES
(100, 'Tecnologia Avançada'),
(101, 'Armas e Defesa'),
(102, 'Transporte'),
(103, 'Colecionáveis'),
(104, 'Vestuário');

INSERT INTO imagens (idImagem, imagem) VALUES
(100, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwNzhmZiIvPjx0ZXh0IHg9IjEwMCIgeT0iMTAwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTgiIGZpbGw9IndoaXRlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5TQUJSRSBMVVo8L3RleHQ+PC9zdmc+'),
(101, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjx0ZXh0IHg9IjEwMCIgeT0iMTAwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTgiIGZpbGw9IndoaXRlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5JUk9OTUFOPC90ZXh0Pjwvc3ZnPg=='),
(102, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2RkZGQwMCIvPjx0ZXh0IHg9IjEwMCIgeT0iMTAwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTgiIGZpbGw9ImJsYWNrIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5NQVNUSUNBPzwvdGV4dD48L3N2Zz4='),
(103, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmZmZiIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNjAiIGZpbGw9IiNmZjAwMDAiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+RVNDVURPPC90ZXh0Pjwvc3ZnPg=='),
(104, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzMzMzMzMyIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDE1MCwxMDAgMTAwLDE1MCA1MCwxMDAiIGZpbGw9IiM2NjY2NjYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+TkFWRTwvdGV4dD48L3N2Zz4='),
(105, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzc1NzU3NSIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjOTk5OTk5Ii8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkJMQVNURVI8L3RleHQ+PC9zdmc+'),
(106, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxyZWN0IHg9IjUwIiB5PSI1MCIgd2lkdGg9IjEwMCIgaGVpZ2h0PSI2MCIgZmlsbD0iIzAwMDBmZiIvPjx0ZXh0IHg9IjEwMCIgeT0iMTgwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTQiIGZpbGw9IndoaXRlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5UUlVDSzwvdGV4dD48L3N2Zz4='),
(107, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmYwMCIvPjxyZWN0IHg9IjUwIiB5PSI1MCIgd2lkdGg9IjEwMCIgaGVpZ2h0PSI2MCIgZmlsbD0iIzAwMDAwMCIvPjx0ZXh0IHg9IjEwMCIgeT0iMTgwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTQiIGZpbGw9ImJsYWNrIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5DQVI8L3RleHQ+PC9zdmc+'),
(108, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmZmZiIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Q0FQQTwvdGV4dD48L3N2Zz4='),
(109, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwODAwMCIvPjxyZWN0IHg9Ijg1IiB5PSI4NSIgd2lkdGg9IjMwIiBoZWlnaHQ9IjMwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlZBUklOSEE8L3RleHQ+PC9zdmc+'),
(110, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDAwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QkFUTUFOPC90ZXh0Pjwvc3ZnPg=='),
(111, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEzMCwxMDAgMTAwLDE1MCA3MCwxMDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QkFUQVJBTkc8L3RleHQ+PC9zdmc+'),
(112, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmYwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+TEFOVEVSTkE8L3RleHQ+PC9zdmc+'),
(113, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iMzAiIGZpbGw9IiNmZmZmMDAiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QU5FTDwvdGV4dD48L3N2Zz4='),
(114, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzc1NzU3NSIvPjxyZWN0IHg9IjYwIiB5PSI2MCIgd2lkdGg9IjgwIiBoZWlnaHQ9IjgwIiBmaWxsPSIjOTk5OTk5Ii8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPldBUiBNQUNISU5FPC90ZXh0Pjwvc3ZnPg=='),
(115, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEyMCw4MCAxMDAsMTEwIDgwLDgwIiBmaWxsPSJ3aGl0ZSIvPjx0ZXh0IHg9IjEwMCIgeT0iMTgwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTQiIGZpbGw9IndoaXRlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5URUlBPC90ZXh0Pjwvc3ZnPg=='),
(116, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPk1BQ0hBRE88L3RleHQ+PC9zdmc+'),
(117, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzMzMzMzMyIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEyMCw5MCAxMDAsMTMwIDgwLDkwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkdBUlJBUzwvdGV4dD48L3N2Zz4='),
(118, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmYwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZjAwMDAiLz48Y2lyY2xlIGN4PSIxMDAiIGN5PSIxMDAiIHI9IjIwIiBmaWxsPSIjZmZmZjAwIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iYmxhY2siIHRleHQtYW5jaG9yPSJtaWRkbGUiPk1BTk9QTEE8L3RleHQ+PC9zdmc+'),
(119, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmYwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEzMCwxMDAgMTAwLDE1MCA3MCwxMDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+U0FCUkUgVkVSREU8L3RleHQ+PC9zdmc+'),
(120, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEzMCwxMDAgMTAwLDE1MCA3MCwxMDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+U0FCUkUgVkVSTUVMSE88L3RleHQ+PC9zdmc+'),
(121, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDBmZiIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDE0MCwxMDAgMTAwLDE1MCA2MCwxMDAiIGZpbGw9IndoaXRlIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkNBQ0EgWDwvdGV4dD48L3N2Zz4='),
(122, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDE0MCwxMDAgMTAwLDE1MCA2MCwxMDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Q0FDQSBUSUU8L3RleHQ+PC9zdmc+'),
(123, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzMzMzMzMyIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+Q0FQQUNFVEU8L3RleHQ+PC9zdmc+'),
(124, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmYwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iMzAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QkItODwvdGV4dD48L3N2Zz4='),
(125, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmZmZiIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iYmxhY2siIHRleHQtYW5jaG9yPSJtaWRkbGUiPlIyLUQyPC90ZXh0Pjwvc3ZnPg=='),
(126, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEyMCw5MCAxMDAsMTMwIDgwLDkwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlBBTlRIRVI8L3RleHQ+PC9zdmc+'),
(127, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDkwLDkwIDEwMCwxMzAgMTEwLDkwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkdBUlJBUzwvdGV4dD48L3N2Zz4='),
(128, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+UFVMTEVJUkFTPC90ZXh0Pjwvc3ZnPg=='),
(129, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDBmZiIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkFSQ088L3RleHQ+PC9zdmc+'),
(130, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEyMCw4MCAxMDAsMTEwIDgwLDgwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlRSQUpFIEFSQcOTRTwvdGV4dD48L3N2Zz4='),
(131, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwODAwMCIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkhPTUVNIEZPUk1JR0E8L3RleHQ+PC9zdmc+'),
(132, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwODAwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+VkVTVEE8L3RleHQ+PC9zdmc+'),
(133, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEyMCw5MCAxMDAsMTMwIDgwLDkwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkNBUEE8L3RleHQ+PC9zdmc+'),
(134, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmYwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iMzAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+T0xITzwvdGV4dD48L3N2Zz4='),
(135, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzc1NzU3NSIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlJPQk9DT1A8L3RleHQ+PC9zdmc+'),
(136, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzMzMzMzMyIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlRFUk1JTkFUT1I8L3RleHQ+PC9zdmc+'),
(137, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmYwMCIvPjxyZWN0IHg9IjUwIiB5PSI1MCIgd2lkdGg9IjEwMCIgaGVpZ2h0PSI2MCIgZmlsbD0iIzAwMDBmZiIvPjx0ZXh0IHg9IjEwMCIgeT0iMTgwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTQiIGZpbGw9ImJsYWNrIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5ERUxPUkVBTjwvdGV4dD48L3N2Zz4='),
(138, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmZmZiIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iYmxhY2siIHRleHQtYW5jaG9yPSJtaWRkbGUiPk1PVE88L3RleHQ+PC9zdmc+'),
(139, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDBmZiIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGVpxdC1hbmNob3I9Im1pZGRsZSI+UE9SVEFMPC90ZXh0Pjwvc3ZnPg=='),
(140, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlBMVVRPTklVTTwvdGV4dD48L3N2Zz4='),
(141, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmZmZiIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iYmxhY2siIHRleHQtYW5jaG9yPSJtaWRkbGUiPkhPVkVSPC90ZXh0Pjwvc3ZnPg=='),
(142, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmMDAwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iMzAiIGZpbGw9IiNmZmZmMDAiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJ3aGl0ZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QU5FTDwvdGV4dD48L3N2Zz4='),
(143, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwODAwMCIvPjxyZWN0IHg9Ijg1IiB5PSI4NSIgd2lkdGg9IjMwIiBoZWlnaHQ9IjMwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPklOVklTSUJJTElEQURFPC90ZXh0Pjwvc3ZnPg=='),
(144, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDAwMCIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPk1FR1pPUkQ8L3RleHQ+PC9zdmc+'),
(145, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDBmZiIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkVTUEFEQTwvdGV4dD48L3N2Zz4='),
(146, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwODAwMCIvPjxyZWN0IHg9Ijc1IiB5PSI3NSIgd2lkdGg9IjUwIiBoZWlnaHQ9IjUwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPk1BU1RFUiBTV09SRDwvdGV4dD48L3N2Zz4='),
(147, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwMDBmZiIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEyMCw5MCAxMDAsMTMwIDgwLDkwIiBmaWxsPSIjZmZmZmZmIi8+PHRleHQgeD0iMTAwIiB5PSIxODAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0id2hpdGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlRSSURFTlRFPC90ZXh0Pjwvc3ZnPg=='),
(148, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmYwMCIvPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iNDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+TEFDTzwvdGV4dD48L3N2Zz4='),
(149, 'PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzAwZmYwMCIvPjxwb2x5Z29uIHBvaW50cz0iMTAwLDUwIDEzMCwxMDAgMTAwLDE1MCA3MCwxMDAiIGZpbGw9IiNmZmZmZmYiLz48dGV4dCB4PSIxMDAiIHk9IjE4MCIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjE0IiBmaWxsPSJibGFjayIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QU5FTCBQT0RFUjwvdGV4dD48L3N2Zz4=');

INSERT INTO produto (idproduto, nome, descricao, preco, quantidade, idimagem, idfabricante, idcategoria) VALUES
(100, 'Sabre de Luz Azul', 'Sabre de luz do Luke Skywalker', 2500.00, 5, 100, 104, 101),
(101, 'Millennium Falcon', 'Nave mais rápida da galáxia', 500000.00, 1, 104, 104, 102),
(102, 'Blaster DL-44', 'Blaster do Han Solo', 1200.00, 10, 105, 104, 101),
(103, 'Sabre de Luz Verde', 'Sabre de luz do Mestre Yoda', 2800.00, 3, 119, 104, 101),
(104, 'Sabre de Luz Vermelho', 'Sabre Sith', 3000.00, 8, 120, 104, 101),
(105, 'Caça X-Wing', 'Caça estelar da Aliança Rebelde', 150000.00, 4, 121, 104, 102),
(106, 'TIE Fighter', 'Caça imperial', 120000.00, 6, 122, 104, 102),
(107, 'Capacete Darth Vader', 'Capacete com respirador', 4500.00, 2, 123, 104, 104),
(108, 'Droide BB-8', 'Droide astromecânico', 8000.00, 7, 124, 104, 100),
(109, 'Droide R2-D2', 'Droide astromecânico clássico', 9500.00, 5, 125, 104, 100),
(110, 'Armadura Iron Man Mark L', 'Nano-tecnologia Stark', 2500000.00, 1, 101, 100, 100),
(111, 'Escudo do Capitão América', 'Vibranium puro', 150000.00, 2, 103, 105, 101),
(112, 'Mjolnir', 'Martelo do Thor', 999999.00, 1, 102, 107, 101),
(113, 'Armadura War Machine', 'Armadura militarizada', 1800000.00, 1, 114, 100, 100),
(114, 'Lantera de Atração', 'Lanterna do Esquadrão Suicida', 35000.00, 4, 112, 101, 101),
(115, 'Armadura Black Panther', 'Traje de vibranium', 1200000.00, 1, 126, 107, 104),
(116, 'Garras do Wolverine', 'Garras de adamantium', 850000.00, 1, 127, 105, 101),
(117, 'Pulseiras Black Widow', 'Armas e defesa', 45000.00, 6, 128, 105, 101),
(118, 'Arco do Hawkeye', 'Arco com diversas flechas', 32000.00, 8, 129, 105, 101),
(119, 'Manopla do Infinito', 'Com todas as joias', 5000000.00, 1, 118, 107, 103),
(120, 'Optimus Prime Truck', 'Transformable Autobot', 75000.00, 3, 106, 103, 102),
(121, 'Bumblebee Camaro', 'Autobot amarelo', 65000.00, 5, 107, 103, 102),
(122, 'Megatron Pistol', 'Transformable Decepticon', 80000.00, 2, 117, 103, 101),
(123, 'Starscream Jet', 'Caça F-22 Transformable', 70000.00, 4, 106, 103, 102),
(124, 'Soundwave Cassete', 'Com Ravage e Laserbeak', 55000.00, 6, 107, 103, 100),
(125, 'Armadura do Batman', 'Traje tático completo', 850000.00, 2, 110, 101, 104),
(126, 'Batarangues', 'Conjunto com 10 unidades', 15000.00, 15, 111, 101, 101),
(127, 'Tridente do Aquaman', 'Tridente de Atlântida', 95000.00, 3, 139, 101, 101),
(128, 'Laço da Verdade', 'Laço da Mulher Maravilha', 65000.00, 4, 140, 101, 101),
(129, 'Armadura do Cyborg', 'Tecnologia alienígena', 750000.00, 1, 141, 101, 100),
(130, 'Traje do Homem-Aranha', 'Traje com teia', 45000.00, 10, 115, 100, 104),
(131, 'Armadura do Homem-Formiga', 'Tecnologia Pym', 680000.00, 2, 131, 106, 100),
(132, 'Vespa Quântica', 'Traje da Vespa', 620000.00, 2, 132, 106, 100),
(133, 'Capa do Dr. Estranho', 'Capa da Levitação', 88000.00, 3, 133, 105, 104),
(134, 'Olho de Agamotto', 'Amuleto místico', 120000.00, 1, 134, 105, 103),
(135, 'Robocop Armor', 'Armadura completa', 950000.00, 1, 142, 102, 100),
(136, 'Endoskeleton T-800', 'Esqueleto do Exterminador', 850000.00, 1, 143, 102, 100),
(137, 'DeLorean Time Machine', 'Máquina do tempo', 1500000.00, 1, 144, 102, 102),
(138, 'Lightspeed Bike', 'Moto de Tron', 125000.00, 4, 145, 102, 102),
(139, 'Portal Gun', 'Arma de portais', 350000.00, 2, 146, 102, 100),
(140, 'Case de Plutônio', 'Combustível para DeLorean', 50000.00, 8, 147, 102, 100),
(141, 'Hoverboard', 'Tabua voadora', 45000.00, 12, 148, 102, 102),
(142, 'Anel do Poder', 'Um anel para todos governar', 9999999.00, 1, 113, 101, 103),
(143, 'Capa da Invisibilidade', 'Capa mágica', 35000.00, 2, 108, 101, 104),
(144, 'Varinha das Varinhas', 'Varinha do Harry Potter', 42000.00, 3, 109, 101, 101),
(145, 'Megazord', 'Robô dos Power Rangers', 125000.00, 2, 136, 108, 103),
(146, 'Espada do Cloud', 'Buster Sword original', 28000.00, 5, 137, 108, 101),
(147, 'Master Sword', 'Espada do Link', 32000.00, 4, 138, 108, 101),
(148, 'Power Ring', 'Anel do Lanterna Verde', 55000.00, 6, 149, 101, 103),
(149, 'Machado do Thor', 'Stormbreaker', 850000.00, 1, 116, 107, 101);

INSERT INTO pedido (pedido_codigo, data_hora, valor_frete, data_entrega_prevista, situacao, desconto, VLR_TOTAL, data_pagamento, data_validade, numero_NF, data_emissao_NF, idcliente, idendereco, idfuncionario, idfrmpagto) VALUES
(100, '2024-01-15 10:30:00', 50.00, '2024-01-20 18:00:00', 'Entregue', 100.00, 2450.00, '2024-01-15 11:00:00', '2024-02-15 23:59:59', 10001, '2024-01-15 12:00:00', 100, 100, 100, 101),
(101, '2024-02-01 14:20:00', 150.00, '2024-02-10 16:00:00', 'Processando', 200.00, 1200.00, '2024-02-01 15:00:00', '2024-03-01 23:59:59', 10002, '2024-02-01 16:00:00', 100, 101, 101, 102),
(102, '2024-03-05 09:15:00', 75.00, '2024-03-12 14:00:00', 'Entregue', 150.00, 2850.00, '2024-03-05 10:00:00', '2024-04-05 23:59:59', 10003, '2024-03-05 11:00:00', 100, 100, 102, 101),
(103, '2024-01-18 13:45:00', 120.00, '2024-01-25 16:00:00', 'Entregue', 80.00, 5120.00, '2024-01-18 14:00:00', '2024-02-18 23:59:59', 10004, '2024-01-18 15:00:00', 101, 102, 103, 102),
(104, '2024-02-22 11:30:00', 200.00, '2024-03-01 12:00:00', 'Cancelado', 300.00, 8200.00, NULL, '2024-03-22 23:59:59', 10005, '2024-02-22 12:00:00', 101, 103, 104, 103),
(105, '2024-01-20 16:20:00', 180.00, '2024-01-28 15:00:00', 'Entregue', 250.00, 1130.00, '2024-01-20 17:00:00', '2024-02-20 23:59:59', 10006, '2024-01-20 18:00:00', 102, 100, 105, 101),
(106, '2024-03-08 14:10:00', 220.00, '2024-03-15 17:00:00', 'Processando', 180.00, 2240.00, '2024-03-08 15:00:00', '2024-04-08 23:59:59', 10007, '2024-03-08 16:00:00', 102, 100, 106, 102),
(107, '2024-01-10 09:00:00', 500.00, '2024-01-15 14:00:00', 'Entregue', 5000.00, 2495000.00, '2024-01-10 10:00:00', '2024-02-10 23:59:59', 10008, '2024-01-10 11:00:00', 105, 104, 107, 101),
(108, '2024-02-05 15:45:00', 300.00, '2024-02-12 11:00:00', 'Entregue', 2000.00, 1798000.00, '2024-02-05 16:00:00', '2024-03-05 23:59:59', 10009, '2024-02-05 17:00:00', 105, 105, 108, 101),
(109, '2024-03-12 10:30:00', 400.00, '2024-03-20 13:00:00', 'Processando', 1500.00, 620000.00, '2024-03-12 11:00:00', '2024-04-12 23:59:59', 10010, '2024-03-12 12:00:00', 105, 104, 109, 102),
(110, '2024-03-25 08:15:00', 350.00, '2024-04-02 10:00:00', 'Pendente', 1000.00, 449000.00, NULL, '2024-04-25 23:59:59', 10011, '2024-03-25 09:00:00', 105, 106, 100, 103),
(111, '2024-01-25 11:20:00', 80.00, '2024-02-01 16:00:00', 'Entregue', 200.00, 149800.00, '2024-01-25 12:00:00', '2024-02-25 23:59:59', 10012, '2024-01-25 13:00:00', 106, 113, 101, 101),
(112, '2024-03-15 13:40:00', 90.00, '2024-03-22 15:00:00', 'Entregue', 150.00, 31950.00, '2024-03-15 14:00:00', '2024-04-15 23:59:59', 10013, '2024-03-15 15:00:00', 106, 113, 102, 102),
(113, '2024-02-10 12:15:00', 250.00, '2024-02-18 14:00:00', 'Entregue', 500.00, 999499.00, '2024-02-10 13:00:00', '2024-03-10 23:59:59', 10014, '2024-02-10 14:00:00', 107, 107, 103, 101),
(114, '2024-03-20 10:50:00', 280.00, '2024-03-28 12:00:00', 'Processando', 300.00, 849700.00, '2024-03-20 11:00:00', '2024-04-20 23:59:59', 10015, '2024-03-20 12:00:00', 107, 107, 104, 101),
(115, '2024-01-30 14:25:00', 60.00, '2024-02-06 17:00:00', 'Entregue', 100.00, 44900.00, '2024-01-30 15:00:00', '2024-02-28 23:59:59', 10016, '2024-01-30 16:00:00', 108, 113, 105, 102),
(116, '2024-03-18 16:30:00', 70.00, '2024-03-25 18:00:00', 'Entregue', 120.00, 31880.00, '2024-03-18 17:00:00', '2024-04-18 23:59:59', 10017, '2024-03-18 18:00:00', 108, 113, 106, 101),
(117, '2024-02-14 09:45:00', 45.00, '2024-02-21 13:00:00', 'Entregue', 80.00, 130000.00, '2024-02-14 10:00:00', '2024-03-14 23:59:59', 10018, '2024-02-14 11:00:00', 109, 114, 107, 103),
(118, '2024-03-22 15:20:00', 55.00, '2024-03-29 16:00:00', 'Processando', 90.00, 67965.00, '2024-03-22 16:00:00', '2024-04-22 23:59:59', 10019, '2024-03-22 17:00:00', 109, 114, 108, 102),
(119, '2024-02-28 08:30:00', 25.00, '2024-03-05 11:00:00', 'Entregue', 15.00, 28510.00, '2024-02-28 09:00:00', '2024-03-28 23:59:59', 10020, '2024-02-28 10:00:00', 110, 108, 109, 102),
(120, '2024-03-10 11:15:00', 30.00, '2024-03-17 14:00:00', 'Entregue', 20.00, 15010.00, '2024-03-10 12:00:00', '2024-04-10 23:59:59', 10021, '2024-03-10 13:00:00', 113, 109, 100, 101),
(121, '2024-01-22 13:50:00', 200.00, '2024-01-29 15:00:00', 'Entregue', 300.00, 74700.00, '2024-01-22 14:00:00', '2024-02-22 23:59:59', 10022, '2024-01-22 15:00:00', 115, 109, 101, 101),
(122, '2024-03-14 10:05:00', 180.00, '2024-03-21 12:00:00', 'Processando', 250.00, 64830.00, '2024-03-14 11:00:00', '2024-04-14 23:59:59', 10023, '2024-03-14 12:00:00', 115, 109, 102, 102),
(123, '2024-02-18 14:40:00', 150.00, '2024-02-25 16:00:00', 'Entregue', 200.00, 64850.00, '2024-02-18 15:00:00', '2024-03-18 23:59:59', 10024, '2024-02-18 16:00:00', 116, 109, 103, 101),
(124, '2024-02-05 16:55:00', 35.00, '2024-02-12 18:00:00', 'Entregue', 25.00, 28010.00, '2024-02-05 17:00:00', '2024-03-05 23:59:59', 10025, '2024-02-05 18:00:00', 118, 110, 104, 102),
(125, '2024-03-28 12:25:00', 40.00, '2024-04-04 14:00:00', 'Pendente', 30.00, 32010.00, NULL, '2024-04-28 23:59:59', 10026, '2024-03-28 13:00:00', 118, 110, 105, 103),
(126, '2024-03-01 09:35:00', 28.00, '2024-03-08 11:00:00', 'Entregue', 20.00, 15008.00, '2024-03-01 10:00:00', '2024-04-01 23:59:59', 10027, '2024-03-01 11:00:00', 119, 110, 106, 101),
(127, '2024-02-12 15:10:00', 42.00, '2024-02-19 17:00:00', 'Entregue', 35.00, 42007.00, '2024-02-12 16:00:00', '2024-03-12 23:59:59', 10028, '2024-02-12 17:00:00', 120, 110, 107, 102),
(128, '2024-01-28 10:20:00', 65.00, '2024-02-04 13:00:00', 'Entregue', 50.00, 65015.00, '2024-01-28 11:00:00', '2024-02-28 23:59:59', 10029, '2024-01-28 12:00:00', 121, 111, 108, 101),
(129, '2024-03-24 13:45:00', 70.00, '2024-03-31 15:00:00', 'Processando', 60.00, 70010.00, '2024-03-24 14:00:00', '2024-04-24 23:59:59', 10030, '2024-03-24 15:00:00', 121, 116, 109, 102),
(130, '2024-02-20 11:30:00', 58.00, '2024-02-27 14:00:00', 'Entregue', 45.00, 58013.00, '2024-02-20 12:00:00', '2024-03-20 23:59:59', 10031, '2024-02-20 13:00:00', 122, 111, 100, 101),
(131, '2024-03-05 14:15:00', 72.00, '2024-03-12 16:00:00', 'Entregue', 55.00, 72017.00, '2024-03-05 15:00:00', '2024-04-05 23:59:59', 10032, '2024-03-05 16:00:00', 123, 111, 101, 103),
(132, '2024-02-08 08:45:00', 22.00, '2024-02-15 10:00:00', 'Entregue', 18.00, 22004.00, '2024-02-08 09:00:00', '2024-03-08 23:59:59', 10033, '2024-02-08 10:00:00', 124, 117, 102, 102),
(133, '2024-03-30 16:20:00', 26.00, '2024-04-06 18:00:00', 'Pendente', 22.00, 26004.00, NULL, '2024-04-30 23:59:59', 10034, '2024-03-30 17:00:00', 124, 117, 103, 101),
(134, '2024-03-12 10:10:00', 24.00, '2024-03-19 12:00:00', 'Entregue', 20.00, 24004.00, '2024-03-12 11:00:00', '2024-04-12 23:59:59', 10035, '2024-03-12 12:00:00', 125, 118, 104, 102),
(135, '2024-02-25 13:35:00', 28.00, '2024-03-04 15:00:00', 'Entregue', 25.00, 28003.00, '2024-02-25 14:00:00', '2024-03-25 23:59:59', 10036, '2024-02-25 15:00:00', 126, 119, 105, 101),
(136, '2024-03-08 09:50:00', 20.00, '2024-03-15 11:00:00', 'Entregue', 15.00, 20005.00, '2024-03-08 10:00:00', '2024-04-08 23:59:59', 10037, '2024-03-08 11:00:00', 127, 119, 106, 103),
(137, '2024-01-30 07:30:00', 15.00, '2024-02-06 09:00:00', 'Entregue', 10.00, 15005.00, '2024-01-30 08:00:00', '2024-02-28 23:59:59', 10038, '2024-01-30 09:00:00', 128, 112, 107, 102),
(138, '2024-03-20 08:40:00', 18.00, '2024-03-27 10:00:00', 'Processando', 12.00, 18006.00, '2024-03-20 09:00:00', '2024-04-20 23:59:59', 10039, '2024-03-20 10:00:00', 128, 112, 108, 101),
(139, '2024-03-15 11:55:00', 16.00, '2024-03-22 13:00:00', 'Entregue', 8.00, 16008.00, '2024-03-15 12:00:00', '2024-04-15 23:59:59', 10040, '2024-03-15 13:00:00', 129, 112, 109, 102),
(140, '2024-02-14 12:00:00', 85.00, '2024-02-21 14:00:00', 'Entregue', 70.00, 85015.00, '2024-02-14 13:00:00', '2024-03-14 23:59:59', 10041, '2024-02-14 14:00:00', 106, 113, 100, 101),
(141, '2024-03-25 15:30:00', 95.00, '2024-04-01 17:00:00', 'Processando', 80.00, 95015.00, '2024-03-25 16:00:00', '2024-04-25 23:59:59', 10042, '2024-03-25 17:00:00', 107, 107, 101, 102),
(142, '2024-02-17 09:25:00', 110.00, '2024-02-24 11:00:00', 'Entregue', 90.00, 11020.00, '2024-02-17 10:00:00', '2024-03-17 23:59:59', 10043, '2024-02-17 11:00:00', 108, 113, 102, 103),
(143, '2024-03-29 14:50:00', 125.00, '2024-04-05 16:00:00', 'Pendente', 100.00, 12525.00, NULL, '2024-04-29 23:59:59', 10044, '2024-03-29 15:00:00', 109, 114, 103, 101),
(144, '2024-02-22 10:40:00', 140.00, '2024-03-01 12:00:00', 'Entregue', 120.00, 14020.00, '2024-02-22 11:00:00', '2024-03-22 23:59:59', 10045, '2024-02-22 12:00:00', 115, 109, 104, 102),
(145, '2024-03-18 13:15:00', 155.00, '2024-03-25 15:00:00', 'Processando', 130.00, 15525.00, '2024-03-18 14:00:00', '2024-04-18 23:59:59', 10046, '2024-03-18 15:00:00', 116, 109, 105, 101),
(146, '2024-02-26 16:05:00', 170.00, '2024-03-05 18:00:00', 'Entregue', 150.00, 17020.00, '2024-02-26 17:00:00', '2024-03-26 23:59:59', 10047, '2024-02-26 18:00:00', 118, 110, 106, 103),
(147, '2024-03-22 08:20:00', 185.00, '2024-03-29 10:00:00', 'Entregue', 160.00, 18525.00, '2024-03-22 09:00:00', '2024-04-22 23:59:59', 10048, '2024-03-22 10:00:00', 119, 110, 107, 101),
(148, '2024-03-10 11:20:00', 25.00, '2024-03-15 17:00:00', 'Entregue', 10.00, 240.00, '2024-03-10 12:00:00', '2024-04-10 23:59:59', 10049, '2024-03-10 13:00:00', 128, 112, 108, 102),
(149, '2024-03-12 08:45:00', 30.00, '2024-03-18 15:00:00', 'Processando', 15.00, 315.00, '2024-03-12 09:00:00', '2024-04-12 23:59:59', 10050, '2024-03-12 10:00:00', 129, 112, 109, 101);