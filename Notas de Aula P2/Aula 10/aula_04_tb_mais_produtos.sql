CREATE TABLE tb_mais_produtos (
  id_produto          INTEGER,
  id_tipo_produto     INTEGER,
  nm_produto          VARCHAR2(30) NOT NULL,
  disponivel          CHAR(1),
  PRIMARY KEY (id_produto),
  FOREIGN KEY (id_tipo_produto) REFERENCES tb_tipos_produtos(id_tipo_produto)
);

INSERT INTO tb_mais_produtos (id_produto, id_tipo_produto, nm_produto, disponivel) 
VALUES (1, 1, 'Modern Science', 'Y');

INSERT INTO tb_mais_produtos (id_produto, id_tipo_produto, nm_produto, disponivel)
VALUES (2, 1, 'Chemistry', 'Y');

INSERT INTO tb_mais_produtos (id_produto, id_tipo_produto, nm_produto, disponivel) 
VALUES (3, NULL, 'Supernova', 'N');

INSERT INTO tb_mais_produtos (id_produto, id_tipo_produto, nm_produto, disponivel) 
VALUES (4, 2, 'Lunar Landing', 'N');

INSERT INTO tb_mais_produtos (id_produto, id_tipo_produto, nm_produto, disponivel) 
VALUES (5, 2, 'Submarine', 'Y');

-- commit the transaction
COMMIT;