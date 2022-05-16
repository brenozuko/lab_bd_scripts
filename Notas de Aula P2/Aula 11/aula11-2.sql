
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
