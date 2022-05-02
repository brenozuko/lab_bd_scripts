-- Subconsultas visões inline - Tabelas artificiais
SELECT id_produto
FROM (SELECT id_produto
      FROM tb_produtos
      WHERE id_produto < 3);

-- Subqueries com fontes de dados dinâmicas
SELECT p.id_produto, preco, dados_compra.count_produto
FROM tb_produtos p, (SELECT id_produto, COUNT(id_produto) count_produto
                     FROM tb_compras
                     GROUP BY id_produto) dados_compra
WHERE p.id_produto = dados_compra.id_produto;


-- Subconsultas de uma única linha podem retornar no máxumo uma linha -- GERA ERRO
-- Subconsultas não podem conter uma cláusula ORDER BY

-- SUBCONSULTAS DE VÁRIAS LINHAS

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto IN (1,2,3);

-- SUBQUERY IN -> Retorna uma id e nome do produto que constam no retorno da subquery

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto IN (SELECT id_produto
                     FROM tb_produtos
                     WHERE nm_produto LIKE '%e%');

-- SUBQUERY NOT IN -> Retorna produtos não comprados

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto NOT IN (SELECT id_produto
                         FROM tb_compras);

-- SUBQUERY ANY -> Retorna qualquer funcionar cujo salário seja menor que um dos salários mais baixos da TB_GRADES_SALARIOS
SELECT id_funcionario, nome, salario
FROM tb_funcionarios
WHERE salario < ANY(SELECT base_salario
                    FROM tb_grades_salarios);