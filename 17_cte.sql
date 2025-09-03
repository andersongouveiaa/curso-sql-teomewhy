-- CTE - COMMON TABLE EXPRESSION

-- SELECT count(DISTINCT t1.IdCliente) as totalClientesQuintoDia
-- FROM transacoes as t1
-- WHERE t1.IdCliente IN(
--     SELECT DISTINCT IdCliente
--     FROM transacoes
--     WHERE substr(DtCriacao,1,10) = '2025-08-25'
-- )
-- AND substr(t1.DtCriacao,1,10) = '2025-08-29'


WITH tb_clientes_primeiro_dia as (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'

), 

tb_clientes_ultimo_dia as (
      SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-29'
),

tb_join as (
    SELECT t1.IdCliente as primCliente,
            t2.IdCliente as ultCliente
    FROM tb_clientes_primeiro_dia as t1
    LEFT JOIN tb_clientes_ultimo_dia as t2
    ON t1.IdCliente = t2.IdCliente
)

SELECT count(primCliente),
        count(ultCliente),
        1.* count(ultCliente) / count(primCliente)
FROM tb_join
