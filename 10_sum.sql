SELECT sum(QtdePontos) as total_pontos_julho,
       
       sum(CASE
              WHEN QtdePontos > 0 THEN QtdePontos
              END) as total_pontos_positivos_julho,
       
       sum(CASE
              WHEN QtdePontos < 0 THEN QtdePontos
              END) as total_pontos_negativos_julho,

       count(CASE
              WHEN QtdePontos < 0 THEN QtdePontos
              END) as qtdeTransacoes_negativas_julho
       

FROM transacoes

WHERE DtCriacao >= '2025-07-01' 
AND DtCriacao < '2025-08-01'

