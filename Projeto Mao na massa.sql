-- 1. Selecione os primeiros 5 registros da tabela Colaboradores, ordenando-os pelo nome em ordem crescente. (Adaptado) --

SELECT *
FROM Colaboradores
ORDER BY nome ASC
LIMIT 5;


-- 2. Encontre todos os registros na tabela CargosColaboradores que não têm uma data de término associada (coluna datatermino nula). (Adaptado) --

SELECT *
FROM CargosColaboradores
WHERE datatermino IS NULL;


-- 3. Liste os colaboradores cujo nome começa com 'A' e termina com 's' na tabela Colaboradores. (Adaptado) --

SELECT *
FROM Colaboradores
WHERE nome LIKE 'A%' AND nome LIKE '%s';


-- 4. Exiba o supervisor e a média salarial dos cargos em cada grupo de supervisor,
-- apenas para aqueles cuja média salarial é superior a 5000. (Adaptado) --

SELECT 
  supervisor, 
  AVG(salario) AS MediaSalarial
FROM CargosColaboradores
GROUP BY supervisor
HAVING MediaSalarial > 5000;


-- 5. Selecione todos os colaboradores e concatene o nome e o e-mail, 
-- além de calcular o comprimento total do texto concatenado. (Adaptado) --

SELECT 
  nome || ' ' || email AS nome_email, 
  LENGTH(nome || ' ' || email) AS comprimento_nome_email
FROM Colaboradores;


-- 6. Para cada licença na tabela Licencas, exiba o ID do colaborador, a data de início 
-- e a diferença em dias entre a data de início e a data atual. (Adaptado) --

SELECT 
  id_colaborador, 
  datainicio, 
  ROUND(JULIANDAY('now') - JULIANDAY(datainicio)) AS Dias_passados
FROM Licencas;


-- 7. Selecione todos os registros da tabela CargosColaboradores e arredonde o salário 
-- para o número inteiro mais próximo. (Adaptado) --

SELECT 
  *, 
  ROUND(salario) AS Salario_Arredondado
FROM CargosColaboradores;


-- 8. Converta a coluna datacontratacao da tabela CargosColaboradores (armazenada como texto no formato YYYY-MM-DD)
-- para o tipo de data e selecione apenas os registros com data posterior a '2023-01-01'. (Adaptado) --

SELECT *
FROM CargosColaboradores
WHERE DATE(datacontratacao) > '2023-01-01';


-- 9. Classifique cada colaborador da tabela HistoricoEmprego de acordo com a faixa salarial:
-- salários abaixo de 3000 como 'Baixo', entre 3000 e 6000 como 'Médio', e acima de 6000 como 'Alto'. (Adaptado) --

SELECT 
  id_colaborador, 
  cargo, 
  salario,
  CASE 
    WHEN salario < 3000 THEN 'Baixo'
    WHEN salario BETWEEN 3000 AND 6000 THEN 'Médio'
    ELSE 'Alto'
  END AS Categoria_salario
FROM HistoricoEmprego;
