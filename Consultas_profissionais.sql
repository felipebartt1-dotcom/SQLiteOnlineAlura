/********************************************************************
 * Arquivo: consultas_profissionais.sql
 * Descrição: Conjunto de consultas SQL para análise de colaboradores,
 * treinamento e histórico de empregos.
 * Banco de Dados: SQLite
 * Autor: Felipe Barletta/Alura
 ********************************************************************/

-- ===============================================================
-- 1) Seleciona os 5 empregos encerrados com maior salário
--    (ordem decrescente por salário)
-- ===============================================================
SELECT *
FROM HistoricoEmprego
WHERE datatermino IS NOT NULL
ORDER BY salario DESC
LIMIT 5;


-- ===============================================================
-- 2) Consulta todos os cursos que contêm a palavra "realizar"
-- ===============================================================
SELECT *
FROM Treinamento
WHERE curso LIKE '%realizar%';


-- ===============================================================
-- 3) Consulta colaboradores cujo nome começa com "Isadora"
-- ===============================================================
SELECT *
FROM Colaboradores
WHERE nome LIKE 'Isadora%';


-- ===============================================================
-- 4) Consulta professores com empregos finalizados
-- ===============================================================
SELECT *
FROM HistoricoEmprego
WHERE cargo = 'Professor'
  AND datatermino IS NOT NULL;


-- ===============================================================
-- 5) Consulta profissionais com cargo "Oftalmologista" ou "Dermatologista"
-- ===============================================================
SELECT *
FROM HistoricoEmprego
WHERE cargo = 'Oftalmologista'
   OR cargo = 'Dermatologista';


-- ===============================================================
-- 6) Consulta profissionais que não são Oftalmologista, Dermatologista ou Professor
-- ===============================================================
SELECT *
FROM HistoricoEmprego
WHERE cargo NOT IN ('Oftalmologista', 'Dermatologista', 'Professor');


-- ===============================================================
-- 7) Consulta cursos específicos por instituição
--    - Cursos iniciados com "O direito" na instituição "da Rocha"
--    - Cursos iniciados com "O conforto" na instituição "das Neves"
-- ===============================================================
SELECT *
FROM Treinamento
WHERE (curso LIKE 'O direito%' AND instituicao = 'da Rocha')
   OR (curso LIKE 'O conforto%' AND instituicao = 'das Neves');
   
-- ===============================================================
-- ===============================================================
-- 8) Retorna o mês com o maior faturamento bruto
-- ===============================================================
SELECT mes, MAX(faturamento_bruto) 
FROM faturamento;

-- ===============================================================
-- 9) Retorna o mês com o menor faturamento bruto
-- ===============================================================
SELECT mes, MIN(faturamento_bruto) 
FROM faturamento;

-- ===============================================================
-- 10) Soma o total de novos clientes adquiridos em 2023
-- ===============================================================
SELECT SUM(numero_novos_clientes) AS 'Novos Clientes 2023' 
FROM faturamento
WHERE mes LIKE '%2023';

-- ===============================================================
-- 11) Calcula a média de despesas registradas
-- ===============================================================
SELECT AVG(despesas) 
FROM faturamento;

-- ===============================================================
-- 12) Calcula a média de lucro líquido
-- ===============================================================
SELECT AVG(lucro_liquido) 
FROM faturamento;

-- ===============================================================
-- 13) Conta quantos empregos foram encerrados 
--     (com data de término preenchida)
-- ===============================================================
SELECT COUNT(*) 
FROM HistoricoEmprego
WHERE datatermino IS NOT NULL;

-- ===============================================================
-- 14) Conta o número de licenças do tipo Férias
-- ===============================================================
SELECT COUNT(*) 
FROM Licencas
WHERE tipolicenca LIKE '%Férias%';

-- ===============================================================
-- 15) Lista os tipos de parentesco dos dependentes, sem repetição
-- ===============================================================
SELECT parentesco 
FROM Dependentes
GROUP BY parentesco;

