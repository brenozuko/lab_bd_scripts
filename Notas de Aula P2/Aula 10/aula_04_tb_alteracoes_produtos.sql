CREATE TABLE tb_alteracoes_produtos (
  id_produto          INTEGER,
  id_tipo_produto     INTEGER,
  nm_produto          VARCHAR2(30) NOT NULL,
  descricao           VARCHAR2(50),
  preco               NUMBER(5, 2),
  PRIMARY KEY(id_produto),
  FOREIGN KEY(id_tipo_produto) REFERENCES tb_tipos_produtos(id_tipo_produto)
);

INSERT INTO tb_alteracoes_produtos (id_produto, id_tipo_produto, nm_produto, descricao, preco) 
VALUES (1, 1, 'Modern Science', 'A description of modern science', 40.00);

INSERT INTO tb_alteracoes_produtos (id_produto, id_tipo_produto, nm_produto, descricao, preco) 
VALUES (2, 1, 'New Chemistry', 'Introduction to Chemistry', 35.00);

INSERT INTO tb_alteracoes_produtos (id_produto, id_tipo_produto, nm_produto, descricao, preco) 
VALUES (3, 1, 'Supernova', 'A star explodes', 25.99);

INSERT INTO tb_alteracoes_produtos (id_produto, id_tipo_produto, nm_produto, descricao, preco) 
VALUES (13, 2, 'Lunar Landing', 'Documentary', 15.99);

INSERT INTO tb_alteracoes_produtos (id_produto, id_tipo_produto, nm_produto, descricao, preco) 
VALUES (14, 2, 'Submarine', 'Documentary', 15.99);

INSERT INTO tb_alteracoes_produtos (id_produto, id_tipo_produto, nm_produto, descricao, preco) 
VALUES (15, 2, 'Airplane', 'Documentary', 15.99);

-- commit the transaction
COMMIT;