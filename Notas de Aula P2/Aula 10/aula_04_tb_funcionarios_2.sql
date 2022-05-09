CREATE TABLE tb_funcionarios_2 (
id_funcionario      INTEGER,
id_divisao          CHAR(3),
id_cargo            CHAR(3),
nome                VARCHAR2(10) NOT NULL,
sobrenome           VARCHAR2(10) NOT NULL,
salario             NUMBER(6,0),
PRIMARY KEY(id_funcionario),
FOREIGN KEY(id_divisao) REFERENCES tb_divisoes(id_divisao),
FOREIGN KEY(id_cargo) REFERENCES tb_cargos(id_cargo)
);

-- insert sample data into employees2 table
INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario) 
VALUES (1, 'BUS', 'PRE', 'James', 'Smith', 800000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (2, 'SAL', 'MGR', 'Ron', 'Johnson', 350000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (3, 'SAL', 'WOR', 'Fred', 'Hobbs', 140000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (4, 'SUP', 'MGR', 'Susan', 'Jones', 200000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (5, 'SAL', 'WOR', 'Rob', 'Green', 350000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (6, 'SUP', 'WOR', 'Jane', 'Brown', 200000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (7, 'SUP', 'MGR', 'John', 'Grey', 265000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (8, 'SUP', 'WOR', 'Jean', 'Blue', 110000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (9, 'SUP', 'WOR', 'Henry', 'Heyson', 125000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (10, 'OPE', 'MGR', 'Kevin', 'Black', 225000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (11, 'OPE', 'MGR', 'Keith', 'Long', 165000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (12, 'OPE', 'WOR', 'Frank', 'Howard', 125000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (13, 'OPE', 'WOR', 'Doreen', 'Penn', 145000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (14, 'BUS', 'MGR', 'Mark', 'Smith', 155000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (15, 'BUS', 'MGR', 'Jill', 'Jones', 175000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (16, 'OPE', 'ENG', 'Megan', 'Craig', 245000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (17, 'SUP', 'TEC', 'Matthew', 'Brant', 115000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (18, 'OPE', 'MGR', 'Tony', 'Clerke', 200000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (19, 'BUS', 'MGR', 'Tanya', 'Conway', 200000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (20, 'OPE', 'MGR', 'Terry', 'Cliff', 215000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (21, 'SAL', 'MGR', 'Steve', 'Green', 275000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (22, 'SAL', 'MGR', 'Roy', 'Red', 375000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (23, 'SAL', 'MGR', 'Sandra', 'Smith', 335000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (24, 'SAL', 'MGR', 'Gail', 'Silver', 225000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (25, 'SAL', 'MGR', 'Gerald', 'Gold', 245000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (26, 'SAL', 'MGR', 'Eileen', 'Lane', 235000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (27, 'SAL', 'MGR', 'Doreen', 'Upton', 235000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (28, 'SAL', 'MGR', 'Jack', 'Ewing', 235000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (29, 'SAL', 'MGR', 'Paul', 'Owens', 245000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (30, 'SAL', 'MGR', 'Melanie', 'York', 255000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (31, 'SAL', 'MGR', 'Tracy', 'Yellow', 225000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (32, 'SAL', 'MGR', 'Sarah', 'White', 235000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (33, 'SAL', 'MGR', 'Terry', 'Iron', 225000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (34, 'SAL', 'MGR', 'Christine', 'Brown', 247000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (35, 'SAL', 'MGR', 'John', 'Brown', 249000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)  
VALUES (36, 'SAL', 'MGR', 'Kelvin', 'Trenton', 255000);

INSERT INTO tb_funcionarios_2 (id_funcionario, id_divisao, id_cargo, nome, sobrenome, salario)   
VALUES (37, 'BUS', 'WOR', 'Damon', 'Jones', 280000);

-- commit the transaction
COMMIT;