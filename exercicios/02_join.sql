-- Quais clientes assinaram a lista de presença no dia 2025/08/25?


SELECT  count( DISTINCT t1.IdCliente) as totalAssinantes

FROM transacoes as t1

LEFT JOIN transacao_produto as t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto = t3.IdProduto

WHERE substr(t1.DtCriacao,1,10) = '2025-08-25'
AND t3.DescProduto = 'Lista de presença'

