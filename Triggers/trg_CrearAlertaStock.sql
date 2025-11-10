USE ECOMMERCE_BD;
GO

CREATE TRIGGER trg_CrearAlertaStock
ON FavoritosCliente
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    
    INSERT INTO AlertasStockPendientes (IDCliente, SKU)
    
    
    SELECT
        i.IDCliente,
        i.SKU
    FROM
        inserted i
    
    JOIN
        ARTICULO a ON i.SKU = a.SKU
    
    WHERE
        a.CantidadStock = 0
    
    AND NOT EXISTS (
        SELECT 1
        FROM AlertasStockPendientes asp
        WHERE asp.IDCliente = i.IDCliente
          AND asp.SKU = i.SKU
    );
END;
GO