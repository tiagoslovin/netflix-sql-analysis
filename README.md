## Análise de Dados do Catálogo da Netflix em SQL

Este projeto consiste em uma análise exploratória de dados sobre o catálogo global de filmes e séries da Netflix, com o objetivo de responder perguntas de negócio e extrair métricas relevantes através de consultas SQL.

---

##  Tecnologias e Ferramentas Utilizadas
- **Linguagem:** SQL
- **Banco de Dados:** PostgreSQL 18
- **Interface:** pgAdmin 4
- **Fonte dos Dados:** Dataset do Kaggle (Netflix Movies and TV Shows)

##  Perguntas de Negócio e Consultas Realizadas

------------------------------------------------

## 1. Volume total do Catálogo
Contagem total de registros para entender a dimensão da base de dados.
```sql
SELECT COUNT(*) AS total_titulos FROM netflix;
```


## 2. Proporção de Conteúdo (Filmes vs Séries)
Análise do percentual de cada tipo de mídia disponível na plataforma.
```sql
SELECT 
    type, 
    COUNT(*) AS quantidade,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix), 2) AS porcentagem
FROM netflix
GROUP BY type;

Insight: O catálogo é predominantemente composto por Filmes (~70%), enquanto Séries correspondem a cerca de 30%.
```
------------------------------------------------

## 3. Principais Países Produtores
Identificação dos 10 países com maior volume de produções cadastradas.
```sql
SELECT 
    country, 
    COUNT(*) AS total_producoes
FROM netflix
WHERE country IS NOT NULL AND country != ''
GROUP BY country
ORDER BY total_producoes DESC
LIMIT 10;
```
------------------------------------------------

## 4. Mapeamento do Conteúdo Brasileiro
Filtro dedicado a mapear todo o acervo nacional de filmes e séries presentes no serviço.
```sql
SELECT 
    title, 
    type, 
    release_year, 
    duration
FROM netflix
WHERE country LIKE '%Brazil%'
ORDER BY release_year DESC;
```
------------------------------------------------

