-- CONECTADO COMO SYSTEM
GRANT CREATE ROLE TO loja;
GRANT CREATE ROLE TO loja WITH ADMIN OPTION;

-- CONECTADO COMO LOJA -- to be continued


-- AUDITORIA

-- CONECTADO COMO SYSTEM - CONCEDE AUDITORIA A LOJA
GRANT AUDIT SYSTEM TO loja;
GRANT AUDIT ANY TO loja;

-- CONECTADO COMO LOJA

AUDIT CREATE TABLE;

CREATE TABLE tb_teste_1(
id_teste        INTEGER
);

-- CHECANDO A USER_AUDIT_TRAIL
SELECT username, extended_timestamp, audit_option
FROM user_audit_trail
WHERE audit_option = 'CREATE TABLE';


SELECT username, extended_timestamp, owner, obj_name, action_name
FROM user_audit_trail
WHERE action_name = 'CREATE TABLE'
ORDER BY 2 DESC;

AUDIT INSERT TABLE,
      UPDATE TABLE,
      DELETE TABLE BY loja, fernando;
      
AUDIT SELECT ON loja.tb_produtos;

AUDIT ALL ON loja.tb_funcionarios;

-- CHECA QUANDO AS INSTRUÇÕES SÃO BEM E MAL SUCEDIDAS
AUDIT UPDATE TABLE BY fernando WHENEVER NOT SUCCESSFUL;
AUDIT INSERT TABLE WHENEVER NOT SUCCESSFUL;

AUDIT CREATE USER, DROP USER WHENEVER SUCCESSFUL;

AUDIT CREATE USER, DROP USER BY loja WHENEVER SUCCESSFUL;

AUDIT SELECT ON loja.tb_produtos BY SESSION;
AUDIT DELETE ON loja.tb_funcionarios BY ACCESS;
AUDIT INSERT, UPDATE ON loja.tb_funcionarios BY ACCESS;

-- TABELAS

-- TABELAS TEMPORÁRIAS

CREATE GLOBAL TEMPORARY TABLE tb_status_encomenda_temp(
id_status_encomenda     INTEGER,
status                  VARCHAR2(10),
ultima_modificacao      DATE DEFAULT SYSDATE
)
ON COMMIT PRESERVE ROWS;

INSERT INTO tb_status_encomenda_temp(id_status_encomenda, status)
VALUES (1, 'Novo');

SELECT * FROM tb_status_encomenda_temp;

-- CRIAÇÃO DE TABELA COM SUBQUERY
CREATE TABLE tb_funcionarios_teste
AS
  SELECT id_funcionario, nome, salario
  FROM tb_funcionarios
  WHERE id_funcionario = 3;

-- CONSULTANDO TABELAS DENTRO DO CATÁLOGO USER_TABLES

SELECT table_name,
       tablespace_name,
       temporary
FROM user_tables
WHERE table_name IN ('TB_STATUS_ENCOMENDA_2', 'TB_STATUS_ENCOMENDA_TEMP');

-- CONSULTANDO CATÁLOGO USER_TAB_COLUMNS

SELECT column_name, data_type, data_length,
       data_precision, data_scale
FROM user_tab_columns
WHERE table_name = 'TB_PRODUTOS';