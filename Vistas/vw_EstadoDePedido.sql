CREATE VIEW vw_EstadoDePedido AS
SELECT
    P.IDPedido,
    C.IDCliente,
    C.Nombre AS NombreCliente,
    C.Apellido AS ApellidoCliente,
    P.FechaCreacion,
    P.EstadoPedido,
    P.MontoTotal,
    PG.MetodoPago,
    PG.FechaPago,
    E.EstadoEnvio,
    E.Tracking
FROM
    PEDIDO P
INNER JOIN
    CLIENTE C ON P.IDCliente = C.IDCliente
LEFT JOIN
    PAGO PG ON P.IDPedido = PG.IDPedido
LEFT JOIN
    ENVIO E ON P.IDPedido = E.IDPedido;
GO