-- 11. Quem iniciou o curso no primeiro dia 
-- em média assistiu quantas aulas?


-- Quem participou no primeiro dia do curso
WITH tb_prim_dia as (
    SELECT DISTINCT IdCliente 
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
),

-- Quem participou do curso inteiro
tb_dias_curso as (
    SELECT DISTINCT 
        IdCliente, 
        substr(DtCriacao,1,10) as presenteDia
    FROM transacoes
    WHERE substr(DtCriacao,1,10) >= '2025-08-25'
    AND substr(DtCriacao,1,10) <'2025-08-30'
    ORDER BY IdCliente, presenteDia
),

-- Contando quantas vezes quem participou do primeiro dia, voltou
tb_cliente_dias as (
    SELECT t1.IdCliente,
            count(DISTINCT t2.presenteDia) as qtdeDias
    FROM tb_prim_dia as t1
    LEFT JOIN tb_dias_curso as t2
    ON t1.IdCliente = t2.IdCliente
    GROUP BY t1.IdCliente
)   

-- Calculando a média 
SELECT round(avg(qtdeDias),2) as mediaDiasCurso
FROM tb_cliente_dias;
