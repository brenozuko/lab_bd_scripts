-- EXERCICIO 1
-- MINHA RESOLUÇÃO
SELECT e.nome || ' ' || e.sobrenome || ' trabalha para ' 
        || d.nm_departamento || ' localizado na cidade ' 
        || l.cidade || ' estado ' || l.estado || ' país ' || p.nm_pais AS "Informação dos empregados"
FROM tb_empregado e, tb_departamento d, tb_localizacao l, tb_pais p
WHERE e.id_departamento = d.id_departamento AND
      d.id_localizacao = l.id_localizacao AND
      l.id_pais = p.id_pais
ORDER BY e.nome, e.sobrenome ASC;

-- SOLUÇÃO
SELECT e.nome || ' ' || e.sobrenome || ' trabalha para ' 
        || d.nm_departamento || ' localizado na cidade ' 
        || l.cidade || ' estado ' || l.estado || ' país ' || p.nm_pais AS "Informação dos empregados"
FROM tb_empregado e
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
INNER JOIN tb_pais p ON(l.id_pais = p.id_pais)
ORDER BY 1 ASC;


-- EXERCICIO 2

-- MINHA RESOLUÇÃO
SELECT nome, sobrenome 
FROM tb_empregado
WHERE LOWER(nome) LIKE 'e_____e' -- Era importante colocar a %, falso positivo
AND id_departamento = 80
OR id_gerente = 148;


-- SOLUÇÃO

SELECT nome || ' ' || sobrenome
FROM tb_empregado
WHERE LOWER(nome) LIKE 'e_____e%'
AND id_departamento = 80
OR id_gerente = 148;


-- EXERCÍCIO O3 

-- MINHA RESOLUÇÃO

SELECT NVL(g.nome, 'Os acionistas') || ' gerencia(m) ' || e.nome
FROM tb_empregado g
RIGHT OUTER JOIN tb_empregado e ON (g.id_empregado = e.id_gerente)
ORDER BY g.nome DESC;


-- SOLUÇÃO

SELECT NVL(g.nome, 'Os acionistas') || ' gerencia(m) ' || e.nome
FROM tb_empregado e
LEFT OUTER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
ORDER BY g.nome DESC;


-- EXERCÍCIO 04

-- MINHA RESOLUÇÃO
SELECT nome, sobrenome, SYSDATE - data_admissao AS "Dias trabalhados"
FROM tb_empregado 
WHERE id_departamento = 80
AND SYSDATE - TO_DATE(data_admissao) > 5000;

-- SOLUÇÃO

SELECT sobrenome, ROUND((SYSDATE - data_admissao), 0) AS "Número de Dias Trabalhados"
FROM tb_empregado
WHERE id_departamento = 80
AND ROUND((SYSDATE - data_admissao), 0) > 5000;
