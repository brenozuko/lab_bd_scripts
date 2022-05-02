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


-- SUBQUERY ALL -- Compara com o maior salário da lista retornada

SELECT id_funcionario, nome, salario
FROM tb_funcionarios
WHERE salario > ALL(SELECT teto_salario
                    FROM tb_grades_salarios);

-- SUBQUERY IN QUE RETORNAM VÁRIAS COLUNAS

SELECT id_produto, id_tipo_produto, nm_produto, preco
FROM tb_produtos
WHERE (id_tipo_produto, preco) IN (SELECT id_tipo_produto, MIN(preco)
                                  FROM tb_produtos
                                  GROUP BY id_tipo_produto);


-- SUBQUERIES CORRELACIONADAS -> Dependem da consulta externa
                                  
SELECT id_produto, id_tipo_produto, nm_produto, preco
FROM tb_produtos externa
WHERE preco > (SELECT AVG(preco)
               FROM tb_produtos interna
               WHERE interna.id_tipo_produto = externa.id_tipo_produto);

-- EXISTS E NOT EXISTS -> Mais performático pois não há comparação de valores

-- Seleciona todos os funcionarios que gerenciam pessoas

SELECT id_funcionario, nome, sobrenome
FROM tb_funcionarios externa
WHERE EXISTS (SELECT id_funcionario
              FROM tb_funcionarios interna
              WHERE interna.id_gerente = externa.id_funcionario);

SELECT id_funcionario, nome, sobrenome
FROM tb_funcionarios externa
WHERE EXISTS (SELECT 1
              FROM tb_funcionarios interna
              WHERE interna.id_gerente = externa.id_funcionario); 

SELECT id_produto, nm_produto
FROM tb_produtos externa
WHERE NOT EXISTS (SELECT 1
                  FROM tb_compras interna
                  WHERE interna.id_produto = externa.id_produto);

-- NOT IN vs NOT EXISTS

SELECT id_tipo_produto, nm_tipo_produto
FROM tb_tipos_produtos externa 
WHERE NOT EXISTS (SELECT 1
                  FROM tb_produtos interna
                  WHERE interna.id_tipo_produto = externa.id_tipo_produto);



-- RETORNA ERRO
SELECT id_tipo_produto, nm_tipo_produto
FROM tb_tipos_produtos 
WHERE id_tipo_produto NOT IN (SELECT 1
                      FROM tb_produtos
                      WHERE interna.id_tipo_produto = externa.id_tipo_produto);
                                        
-- CORREÇÃO USANDO NVL

SELECT id_tipo_produto, nm_tipo_produto
FROM tb_tipos_produtos
WHERE id_tipo_produto NOT IN (SELECT NVL(id_tipo_produto, 0)
                              FROM tb_produtos);


-- SUBQUERIES ANINHADAS

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) < (SELECT MAX(AVG(preco))
                     FROM tb_produtos
                     WHERE id_produto IN (SELECT id_produto
                                          FROM tb_compras
                                          WHERE quantidade > 1)
                     GROUP BY id_tipo_produto)
ORDER BY id_tipo_produto;

-- UPDATE USANDO SUBQUERY

UPDATE tb_funcionarios
SET salario = (SELECT AVG(teto_salario)
               FROM tb_grades_salarios)
WHERE id_funcionario = 4;

ROLLBACK;

-- DELETE USANDO SUBQUERY
--Retorna erro pois fere a integridade referencial
DELETE
FROM tb_funcionarios
WHERE salario > (SELECT AVG(teto_salario)
                 FROM tb_grades_salarios);

ROLLBACK;