-- Tipo de conexão: TNS
-- Apelido da rede: ORSL
-- Usuario e senha padrão: system e oracle

CREATE USER loja IDENTIFIED BY loja_senha;
GRANT connect, resource TO loja;

