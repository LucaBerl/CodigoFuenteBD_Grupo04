CREATE VIEW vw_EstadoDePedido AS
SELECT
    P.IDPedido,
    C.IDCliente,
    C.Nombre AS NombreCliente,
    C.Apellido AS ApellidoCliente,
    P.FechaCreacion,
    ep.Nombre AS EstadoPedido, 
    P.MontoTotal,
    PG.MetodoPago,
    PG.FechaPago,
    ISNULL(ee.Nombre, 'N/A') AS EstadoEnvio, -- Usamos ISNULL por si el LEFT JOIN a ENVIO falla 
    E.Tracking
FROM
    PEDIDO P
INNER JOIN
    CLIENTE C ON P.IDCliente = C.IDCliente   
INNER JOIN
    EstadoPedido ep ON P.IDEstadoPedido = ep.IDEstadoPedido 
LEFT JOIN
    PAGO PG ON P.IDPedido = PG.IDPedido
LEFT JOIN
    ENVIO E ON P.IDPedido = E.IDPedido
LEFT JOIN
    EstadoEnvio ee ON E.IDEstadoEnvio = ee.IDEstadoEnvio;
GO