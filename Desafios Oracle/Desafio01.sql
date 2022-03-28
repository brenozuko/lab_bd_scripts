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
WHERE LOWER(nome) LIKE 'e_____e'
AND id_departamento = 80
OR id_gerente = 148;
