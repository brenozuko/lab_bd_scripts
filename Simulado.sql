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




