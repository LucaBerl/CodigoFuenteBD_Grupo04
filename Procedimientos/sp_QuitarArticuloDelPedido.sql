-- ESTE PROCEDIMIENTO ALMACENADO QUITA UNO O VARIOS ARTICULOS AL PEDIDO (CARRITO DE COMPRAS) DE UN CLIENTE. PARA ELLO, PRIMERO BUSCAMOS EL PEDIDO CORRESPONDIENTE
-- LUEGO VALIDAMOS CANTIDADES PARA NO DESCONTAR MAS DE LO QUE SE TIENE. PROCEDEMOS A DESCONTAR LA CANTIDAD CORRESPONDIENTE EN "DETALLEPEDIDO" (SI QUEDA EN 0 ELIMINAMOS EL REGISTRO)
-- POR ULTIMO, ACTUALIZAMOS LA FECHA DEL ULTIMO MOVIMIENTO DEL CARRITO.

USE ECOMMERCE_BD;
GO

CREATE PROCEDURE sp_QuitarArticuloDelPedido
    @IDCliente INT,
    @SKU INT,
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IDPedido INT;
        DECLARE @CantidadActual INT;
        
        
        DECLARE @IDEstadoEnProceso INT;
        SELECT @IDEstadoEnProceso = IDEstadoPedido FROM EstadoPedido WHERE Nombre = 'EnProceso';

        -- Buscar pedido "EnProceso" del cliente usando el ID

        SELECT TOP 1 @IDPedido = IDPedido FROM PEDIDO
        WHERE IDCliente = @IDCliente AND IDEstadoPedido = @IDEstadoEnProceso;

        IF @IDPedido IS NULL
        BEGIN
            RAISERROR('No existe un pedido en proceso para este cliente.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar que el articulo este dentro del pedido
        SELECT @CantidadActual = CantidadPedido FROM DetallePedido
        WHERE IDPedido = @IDPedido AND SKU = @SKU;

        IF @CantidadActual IS NULL
        BEGIN
            RAISERROR('El artículo no existe en el pedido.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar que la cantidad a quitar sea menor o igual a la cantidad actual
        IF @Cantidad > @CantidadActual
        BEGIN
            RAISERROR('La cantidad a quitar supera la cantidad actual en el pedido.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Reducir cantidad o eliminar el detalle si queda en cero
        IF @Cantidad = @CantidadActual
        BEGIN
            DELETE FROM DetallePedido
            WHERE IDPedido = @IDPedido AND SKU = @SKU;
        END
        ELSE
        BEGIN
            UPDATE DetallePedido SET CantidadPedido = CantidadPedido - @Cantidad
            WHERE IDPedido = @IDPedido AND SKU = @SKU;
        END

        -- Actualizar fecha de último movimiento del pedido
        UPDATE PEDIDO SET FechaUltMovimiento = GETDATE()
        WHERE IDPedido = @IDPedido;

        COMMIT TRANSACTION;

        PRINT 'Artículo quitado correctamente del pedido.';

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