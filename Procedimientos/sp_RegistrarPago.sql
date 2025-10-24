-- ESTE PROCEDIMIENTO, REGISTRA EL PAGO DEL CLIENTE UNA VEZ FINALIZADA LA COMPRA. PARA ELLO VERIFICAMOS STOCK DISPONIBLE Y LUEGO LO DESCONTAMOS DE LA TABLA ARTICULO.
-- LUEGO INSERTAMOS REGISTRO EN LA TABLA DE PAGO, ACTUALIZAMOS EL ESTADO DEL PEDIDO A "FINALIZADO" Y CREAMOS AUTOMATICAMENTE LA TABLA ENVIO CON ESTADO "PENDIENTE".

USE ECOMMERCE_BD;
GO

CREATE PROCEDURE sp_RegistrarPago
    @IDPedido INT,
    @MetodoPago NVARCHAR(100),
    @Monto DECIMAL(12,2),
    @IDDomicilio INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @EstadoActual NVARCHAR(50);

        -- Verificar existencia del pedido

        SELECT @EstadoActual = EstadoPedido FROM PEDIDO WHERE IDPedido = @IDPedido;

        IF @EstadoActual IS NULL
        BEGIN
            RAISERROR('El pedido no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar que este en estado válido

        IF @EstadoActual <> 'EnProceso'
        BEGIN
            RAISERROR('El pedido no se encuentra en estado válido para registrar un pago.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

       
        -- Verificar stock disponible de todos los artículos
        
        IF EXISTS (
            SELECT 1 FROM DetallePedido d
            JOIN ARTICULO a ON d.SKU = a.SKU
            WHERE d.IDPedido = @IDPedido AND a.CantidadStock < d.CantidadPedido 
        )
        BEGIN
            RAISERROR('No hay stock suficiente para uno o más artículos del pedido.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        
        -- Descontar stock real
        
        UPDATE a SET a.CantidadStock = a.CantidadStock - d.CantidadPedido FROM ARTICULO a
        JOIN DetallePedido d ON a.SKU = d.SKU
        WHERE d.IDPedido = @IDPedido;

        
        -- Registrar el pago
        
        INSERT INTO PAGO (IDPedido, MetodoPago, Monto)
        VALUES (@IDPedido, @MetodoPago, @Monto);

        
        --  Actualizar estado del pedido
        
        UPDATE PEDIDO SET EstadoPedido = 'Finalizado', FechaUltMovimiento = GETDATE()
        WHERE IDPedido = @IDPedido;

        
        -- Crear el envío asociado
        
        INSERT INTO ENVIO (IDPedido, IDDomicilio, EstadoEnvio)
        VALUES (@IDPedido, @IDDomicilio, 'Pendiente');

        COMMIT TRANSACTION;

        PRINT 'Pago registrado, stock actualizado y envío creado correctamente.';
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
