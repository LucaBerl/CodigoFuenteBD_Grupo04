-- ESTE PROCEDIMIENTO, REGISTRA EL PAGO DEL CLIENTE UNA VEZ FINALIZADA LA COMPRA. PARA ELLO VERIFICAMOS STOCK DISPONIBLE Y LUEGO LO DESCONTAMOS DE LA TABLA ARTICULO.
-- LUEGO INSERTAMOS REGISTRO EN LA TABLA DE PAGO, ACTUALIZAMOS EL ESTADO DEL PEDIDO A "FINALIZADO" Y CREAMOS AUTOMATICAMENTE LA TABLA ENVIO CON ESTADO "PENDIENTE".

CREATE PROCEDURE sp_RegistrarPago
    @IDPedido INT,
    @MetodoPago NVARCHAR(100),
    @Monto DECIMAL(12,2),
    @IDDomicilio INT = NULL -- Acepta NULL para "RetiraLocal"
AS
BEGIN
    SET NOCOUNT ON;

    
    DECLARE @IDEstadoEnProceso INT = (SELECT IDEstadoPedido FROM EstadoPedido WHERE Nombre = 'EnProceso');
    DECLARE @IDEstadoFinalizado INT = (SELECT IDEstadoPedido FROM EstadoPedido WHERE Nombre = 'Finalizado');
    DECLARE @IDEstadoEnvioPendiente INT = (SELECT IDEstadoEnvio FROM EstadoEnvio WHERE Nombre = 'Pendiente');
    DECLARE @IDEstadoEnvioRetiraLocal INT = (SELECT IDEstadoEnvio FROM EstadoEnvio WHERE Nombre = 'RetiraLocal');

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IDEstadoActual INT;
        DECLARE @IDClienteDelPedido INT;
        DECLARE @IDEstadoEnvioDestino INT;

        -- Verificar existencia del pedido y obtener su estado y cliente
        SELECT @IDEstadoActual = IDEstadoPedido, @IDClienteDelPedido = IDCliente FROM PEDIDO 
        WHERE IDPedido = @IDPedido;

        IF @IDEstadoActual IS NULL
        BEGIN
            RAISERROR('El pedido no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar que este en estado válido (EnProceso)
        IF @IDEstadoActual <> @IDEstadoEnProceso
        BEGIN
            RAISERROR('El pedido no se encuentra en estado válido para registrar un pago.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

       
        --  VALIDACIÓN DE DOMICILIO Y TIPO DE ENVÍO
        
        
        IF @IDDomicilio IS NULL
        BEGIN
            -- El cliente eligió "Retira por Local"
            SET @IDEstadoEnvioDestino = @IDEstadoEnvioRetiraLocal;
        END
        ELSE
        BEGIN
            -- El cliente eligió envío a domicilio. Validamos que le pertenezca.
            SET @IDEstadoEnvioDestino = @IDEstadoEnvioPendiente;
            
            IF NOT EXISTS (
                SELECT 1 FROM DomicilioCliente 
                WHERE IDDomicilio = @IDDomicilio AND IDCliente = @IDClienteDelPedido
            )
            BEGIN
                RAISERROR('El domicilio de envío seleccionado no pertenece al cliente que realizó el pedido.', 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END
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

        
        -- Actualizar estado del pedido a "Finalizado"
        UPDATE PEDIDO 
        SET IDEstadoPedido = @IDEstadoFinalizado, FechaUltMovimiento = GETDATE()
        WHERE IDPedido = @IDPedido;

        
        -- Crear el envío asociado 
        INSERT INTO ENVIO (IDPedido, IDDomicilio, IDEstadoEnvio)
        VALUES (@IDPedido, @IDDomicilio, @IDEstadoEnvioDestino);

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