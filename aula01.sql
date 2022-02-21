CREATE TABLE tb_clientes(
id_cliente      INTEGER,
nome            VARCHAR2(10) NOT NULL,
sobrenome       VARCHAR2(10) NOT NULL,
dt_nascimento   DATE,
telefone        VARCHAR2(12),
fg_ativo        INTEGER,
CONSTRAINT pk_tb_clientes_id_cliente PRIMARY KEY(id_cliente)
);

CREATE TABLE tb_tipos_produtos(
id_tipo_produto   INTEGER,
nm_tipo_produto   VARCHAR2(10) NOT NULL,
fg_ativo          INTEGER,
CONSTRAINT pk_tb_tipos_produtos_id_tipo PRIMARY KEY(id_tipo_produto)
);

CREATE TABLE tb_produtos(
id_produto      INTEGER,
id_tipo_produto INTEGER,
nm_produto      VARCHAR2(30) NOT NULL,
ds_produto      VARCHAR2(50),
preco           NUMBER(5,2),
fg_ativo        INTEGER,

CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY(id_produto),
CONSTRAINT fk_tb_produtos_id_tipo_produto FOREIGN KEY(id_tipo_produto)
  REFERENCES tb_tipos_produtos(id_tipo_produto)
);

CREATE TABLE tb_compras(
id_produto      INTEGER,
id_cliente      INTEGER,
quantidade      INTEGER,
fg_ativo        INTEGER,

CONSTRAINT fk_tb_compras_id_produto FOREIGN KEY(id_produto)
  REFERENCES tb_produtos(id_produto),
CONSTRAINT fk_tb_compras_id_cliente FOREIGN KEY(id_cliente)
  REFERENCES tb_clientes(id_cliente),
CONSTRAINT pk_tb_compras_id_prod_id_cli PRIMARY KEY(id_produto, id_cliente)
);

CREATE TABLE tb_funcionarios(
id_funcionario    INTEGER,
id_gerente        INTEGER,
nome              VARCHAR2(10) NOT NULL,
sobrenome         VARCHAR2(10) NOT NULL,
cargo             VARCHAR2(20),
salario           NUMBER(8,2),
fg_ativo          INTEGER,
CONSTRAINT pk_tb_funcionarios_id_func PRIMARY KEY(id_funcionario),
CONSTRAINT fk_tb_funcionarios_id_gerente FOREIGN KEY(id_gerente)
  REFERENCES tb_funcionarios(id_funcionario)
);

CREATE TABLE tb_grades_salarios(
id_salario     INTEGER,
base_salario   NUMBER(8,2),
teto_salario   NUMBER(8,2),
fg_ativo       INTEGER,
CONSTRAINT pk_tb_grd_salarios_id_salario
  PRIMARY KEY(id_salario)
);

DESCRIBE (tb_clientes);

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (1, 'John', 'Brown', '01/Jan/1965', '800-555-1211', 1);

INSERT INTO tb_clientes(id_cliente,nome,sobrenome,dt_nascimento,telefone,fg_ativo)
VALUES (2, 'Cynthia', 'Green', '05/Feb/1968', '800-555-1212', 1);

INSERT INTO tb_clientes(id_cliente,nome,sobrenome,dt_nascimento,telefone,fg_ativo)
VALUES (3, 'Steve', 'White', '16/Mar/1971', '800-555-1213', 1);

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (4, 'Gail', 'Black','', '800-555-1214', 1);

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (5, 'Doreen', 'Blue', '20/May/1970', NULL, 1);

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (6, 'Fred', 'Brown', '01/Jan/1970', '800-555-1215', 1);

COMMIT;

SELECT * FROM tb_clientes;

DESC(tb_tipos_produtos);

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (1, 'Book', 1);

INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES(2, 'Video', 1);

INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES(3, 'DVD', 1);

INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES(4, 'CD', 1);

INSERT INTO tb_tipos_produtos(id_tipo_produto, nm_tipo_produto, fg_ativo)
VALUES (5, 'Magazine', 1);

COMMIT;

SELECT * FROM tb_tipos_produtos;

DESC (tb_produtos);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES(1,1,'Modern Science', 'A description of modern science', 19.95, 1);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (2,1, 'Chemistry', 'Intrduction to Chemistry', 30, 1);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (3,2, 'Supernova', 'A star explodes', 25.99, 1);

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (4,2, 'Tank war', 'Action movie about a future war', 13.95, 1);

COMMIT;

SELECT * FROM tb_produtos;

DESC(tb_compras);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (1, 1, 1, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (2, 1, 3, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (1, 4, 1, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (2, 2, 1, 1);

INSERT INTO tb_compras(id_cliente, id_produto, quantidade, fg_ativo)
VALUES (1, 3, 1, 1);

SELECT * FROM tb_compras;

COMMIT;

DESC(tb_funcionarios);

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (1, NULL, 'James', 'Smith', 'CEO', 8000.00, 1);

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (2, 1, 'Ron', 'Johnson', 'Sales Manager', 6000.00, 1);

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (3, 2, 'Fred', 'Hobbs', 'Salesperson', 1500.00,1 );

INSERT INTO tb_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (4, 2, 'Susan', 'Jones', 'Salesperson', 5000.00,1);

COMMIT;

SELECT * FROM tb_funcionarios;

DESC(tb_grades_salarios);

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES (1, 1, 2500.00, 1);

INSERT INTO tb_grades_salarios(id_salario,base_salario, teto_salario, fg_ativo)
VALUES(2,2500.01,5000.00,1);

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES (3, 5000.01, 7500.00, 1);

INSERT INTO tb_grades_salarios(id_salario, base_salario, teto_salario, fg_ativo)
VALUES (4, 7500.01, 9999.99, 1);

COMMIT;

SELECT * from tb_grades_salarios;

UPDATE tb_clientes
SET sobrenome = 'Orange'
WHERE id_cliente = 2;

SELECT * FROM tb_clientes;

ROLLBACK;

-- Dá erro - integridade referencial
DELETE
FROM tb_clientes
WHERE id_cliente = 2;

-- CRIAÇÃO DE PROCEDURE
CREATE OR REPLACE PROCEDURE get_cliente(
          p_id_cliente IN tb_clientes.id_cliente%TYPE)
AS 
v_nome      tb_clientes.nome%TYPE;
v_sobrenome tb_clientes.spbrenome%TYPE;
v_controle  INTEGER;

BEGIN 
 SELECT COUNT(*) INTO v_controle
 FROM tb_clientes
 WHERE id_cliente = p_id_cliente;
 
IF(v_controle = 1) THEN
  SELECT nome, sobrenome INTO v_nome, v_sobrenome
  FROM tb_clientes
  WHERE id_cliente = p_id_cliente;
  
  DBMS_OUTPUT.PUT_LINE('Cliente localizado: ' || v_nome || ' ' || v_sobrenome);
  
ELSE 
  DBMS_OUTPUT.PUT_LINE('Cliente não localizado!');
END IF;

EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('Erro');
END get_cliente;~

CALL get_cliente(90);

-- PREFERÍVEL
SET serveroutput ON
BEGIN
  get_cliente(3);
END;