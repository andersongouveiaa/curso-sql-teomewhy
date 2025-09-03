-- Qual o dia com maior engajamento de cada aluno que iniciou o curso no dia 01?

WITH alunos_dia01 as (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
)

SELECT t1.IdCliente,
        substr(t2.DtCriacao,1,10) as dtDia,
        count(*) as qtdeInteracoes

FROM alunos_dia01 as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente
AND t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'

GROUP BY t1.IdCliente, substr(t2.DtCriacao,1,10)

