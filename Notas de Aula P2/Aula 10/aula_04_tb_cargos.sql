CREATE TABLE tb_cargos (
id_cargo  CHAR(3),
nm_cargo  VARCHAR2(20) NOT NULL,
PRIMARY KEY(id_cargo)
);

-- insert sample data into jobs table
INSERT INTO tb_cargos (id_cargo, nm_cargo) 
VALUES ('WOR', 'Worker');

INSERT INTO tb_cargos (id_cargo, nm_cargo) 
VALUES ('MGR', 'Manager');

INSERT INTO tb_cargos (id_cargo, nm_cargo) 
VALUES ('ENG', 'Engineer');

INSERT INTO tb_cargos (id_cargo, nm_cargo) 
VALUES ('TEC', 'Technologist');

INSERT INTO tb_cargos (id_cargo, nm_cargo) 
VALUES ('PRE', 'President');

-- commit the transaction
COMMIT;