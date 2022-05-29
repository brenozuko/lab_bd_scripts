-- Questão 1

SELECT nome, sobrenome
FROM tb_empregado
WHERE nome LIKE '%li%';

-- Questão 2

SELECT
CASE
  WHEN LENGTH(nome) + LENGTH(sobrenome) > 10 THEN SUBSTR(nome, 1, 1) || ' ' || SUBSTR(sobrenome, 1, 10)
  ELSE nome || ' ' || sobrenome
END "Nome dos empregados"
FROM tb_empregado;

-- Questão 3

SELECT 
  id_funcao, 
  COUNT(id_empregado) AS "Empregados evadidos",
  EXTRACT(year FROM data_termino) ano_termino
FROM tb_historico_funcao
GROUP BY id_funcao, EXTRACT(year FROM data_termino)
ORDER BY COUNT(id_empregado) ASC;

-- Questão 4

SELECT 
CASE 
  WHEN TO_CHAR(data_admissao, 'D') = 1 THEN 'domingo'
  WHEN TO_CHAR(data_admissao, 'D') = 2 THEN 'segunda'
  WHEN TO_CHAR(data_admissao, 'D') = 3 THEN 'terça'
  WHEN TO_CHAR(data_admissao, 'D') = 4 THEN 'quarta'
  WHEN TO_CHAR(data_admissao, 'D') = 5 THEN 'quinta'
  WHEN TO_CHAR(data_admissao, 'D') = 6 THEN 'sexta'
  WHEN TO_CHAR(data_admissao, 'D') = 7 THEN 'sabado'
END 
AS "Dia da semana",
COUNT(id_empregado) "Funcionarios Contratados"
FROM tb_empregado
GROUP BY TO_CHAR(data_admissao, 'D')
HAVING COUNT(id_empregado) >= 20;

-- Questão 05

CREATE TABLE tb_departamento_copia AS SELECT * FROM tb_departamento;


CREATE OR REPLACE PROCEDURE sp_questao_05(p_id_departamento IN INTEGER)
AS
v_primeira_letra      VARCHAR2(1);
v_controle            INTEGER;
v_nm_departamento     VARCHAR2(100);

BEGIN

SELECT COUNT(*) INTO v_controle
FROM tb_departamento_copia
WHERE p_id_departamento = id_departamento;

IF(v_controle = 1) THEN
  
  SELECT nm_departamento, SUBSTR(nm_departamento, 1, 1) INTO v_nm_departamento, v_primeira_letra
  FROM tb_departamento_copia
  WHERE p_id_departamento = id_departamento;
  
  IF(v_primeira_letra IN ('a','e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')) THEN
    
    UPDATE tb_departamento_copia
    SET nm_departamento = UPPER(nm_departamento)
    WHERE id_departamento = p_id_departamento;
    
    DBMS_OUTPUT.PUT_LINE('Nome de departamento ' || v_nm_departamento || ' atualizado pra maiúsculo.');
  ELSE
    UPDATE tb_departamento_copia
    SET nm_departamento = LOWER(nm_departamento)
    WHERE id_departamento = p_id_departamento;
    
    DBMS_OUTPUT.PUT_LINE('Nome de departamento ' || v_nm_departamento || ' atualizado pra minúsculo.');
  END IF;
ELSE
  DBMS_OUTPUT.PUT_LINE('ERRO: ID NÃO ENCONTRADO');
END IF;

END sp_questao_05;

SET serveroutput ON
BEGIN
sp_questao_05(10); -- invocando o stored procedure
END;

SELECT * FROM tb_departamento_copia;
