-- ===============================================================
-- Consulta 1: Média de notas dos alunos em História
-- Objetivo: Retornar a média das notas dos alunos na disciplina de História
-- ===============================================================

SELECT AVG(nota) média FROM Notas
WHERE id_disciplina = 2;

-- ===============================================================
-- Consulta 2: Alunos cujo nome começa com 'A'
-- Objetivo: Retornar todas as informações dos alunos cujo nome começa com a letra 'A'
-- ===============================================================
Select * from alunos
where nome_aluno like ('A%');

-- ===============================================================
-- Consulta 3: Alunos com aniversário em fevereiro
-- Objetivo: Buscar apenas os alunos que fazem aniversário no mês de fevereiro
-- ===============================================================
SELECT * FROM Alunos
WHERE STRFTIME('%m', data_nascimento) = '02';

-- ===============================================================
-- Consulta 4: Calcular a idade dos alunos
-- Objetivo: Criar uma consulta que calcula a idade de cada aluno com base na data de nascimento
-- ===============================================================
 SELECT nome_aluno,
      data_nascimento,
      (strftime('%Y', CURRENT_DATE) - strftime('%Y', data_nascimento)) - 
      (strftime('%m-%d', CURRENT_DATE) < strftime('%m-%d', data_nascimento)) AS idade
FROM Alunos;


-- ===============================================================
-- Consulta 5: Verificar aprovação dos alunos
-- Objetivo: Retornar se o aluno está ou não aprovado (nota >= 6)
-- ===============================================================
SELECT 
ID_Aluno As aluno, 
nota,
CASE WHEN nota >= 6 THEN 'APROVADO' 
ELSE 'REPROVADO' END 
AS Resultado
FROM Notas;
