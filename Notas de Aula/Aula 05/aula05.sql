-- EXERCÍCIO 2 DE AULA

CREATE TABLE tb_cliente_teste(
id_cliente      INTEGER,
ds_cliente      VARCHAR2(40),
nm_cliente      VARCHAR2(40),
valor           NUMERIC,
fg_ativo        INTEGER,
PRIMARY KEY (id_cliente)
);


create or replace
PROCEDURE manipula_dados(
p_id_cliente IN tb_cliente_teste.id_cliente%TYPE,
p_descricao  IN tb_cliente_teste.ds_cliente%TYPE,
p_nome       IN tb_cliente_teste.nm_cliente%TYPE,
p_valor      IN tb_cliente_teste.valor%TYPE,
p_fg_ativo   IN tb_cliente_teste.fg_ativo%TYPE,
p_opcao      IN CHAR)
AS
v_controle INTEGER;

BEGIN 

-- verifica a existência de tuplas na tb_cliente_teste
SELECT COUNT(*) INTO v_controle
FROM tb_cliente_teste
WHERE id_cliente = p_id_cliente
AND fg_ativo = 1;

-- opção = I (INSERT)
IF(p_opcao = 'I') THEN
  IF(v_controle != 1) THEN
    INSERT INTO tb_cliente_teste(id_cliente, ds_cliente, nm_cliente, valor, fg_ativo)
    VALUES (p_id_cliente, p_descricao, p_nome, p_valor, p_fg_ativo);
    COMMIT;
    dbms_output.put_line('Cliente inserido com sucesso');
    
    ELSE
    dbms_output.put_line('ID do cliente já existe');
    
  END IF;
END IF;

-- opção = U (UPDATE)
IF(p_opcao = 'U') THEN
  IF(v_controle = 1) THEN
    UPDATE tb_cliente_teste SET ds_cliente      = p_descricao,
                                nm_cliente      = p_nome,
                                valor           = p_valor,
                                fg_ativo        = p_fg_ativo
    WHERE id_cliente = p_id_cliente
    AND fg_ativo = 1;
    
    COMMIT;
    dbms_output.put_line('Cliente atualizado com sucesso');
  ELSE
    dbms_output.put_line('ID do cliente não existe');
  END IF;
END IF;

-- opção = D (DELETE)
IF(p_opcao = 'D') THEN
  IF (v_controle = 1) THEN
    DELETE
    FROM tb_cliente_teste
    WHERE id_cliente = p_id_cliente
    AND fg_ativo = 1;
    
    COMMIT;
    
    dbms_output.put_line('Cliente removido com sucesso');
  ELSE
    dbms_output.put_line('ID do cliente não existe');
  END IF;
END IF;

EXCEPTION 
  WHEN OTHERS THEN
  ROLLBACK;
END manipula_dados;


SET serveroutput ON
BEGIN
-- opção inserir (opção = I)
 manipula_dados(1, 'Cliente 1', 'Nome Cliente 1', 22.33,1,'I');

-- opção inserir (opção = I)
 manipula_dados(2, 'Cliente 2', 'Nome Cliente 2', 99.99,1,'I');

-- opção alterar (opção = U)
manipula_dados(2, 'Cliente - Alterado hoje', 'Alterado hoje', 99.99, 1, 'U');

-- opção deletar (opção = D)
manipula_dados(1, NULL, NULL, NULL, NULL, 'D');
END;


-- FUNÇÔES SIMPLES

-- ASCII e CHR

SELECT ASCII('a'), ASCII('A'), ASCII('z'), ASCII('Z'), ASCII('O'), ASCII('9')
FROM dual;

SELECT CHR(97), CHR(65), CHR(122), CHR(90), CHR(48), CHR(57)
FROM dual;

-- CONCAT 

SELECT CONCAT(nome,sobrenome)
FROM tb_funcionarios;


-- INITCAP - Converte a primeira letra em maiúsculo

SELECT id_produto, INITCAP(ds_produto)
FROM tb_produtos;

-- INSTR

-- Procura pela ocorrência da string 'Science'
SELECT nm_produto, INSTR(nm_produto, 'Science')
FROM tb_produtos
WHERE id_produto = 1;

-- Procura pela segunda ocorrência da letra 'e'
SELECT nm_produto, INSTR(nm_produto, 'e', 1, 2)
FROM tb_produtos
WHERE id_produto = 1;

-- LENGTH - retorna tamanho do valor da coluna
SELECT nm_produto, LENGTH(nm_produto)
FROM tb_produtos;

-- UPPER e LOWER

SELECT UPPER(nome), LOWER(sobrenome)
FROM tb_funcionarios;

-- RPAD e LPAD

SELECT RPAD(nm_produto, 30, '.'), LPAD(preco, 8, '*.')
FROM tb_produtos
WHERE id_produto < 4;´

-- LTRIM, RTRIM, TRIM

SELECT
  LTRIM('   Olá pessoal tudo joia?'),
  RTRIM('Oi tudo bem!abcabc', 'abc'),
  TRIM('0' FROM '0000Treinamento em Oracle!0000')
FROM dual;