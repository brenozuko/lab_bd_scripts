-- EXERCÍCIO 2

-- NÚMERO 1

--Inserção de dados table "tb_regiao"
INSERT INTO tb_regiao 
VALUES (1, 'Europa');

INSERT INTO tb_regiao
 VALUES (2, 'Américas');

INSERT INTO tb_regiao 
VALUES (3, 'Ásia');

INSERT INTO tb_regiao 
VALUES (4, 'Oriente Médio e África');

SELECT * FROM tb_regiao;


-- NÚMERO 2

--Inserção de dados table "tb_pais"

INSERT INTO tb_pais 
VALUES ( 'IT', 'Itália', 1);

INSERT INTO tb_pais 
VALUES ('JP', 'Japão', 3);

INSERT INTO tb_pais 
VALUES ('US', 'EUA', 2);

INSERT INTO tb_pais
VALUES ( 'CA', 'Canadá', 2);

INSERT INTO tb_pais
VALUES ( 'CN', 'China', 3);

INSERT INTO tb_pais
VALUES ( 'IN', 'Índia', 3);

INSERT INTO tb_pais
VALUES ( 'AU', 'Austrália', 3);

INSERT INTO tb_pais
VALUES ( 'ZW', 'Zimbábue', 4);

INSERT INTO tb_pais
VALUES ( 'SG', 'Cingapura', 3);

INSERT INTO tb_pais
VALUES ( 'UK', 'Reino Unido', 1);

INSERT INTO tb_pais
VALUES ( 'FR', 'França', 1);

INSERT INTO tb_pais
VALUES ( 'DE', 'Alemanha', 1);

INSERT INTO tb_pais
VALUES ( 'ZM', 'Zâmbia', 4);

INSERT INTO tb_pais
VALUES ( 'EG', 'Egito', 4);

INSERT INTO tb_pais
VALUES ( 'BR', 'Brasil', 2);

INSERT INTO tb_pais
VALUES ( 'CH', 'Suíça', 1);

INSERT INTO tb_pais
VALUES ( 'NL', 'Holanda', 1);

INSERT INTO tb_pais
VALUES ('MX', 'México', 2);

INSERT INTO tb_pais
VALUES ('KW', 'Kuweit', 4);

INSERT INTO tb_pais
VALUES ( 'IL', 'Israel', 4 );

INSERT INTO tb_pais
VALUES ( 'DK', 'Dinamarca', 1);

INSERT INTO tb_pais
VALUES ( 'HK', 'Hong Kong', 3);

INSERT INTO tb_pais
VALUES ( 'NG', 'Nigéria', 4 );

INSERT INTO tb_pais
VALUES ( 'AR', 'Argentina', 2);

INSERT INTO tb_pais
VALUES ( 'BE', 'Bélgica', 1 );

SELECT *
FROM tb_pais;

-- NÚMERO 3

-- Inserção de dados table "tb_localizacao"

INSERT INTO tb_localizacao
VALUES(1000, 'IT', 'Via Cola di Rie, 1297', '00989', 'Roma', NULL);

INSERT INTO tb_localizacao
VALUES ( 1100, 'IT', 'Calle della Testa, 93091', '10934', 'Veneza', NULL);

INSERT INTO tb_localizacao
VALUES ( 1200, 'JP', 'Shinjuku-ku, 2017 ', '1689', 'Tóquio', 'Prefeitura de Tóquio');

INSERT INTO tb_localizacao
VALUES ( 1300, 'JP', 'Kamiya-cho, 9450 ', '6823', 'Hiroshima', NULL);

INSERT INTO tb_localizacao
VALUES ( 1400, 'US' , 'Jabberwocky Rd, 2014 ', '26192', 'Southlake', 'Texas');

INSERT INTO tb_localizacao
VALUES (1500, 'US', 'Interiors Blvd, 2011 ', '99236', 'Sul de São Francisco', 'Califórnia');

INSERT INTO tb_localizacao
VALUES (1600, 'US', 'Zagora St, 2007 ', '50090', 'South Brunswick', 'New Jersey');

INSERT INTO tb_localizacao
VALUES (1700, 'US', 'Charade Rd, 2004 ', '98199', 'Seattle', 'Washington');

INSERT INTO tb_localizacao
VALUES (1800, 'CA', 'Spadina Ave, 147 ', 'M5V 2L7', 'Toronto', 'Ontário');

INSERT INTO tb_localizacao
VALUES (1900, 'CA', 'Boxwood St, 6092 ', 'YSW 9T2', 'Whitehorse', 'Yukon');

INSERT INTO tb_localizacao
VALUES (2000, 'CN', 'Laogianggen, 40-5-12', '190518', 'Pequim', NULL);

INSERT INTO tb_localizacao
VALUES (2100, 'IN', 'Vileparle (E), 1298 ', '490231', 'Bombaim', 'Maharashtra');

INSERT INTO tb_localizacao
VALUES (2200, 'AU', 'Victoria Street, 12-98', '2901', 'Sydney', 'Nova Gales do Sul');

INSERT INTO tb_localizacao
VALUES (2300, 'SG', 'Clementi North, 198 ', '540198', 'Cingapua', NULL);

INSERT INTO tb_localizacao
VALUES (2400, 'UK', 'Arthur St, 8204 ', NULL, 'Londres', NULL);

