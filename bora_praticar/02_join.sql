-- em 2024, quantas transações de Lovers tivemos? 

SELECT  t3.DescCateogriaProduto,
        count(t1.IdTransacao)
       
FROM transacoes as t1

LEFT JOIN transacao_produto as t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01' 
AND t1.DtCriacao < '2025-01-01'
-- AND t3.DescCateogriaProduto = 'lovers'

GROUP BY t3.DescCateogriaProduto
HAVING count(t1.IdTransacao) <1000

ORDER BY count(t1.IdTransacao) desc
