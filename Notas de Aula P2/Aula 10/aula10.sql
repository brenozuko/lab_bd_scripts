-- DECODE
SELECT id_produto, disponivel, 
DECODE(disponivel, 'Y', 'Produto está disponível', 'Produto não está disponível')
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto,
       DECODE(id_tipo_produto,
              1, 'Book',
              2, 'Video',
              3, 'DVD',
              4, 'CD',
              'Magazine')
FROM tb_produtos;

-- CASE
SELECT id_produto, id_tipo_produto,
  CASE 
    WHEN id_tipo_produto = 1 THEN 'Book'
    WHEN id_tipo_produto = 2 THEN 'Video'
    WHEN id_tipo_produto = 3 THEN 'DVD'
    WHEN id_tipo_produto = 4 THEN 'CD'
    ELSE 'Magazine'
  END
FROM tb_produtos;


SELECT id_produto, preco,
  CASE
    WHEN preco > 15.00 THEN 'Caro'
    ELSE 'Barato'
  END
FROM tb_produtos;

-- CONSULTAS HIERÁRQUICAS
SELECT id_fncionario, id_gerente, nome, sobrenome
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente
ORDER BY 1;

-- ROLLUP
SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP(id_divisao, id_cargo)
ORDER BY id_divisao,id_cargo;

-- CUBE

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY CUBE(id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;~

-- CASE E ROLLUP

SELECT
  CASE GROUPING(id_divisao)
    WHEN 1 THEN 'Todas as divisões'
    ELSE id_divisao
  END AS DIV, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP(id_divisao)
ORDER BY id_divisao;
