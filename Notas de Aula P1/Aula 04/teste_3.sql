SET ECHO OFF
SET VERIFY OFF

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &1; -- Pega o valor da execução do escript