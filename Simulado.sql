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


-- Questão 05

SELECT id_empregado || ', ' || nome || ', ' || sobrenome || ', ' || email || ', ' || telefone || ', ' || data_admissao || ', ' ||
       id_funcao || ', ' || salario || ', ' || percentual_comissao || ', ' || id_gerente || ', ' || id_departamento AS SAIDA
FROM tb_empregado;

-- Questão 06

SELECT id_funcao "Descrição da Função",
CASE
  WHEN id_funcao = 'SH_CLERK'     THEN 'A'
  WHEN id_funcao = 'ST_MAN'       THEN 'B'
  WHEN id_funcao = 'AC_ACCOUNT'   THEN 'C'
  WHEN id_funcao = 'AC_MGR'       THEN 'D'
  WHEN id_funcao = 'IT_PROG'      THEN 'E'
  ELSE '0' 
END AS "Grade"
FROM tb_empregado;

-- Questão 07

SELECT nome, MONTHS_BETWEEN(sysdate, data_admissao) "Meses Trabalhados"
FROM tb_empregado
ORDER BY MONTHS_BETWEEN(sysdate, data_admissao);



-- Questão 08

SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
WHERE e.percentual_comissao IS NOT NULL;


-- Questão 09
GRANT UPDATE ON tb_departamento TO joao WITH GRANT OPTION;

