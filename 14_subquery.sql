-- LISTA DE TRANSAÇÕES COM O PRODUTO RESGATAR PONEI

SELECT * 

FROM transacao_produto as t1

WHERE t1.IdProduto = (
    SELECT IdProduto 
    FROM produtos 
    WHERE DescProduto = 'Resgatar Ponei'
);
