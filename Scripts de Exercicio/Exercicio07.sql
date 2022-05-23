-- QUESTÃO 1

SELECT e.nome, f.ds_funcao, e.data_admissao
FROM tb_empregado e 
INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
WHERE e.data_admissao BETWEEN TO_DATE('20-FEV-1987') AND TO_DATE('01-MAI-1989')
ORDER BY e.data_admissao ASC;

