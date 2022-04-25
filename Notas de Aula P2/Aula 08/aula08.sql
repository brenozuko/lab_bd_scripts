-- GROUP BY e VARIANCE - retorna as variâncias de preço do produto
SELECT id_tipo_produto, VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

-- ORDER COM VARIANCE e group by - retorna a variância do preço e ordena pela tal
SELECT VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY VARIANCE(preco);

-- GROUP BY é obrigatório ao se utilizar funções agregadas que retornam colunas específicas
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos;

-- Também não é permitida utilização de função agregada em WHERE
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE AVG(preco) > 20.00
GROUP BY id_tipo_produto;


-- GROUP BY pode ser usado sem HAVING, mas HAVING deve ser usado com GROUP BY
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) > 20.00;

-- Utilização de WHERE com GROUP BY -> sem função agregada
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

-- Utilização de having
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.0
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.0
ORDER BY id_tipo_produto;

-- TIPO DATE

-- DATA E HORA - a conversão é feita para o padrão do banco independentemente da inserção feita
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES(7, 'Steve', 'Purple', DATE'1972-10-25', '800-555-1215', 1);

SELECT *
FROM tb_clientes
ORDER BY id_cliente;

ROLLBACK;

-- TO CHAR - aplicando máscara
SELECT id_cliente, TO_CHAR(dt_nascimento, 'MONTH DD, YYYY')
FROM tb_clientes;

-- Retorna o dia de hoje com as mudanças propostas pela máscara
SELECT TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS')
FROM dual;

-- Conversão para data e cast para char
SELECT TO_CHAR(TO_DATE('05-FEV-1968'), 'MONTH DD, YYYY')
FROM dual;