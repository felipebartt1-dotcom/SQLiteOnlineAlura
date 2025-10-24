![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-F7DF1E?style=flat&logo=sql&logoColor=black)

# 🗄️ Projeto SQLite Online – Alura

Consultas SQL desenvolvidas durante o curso **SQLite Online** da Alura. Este projeto tem como objetivo praticar a criação e execução de queries, incluindo filtros, ordenações, condições compostas e uso de:  
`LIKE`, `IN`, `NOT IN`, `IS NOT NULL`, funções agregadas e manipulação de datas.

🔗 Repositório: [SQLite Online – Alura](https://github.com/felipebartt1-dotcom/SQLiteOnlineAlura)

---

## 📂 Bancos de Dados

1. **Banco+de+dados+Fokus.db**  
   Tabelas principais:  
   - Colaboradores  
   - Dependentes  
   - Faturamento  
   - HistoricoEmprego  
   - Licencas  
   - Treinamento  
   - CargosColaboradores  

2. **Escola.db**  
   Tabelas principais:  
   - Alunos  
   - Notas  
   - Disciplinas  

---

## 📊 Consultas

### 1️⃣ Consultas Profissionais (`Consultas_profissionais.sql`)

- Top 5 empregos encerrados com maior salário  
- Cursos contendo a palavra “realizar”  
- Colaboradores cujo nome começa com “Isadora”  
- Profissionais com cargo “Oftalmologista” ou “Dermatologista”  
- Profissionais que não são Oftalmologista, Dermatologista ou Professor  
- Cursos específicos por instituição  
- Mês com maior e menor faturamento bruto  
- Total de novos clientes adquiridos em 2023  
- Média de despesas e lucro líquido  
- Total de empregos encerrados  
- Número de licenças do tipo “Férias”  
- Tipos de parentesco dos dependentes e contagem por tipo  
- Cursos realizados por instituição, ordenados pelo número de cursos  
- Instituições com mais de 2 cursos cadastrados  
- Contagem de colaboradores por cargo (com 2 ou mais ocorrências)  
- Consultas complementares com funções de texto, data e arredondamento  

---

### 2️⃣ Projeto Mao na Massa (`Projeto Mao na massa.sql`)

- Primeiros 5 colaboradores, ordenados por nome  
- Cargos sem data de término (datatermino nula)  
- Colaboradores cujo nome começa com 'A' e termina com 's'  
- Supervisores com média salarial acima de 5000  
- Concatenação de nome e e-mail e comprimento do texto resultante  
- Licenças: diferença em dias entre a data de início e a data atual  
- Arredondamento do salário na tabela CargosColaboradores  
- Cargos com data de contratação posterior a 2023-01-01  
- Classificação de colaboradores por faixa salarial: Baixo, Médio, Alto  

---

### 3️⃣ Mão na Massa – Gerenciamento Escolar (`Mão na massa gerenciamento escolar.sql`)

- Média de notas dos alunos em História  
- Alunos cujo nome começa com 'A'  
- Alunos com aniversário em fevereiro  
- Cálculo da idade dos alunos a partir da data de nascimento  
- Verificação de aprovação dos alunos (nota >= 6)  

> Todas as consultas estão comentadas dentro dos arquivos `.sql` para fácil compreensão e aprendizado.

---

## ⚙️ Como usar

1. Abra o banco de dados correspondente:  
   - [`Banco+de+dados+Fokus.db`](./Banco+de+dados+Fokus.db) para consultas profissionais e Projeto Mao na Massa  
   - [`Banco_de_dados_escola.db`](./Banco_de_dados_escola.db) para o módulo de gerenciamento escolar  

2. Abra o arquivo `.sql` desejado:  
   - `Consultas_profissionais.sql`  
   - `Projeto Mao na massa.sql`  
   - `Mão na massa gerenciamento escolar.sql`  

3. Execute as consultas individualmente.