-- ===============================================================
-- 16) Conta quantos dependentes existem de cada tipo de parentesco
-- ===============================================================
SELECT parentesco, COUNT(*) AS Contagem
FROM Dependentes
GROUP BY parentesco;

-- ===============================================================
-- 17) Conta os cursos realizados por instituição, 
--     ordenando do maior para o menor número de cursos
-- ===============================================================
SELECT instituicao, COUNT(curso) AS 'Contagem'
FROM Treinamento
GROUP BY instituicao
ORDER BY COUNT(curso) DESC;

-- ===============================================================
-- 18) Filtra apenas as instituições que possuem mais de 2 cursos cadastrados,
--     ordenando do maior para o menor
-- ===============================================================
SELECT instituicao, COUNT(curso) AS 'Contagem'
FROM Treinamento
GROUP BY instituicao
HAVING COUNT(curso) > 2
ORDER BY COUNT(curso) DESC;

-- ===============================================================
-- 19) Conta quantos colaboradores já ocuparam cada cargo,
--     mostrando apenas os cargos com 2 ou mais ocorrências, ordenando pela quantidade
-- ===============================================================
SELECT cargo, COUNT(*) AS qtd
FROM HistoricoEmprego
GROUP BY cargo
HAVING qtd >= 2
ORDER BY qtd;

-- ===============================================================
-- 20) Verifica o tamanho dos CPFs cadastrados
-- ===============================================================
SELECT COUNT(*), LENGTH(CPF) AS QTD
FROM Colaboradores
WHERE qtd = 11;

-- ===============================================================
-- 21) Concatena nome, CPF e endereço em uma única string
-- ===============================================================
SELECT ('A pessoa colaboradora ' || nome || ' de CPF ' 
        || cpf || ' possui o seguinte endereço: ' 
        || endereco) AS texto
FROM Colaboradores;

-- ===============================================================
-- 22) Concatenação anterior em letras maiúsculas
-- ===============================================================
SELECT UPPER('A pessoa colaboradora ' || nome || ' de CPF ' 
        || cpf || ' possui o seguinte endereço: ' 
        || endereco) AS texto
FROM Colaboradores;

-- ===============================================================
-- 23) Concatenação anterior em letras minúsculas
-- ===============================================================
SELECT LOWER('A pessoa colaboradora ' || nome || ' de CPF ' 
        || cpf || ' possui o seguinte endereço: ' 
        || endereco) AS texto
FROM Colaboradores;

-- ===============================================================
-- 24) Extrai o ano e o mês da data de início das licenças
-- ===============================================================
SELECT id_colaborador, STRFTIME('%Y/%m', datainicio) 
FROM Licencas;

-- ===============================================================
-- 25) Calcula o número de dias entre contratação e término do emprego
-- ===============================================================
SELECT id_colaborador, JULIANDAY(datatermino) - JULIANDAY(datacontratacao) AS dias_trabalhados
FROM HistoricoEmprego
WHERE datatermino IS NOT NULL;

-- ===============================================================
-- 26) Calcula e arredonda a média do faturamento bruto
-- ===============================================================
SELECT AVG(faturamento_bruto), ROUND(AVG(faturamento_bruto),2)
FROM faturamento;

-- ===============================================================
-- 27) Arredonda os valores de faturamento e despesas para cima (CEIL)
-- ===============================================================
SELECT CEIL(faturamento_bruto), CEIL(despesas) 
FROM faturamento;

-- ===============================================================
-- 28) Arredonda os valores de faturamento e despesas para baixo (FLOOR)
-- ===============================================================
SELECT FLOOR(faturamento_bruto), FLOOR(despesas) 
FROM faturamento;

-- ===============================================================
-- 29) Exibe o faturamento médio formatado como texto
-- ===============================================================
SELECT ('O faturamento bruto médio foi ' 
        || CAST(ROUND(AVG(faturamento_bruto),2) AS TEXT)) AS resultado
FROM faturamento;
