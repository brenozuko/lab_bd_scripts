-- SEQUENCIAS

CREATE SEQUENCE seq_teste;

CREATE SEQUENCE seq_teste_2
START WITH 10 INCREMENT BY 5
MINVALUE 10 MAXVALUE 20
CYCLE CACHE 2 ORDER;

CREATE SEQUENCE seq_teste_3
START WITH 10 INCREMENT BY -1
MINVALUE 1 MAXVALUE 10
CYCLE CACHE 5;

-- CHECA SEQUÊNCIAS CRIADAS
SELECT * 
FROM user_sequences
ORDER BY sequence_name;


-- INCREMENTO APLICADO AUTOMATICAMENTE
SELECT seq_teste.nextval
FROM dual;

-- Pega o valor atual da sequência
SELECT seq_teste.currval
FROM dual;

-- Testes SEQ 2 e SEQ 3
SELECT seq_teste_2.nextval
FROM dual;

SELECT seq_teste_3.nextval
FROM dual;

-- TESTANDO APLICABILIDADE DA SEQUÊNCIA

CREATE TABLE tb_status_encomenda_2(
id_status             INTEGER CONSTRAINT pk_status_enc_2_new PRIMARY KEY,
status                VARCHAR2(10),
ultima_modificacao    DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq_status_enc_2 NOCACHE;

INSERT INTO tb_status_encomenda_2(id_status,
                                  status,
                                  ultima_modificacao)
VALUES
(seq_status_enc_2.nextval, 'Enviado', '01-JAN-2013');

SELECT * FROM tb_status_encomenda_2;

INSERT INTO tb_status_encomenda_2(id_status,
                                  status,
                                  ultima_modificacao)
VALUES
(seq_status_enc_2.nextval, 'Pendente', '01-MAR-2013');

-- ALTERANDO SEQUÊNCIA

ALTER SEQUENCE seq_teste
INCREMENT BY 2;

-- DROPANDO SEQUENCIA
DROP SEQUENCE seq_teste_3;