INSERT INTO tb_localizacao
VALUES (2500, 'UK', 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford');

INSERT INTO tb_localizacao
VALUES (2600, 'UK', 'Chester Road, 9702 ', '09629850293', 'Stretford', 'Manchester');

INSERT INTO tb_localizacao
VALUES (2700, 'DE', 'Schwanthalerstr. 7031', '80925', 'Munique', 'Bavaria');

INSERT INTO tb_localizacao
VALUES (2800, 'BR', 'Rua Frei Caneca 1360 ', '01307-002', 'São Paulo', 'São Paulo');

INSERT INTO tb_localizacao
VALUES (2900, 'CH', 'Rue des Corps-Saints, 20', '1730', 'Geneva', 'Geneve');

INSERT INTO tb_localizacao
VALUES (3000, 'CH', 'Murtenstrasse 921', '3095', 'Bern', 'BE');

INSERT INTO tb_localizacao
VALUES (3100, 'NL', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht');

INSERT INTO tb_localizacao
VALUES (3200, 'MX', 'Mariano Escobedo 9991', '11932', 'Cidade do México', 'Distrito Federal');

SELECT *
FROM tb_localizacao;

-- NÚMERO 4

-- Inserção de dados table "tb_departamento"
-- Desativando a restrição de integridade da “tb_empregado” para carregar os dados

ALTER TABLE tb_departamento
  DISABLE CONSTRAINT fk_gerente_depto;

INSERT INTO tb_departamento
VALUES (10, 'Administração', 200, 1700);

INSERT INTO tb_departamento
VALUES (20, 'Marketing', 201, 1800);

INSERT INTO tb_departamento
VALUES (30, 'Aquisição', 114, 1700);

INSERT INTO tb_departamento
VALUES (40, 'Recursos Humanos', 203, 2400);

INSERT INTO tb_departamento
VALUES (50, 'Expedição', 121, 1500);

INSERT INTO tb_departamento
VALUES (60, 'TI', 103, 1400);

INSERT INTO tb_departamento
VALUES (70, 'Relações Públicas', 204, 2700);


INSERT INTO tb_departamento
VALUES (80, 'Vendas', 145, 2500);

INSERT INTO tb_departamento
VALUES (90, 'Executivo', 100, 1700);

INSERT INTO tb_departamento
VALUES (100, 'Financeiro', 108, 1700);

INSERT INTO tb_departamento
VALUES (110, 'Contabilidade', 205, 1700);

INSERT INTO tb_departamento
VALUES (120, 'Tesouraria', NULL, 1700);

INSERT INTO tb_departamento
VALUES (130, 'Corporativo', NULL, 1700);

INSERT INTO tb_departamento
VALUES (140, 'Controle de Crédito', NULL, 1700);

INSERT INTO tb_departamento
VALUES (150, 'Suporte de Serviços', NULL, 1700);

INSERT INTO tb_departamento
VALUES (160, 'Benefícios', NULL, 1700);

INSERT INTO tb_departamento
VALUES (170, 'Fábrica', NULL, 1700);

INSERT INTO tb_departamento
VALUES (180, 'Construção', NULL, 1700);

INSERT INTO tb_departamento
VALUES (190, 'Contratante', NULL, 1700);

INSERT INTO tb_departamento
VALUES (200, 'Operações', NULL, 1700);

INSERT INTO tb_departamento
VALUES (210, 'Suporte de TI', NULL, 1700);

INSERT INTO tb_departamento
VALUES (220, 'NOC', NULL, 1700);

INSERT INTO tb_departamento
VALUES (230, 'Helpdesk', NULL, 1700);

INSERT INTO tb_departamento
VALUES (240, 'Vendas Governo', NULL, 1700);

INSERT INTO tb_departamento
VALUES (250, 'Vendas Varejo', NULL, 1700);

INSERT INTO tb_departamento
VALUES (260, 'Recrutamento', NULL, 1700);

INSERT INTO tb_departamento
VALUES (270, 'Folha de Pagamentos', NULL, 1700);

SELECT *
FROM tb_departamento;

-- NÚMERO 5

-- Inserção dos dados table "tb_funcao"

INSERT INTO tb_funcao
VALUES ('AD_PRES', 'Presidente', 20000, 40000);

INSERT INTO tb_funcao
VALUES ('AD_VP', 'Vice Presidente Administrativo', 15000, 30000);

INSERT INTO tb_funcao
VALUES ('AD_ASST', 'Assistente Administrativo', 3000, 6000);

INSERT INTO tb_funcao
VALUES ('FI_MGR', 'Gerente Financeiro', 8200, 16000);

INSERT INTO tb_funcao
VALUES ('SA_REP', 'Representante de Vendas', 6000, 12000);

INSERT INTO tb_funcao
VALUES ('PU_MAN', 'Gerente de Compras', 8000, 15000);

INSERT INTO tb_funcao
VALUES ('PU_CLERK', 'Compras', 2500, 5500);

INSERT INTO tb_funcao
VALUES ('ST_MAN', 'Gerente de Estoque', 5500, 8500);

INSERT INTO tb_funcao
VALUES ('ST_CLERK', 'Estoque', 2000, 5000);

INSERT INTO tb_funcao
VALUES ('SH_CLERK', 'Despachante', 2500, 5500);

INSERT INTO tb_funcao
VALUES ('IT_PROG', 'Programador', 4000, 10000);

INSERT INTO tb_funcao
VALUES ('MK_MAN', 'Gerente de Marketing', 9000, 15000);

INSERT INTO tb_funcao
VALUES ('MK_REP', 'Representante de Marketing', 4000, 9000);

INSERT INTO tb_funcao
VALUES ( 'HR_REP', 'Representante de RH', 4000, 9000);

INSERT INTO tb_funcao
VALUES ('PR_REP', 'Representante de Relações Pública', 4500, 10500);

SELECT *
FROM tb_funcao;