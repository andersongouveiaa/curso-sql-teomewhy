SELECT count(*),
       count(1),
       count(IdCliente),
         count(DtCriacao)
FROM Clientes;

SELECT COUNT(DISTINCT IdCliente)

FROM Clientes
