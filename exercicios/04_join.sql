-- Clientes mais antigos, tem mais frequência de transação?

SELECT t1.IdCliente,
        CAST (julianday('now') - julianday(substr(t1.DtCriacao,1,10)) as INT) as idadeBase,
        count(t2.IdTransacao) as qtdeTransacoes

FROM clientes as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente

GROUP BY t1.idCliente, idadeBase
