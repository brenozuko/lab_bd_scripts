-- SELECIONA PREÇO E ADICIONA 2

SELECT nm_produto, preco, preco + 2.00
FROM tb_produtos;

-- SELECIONA PREÇO E MULTIPLICA POR 2 ADICIONANDO ALIAS

SELECT preco, preco * 2 DOBRO_PREÇO
FROM tb_produtos;

SELECT preco, preco * 2 AS "Dobro do Preço"
FROM tb_produtos;

-- CONCATENAÇÃO 

SELECT nome || ' ' || sobrenome AS "Nome do Cliente"
FROM tb_clientes;

SELECT 'O nome do cliente é: ' || nome || ' ' || sobrenome || '. Sua data de nascimento é: ' || dt_nascimento AS "Frase Completa"
FROM tb_clientes;

-- SELEÇÃO DE VALORES NULOS

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NULL;

SELECT id_cliente, nome, sobrenome, telefone
FROM tb_clientes
WHERE telefone IS NULL;

-- UTILIZAÇÃO DA FUNÇÃO NVL

--  P.S: Quando usamos NVL o retorno será sempre referemte a tipo da coluna colocado no primeiro parâmetro.

-- NVL(coluna_string, 'string')
-- NVL(coluna_number, 0)

SELECT id_cliente, nome, sobrenome,
NVL(telefone, 'Número de telefone desconhecido') AS Número_telefone
FROM tb_clientes;

SELECT id_cliente, nome,sobrenome,
NVL(dt_nascimento, '22/JUN/2013') AS "Data de Nascimento"
FROM tb_clientes;

-- NULLIF E LENGTH

SELECT nome, LENGTH(nome) "expressão1",
       sobrenome, LENGTH(sobrenome) "expressão2",
       NULLIF(LENGTH(nome), LENGTH(sobrenome)) "resultado"
FROM tb_funcionarios;

-- DISTINCT

SELECT id_cliente 
FROM tb_compras;

SELECT DISTINCT(id_cliente)
FROM tb_compras;


-- COMPARATIVOS

-- Diferente: <> ou !=
SELECT *
FROM tb_clientes
WHERE id_cliente <> 2;

-- Maior: > 
SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto > 2;

-- Menor ou igual: <=
SELECT ROWNUM, id_produto, nm_produto
FROM tb_produtos
WHERE ROWNUM <= 3;

-- ANY
SELECT *
FROM tb_clientes
WHERE id_cliente > ANY(2,3,4);

-- OPERADORES SQL

-- LIKE
SELECT *
FROM tb_clientes
WHERE nome LIKE '_o%'; -- Similar a REGEX

SELECT *
FROM tb_clientes
WHERE nome LIKE '%a';

-- Seleciona nome com 4 caracteres
SELECT *
FROM tb_clientes
WHERE nome LIKE '____';

SELECT *
FROM tb_clientes
WHERE nome LIKE 'J%';

-- Escapa caracteres
-- P.S: ESCAPE pode ser definido com qualquer caracter
SELECT nome
FROM tb_promocao
WHERE nome LIKE '%\%%' ESCAPE '\';

-- IN

SELECT *
FROM tb_clientes
WHERE id_cliente IN (2,3,5);