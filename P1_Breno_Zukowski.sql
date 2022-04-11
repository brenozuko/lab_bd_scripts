-- Nome: Breno Costa Zukowski Marques
-- RA: 2840482011010

-- Exercicio 1
SELECT e.nome || ' trabalha para ' || NVL(g.nome, 'Os acionistas')
FROM tb_empregado e
LEFT OUTER JOIN tb_empregado g ON(e.id_gerente = g.id_empregado)
ORDER BY g.nome DESC;

-- Exercício 2
SELECT nome, salario, NVL2(percentual_comissao, salario + (salario * percentual_comissao), salario + 2000) AS "Novo Salário"
FROM tb_empregado; 

-- Exercício 3
SELECT e.nome, e.sobrenome, d.id_departamento, d.nm_departamento
FROM tb_empregado e
RIGHT OUTER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento);

-- Exercício 4
SELECT nome, sobrenome, salario
FROM tb_empregado
WHERE salario < (SELECT salario 
                 FROM tb_empregado
                 WHERE id_empregado = 182);


-- Exercício 5

CREATE OR REPLACE PROCEDURE sp_questao_05(
 p_id_departamento IN tb_departamento.id_departamento%TYPE
)

AS
v_id_departamento     NUMBER;
v_output              VARCHAR2(455);

BEGIN
  SELECT COUNT(*) INTO v_id_departamento
  FROM tb_departamento
  WHERE id_departamento = p_id_departamento;
   
  IF(v_id_departamento = 1) THEN
    SELECT 'O departamento ' || d.nm_departamento || ' presente na cidade ' ||  l.cidade || ', estado ' || l.estado || 
    ', país ' || p.nm_pais || ', região ' || r.nm_regiao INTO v_output
    FROM tb_departamento d
    INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
    INNER JOIN tb_pais p ON(l.id_pais = p.id_pais)
    INNER JOIN tb_regiao r ON(p.id_regiao = r.id_regiao)
    WHERE d.id_departamento = p_id_departamento;
    
    DBMS_OUTPUT.PUT_LINE(v_output);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Departamento não localizado');
  END IF;
  END sp_questao_05;
