-- Lista de produtos com nome que começa com “Venda de”;

SELECT IdProduto,
       DescProduto

FROM produtos

where DescProduto like 'venda de%'
