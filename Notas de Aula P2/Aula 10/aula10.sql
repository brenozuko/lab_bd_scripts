-- DECODE
SELECT id_produto, disponivel, 
DECODE(disponivel, 'Y', 'Produto está disponível', 'Produto não está disponível')
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto,
       DECODE(id_tipo_produto,
              1, 'Book',
              2, 'Video',
              3, 'DVD',
              4, 'CD',
              'Magazine')
FROM tb_produtos;

-- CASE
SELECT id_produto, id_tipo_produto,
  CASE 
    WHEN id_tipo_produto = 1 THEN 'Book'
    WHEN id_tipo_produto = 2 THEN 'Video'
    WHEN id_tipo_produto = 3 THEN 'DVD'
    WHEN id_tipo_produto = 4 THEN 'CD'
    ELSE 'Magazine'
  END
FROM tb_produtos;


SELECT id_produto, preco,
  CASE
    WHEN preco > 15.00 THEN 'Caro'
    ELSE 'Barato'
  END
FROM tb_produtos;

-- CONSULTAS HIERÁRQUICAS
SELECT id_fncionario, id_gerente, nome, sobrenome
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente
ORDER BY 1;

-- ROLLUP
SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP(id_divisao, id_cargo)
ORDER BY id_divisao,id_cargo;

-- CUBE

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY CUBE(id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;~

-- CASE E ROLLUP

SELECT
  CASE GROUPING(id_divisao)
    WHEN 1 THEN 'Todas as divisões'
    ELSE id_divisao
  END AS DIV, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP(id_divisao)
ORDER BY id_divisao;

-- INSERTS ATÍPICOS

INSERT INTO tb_clientes
VALUES(10, 'Kyle', 'O''Malley', NULL, NULL, 1);

INSERT INTO tb_produtos(id_produto,
                        id_tipo_produto,
                        nm_produto,
                        ds_produto,
                        preco,
                        fg_ativo)
VALUES
(14,1,'The "Great" Gatsby', NULL, 12.99, 1);

INSERT INTO tb_clientes (id_cliente,
                         nome,
                         sobrenome)
SELECT 11, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 1;

-- UPDATES

UPDATE tb_clientes
SET sobrenome='Orange'
WHERE id_cliente = 2;

UPDATE tb_produtos
SET
  preco = preco*1.20,
  nm_produto = LOWER(nm_produto)
WHERE preco > 20.00;

-- SET COM RETURNING
SET SERVEROUTPUT ON
DECLARE media_preco_produto NUMBER;
BEGIN 
  UPDATE tb_produtos
    SET preco = preco * 0.75
    RETURNING AVG(preco) INTO media_preco_produto;

DBMS_OUTPUT.PUT_LINE('Valor da variável: ' || ROUND(media_preco_produto, 2));
END;

-- DELETE
DELETE 
FROM tb_clientes
WHERE id_cliente = 10;



-- PRIMARY KEY CRIA AUTOMATICAMENTE: UNIQUE, NOT NULL E INDEX

-- INTEGRIDADE DO BANCO

-- ERRO ORA-00001 - PRIMARY KEY FERIDA
INSERT INTO tb_clientes(id_cliente,
                        nome,
                        sobrenome,
                        dt_nascimento,
                        telefone,
                        fg_ativo)
VALUES
(1, 'Jason', 'Price', '01-JAN-60', '800-555-1211', 1);


UPDATE tb_clientes
  SET id_cliente = 1
WHERE id_cliente = 2;

-- ERRO ORA-02291 - FOREIGN KEY VIOLADA

UPDATE tb_clientes
  SET id_cliente = 1
WHERE id_cliente = 2;

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, 
                        ds_produto, preco, fg_ativo)
VALUES 
(15,6,'Teste', 'Teste', null, 1);

UPDATE tb_produtos
SET id_tipo_produto = 6
WHERE id_produto = 1;

DELETE 
FROM tb_tipos_produtos
WHERE id_tipo_produto = 1;
                        

-- VALOR PADRÃO 
CREATE TABLE tb_status_encomenda(
id_status_encomenda       INTEGER,
status                    VARCHAR2(40) DEFAULT 'Encomenda disponibilizada' NOT NULL,
ultima_modificacao        DATE DEFAULT SYSDATE,
PRIMARY KEY (id_status_encomenda)
);


INSERT INTO tb_status_encomenda(id_status_encomenda)
VALUES(1);

INSERT INTO tb_status_encomenda(id_status_encomenda,
                                status,
                                ultima_modificacao)
VALUES(2,'Encomenda enviada', '01-MAI-2013');