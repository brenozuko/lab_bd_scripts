-- P2 BD
-- Breno Costa Zukowski Marques
-- RA: 2840482011010

-- QUESTÃO 1
SELECT nome,
NVL(TO_CHAR(percentual_comissao), 'Nenhuma Comissão') AS "COMISSÃO"
FROM tb_empregado;


-- QUESTÃO 2
SELECT ROUND(MAX(salario),0) "Máximo",
ROUND(MIN(salario),0) "Mínimo",
ROUND(AVG(salario),0) "Média",
ROUND(SUM(salario),0) "Somatório"
FROM tb_empregado;

-- QUESTÃO 3
SELECT COUNT(*) "TOTAL DE EMPREGADOS", SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1990,1,0)) "CONTRATADOS EM 1990",
SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1991,1,0)) "CONTRATADOS EM 1991",
SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1992,1,0)) "CONTRATADOS EM 1992",
SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1993,1,0)) "CONTRATADOS EM 1993"
FROM tb_empregado;

-- QUESTÃO 4
SELECT id_empregado || ', ' || nome || ', ' || sobrenome || ', ' || email || ', ' || telefone || ', ' || data_admissao || ', ' ||
       id_funcao || ', ' || salario || ', ' || percentual_comissao || ', ' || id_gerente || ', ' || id_departamento AS "Saída"
FROM tb_empregado;

-- QUESTÃO 5


-- QUESTÃO 6
GRANT UPDATE ON tb_departamento TO joao WITH GRANT OPTION;


-- QUESTÃO 8

SELECT id_empregado, nome, salario, TO_NUMBER(salario + (salario * 15/100)) AS "Novo Salário"
FROM tb_empregado;

-- QUESTÃO 7


-- QUESTÃO 9

SELECT UPPER(SUBSTR(nome, 1, 1)) || LOWER(SUBSTR(nome, 2)) AS "Nome",
CASE 
  WHEN UPPER(SUBSTR(nome, 1, 1)) = 'J' OR UPPER(SUBSTR(nome, 1, 1)) = 'A' OR UPPER(SUBSTR(nome,1,1)) = 'M' 
  THEN LENGTH(nome)
END AS "Tamanho do nome"
FROM tb_empregado;
