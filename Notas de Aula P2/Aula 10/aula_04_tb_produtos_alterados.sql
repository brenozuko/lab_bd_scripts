CREATE TABLE tb_produtos_alterados(
id_produto          INTEGER,
id_tipo_produto     INTEGER,
nm_produto          VARCHAR2(30) NOT NULL,
ds_produto          VARCHAR2(50),
preco               NUMBER(5, 2),
fg_ativo            INTEGER,
PRIMARY KEY (id_produto),
FOREIGN KEY (id_tipo_produto) REFERENCES tb_tipos_produtos(id_tipo_produto)
);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(1, 1, 'Modern Science',40, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(2, 1, 'New Chemistry',35, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(3, 1, 'Super Nova',25.99, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(13, 2, 'Lunar Landing',15.99, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(14, 2, 'Submarine',15.99, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(15, 2, 'Airplane',15.99, 1);

COMMIT;