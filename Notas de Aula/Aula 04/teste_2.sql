SET ECHO OFF 
SET VERIFY OFF 

ACCEPT v_id_produto NUMBER FORMAT 99 PROMPT 'Entre com o ID do produto: ';

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto