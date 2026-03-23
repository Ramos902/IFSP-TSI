USE loja_web;
/*Questão 02 - 2.	Criar uma view para cada uma das tabelas em nosso database, serão view com “select * from tabela” apenas.*/
CREATE VIEW vw_categoria AS
SELECT * FROM categoria;
CREATE VIEW vw_cliente AS
SELECT * FROM cliente;
CREATE VIEW vw_endereco AS
SELECT * FROM endereco;
CREATE VIEW vw_fabricante AS
SELECT * FROM fabricante;
CREATE VIEW vw_forma_pagto AS
SELECT * FROM forma_pagto;
CREATE VIEW vw_funcionario AS
SELECT * FROM funcionario;
CREATE VIEW vw_imagens AS
SELECT * FROM imagens;
CREATE VIEW vw_item_pedido AS
SELECT * FROM item_pedido;
CREATE VIEW vw_pedido AS
SELECT * FROM pedido;
CREATE VIEW vw_produto AS
SELECT * FROM produto;

/*Questão 03 - Criar uma visão segura sem dados sensíveis (CPF/RG).*/
CREATE VIEW vw_secure_cliente AS
SELECT idCliente, nome_usuario, e_mail_cliente, nome, telefone_residencial, telefone_celular, telefone_comercial, dtnasc FROM cliente;

/*Questão 04 - Agrupar produtos por categoria para relatórios*/
CREATE VIEW view_produtos_per_categoria AS 
SELECT
    c.idcategoria,
    c.nome AS categoria,
    COUNT(p.idproduto) AS total_produtos,
    SUM(p.quantidade) AS total_estoque,
    MIN(p.preco) AS menor_preco,
    MAX(p.preco) AS maior_preco,
    AVG(p.preco) AS preco_medio
FROM categoria c 
LEFT JOIN produto p ON p.idcategoria = c.idcategoria
GROUP BY c.idcategoria, c.nome;

/*Questão 05 - Monitorar pedidos não processados.*/
CREATE VIEW view_pedidos_nao_processados AS
SELECT 
    pe.pedido_codigo,
    c.nome AS cliente,
    pe.situacao,
    pe.numero_NF,
    p.nome AS produto,
    p.preco,
    pe.VLR_TOTAL,
    e.logradouro,
    e.bairro,
    e.cep
FROM pedido pe
JOIN cliente c ON c.idCliente = pe.idcliente
JOIN endereco e ON e.idendereco = pe.idendereco
JOIN item_pedido ip ON ip.pedido_codigo = pe.pedido_codigo
JOIN produto p ON p.idproduto = ip.idproduto
WHERE pe.situacao IN ('Em Processamento', 'Processando', 'Pendente', 'Confirmado');

/*Questão 06 - Identificar produtos populares.*/

