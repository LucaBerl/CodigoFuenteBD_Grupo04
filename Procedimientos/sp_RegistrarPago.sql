-- ESTE PROCEDIMIENTO, REGISTRA EL PAGO DEL CLIENTE UNA VEZ FINALIZADA LA COMPRA. PARA ELLO VERIFICAMOS ESTADO, MONTO Y STOCK DISPONIBLE Y LUEGO LO DESCONTAMOS DE LA TABLA ARTICULO.
-- LUEGO INSERTAMOS REGISTRO EN LA TABLA DE PAGO, ACTUALIZAMOS EL ESTADO DEL PEDIDO A "FINALIZADO" Y CREAMOS AUTOMATICAMENTE LA TABLA ENVIO CON ESTADO "PENDIENTE".

USE ECOMMERCE_BD;
GO


CREATE PROCEDURE sp_RegistrarPago
    @IDPedido INT,
    @MetodoPago NVARCHAR(100),
    @Monto DECIMAL(12,2),
    @IDDomicilio INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    
    DECLARE @IDEstadoEnProceso INT = (SELECT IDEstadoPedido FROM dbo.EstadoPedido WHERE Nombre = 'EnProceso');
    DECLARE @IDEstadoFinalizado INT = (SELECT IDEstadoPedido FROM dbo.EstadoPedido WHERE Nombre = 'Finalizado');
    DECLARE @IDEstadoEnvioPendiente INT = (SELECT IDEstadoEnvio FROM dbo.EstadoEnvio WHERE Nombre = 'Pendiente');
    DECLARE @IDEstadoEnvioRetiraLocal INT = (SELECT IDEstadoEnvio FROM dbo.EstadoEnvio WHERE Nombre = 'RetiraLocal');

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IDEstadoActual INT;
        DECLARE @IDClienteDelPedido INT;
        DECLARE @IDEstadoEnvioDestino INT;
        DECLARE @MontoCalculado DECIMAL(12,2);

        
        SELECT @IDEstadoActual = IDEstadoPedido, @IDClienteDelPedido = IDCliente, @MontoCalculado = MontoTotal FROM dbo.PEDIDO 
        WHERE IDPedido = @IDPedido;

        IF @IDEstadoActual IS NULL
        BEGIN
            RAISERROR('El pedido no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @IDEstadoActual <> @IDEstadoEnProceso
        BEGIN
            RAISERROR('El pedido no se encuentra en estado válido para registrar un pago.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @Monto <> @MontoCalculado
        BEGIN
            RAISERROR('El monto pagado no coincide con el monto total del pedido.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Validación de Domicilio
        IF @IDDomicilio IS NULL
        BEGIN
            SET @IDEstadoEnvioDestino = @IDEstadoEnvioRetiraLocal;
        END
        ELSE
        BEGIN
            SET @IDEstadoEnvioDestino = @IDEstadoEnvioPendiente;
            
            
            IF NOT EXISTS (
                SELECT 1 FROM dbo.DomicilioCliente 
                WHERE IDDomicilio = @IDDomicilio AND IDCliente = @IDClienteDelPedido
            )
            BEGIN
                RAISERROR('El domicilio de envío seleccionado no pertenece al cliente.', 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END
        END

        -- Verificación de Stock
        
        IF EXISTS (
            SELECT 1 FROM dbo.DetallePedido d 
            JOIN dbo.ARTICULO a ON d.SKU = a.SKU 
            WHERE d.IDPedido = @IDPedido AND a.CantidadStock < d.CantidadPedido 
        )
        BEGIN
            RAISERROR('No hay stock suficiente para uno o más artículos.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Descontar stock
        
        UPDATE a SET a.CantidadStock = a.CantidadStock - d.CantidadPedido 
        FROM dbo.ARTICULO a 
        JOIN dbo.DetallePedido d ON a.SKU = d.SKU 
        WHERE d.IDPedido = @IDPedido;
        
        -- Registrar el pago
        
        INSERT INTO dbo.PAGO (IDPedido, MetodoPago, Monto)
        VALUES (@IDPedido, @MetodoPago, @Monto);

        -- Actualizar estado del pedido
        
        UPDATE dbo.PEDIDO 
        SET IDEstadoPedido = @IDEstadoFinalizado, FechaUltMovimiento = GETDATE()
        WHERE IDPedido = @IDPedido;
            
        -- Crear el envío
        
        INSERT INTO dbo.ENVIO (IDPedido, IDDomicilio, IDEstadoEnvio) 
        VALUES (@IDPedido, @IDDomicilio, @IDEstadoEnvioDestino);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO