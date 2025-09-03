-- 12. Dentre os clientes de janeiro/2025, quantos assistiram 

WITH tb_clientes_janeiro as (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE dtCriacao >= '2025-01-01'
    AND dtCriacao < '2025-02-01'
)

SELECT count(DISTINCT t1.IdCliente),
        count(DISTINCT t2.IdCliente)
FROM tb_clientes_janeiro as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente 
AND t2.DtCriacao >='2025-08-25'
AND t2.DtCriacao < '2025-08-30'
