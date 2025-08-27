-- Lista de pedidos realizados no fim de semana

SELECT IdTransacao,
       DtCriacao,
       strftime('%w', datetime(substr(DtCriacao, 1,19))) as DiaSemana

FROM transacoes

WHERE diaSemana in ('0', '6')
