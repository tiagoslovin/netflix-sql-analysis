-- ========================================================
-- PROJETO: Análise Exploratória do Catálogo da Netflix
-- Ferramenta: PostgreSQL / pgAdmin 4
-- Autor: Tiago Slovinski
-- ========================================================

-- 1. VISÃO GERAL
-- Quantos títulos existem cadastrados no total?
SELECT COUNT(*) AS total_titulos 
FROM netflix;


-- 2. FILMES VS. SÉRIES
-- Qual a quantidade e a porcentagem de Filmes e Séries?
SELECT 
    type, 
    COUNT(*) AS quantidade,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix), 2) AS porcentagem
FROM netflix
GROUP BY type;


-- 3. TOP 10 PAÍSES PRODUTORES
-- Quais países mais produzem conteúdo para o catálogo?
SELECT 
    country, 
    COUNT(*) AS total_producoes
FROM netflix
WHERE country IS NOT NULL AND country != ''
GROUP BY country
ORDER BY total_producoes DESC
LIMIT 10;


-- 4. CONTEÚDO BRASILEIRO
-- Quais são todos os filmes e séries do Brasil no catálogo?
SELECT 
    title, 
    type, 
    release_year, 
    duration
FROM netflix
WHERE country LIKE '%Brazil%'
ORDER BY release_year DESC;


-- 5. EVOLUÇÃO HISTÓRICA
-- Quantos títulos foram lançados por ano a partir de 2010?
SELECT 
    release_year, 
    COUNT(*) AS lancamentos
FROM netflix
WHERE release_year >= 2010
GROUP BY release_year
ORDER BY release_year ASC;