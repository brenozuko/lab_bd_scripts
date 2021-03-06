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

-- NOT IN
SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2,3,5);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2,3,5, NULL);

-- BETWEEN
SELECT *
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;

-- NOT BETWEEN

SELECT * 
FROM tb_clientes
WHERE id_cliente NOT BETWEEN 1 AND 3;

-- OPERADORES LÓGICOS

-- AND e OR
SELECT * 
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' AND 
      id_cliente > 3;

-- AND tem precedência sobre OR
SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' OR
      id_cliente < 2 AND
      telefone LIKE '%1211';


-- ORDER BY

-- Default: ASC
SELECT * 
FROM tb_clientes
ORDER BY sobrenome;

-- Primeira coluna define o order by: ASC
SELECT * 
FROM tb_clientes
ORDER BY nome ASC, sobrenome DESC;


-- Ordena pelo id_cliente (de acordo com as especificações do SELECT)
SELECT id_cliente, nome, sobrenome
FROM tb_clientes
ORDER BY 1;

-- Respeita a ordem de criação da tabela
SELECT *
FROM tb_clientes
ORDER BY 3;


-- JOIN

-- N = TABELAS ENVOLVIDAS NO RELATÓRIO
-- JOIN = N - 1

-- Consultas separadas
SELECT nm_produto, id_tipo_produto
FROM tb_produtos
WHERE id_produto = 3;

SELECT nm_tipo_produto
FROM tb_tipos_produtos
WHERE id_tipo_produto = 2;

-- Usando EQUIJOIN

SELECT tb_produtos.nm_produto,
       tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto
AND tb_produtos.id_produto = 3;

-- JOIN e ORDER BY
SELECT tb_produtos.nm_produto,
       tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto
ORDER BY tb_produtos.nm_produto;

-- Usando Aliases (APELIDOS)

SELECT p.nm_produto, tp.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto;

-- Produto cartesiano
SELECT p.id_tipo_produto, tp.id_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp;

-- Seleção entre 3 tabelas

SELECT c.nome, c.sobrenome, p.nm_produto AS produto,
       tp.nm_tipo_produto AS tipo
FROM tb_clientes c, tb_compras co, tb_produtos p, tb_tipos_produtos tp
WHERE c.id_cliente = co.id_cliente AND
      p.id_produto = co.id_produto AND
      p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto;

-- Intervalo de salários, nome e sobrenome de funcionarios: não-equijoin
SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f, tb_grades_salarios gs
WHERE f.salario BETWEEN gs.base_salario AND gs.teto_salario
ORDER BY gs.id_salario;

-- LEFT ALTER JOIN - Operador a direita

SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto(+)
ORDER BY 1;


-- RIGHT ALTER JOIN - Operador a esquerda
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto(+) = tp.id_tipo_produto
ORDER BY 1;
      

-- ORA-01719
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto(+) = tp.id_tipo_produto
OR p.id_tipo_produto = 1; 