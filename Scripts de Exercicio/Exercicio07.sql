-- QUESTÃO 1

SELECT e.nome, f.ds_funcao, e.data_admissao
FROM tb_empregado e 
INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
WHERE e.data_admissao BETWEEN TO_DATE('20-FEV-1987') AND TO_DATE('01-MAI-1989')
ORDER BY e.data_admissao ASC;

-- QUESTÃO 2

SELECT UPPER(e.nome || ' ' || e.sobrenome) "Nome do Empregado", LENGTH(e.sobrenome) "Tamanho do sobrenome", 
d.nm_departamento, p.nm_pais 
FROM tb_empregado e 
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
INNER JOIN tb_pais p ON(l.id_pais = p.id_pais)
WHERE UPPER(e.nome) LIKE 'B%'
OR UPPER(e.nome) LIKE 'L%'
OR UPPER(e.nome) LIKE 'A%';

-- QUESTÃO 3


SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
