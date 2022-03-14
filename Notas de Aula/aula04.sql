-- AUTOJOIN - É necessário nomear as tabelas de forma diferente.
SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || g.nome
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario
ORDER BY f.nome;

-- AUTOJOIN - inverter os predicados de chave primária e estrangeira gera inconsistência.
SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || g.nome
FROM tb_funcionarios f, tb_funcionarios g
WHERE g.id_gerente = f.id_funcionario
ORDER BY f.nome;

-- AUTOJOIN - onde através da junção externa a esquerda, são trazidos todos os funcionários.
SELECT f.nome || ' trabalha para ' || NVL(g.sobrenome, 'os acionistas') -- NVL substitui valores nulos por 'os acionistas'
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario (+)
ORDER BY f.sobrenome DESC;

-- AUTOJOIN com INNER JOIN
SELECT p.nm_produto AS PRODUTO, tb.nm_tipo_produto AS TIPO
FROM tb_produtos p
INNER Join tb_tipos_produtos tp ON(p.id_tipo_produto = tp.id_tipo_produto)
ORDER BY p.nm_produto;

-- NÃO-EQUIJOIN com INNER JOIN
SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f
INNER JOIN tb_grades_salarios gs ON (f.salario BETWEEN gs.base_salario
                                    AND gs.teto_salario)
ORDER BY gs.id_salario;

-- JOIN com USING
SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

-- JOIN com USING - não é possível qualificar com apelido a coluna utilizada pelo using

SELECT p.nm_produto AS PRODUTO,
       tp.nm_tipo_produto AS TIPO, tp.id_tipo_produto -- ERRO ORA-25154
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);


SELECT p.nm_produto AS PRODUTO,
       tp.nm_tipo_produto AS TIPO, id_tipo_produto
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (tp.id_tipo_produto); -- ERRO ORA-01748


-- INNER JOIN com USING em múltiplas tabelas
SELECT c.nome, c.sobrenome, p.nm_produto AS produto,
       tp.nm_tipo_produto AS tipo
FROM tb_clientes c
INNER JOIN tb_compras co USING (id_cliente)
INNER JOIN tb_produtos p USING (id_produto)
INNER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;


-- LEFT OUTER JOIN - Sintaxe verbal
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
LEFT OUTER JOIN tb_tipos_produtos tp USING(id_tipo_produto)
ORDER BY p.nm_produto;

-- RIGHT OUTER JOIN - Sintaxe verbal
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
RIGHT OUTER JOIN tb_tipos_produtos tp USING(id_tipo_produto)
ORDER BY p.nm_produto;

-- FULL OUTER JOIN - Sintaxe verbal
SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
FULL OUTER JOIN tb_tipos_produtos tp USING(id_tipo_produto)
ORDER BY p.nm_produto;


-- AUTOJOIN com INNER JOIN
SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || g.nome
FROM tb_funcionarios f
INNER JOIN tb_funcionarios g ON(f.id_gerente = g.id_funcionario)
ORDER BY f.nome;

-- CROSS JOIN - produto cartesiano
SELECT * 
FROM tb_tipos_produtos
CROSS JOIN tb_produtos;

-- VARIÁVEIS SQL

-- INPUT: INTEGER
SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto;

-- INPUT: 
-- v_coluna = id_produto
-- v_tabela = tb_produtos
-- v_id_produto = 1

SELECT nm_produto, &v_coluna
FROM &v_tabela
WHERE &v_coluna = &v_id_produto;

-- Indica que a variável v_coluna é a mesma em todas as ocorrências da query
-- Input apenas uma vez
SELECT nm_produto, &&v_coluna
FROM &v_tabela
WHERE &&v_coluna = &v_id_produto;

-- Pré definição de variáveis com DEFINE

DEFINE v_id_produto = 7;

SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;


-- ACCEPT para especificar tipo

ACCEPT v_id NUMBER FORMAT 99 PROMPT 'Entre com o ID';

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id;


-- Fluxo de DEFINE e UNDEFINE:

DEFINE v_id_produto = 7; --1

SELECT nm_produto, id_produto -- 2 e 4
FROM tb_produtos
WHERE id_produto = &v_id_produto;

UNDEFINE v_id_produto; -- 3