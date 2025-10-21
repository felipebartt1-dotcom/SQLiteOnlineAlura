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
