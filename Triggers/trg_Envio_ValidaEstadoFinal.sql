USE ECOMMERCE_BD;
GO

CREATE TRIGGER trg_Envio_ValidarEstadoFinal
ON ENVIO
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

   
    DECLARE @IDEstadoEntregado INT = (SELECT IDEstadoEnvio FROM EstadoEnvio WHERE Nombre = 'Entregado');
    DECLARE @IDEstadoCancelado INT = (SELECT IDEstadoEnvio FROM EstadoEnvio WHERE Nombre = 'Cancelado');

    -- Comprobamos si algún registro que se intentó actualizar ya se encontraba en algun estado final , osea entregado o cancelado...
    
    IF EXISTS (
        SELECT 1 FROM deleted d
        WHERE d.IDEstadoEnvio IN (@IDEstadoEntregado, @IDEstadoCancelado)
    )
    BEGIN
        -- Si encontramos uno, anulamos la transacción...
        RAISERROR('No se puede modificar un envío que ya ha sido Entregado o Cancelado.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO