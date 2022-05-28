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