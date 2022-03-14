
SET ECHO OFF 
SET VERIFY OFF

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto;