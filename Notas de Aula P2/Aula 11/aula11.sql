-- MERGE - Mescla uma tabela em outra

MERGE INTO tb_produtos p
USING tb_produtos_alterados pa ON(p.id_produto = pa.id_produto)
WHEN MATCHED THEN
  UPDATE
  SET
  p.id_tipo_produto = pa.id_tipo_produto,
  p.nm_produto = pa.nm_produto,
  p.ds_produto = pa.ds_produto,
  p.preco = pa.preco,
  p.fg_ativo = pa.fg_ativo
  WHEN NOT MATCHED THEN
  INSERT (
  p.id_produto, p.id_tipo_produto, p.nm_produto,
  p.ds_produto, p.preco, p.fg_ativo)
  VALUES (
  pa.id_produto, pa.id_tipo_produto, pa.nm_produto,
  pa.ds_produto, pa.preco, pa.fg_ativo);


  -- TRANSAÇÕES

  -- Sempre tem início e fim.

  -- O corpo da transação é constituído por N instruções SQL. 

  -- Se a transação for executada com sucesso é feito o COMMIT caso contrário o ROLLBACK.

  -- Toda transação dá suporte ao ACID - Atomicidade, Consistência, Isolamento, Durabilidade.

  -- Várias queries selecionadas constituem uma transação.

  -- É integralmente processada ou não é processada de forma alguma.

  -- TRANSAÇÃO COM COMMIT

INSERT INTO tb_clientes
VALUES
(12, 'Geraldo', 'Henrique', '31-JUL-1977', '800-112233', 1);
  
COMMIT;

-- TRANSAÇÃO COM ROLLBACK EXPLÍCITO

UPDATE tb_clientes
SET nome = 'José'
WHERE id_cliente = 1;
  
  
SELECT *
FROM tb_clientes
ORDER BY 1;
  
ROLLBACK;
   
  
SELECT *
FROM tb_clientes
ORDER BY 1;

-- DDL e DCL tem commit automático


-- SAVEPOINTS - permitem segmentar transações de grande porte
 
SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4,6);
  
-- Produto 4 - 13,95
-- Produto 6 - 49,99
 
UPDATE tb_produtos
SET preco = preco * 1.20
WHERE id_produto = 4;
COMMIT;
 
SAVEPOINT save1;

UPDATE tb_produtos
  SET preco = preco * 1.30
WHERE id_produto = 6;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4,6);

-- Produto 4 - 16,74
-- Produto 6 - 64,99

ROLLBACK TO SAVEPOINT save1;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4,6);
  
-- Produto 4 - 16,74
-- Produto 6 - 49,99

-- Transações SELECT não precisam ser isoladas - Podem rodar paralelamente

-- Leitores não bloqueiam leitores
-- Gravadores não bloqueiam leitores
-- Gravadores só bloqueiam gravadores quando eles tentem modificar a mesma linha
-- Exceção: gravador tenta alterar a mesma linha, porém registros diferentes

-- FLASHBACK


SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

-- ORIGINAL
-- Produto 1 - 40
-- Produto 2 - 35
-- Produto 3 - 25,99
-- Produto 4 - 16,74

UPDATE tb_produtos
  SET preco = preco * 0.75
WHERE id_produto <= 5;

COMMIT;

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

-- ATUALIZADO
-- Produto 1 - 30
-- Produto 2 - 26,25
-- Produto 3 - 19,49
-- Produto 4 - 12,56

-- 24 * 60 = 1440
EXECUTE DBMS_FLASHBACK.ENABLE_AT_TIME(SYSDATE - 10/1440);

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

EXECUTE DBMS_FLASHBACK.DISABLE();

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;