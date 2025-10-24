CREATE VIEW vw_ReporteMensual AS
SELECT
    YEAR(PG.FechaPago) AS Anio,
    MONTH(PG.FechaPago) AS Mes,
    SUM(PG.Monto) AS MontoTotalVentas,
    COUNT(DISTINCT P.IDPedido) AS CantidadPedidos
FROM
    PAGO PG
JOIN
    PEDIDO P ON PG.IDPedido = P.IDPedido
GROUP BY
    YEAR(PG.FechaPago),
    MONTH(PG.FechaPago);
GO