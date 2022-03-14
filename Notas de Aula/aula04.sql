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