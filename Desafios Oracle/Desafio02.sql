-- Exercício 05

-- MINHA RESOLUÇÃO
DESC tb_empregado;

-- SCRIPT SEPARADO
SELECT e.id_empregado, e.nome, e.sobrenome, f.ds_funcao, e.data_admissao
FROM tb_empregado e
INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
ORDER BY 1;
-- FIM DO SCRIPT

@ /home/oracle/item_5.sql

-- RESOLUÇÃO DE AULA 

DESC tb_empregado;

SELECT e.id_empregado, e.nome || ' ' || e.sobrenome, f.ds_funcao,
       e.data_admissao
FROM tb_empregado e
INNER JOIN tb_funcao f ON(e.id_funcao = f.id_funcao);

@ \home\oracle\item_5.sql