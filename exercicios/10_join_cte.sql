-- 10. Qual foi a curva de churn do curso de SQL?

-- SELECT 
--         substr(DtCriacao,1,10) as dtDia,
--         count(DISTINCT IdCliente) as qtdeCliente

-- FROM transacoes

-- WHERE DtCriacao >= '2025-08-25'
-- AND DtCriacao < '2025-08-30'

-- GROUP BY dtDia

WITH tb_clientes_d1 as(
    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-26'
)

SELECT substr(t2.DtCriacao,1,10) as dtDia,
        count(DISTINCT t1.IdCliente) as qtdeCliente

FROM tb_clientes_d1 as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente

WHERE t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'

GROUP BY dtDia
