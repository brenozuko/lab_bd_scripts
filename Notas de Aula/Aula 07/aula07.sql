-- REGEXP_INSTR
SELECT 
    REGEXP_INSTR('Teste de expressão regular', 'e', 6,2) AS resultado
FROM dual;

-- REGEXP_REPLACE

SELECT
    REGEXP_REPLACE('Teste de expressão regular', 'd[[:alpha:]]{1}', 'Oracle')
AS resultado
FROM dual;

-- REGEXP_SUBSTR
SELECT 
    REGEXP_SUBSTR('Teste de expressão regular', 'e[[:alpha:]]{8}') AS resultado
FROM dual;

-- REGEXP_COUNT
SELECT
    REGEXP_COUNT('teste teste teste expressão regular', 't[[:alpha:]]{4}') AS resultado
FROM dual;

-- FUNÇÕES AGREGADAS

-- AVG
SELECT AVG(preco)
FROM tb_produtos;

-- ARREDONDANDO PRA DUAS CASAS
SELECT ROUND(AVG(preco), 2)
FROM tb_produtos;

SELECT CAST(AVG(preco) as NUMBER(5,2))
FROM tb_produtos;

-- MÉDIA + 2
SELECT AVG(preco + 2.00)
FROM tb_produtos;