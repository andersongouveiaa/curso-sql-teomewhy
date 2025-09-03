--Qual o total de pontos trocados no Stream Elements em Junho de 2025?

SELECT substr(DtCriacao,1,7) as anoMes,
        sum(QtdePontos) as totalPontosMes
       

FROM transacoes

WHERE substr(DtCriacao,1,7) = '2025-06'


GROUP BY substr(DtCriacao,1,7)
