-- Questão (01)

SELECT nome,
NVL(TO_CHAR(percentual_comissao), 'Nenhuma Comissão') COMISSÃO
FROM tb_empregado;

-- Questão (02)

SELECT ROUND(MAX(salario),0) "Máximo",
ROUND(MIN(salario),0) "Mínimo",
ROUND(SUM(salario),0) "Somatório",
ROUND(AVG(salario),0) "Média"
FROM tb_empregado;

-- Questão (03)

SELECT id_gerente, MIN(salario)
FROM tb_empregado
WHERE id_gerente IS NOT NULL
GROUP BY id_gerente
HAVING MIN(salario) > 1000
ORDER BY MIN(salario) DESC;

-- Questão (04)

SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1990,1,0)) "1990",
SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1991,1,0)) "1991",
SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1992,1,0)) "1992",
SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1993,1,0)) "1993"
FROM tb_empregado;

-- Questão (05)

SELECT id_empregado || ',' || nome || ','|| id_funcao || ',' ||
id_gerente || ',' || data_admissao || ',' ||
salario || ',' || percentual_comissao || ',' || id_departamento SAIDA
FROM tb_empregado;

-- Questão (06)

SELECT id_funcao, DECODE(id_funcao,'IT_PROG', 'E',
'AC_MGR', 'D',
'AC_ACCOUNT', 'C',
'ST_MAN', 'B',
'SH_CLERK', 'A',
'0') GRADE
FROM tb_empregado;

-- Questão (07)

SELECT nome, MONTHS_BETWEEN(SYSDATE, data_admissao) MESES_TRABALHADO
FROM tb_empregado
ORDER BY MONTHS_BETWEEN(SYSDATE, data_admissao);

-- Questão (08)

SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e, tb_departamento d, tb_localizacao l
WHERE e.id_departamento = d.id_departamento
AND d.id_localizacao = l.id_localizacao
AND e.percentual_comissao IS NOT NULL;

-- Questão (09)

GRANT UPDATE ON tb_departamento TO joao WITH GRANT OPTION;

-- Questão (10)

SELECT id_empregado, REPLACE(id_funcao, 'SH', 'SHIPPING')
FROM tb_empregado
WHERE SUBSTR(id_funcao, 1, 2) = 'SH';




