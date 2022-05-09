CREATE TABLE tb_divisoes (
id_divisao    CHAR(3),
nm_divisao    VARCHAR2(15) NOT NULL,
PRIMARY KEY (id_divisao)
);

-- insert sample data into divisions table
INSERT INTO tb_divisoes (id_divisao, nm_divisao) 
VALUES ('SAL', 'Sales');

INSERT INTO tb_divisoes (id_divisao, nm_divisao) 
VALUES ('OPE', 'Operations');

INSERT INTO tb_divisoes (id_divisao, nm_divisao) 
VALUES ('SUP', 'Support');

INSERT INTO tb_divisoes (id_divisao, nm_divisao) 
VALUES ('BUS', 'Business');

-- commit the transaction
COMMIT;