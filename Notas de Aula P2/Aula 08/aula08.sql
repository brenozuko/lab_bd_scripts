-- GROUP BY e VARIANCE - retorna as variâncias de preço do produto
SELECT id_tipo_produto, VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

-- ORDER COM VARIANCE e group by - retorna a variância do preço e ordena pela tal
SELECT VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY VARIANCE(preco);

-- GROUP BY é obrigatório ao se utilizar funções agregadas que retornam colunas específicas
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos;

-- Também não é permitida utilização de função agregada em WHERE
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE AVG(preco) > 20.00
GROUP BY id_tipo_produto;


-- GROUP BY pode ser usado sem HAVING, mas HAVING deve ser usado com GROUP BY
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) > 20.00;

-- Utilização de WHERE com GROUP BY -> sem função agregada
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

-- Utilização de having
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.0
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.0
ORDER BY id_tipo_produto;

-- TIPO DATE

-- DATA E HORA - a conversão é feita para o padrão do banco independentemente da inserção feita
INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES(7, 'Steve', 'Purple', DATE'1972-10-25', '800-555-1215', 1);

SELECT *
FROM tb_clientes
ORDER BY id_cliente;

ROLLBACK;

-- TO CHAR - aplicando máscara
SELECT id_cliente, TO_CHAR(dt_nascimento, 'MONTH DD, YYYY')
FROM tb_clientes;

-- Retorna o dia de hoje com as mudanças propostas pela máscara
SELECT TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS')
FROM dual;

-- Conversão para data e cast para char
SELECT TO_CHAR(TO_DATE('05-FEV-1968'), 'MONTH DD, YYYY')
FROM dual;

-- Ao se omitir o segundo parâmetro NLS_DATE_FORMAT, o SGBD formata para o padrão. 
SELECT TO_DATE('04-JUL-2013'), TO_DATE('04-JUL-13')
FROM dual;

-- Mais um exemplo de data 
SELECT TO_DATE('Jul 04, 2013', 'MONTH DD, YYYY')
FROM dual;

-- Seleciona padrões NLS
SELECT *
FROM nls_session_parameters;

-- Altera o NLS_DATE_FORMAT
ALTER SESSION SET NLS_DATE_FORMAT='Mon/dd/yyyy';

-- Exibe o valor da sessão alterada
SELECT TO_DATE('7.4.13', 'MM.DD.YY')
FROM dual;

-- ** FORMATAR DATA E HORA COM TO_CHAR **

-- Inserção de data com hora

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (
    10,
    'Nome',
    'Sobrenome',
    TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'), 
    '800-555-1215',
    1);

-- Apenas a nova inserção retorna o horário
SELECT id_cliente,
       TO_CHAR(dt_nascimento, 'DD-MON-YYYY HH24:MI:SS')
FROM tb_clientes
ORDER BY id_cliente;

ROLLBACK;

-- Combinação de TO_DATE e TO_CHAR para trazer parte específica da hora

SELECT TO_CHAR(TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'),
             'HH24:MI:SS')
FROM dual;

-- Utilizando o padrão YY -> será considerado o século atual o que pode gerar inconsistências
-- 75 deveria ser 1975 e retorna 2075
SELECT 
    TO_CHAR(TO_DATE('Jul 04, 15', 'MONTH DD, YY'), 'MONTH DD, YYYY'),
    TO_CHAR(TO_DATE('Jul 04, 75', 'MONTH DD, YY'), 'MONTH DD, YYYY')
FROM dual;

-- Substituindo por RR conseguimos tratar essa inconsistência
SELECT 
    TO_CHAR(TO_DATE('Jul 04, 15', 'MONTH DD, RR'), 'MONTH DD, YYYY'),
    TO_CHAR(TO_DATE('Jul 04, 75', 'MONTH DD, RR'), 'MONTH DD, YYYY')
FROM dual;

-- FUNÇÕES DE DATA

-- ADD_MONTHS(x, y) - Adiciona um número de meses a uma data
SELECT ADD_MONTHS('Jul 01, 2013', 13)
FROM dual;

-- Se y for negativo, subtrai os meses
SELECT ADD_MONTHS('Jul 01, 2013', -13)
FROM Dual;

-- LAST_DAY(x) - Retorna a data do último dia do mês data inserida
SELECT LAST_DAY('Jul 01, 2013')
FROM dual;

-- MONTHS_BETWEEN(x) - diferença de meses entre x e y
-- Se x ocorre antes de y, o número retornado é negativo
SELECT MONTHS_BETWEEN('Jul 03, 2013', 'Mai 01, 2011')
FROM dual;

-- NEXT_DAY(x, dia)
-- Retorna a data do próximo dia depois de "x"

-- Sunday = 1; Monday = 2; Tuesday = 3....
SELECT NEXT_DAY('Jul 03, 2013', 1)
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 1)
FROM DUAL;

-- ROUND(x, [unidade]) -> arredonda para o dia mais próximo

-- No segundo semestre arredonda para o primeiro dia do próximo ano
SELECT ROUND(TO_DATE('Jul 03, 2013'), 'YYYY')
FROM dual;

-- No primeiro semestre arredonda para o primeiro dia deste ano vigente
SELECT ROUND(TO_DATE('Jan 03, 2013'), 'YYYY')
FROM dual;

-- ROUND com mês
SELECT ROUND(TO_DATE('Mai 25, 2013'), 'MM')
FROM dual;

SELECT ROUND(TO_DATE('Mai 10, 2013'), 'MM')
FROM dual;

-- ROUND com hora

SELECT TO_CHAR
       (ROUND
       (TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS'), 
       'HH24'),
       'MONTH DD, YYYY HH24:MI:SS')
FROM dual;

-- EXTRACT - extrai dia, mês e ano de um tipo DATE
SELECT 
    EXTRACT(YEAR FROM TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS YEAR,
    EXTRACT(MONTH FROM TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS MONTH,
    EXTRACT(DAY FROM TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS DAY
FROM dual;

-- EXTRACT - extrai hora, minuto e segundo de um tipo DATE
SELECT
  EXTRACT(HOUR FROM TO_TIMESTAMP('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS HORA,
  EXTRACT(MINUTE FROM TO_TIMESTAMP('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS MINUTO,
  EXTRACT(SECOND FROM TO_TIMESTAMP('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS SEGUNDO
FROM dual;


-- NUMTODSINTERVAL(x, tipo) -> retorna o intervalo dado um número e a unidade esperada

SELECT
    NUMTODSINTERVAL(1.5, 'DAY'),
    NUMTODSINTERVAL(3.25, 'HOUR'),
    NUMTODSINTERVAL(5, 'MINUTE'),
    NUMTODSINTERVAL(10.123456789, 'SECOND')
from dual;