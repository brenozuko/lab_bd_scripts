-- QUESTÃO 1
SELECT nome, NVL(TO_CHAR(percentual_comissao, '%'), 'Nenhuma comissão') AS "COMISSÂO"
FROM tb_empregado;

-- QUESTÃO 2
SELECT MAX(salario) "Maior Salario", MIN(salario) "Menor Salário", 
       AVG(salario) "Média do salário", SUM(salario) "Soma dos salários"
FROM tb_empregado;

-- QUESTÃO 3

SELECT e.id_gerente, e.salario
FROM tb_empregado e
LEFT OUTER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
WHERE e.salario =  (SELECT MIN(salario) 
                    FROM tb_empregado 
                    WHERE id_gerente = g.id_empregado 
                    AND salario >= 1000)
AND g.id_empregado IS NOT NULL
ORDER BY e.salario DESC;

-- Questão 04

SELECT COUNT(id_empregado) "Total empregados", TO_CHAR(data_admissao, 'YYYY')
FROM tb_empregado
GROUP BY TO_CHAR(data_admissao, 'YYYY')
HAVING TO_CHAR(data_admissao, 'YYYY') IN ('1990', '1991', '1992', '1993');


SELECT
(SELECT COUNT(*) FROM tb_empregado) AS "total de empregados",
(SELECT COUNT(*) FROM tb_empregado WHERE TO_CHAR(data_admissao,'YYYY') = '1990') AS "contratados em 1990",
(SELECT COUNT(*) FROM tb_empregado WHERE TO_CHAR(data_admissao,'YYYY') = '1991') AS "contratados em 1991",
(SELECT COUNT(*) FROM tb_empregado WHERE TO_CHAR(data_admissao,'YYYY') = '1992') AS "contratados em 1992",
(SELECT COUNT(*) FROM tb_empregado WHERE TO_CHAR(data_admissao,'YYYY') = '1993') AS "contratados em 1993"
FROM dual;


