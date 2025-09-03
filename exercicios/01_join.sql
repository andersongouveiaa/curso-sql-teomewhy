-- Quais clientes mais perderam pontos por lover?
 
SELECT t1.IdCliente,
      sum(t1.QtdePontos) as totalPontos
      
FROM transacoes as t1

LEFT JOIN transacao_produto as t2
on t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCateogriaProduto = 'lovers'

GROUP BY t1.IdCliente

ORDER BY sum(t1.QtdePontos) 

LIMIT 5
