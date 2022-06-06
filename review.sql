-- RECUPERA TODAS AS LINHAS DA UNIÃO

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION ALL
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- RECUPERA TODAS AS LINHAS NÃO DUPLICADAS

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION
SELECT id_prudot, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- RECUPERA A INTERSECÇÃO DE LINHAS
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
INTERSECT
SELECT id_prudot, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- RECUPERA A DIFERENÇA
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
MINUS
SELECT id_prudot, id_tipo_produto, nm_produto
FROM tb_mais_produtos;


GRANT CREATE VIEW TO loja;

CREATE USER fernando IDENTIFIED BY fernando1234;

CREATE USER sonia IDENTIFIED BY sonia1234;

GRANT CREATE SESSION, 
      CREATE USER,
      CREATE TABLE TO fernando;
      
      
GRANT SELECT ON tb_clientes TO fernando WITH GRANT OPTION;

GRANT SELECT ON loja.tb_clientes TO sonia;
