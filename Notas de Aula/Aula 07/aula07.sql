-- REGEXP_INSTR
SELECT 
    REGEXP_INSTR('Teste de expressão regular', 'e', 6,2) AS resultado
FROM dual;

-- REGEXP_REPLACE

SELECT
    REGEXP_REPLACE('Teste de expressão regular', 'd[[:alpha:]]{1}', 'Oracle')
AS resultado
FROM dual;

-- REGEXP_SUBSTR
SELECT 
    REGEXP_SUBSTR('Teste de expressão regular', 'e[[:alpha:]]{8}') AS resultado
FROM dual;

-- REGEXP_COUNT
SELECT
    REGEXP_COUNT('teste teste teste expressão regular', 't[[:alpha:]]{4}') AS resultado
FROM dual;

-- FUNÇÕES AGREGADAS

-- AVG
SELECT AVG(preco)
FROM tb_produtos;

-- ARREDONDANDO PRA DUAS CASAS
SELECT ROUND(AVG(preco), 2)
FROM tb_produtos;

SELECT CAST(AVG(preco) as NUMBER(5,2))
FROM tb_produtos;

-- MÉDIA + 2
SELECT AVG(preco + 2.00)
FROM tb_produtos;

SELECT AVG(DISTINCT preco)
FROM tb_produtos;

-- COUNT

SELECT COUNT(id_produto)
FROM tb_produtos;

-- Não usar * - Utilize pseudo-coluna ROWID
SELECT COUNT(ROWID)
FROM tb_produtos;

-- MAX E MIN - RETORNA VALORES MÁXIMO E MÍNIMO DE UMA COLUNA
SELECT MAX(preco), MIN(preco)
FROM tb_produtos;

-- Seleciona o produto de maior preço com a subquery
SELECT nm_produto, preco
FROM tb_produtos
WHERE preco = (SELECT MAX(preco) 
               FROM tb_produtos);

-- RETORNA O VALOR MÁXIMO DA STRING
SELECT MAX(nm_produto), MIN(nm_produto)
FROM tb_produtos;

-- RETORNA O VALOR MÁXIMO DA DATA
SELECT MAX(dt_nascimento), MIN(dt_nascimento)
FROM tb_clientes;

-- DESVIO PADRÃO
SELECT STDDEV(preco)
FROM tb_produtos;

-- SOMATÓRIO
SELECT SUM(preco)
FROM tb_produtos;

-- VARIÂNCIA
SELECT VARIANCE(preco)
FROM tb_produtos;

-- GROUP BY - AGRUPA COLUNAS DO MESMO VALOR

SELECT id_tipo_produto
FROM tb_produtos
GROUP BY id_tipo_produto;

-- COM MÚLTIPLAS COLUNAS
SELECT id_produto, id_cliente
FROM tb_compras
GROUP BY id_produto, id_cliente;

-- PROCESSANDO FUNÇÕES COM GROUP BY
SELECT id_tipo_produto, COUNT(ROWID)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

-- COM AVG
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

-- GROUP BY COM INNER JOIN
SELECT p.id_tipo_produto, tp.nm_tipo_produto,  ROUND(AVG(p.preco), 2)
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp ON(p.id_tipo_produto = tp.id_tipo_produto)
GROUP BY p.id_tipo_produto, tp.nm_tipo_produto
ORDER BY p.id_tipo_produto;

