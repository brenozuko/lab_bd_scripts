-- SEQUENCIAS

CREATE SEQUENCE seq_teste;

CREATE SEQUENCE seq_teste_2
START WITH 10 INCREMENT BY 5
MINVALUE 10 MAXVALUE 20
CYCLE CACHE 2 ORDER;

CREATE SEQUENCE seq_teste_3
START WITH 10 INCREMENT BY -1
MINVALUE 1 MAXVALUE 10
CYCLE CACHE 5;

-- CHECA SEQUÊNCIAS CRIADAS
SELECT * 
FROM user_sequences
ORDER BY sequence_name;


-- INCREMENTO APLICADO AUTOMATICAMENTE
SELECT seq_teste.nextval
FROM dual;

-- Pega o valor atual da sequência
SELECT seq_teste.currval
FROM dual;

-- Testes SEQ 2 e SEQ 3
SELECT seq_teste_2.nextval
FROM dual;

SELECT seq_teste_3.nextval
FROM dual;

-- TESTANDO APLICABILIDADE DA SEQUÊNCIA

CREATE TABLE tb_status_encomenda_2(
id_status             INTEGER CONSTRAINT pk_status_enc_2_new PRIMARY KEY,
status                VARCHAR2(10),
ultima_modificacao    DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq_status_enc_2 NOCACHE;

INSERT INTO tb_status_encomenda_2(id_status,
                                  status,
                                  ultima_modificacao)
VALUES
(seq_status_enc_2.nextval, 'Enviado', '01-JAN-2013');

SELECT * FROM tb_status_encomenda_2;

INSERT INTO tb_status_encomenda_2(id_status,
                                  status,
                                  ultima_modificacao)
VALUES
(seq_status_enc_2.nextval, 'Pendente', '01-MAR-2013');

-- ALTERANDO SEQUÊNCIA

ALTER SEQUENCE seq_teste
INCREMENT BY 2;

-- DROPANDO SEQUENCIA
DROP SEQUENCE seq_teste_3;

-- INDICES

-- BUSCA COMUM - SEM INDEXAÇÃO

SELECT *
FROM tb_clientes
WHERE sobrenome = 'Brown';

-- indexação de sobrenome
CREATE INDEX idx_clientes_sobrenome
ON tb_clientes(sobrenome);

-- INDEXAÇÃO ÚNICA
CREATE UNIQUE INDEX idx_clientes_telefone
ON tb_clientes(telefone);

-- INDICE COMPOSTO
CREATE INDEX idx_func_nome_sobre
ON tb_funcionarios(nome, sobrenome);


-- Indice baseado em função
SELECT nome, sobrenome
FROM tb_clientes
WHERE UPPER(sobrenome) = 'BROWN';


CREATE INDEX idx_funcao_clientes_sobrenome
ON tb_clientes (UPPER(sobrenome));

-- CONECTADO COMO SYSTEM - PERMITE A INDEXAÇÃO BASEADA EM FUNÇÃO
ALTER SYSTEM SET QUERY_REWRITE_ENABLED = TRUE;

-- Verificando o catálogo de índices

SELECT index_name, table_name, uniqueness, status
FROM user_indexes
WHERE table_name IN ('TB_CLIENTES', 'TB_FUNCIONARIOS')
ORDER BY index_name;

-- Verificando o catálogo de colunas de índices

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN ('TB_CLIENTES', 'TB_FUNCIONARIOS')
ORDER BY index_name;

-- ALTER INDEX
ALTER INDEX idx_clientes_telefone
RENAME TO idx_clientes_telefone_nr;

-- DROP INDEX
DROP INDEX idx_clientes_telefone_nr;

-- VISÕES
-- VISÕES NUNCA ARMAZENAM TUPLAS, APENAS AS TABELAS DE BASE

-- conectado como system

GRANT CREATE VIEW TO loja;

-- CRIANDO A VIEW

CREATE VIEW view_produtos_baratos AS
SELECT *
FROM tb_produtos
WHERE preco < 15.00;