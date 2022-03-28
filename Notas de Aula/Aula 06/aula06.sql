-- FUNÇÕES SQL

-- REPLACE
SELECT REPLACE (nm_produto, 'Science', 'Physics')
FROM tb_produtos
WHERE id_produto = 1;

-- SOUNDEX
SELECT sobrenome
FROM tb_clientes
WHERE SOUNDEX(sobrenome) = SOUNDEX('whyte'); 

-- SUBSTR

SELECT nm_produto, SUBSTR(nm_produto, 2, 7)
FROM tb_produtos
WHERE id_produto < 4;

SELECT SUBSTR('Administrador de Banco de Dados - DBA', 34, 4)
FROM dual;

-- UPPER WITH SUBSTR

SELECT nm_produto, UPPER(SUBSTR(nm_produto,2,8))
FROM tb_produtos
WHERE id_produto < 4;

-- ABS - remove sinais

SELECT id_produto, preco, preco - 30.00, ABS(preco - 30.00)
FROM tb_produtos
WHERE id_produto < 4;

-- CEIL - arredondamento pra cima

SELECT CEIL(5.8), CEIL(-5.2)
FROM dual;

-- FLOOR - arredondamento pra baixo 

SELECT FLOOR(5.8), FLOOR(-5.2)
FROM dual;

-- MOD 

SELECT MOD(8,3), MOD(8,4)
FROM dual;

-- POWER

SELECT POWER(2,1), POWER(2,3)
FROM dual;

-- ROUND

SELECT ROUND(5.75), ROUND(5.75,1), ROUND(5.75, -1)
FROM dual;

-- SIGN

SELECT SIGN(-5), SIGN(5), SIGN(0)
FROM dual;

-- SQRT

SELECT SQRT(25), SQRT(5)
FROM dual;

-- TRUNC -- não arredonda, apenas depreza casas decimais

SELECT TRUNC(5.75), TRUNC(5.75, 1), TRUNC(5.75, -1)
FROM dual;

-- FUNÇÕES DE CONVERSÃO

-- TO_CHAR

SELECT TO_CHAR(12345.67)
FROM dual; 

SELECT TO_CHAR(12345.67, '99,999.99')
FROM dual;

SELECT TO_CHAR(12345.67, '$99,999.99')
FROM dual;

-- RETIRA 0 DE PONTO FLUTUANTE
SELECT TO_CHAR(0.67, 'B9.99')
FROM dual;

SELECT TO_CHAR(123456.67, 'C99,9999.99')
FROM dual;

SELECT TO_CHAR(12345.67, '99999D99')
FROM dual;

SELECT TO_CHAR(12345.67, '99999.99EEEE')
FROM dual;

SELECT TO_CHAR(0012345.6700, 'FM99999.99')
FROM dual;

-- MOEDA LOCAL
SELECT TO_CHAR(12345.67, 'L99,999.99')
FROM dual;

SELECT TO_CHAR(-12345.67, '99,999.99MI')
FROM dual;

SELECT TO_CHAR(-12345.67, '99,999.99PR')
FROM dual;

SELECT TO_CHAR(2022, 'RN')
FROM dual;

SELECT TO_CHAR(12345.67, 'TM')
FROM dual;

SELECT TO_CHAR(12345.67, 'S99999.99')
FROM dual;

SELECT TO_CHAR(12345.67, 'U99999.99')
from DUAL;

-- ARREDONDAMENTO DECIMAL
SELECT TO_CHAR(12345.67, '99999V99')
FROM dual;

-- MANIPULAÇÃO EM QUERY

SELECT id_produto, 'O preço do produto é: ' || TO_CHAR(preco, 'L99.99')
FROM tb_produtos
WHERE id_produto < 5;


-- TO_NUMBER

SELECT TO_NUMBER('970.13')
FROM dual;