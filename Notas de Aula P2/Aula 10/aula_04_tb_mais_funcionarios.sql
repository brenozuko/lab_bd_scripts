CREATE TABLE tb_mais_funcionarios (
id_funcionario          INTEGER,
id_gerente              INTEGER,
nome                    VARCHAR2(10) NOT NULL,
sobrenome               VARCHAR2(10) NOT NULL,
cargo                   VARCHAR2(20),
salario                 NUMBER(6, 0),
fg_ativo                INTEGER,
PRIMARY KEY (id_funcionario),
FOREIGN KEY (id_gerente) REFERENCES tb_mais_funcionarios(id_funcionario)
);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)
VALUES (1, NULL, 'James', 'Smith', 'CEO', 800000, 1);
     
INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (3, 2, 'Fred', 'Hobbs', 'Sales Person', 200000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (4, 1, 'Susan', 'Jones', 'Support Manager', 500000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (5, 2, 'Rob', 'Green', 'Sales Person', 40000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (6, 4, 'Jane', 'Brown', 'Support Person', 45000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (7, 4, 'John', 'Grey', 'Support Manager', 30000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (8, 7, 'Jean', 'Blue', 'Support Person', 29000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (9, 6, 'Henry', 'Heyson', 'Support Person', 30000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (10, 1, 'Kevin', 'Black', 'Ops Manager', 100000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (11, 10, 'Keith', 'Long', 'Ops Person', 50000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (12, 10, 'Frank', 'Howard', 'Ops Person', 45000, 1);

INSERT INTO tb_mais_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (13, 10, 'Doreen', 'Penn', 'Ops Person', 47000, 1);

-- commit the transaction
COMMIT;