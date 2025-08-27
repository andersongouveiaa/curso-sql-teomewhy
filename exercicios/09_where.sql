--Listar todas as transações adicionando uma coluna nova sinalizando “alto”, “médio” e “baixo” para o valor dos pontos [<10 ; <500; >=500]


SELECT IdTransacao,
        QtdePontos,       
        (CASE 
            WHEN QtdePontos < 10 THEN 'baixo'
            WHEN QtdePontos BETWEEN 11 and 499 THEN 'médio'
            ELSE 'alto'
        END) as CategoriaPontos

FROM transacoes
