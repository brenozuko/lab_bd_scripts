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

DELETE
FROM tb_clientes
WHERE id_cliente = 2;

CREATE OR REPLACE PROCEDURE get_cliente(
          p_id_cliente IN tb_clientes.id_cliente%TYPE)
AS 
v_nome      tb_clientes.nome%TYPE;
v_sobrenome tb_clientes.sobrenome%TYPE;
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
END get_cliente;
 
CALL get_cliente(90);

SET serveroutput ON
BEGIN
  get_cliente(3);
END;

-- INSERTS EM FUNCIONÁRIO
INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (5, 2, 'Rob', 'Green', 'Sales Person', 400000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (6, 4, 'Jane', 'Brown', 'Support Person', 450000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (7, 4, 'John', 'Grey', 'Support Manager', 300000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (8, 7, 'Jean', 'Blue', 'Support Person', 290000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (9, 6, 'Henry', 'Heyson', 'Support Person', 300000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (10, 1, 'Kevin', 'Black', 'Ops Manager', 100000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (11, 10, 'Keith', 'Long', 'Ops Person', 500000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (12, 10, 'Frank', 'Howard', 'Ops Person', 450000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (13, 10, 'Doreen', 'Penn', 'Ops Person', 470000, 1);

-- commit the transaction
COMMIT;

-- INSERTS EM PRODUTO
INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (6, 2, 'Z Files', 'Series on mysterious activities', 49.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (7, 2, '2412: The Return', 'Aliens return', 14.95, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (8, 3, 'Space Force 9', 'Adventures of heroes', 13.49, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (9, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (10, 4, 'Classical Music', 'The best classical music', 10.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (11, 4, 'Pop 3', 'The best popular music', 15.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (12, 4, 'Creative Yell', 'Debut album', 14.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)  
VALUES (13, NULL, 'My Front Line', 'Their greatest hits', 13.49, 1);

COMMIT;

CREATE TABLE tb_promocao (
  id_promocao        INTEGER CONSTRAINT pk_promocao PRIMARY KEY,
  nome               VARCHAR2(30) NOT NULL,
  duracao            INTERVAL DAY(3) TO SECOND (4)
);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(1, '10% off Z Files', INTERVAL '3' DAY);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(2, '20% off Pop 3', INTERVAL '2' HOUR);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(3, '30% off Modern Science', INTERVAL '25' MINUTE);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(4, '20% off Tank War', INTERVAL '45' SECOND);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(5, '10% off Chemistry', INTERVAL '3 2:25' DAY TO MINUTE);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(6, '20% off Creative Yell', INTERVAL '3 2:25:45' DAY TO SECOND);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(7, '15% off My Front Line', INTERVAL '123 2:25:45.12' DAY(3) TO SECOND(2));

SELECT * FROM tb_promocao;

COMMIT;

-- SELEÇÃO DE COLUNAS ESPECÍFICAS
SELECT id_cliente, nome, sobrenome, dt_nascimento, telefone 
FROM tb_clientes;

-- SELEÇÃO DE TODAS AS COLUNAS
SELECT *
FROM tb_clientes
WHERE id_cliente = 2;

-- SELEÇÃO DE ID DA LINHA E COLUNA
SELECT ROWID, id_cliente
FROM tb_clientes;

-- SELEÇÃO DE NUMERO DA LINHA E COLUNAS
SELECT ROWNUM, id_cliente, nome, sobrenome 
FROM tb_clientes;

-- SELEÇÃO DE NÚMERO DA LINHA E COLUNAS COM APENAS UMA TUPLA
SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 3;

-- CALCULADORA SQL
SELECT 2 * 6
FROM dual;

-- PRECEDÊNCIAS
SELECT 10 * 12/ 3 - 1
FROM dual;

SELECT 10 * (12/3 - 1)
FROM dual;

-- DATAS
SELECT TO_DATE('22/JUN/2020') + 2
FROM dual;

SELECT TO_DATE('31/DEZ/2020') - TO_DATE('22/JUN/2020')
FROM dual;