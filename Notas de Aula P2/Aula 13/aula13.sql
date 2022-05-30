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


CREATE VIEW view_funcionarios AS
SELECT id_funcionario, id_gerente,
       nome, sobrenome, cargo, fg_ativo
FROM tb_funcionarios;

SELECT *
FROM view_produtos_baratos;

SELECT *
FROM view_funcionarios;

-- DML em VIEWS

INSERT INTO view_produtos_baratos(id_produto, id_tipo_produto,
                                  nm_produto, preco, fg_ativo)
VALUES
(33, 1, 'DVD-R', 13.50, 1);


SELECT id_produto, nm_produto. preco
FROM view_produtos_baratos
WHERE id_produto = 33;


-- NÃO APRESENTA RESULTADO NA VIEW, POR FERIR A RESTRIÇÃO
INSERT INTO view_produtos_baratos(id_produto, id_tipo_produto,
                                  nm_produto, preco, fg_ativo)
VALUES
(43, 1, 'Mouse Optico', 16.50, 1);


SELECT id_produto, nm_produto, preco
FROM view_produtos_baratos
WHERE id_produto = 43;

-- NULIFICA VALORES NÃO PASSADOS 
INSERT INTO view_funcionarios(id_funcionario, id_gerente, nome,
                              sobrenome, cargo)
VALUES
(100, 1, 'Jefferson', 'Mendes', 'DBA');

SELECT id_funcionario, nome, sobrenome, salario
FROM tb_funcionarios
WHERE id_funcionario = 100;


-- WITH CHECK OPTION - NÃO PERMITE A INSERÇÃO QUE VIOLA A RESTRIÇÃO

CREATE VIEW view_produtos_baratos_2 AS
SELECT *
FROM tb_produtos
WHERE preco < 15.00
WITH CHECK OPTION CONSTRAINT view_produtos_baratos_2_preco;

-- ERRO ORA-01402
INSERT INTO view_produtos_baratos_2(id_produto, id_tipo_produto,
                                    nm_produto, preco)
VALUES
(53,1,'Submarino', 19.50);

-- VIEW WITH READ ONLY

CREATE VIEW view_produtos_baratos_3 AS
SELECT *
FROM tb_produtos
WHERE preco < 15.00
WITH READ ONLY CONSTRAINT view_prod_baratos_3_read_only;

-- RETORNA ERRO

INSERT INTO view_produtos_baratos_3(id_produto, id_tipo_produto,
                                    nm_produto, preco)
VALUES
(34,1, 'E-Book Ms Project', 19.50);

-- CHECA CATÁLOGO DAS VIEWS
SELECT view_name, text_length, text
FROM user_views
ORDER BY view_name;

-- CHECA CATÁLOGO DE CONSTRAINTS DAS VIEWS
SELECT constraint_name, constraint_type, status, deferrable, deferred
FROM user_constraints
WHERE table_name IN ('VIEW_PRODUTOS_BARATOS_2',
                     'VIEW_PRODUTOS_BARATOS_3')
ORDER BY constraint_name;

-- VIEWS COMPLEXAS - QUE REALIZA JUNÇÕES OU EXECUTA FUNÇÕES, UTILIZA DISTINCT, FUNÇÕES, ETC

CREATE VIEW view_tipos_e_produtos AS
SELECT p.id_produto, p.nm_produto nome_produto,
       tp.nm_tipo_produto nome_tipo_produto, p.preco
FROM tb_produtos p
FULL OUTER JOIN tb_tipos_produtos tp
USING (id_tipo_produto)
ORDER BY p.id_produto;

SELECT *
FROM view_tipos_e_produtos;

CREATE VIEW view_sarios_funcionarios AS 
SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f
INNER JOIN tb_grades_salarios gs
ON f.salario BETWEEN gs.base_salario AND gs.teto_salario
ORDER BY gs.id_salario;

CREATE VIEW view_media_produtos AS
SELECT id_tipo_produto, AVG(preco) media_preco
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.00
ORDER BY id_tipo_produto;