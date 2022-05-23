-- Nome do DB: Oracle_11gR2
-- Tipo de conexão: TNS
-- Apelido da rede: ORCL
-- Usuario e senha padrão: system e oracle

CREATE USER loja IDENTIFIED BY loja_senha;
GRANT connect, resource TO loja;

