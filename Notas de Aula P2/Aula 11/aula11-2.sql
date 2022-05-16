
-- CREATE USER E GRANT
CREATE USER jean IDENTIFIED BY master;

CREATE USER henrique IDENTIFIED BY 0800
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CREATE SESSION TO jean;

GRANT CREATE SESSION TO jean;

CREATE USER fernando IDENTIFIED BY fernando1234;

CREATE USER sonia IDENTIFIED BY sonia1234;

GRANT CREATE SESSION TO fernando, sonia;

ALTER USER jean IDENTIFIED BY senha123alterada;

GRANT CREATE SESSION,
      CREATE USER,
      CREATE TABLE TO fernando;


-- WITH ADMIN OPTION - garante que o usuário possa conceder o privilégio atribuído para outro usuário

-- Apenas o privilégio concedido na query
GRANT EXECUTE ANY PROCEDURE TO fernando WITH ADMIN OPTION;

-- Conectado como Fernando em Exercicios
GRANT EXECUTE ANY PROCEDURE TO sonia;

GRANT EXECUTE ANY PROCEDURE TO PUBLIC;

-- Mostra o usuário
SHOW user;

-- Seleciona privilégios do usuário
SELECT *
FROM user_sys_privs
ORDER BY privilege;

-- Ao criar um user como fernando
CREATE USER roberto IDENTIFIED BY roberto1234;

--ORA-01031: privilégios insuficientes
DROP USER roberto;

-- Se você revoga um privilégio qualquer de um usuário, e o mesmo passou este privilégio a outro usuário, o privilégio desse usuário se mantém. Só é válido pra privilégios de sistema, quando é de objeto revogam-se todos.

REVOKE CREATE TABLE FROM fernando;

-- CONECTADO COMO LOJA - PRIVILÉGIOS DE OBJETO

GRANT SELECT, INSERT, UPDATE ON tb_produtos TO fernando;
GRANT SELECT ON tb_funcionarios TO fernando;

GRANT UPDATE(sobrenome, salario)
ON tb_funcionarios TO fernando;

GRANT SELECT ON tb_clientes TO fernando WITH GRANT OPTION;

-- conectado como Fernando em loja 

GRANT SELECT ON loja.tb_clientes TO sonia;

-- CONECTADO COMO LOJA

-- Verifica os privilégios concedidos em uma tabela específica
SELECT *
FROM user_tab_privs_made
WHERE table_name = 'TB_PRODUTOS';

-- Verifica privilégios concedidos em diversas tabelas
SELECT *
FROM user_col_privs_made;

-- CONECTADO COMO FERNANDO

-- Verifica quais privilégios fernando recebeu
SELECT *
FROM user_tab_privs_recd;


-- CONECTADO COMO SYSTEM

GRANT CREATE synonym TO fernando;

-- SYNONYMS - TO BE ADDED