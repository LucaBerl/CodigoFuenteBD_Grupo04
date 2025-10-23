USE ECOMMERCE_DB; 
GO

CREATE TRIGGER trg_ActualizarMontoTotal
ON DetallePedido
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET MontoTotal = ISNULL((
        SELECT SUM(Subtotal) FROM DetallePedido d
        WHERE d.IDPedido = p.IDPedido), 0)
    FROM PEDIDO p
    WHERE p.IDPedido IN (
        SELECT DISTINCT IDPedido FROM inserted
        UNION
        SELECT DISTINCT IDPedido FROM deleted
    );
END;
GO
