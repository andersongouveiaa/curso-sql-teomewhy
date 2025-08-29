--Quantos clientes tem email cadastrado?

SELECT sum(FlEmail) as total_clientes_email


FROM clientes;

--          PRÓXIMO

--Qual cliente juntou mais pontos positivos em 2025-05?

select sum(QtdePontos) as total_pontos,
       IdCliente

FROM transacoes

WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01'
AND QtdePontos > 0

GROUP BY IdCliente

ORDER BY sum(QtdePontos) DESC

LIMIT 1;

--          PRÓXIMO

--Qual cliente fez mais transações no ano de 2024?

SELECT IdCliente,
        count(IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2024-01-01'
AND DtCriacao < '2025-01-01'

GROUP BY IdCliente

ORDER BY count(IdTransacao) desc

LIMIT 1;

--          PRÓXIMO

--Quantos produtos são de rpg?

SELECT count(*) AS total_produtos_rpg

FROM produtos

WHERE DescCateogriaProduto ='rpg';

--          PRÓXIMO 

--Qual o valor médio de pontos positivos por dia?

SELECT DISTINCT substr(DtCriacao, 1,10) as dtPorDia,
                round(avg(CASE
                                 WHEN QtdePontos > 0 THEN QtdePontos
                                 END),2) as media_pontos_positivos_dia

FROM transacoes

GROUP BY dtPorDia;

--          PRÓXIMO

--Qual dia da semana Tem mais pedidos em 2025?

SELECT 
     count(IdTransacao) as qtdeTransacoes,
     strftime('%w', substr(DtCriacao, 1,10)) as DiaSemana

FROM transacoes

WHERE substr(DtCriacao, 1,4) = '2025'

GROUP BY DiaSemana

ORDER BY count(IdTransacao) DESC
LIMIT 1;

--          PRÓXIMO

--Qual o produto mais transacionado?

SELECT  IdProduto,
        sum(QtdeProduto) as total_produto
FROM transacao_produto

GROUP by IdProduto

ORDER BY sum(QtdeProduto) DESC
LIMIT 1;

--          PRÓXIMO

-- Qual o produto com mais pontos transacionado?

SELECT IdProduto,
        sum(VlProduto) as total_valor

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(VlProduto) desc
LIMIT 1;
