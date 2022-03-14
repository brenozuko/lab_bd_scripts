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

COMMIT;