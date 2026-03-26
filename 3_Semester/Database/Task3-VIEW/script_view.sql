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
CREATE VIEW view_produtos_populares AS
SELECT
    p.idproduto,
    p.nome AS produto,
    c.nome AS categoria,
    f.nome AS fabricante,
    SUM(ip.quantidade_venda) AS total_vendido,
    COUNT(DISTINCT ip.pedido_codigo) AS total_pedidos,
    SUM(ip.quantidade_venda * ip.preco_venda) AS receita_total
FROM produto p
JOIN item_pedido ip ON ip.idproduto = p.idproduto
JOIN pedido pe ON pe.pedido_codigo = ip.pedido_codigo
JOIN categoria c ON c.idcategoria = p.idcategoria
JOIN fabricante f ON f.idfabricante = p.idfabricante
WHERE pe.situacao NOT IN ('Cancelado')
GROUP BY p.idproduto, p.nome, c.nome, f.nome
ORDER BY total_vendido DESC;


/* Questão 07 - Analisar preferências de pagament*/
CREATE VIEW view_preferencias_pagamento AS
SELECT
    fp.idfrmpagto,
    fp.nome AS forma_pagamento,
    fp.taxa_juros,
    COUNT(pe.pedido_codigo) AS total_pedidos,
    SUM(pe.VLR_TOTAL) AS valor_total_movimentado,
    AVG(pe.VLR_TOTAL) AS ticket_medio,
    COUNT(DISTINCT pe.idcliente) AS clientes_distintos
FROM forma_pagto fp
LEFT JOIN pedido pe ON pe.idfrmpagto = fp.idfrmpagto
    AND pe.situacao NOT IN ('Cancelado')
GROUP BY fp.idfrmpagto, fp.nome, fp.taxa_juros
ORDER BY total_pedidos DESC;

/* Questão 08 - Facilitar envio de marketing/logística.*/

CREATE VIEW view_dados_marketing_logistica AS
SELECT
    c.idCliente,
    c.nome AS cliente,
    c.nome_usuario,
    c.e_mail_cliente,
    c.telefone_celular,
    e.logradouro,
    e.complemento,
    e.bairro,
    e.cidade,
    e.uf,
    e.cep,
    COUNT(pe.pedido_codigo) AS total_pedidos,
    SUM(pe.VLR_TOTAL) AS valor_total_gasto,
    MAX(pe.data_hora) AS ultimo_pedido
FROM cliente c
JOIN pedido pe ON pe.idcliente = c.idCliente
JOIN endereco e ON e.idendereco = pe.idendereco
WHERE pe.situacao NOT IN ('Cancelado')
GROUP BY
    c.idCliente, c.nome, c.nome_usuario, c.e_mail_cliente, c.telefone_celular,
    e.logradouro, e.complemento, e.bairro, e.cidade, e.uf, e.cep
ORDER BY valor_total_gasto DESC;

/* Questão 09 - Problema de Segurança
    -- Nenhum usuário do banco poderá ter acesso direto as tabelas exceto o ‘root’. 
    -- Todos os usuários devem ter apenas acesso a view.
*/

/*USUARIO EXEMPLO*/
DROP USER IF EXISTS 'vendedor'@'%';
CREATE USER 'vendedor'@'%' IDENTIFIED BY 'senha123';

/* Conceder acesso apenas às views para vendedor */
GRANT SELECT ON loja_web.vw_categoria TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_cliente TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_endereco TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_fabricante TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_forma_pagto TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_funcionario TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_imagens TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_item_pedido TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_pedido TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_produto TO 'vendedor'@'%';
GRANT SELECT ON loja_web.vw_secure_cliente TO 'vendedor'@'%';
GRANT SELECT ON loja_web.view_produtos_per_categoria TO 'vendedor'@'%';
GRANT SELECT ON loja_web.view_pedidos_nao_processados TO 'vendedor'@'%';
GRANT SELECT ON loja_web.view_produtos_populares TO 'vendedor'@'%';
GRANT SELECT ON loja_web.view_preferencias_pagamento TO 'vendedor'@'%';
GRANT SELECT ON loja_web.view_dados_marketing_logistica TO 'vendedor'@'%';
FLUSH PRIVILEGES;