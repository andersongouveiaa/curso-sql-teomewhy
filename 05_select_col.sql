SELECT IdCliente,
    QtdePontos,
    QtdePontos + 10 as QtdePontosPlus10,
    QtdePontos*2 as QtdePontosDouble,
    
    DtCriacao,
    
    datetime(substr(DtCriacao, 1,19)) as DtCriacaoNova,

    strftime('%w', datetime(substr(DtCriacao, 1,19))) as DiaSemana
    
FROM Clientes
