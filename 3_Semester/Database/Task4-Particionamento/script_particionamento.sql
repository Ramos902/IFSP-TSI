CREATE DATABASE MegaLoja_Online;
USE MegaLoja_Online;
CREATE TABLE faturamento (
    id INT AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    categoria_produto ENUM('eletronicos', 'roupas', 'alimentos', 'moveis'),
    regiao VARCHAR(20) NOT NULL,
    cliente_id INT,
    PRIMARY KEY (id)
);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-08-25', 4721.28, 'alimentos', 'Sudeste', 33);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-04-18', 4376.11, 'roupas', 'Sul', 74);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-06-03', 4487.35, 'moveis', 'Nordeste', 48);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2019-01-26', 1591.31, 'roupas', 'Sudeste', 15);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-08-01', 3456.98, 'eletronicos', 'Centro-Oeste', 72);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-27', 3159.95, 'moveis', 'Nordeste', 12);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-09-08', 3569.23, 'alimentos', 'Sudeste', 7);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-04-12', 3939.81, 'roupas', 'Sul', 61);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-02-09', 1133.09, 'alimentos', 'Centro-Oeste', 92);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-11-23', 2700.32, 'moveis', 'Sudeste', 18);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2020-01-08', 4287.97, 'eletronicos', 'Sudeste', 88);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-04-10', 3684.66, 'alimentos', 'Nordeste', 8);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-15', 4725.13, 'moveis', 'Norte', 88);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2020-03-08', 3804.81, 'roupas', 'Sudeste', 66);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-01-13', 2056.23, 'eletronicos', 'Nordeste', 38);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-01-15', 3811.89, 'alimentos', 'Sul', 59);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-03-08', 1941.67, 'roupas', 'Sudeste', 66);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-11-22', 1568.16, 'eletronicos', 'Centro-Oeste', 82);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-25', 1045.28, 'moveis', 'Sudeste', 48);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-04-10', 4380.66, 'alimentos', 'Sul', 98);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-16', 4279.13, 'roupas', 'Nordeste', 44);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-12-19', 3968.81, 'eletronicos', 'Norte', 79);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-05-18', 4310.67, 'moveis', 'Sudeste', 42);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-01-26', 1591.31, 'alimentos', 'Centro-Oeste', 15);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-08-01', 3456.98, 'roupas', 'Sudeste', 72);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-27', 3159.95, 'eletronicos', 'Nordeste', 12);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-09-08', 3569.23, 'moveis', 'Sudeste', 7);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-04-12', 3939.81, 'alimentos', 'Sul', 61);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-02-09', 1133.09, 'roupas', 'Centro-Oeste', 92);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-11-23', 2700.32, 'eletronicos', 'Sudeste', 18);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2020-01-08', 4287.97, 'moveis', 'Sudeste', 88);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-04-10', 3684.66, 'alimentos', 'Nordeste', 8);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-15', 4725.13, 'roupas', 'Norte', 88);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2020-03-08', 3804.81, 'eletronicos', 'Sudeste', 66);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-01-13', 2056.23, 'moveis', 'Nordeste', 38);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-01-15', 3811.89, 'alimentos', 'Sul', 59);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-03-08', 1941.67, 'roupas', 'Sudeste', 66);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-11-22', 1568.16, 'eletronicos', 'Centro-Oeste', 82);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-25', 1045.28, 'moveis', 'Sudeste', 48);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-04-10', 4380.66, 'alimentos', 'Sul', 98);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-08-16', 4279.13, 'roupas', 'Nordeste', 44);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-12-19', 3968.81, 'eletronicos', 'Norte', 79);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-05-18', 4310.67, 'moveis', 'Sudeste', 42);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-09-19', 2769.18, 'alimentos', 'Centro-Oeste', 15);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-03-01', 3578.96, 'roupas', 'Sudeste', 72);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2022-06-25', 2901.81, 'eletronicos', 'Nordeste', 12);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2023-11-25', 2056.23, 'moveis', 'Sudeste', 7);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2021-09-08', 3939.81, 'alimentos', 'Sul', 61);
INSERT INTO faturamento (data_venda, valor, categoria_produto, regiao, cliente_id) VALUES ('2024-01-22', 1133.09, 'roupas', 'Centro-Oeste', 92);