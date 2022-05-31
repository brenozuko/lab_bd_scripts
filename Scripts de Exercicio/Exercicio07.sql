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
WHERE NVL(e.percentual_comissao, 0) > 0;


-- QUESTÃO 4

SELECT e.nome || ' trabalha para ' || NVL(g.nome, 'os acionistas')
FROM tb_empregado e LEFT OUTER JOIN tb_empregado g ON(e.id_gerente = g.id_empregado)
ORDER BY g.nome DESC;

-- QUESTÃO 5

CREATE OR REPLACE PROCEDURE sp_get_emp(p_id IN INTEGER)
AS
v_nome_completo            VARCHAR2(500);
v_ds_funcao                VARCHAR2(500);
v_controle                 INTEGER;

BEGIN

SELECT COUNT(*) INTO v_controle
FROM tb_empregado 
WHERE id_empregado = p_id;

IF(v_controle = 1) THEN
  SELECT e.nome || ' ' || e.sobrenome "Nome Completo", f.ds_funcao INTO v_nome_completo, v_ds_funcao
  FROM tb_empregado e
  INNER JOIN tb_funcao f ON(e.id_funcao = f.id_funcao)
  WHERE e.id_empregado = p_id;

  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome_completo || ' Função: ' || v_ds_funcao); 
ELSE 
  DBMS_OUTPUT.PUT_LINE('Empregado ' || p_id || ' não localizado!');
END IF;
END sp_get_emp;


SET serveroutput ON
BEGIN
sp_get_emp(200); -- invocando o stored procedure
END;


SET serveroutput ON
BEGIN
sp_get_emp(999); -- invocando o stored procedure
END;

