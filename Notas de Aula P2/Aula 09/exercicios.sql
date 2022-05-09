-- EXERCÍCIO 1

-- Minha resolução
SELECT sobrenome, id_departamento, salario
FROM tb_empregado externa
WHERE (id_departamento, salario) IN (SELECT id_departamento, salario
                                     FROM tb_empregado interna
                                     WHERE interna.id_departamento = externa.id_departamento
                                     AND interna.salario = externa.salario
                                     AND interna.percentual_comissao > 0);
                                     
                                                     

-- Resolução de aula
SELECT sobrenome, id_departamento, salario
FROM tb_empregado
WHERE (salario, id_departamento) IN (SELECT salario, id_departamento
                                     FROM tb_empregado
                                     WHERE percentual_comissao IS NOT NULL);



-- EXERCÍCIO 2

-- MINHA RESOLUÇÃO

SELECT e.sobrenome, d.nm_departamento, e.salario
FROM tb_empregado e
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
WHERE (e.salario, NVL(e.percentual_comissao, 0)) IN (SELECT e.salario, NVL(e.percentual_comissao,0)
                                                     FROM tb_empregado e
                                                     INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
                                                     WHERE d.id_localizacao = 1700);

-- RESOLUÇÃO DE AULA
SELECT e.sobrenome, d.nm_departamento, e.salario
FROM tb_empregado e, tb_departamento d
WHERE e.id_departamento = d.id_departamento
AND (salario, NVL(percentual_comissao, 0)) IN (SELECT salario, NVL(percentual_comissao, 0)
                                               FROM tb_empregado e, tb_departamento d
                                               WHERE e.id_departamento = d.id_departamento
                                               AND d.id_localizacao = 1700);

-- EXERCÍCIO 3

-- MINHA RESOLUÇÂO
SELECT sobrenome, salario
FROM tb_empregado
WHERE salario = (SELECT salario
                 FROM tb_empregado
                 WHERE sobrenome = 'Kochhar')
AND sobrenome != 'Kochhar';

-- RESOLUÇÃO DE AULA
SELECT sobrenome, salario
FROM tb_empregado
WHERE (salario, NVL(percentual_comissao, 0)) = (SELECT salario, NVL(percentual_comissao, 0)
                                                FROM tb_empregado
                                                WHERE sobrenome = 'Kochhar')
AND sobrenome != 'Kochhar';


-- EXERCICIO 4

-- MINHA RESOLUÇÃO
SELECT e.id_empregado, e.sobrenome, d.id_departamento
FROM tb_empregado e
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
WHERE 

-- RESOLUÇÃO DE AULA
SELECT id_empregado, sobrenome, id_departamento
FROM tb_empregado
WHERE id_departamento IN (SELECT id_departamento
                          FROM tb_departamento
                          WHERE id_localizacao IN (SELECT id_localizacao
                                                   FROM tb_localizacao
                                                   WHERE cidade Like 'T%'));
