-- ESTE PROCEDIMIENTO ALMACENADO AGREGA UNO O VARIOS ARTICULOS AL PEDIDO (CARRITO DE COMPRAS) DE UN CLIENTE. PRIMERO, VERIFICAMOS STOCK. LUEGO VERIFICAMOS SI EL CLIENTE 
-- YA TIENE UN PEDIDO EN PROCESO, SI NO LO TIENE, CREAMOS UN PEDIDO NUEVO. SI EL ARTICULO YA EXISTIA EN EL PEDIDO, ACTUALIZAMOS CANTIDAD EN "DETALLEPEDIDO", CASO CONTRARIO
-- INSERTAMOS UN NUEVO "DETALLEPEDIDO", ACTUALIZAMOS FECHA ULTIMO MOVIMIENTO, Y FINALIZAMOS LA TRANSACCION.

USE ECOMMERCE_BD;
GO

CREATE PROCEDURE sp_AgregaArticuloEnPedido
    @IDCliente INT,
    @SKU INT,
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON; 

    BEGIN TRY;
        BEGIN TRANSACTION;

            DECLARE @IDPedido INT;
            DECLARE @Precio DECIMAL(10,2);
            DECLARE @StockDisponible INT;

            
            DECLARE @IDEstadoEnProceso INT;
            SELECT @IDEstadoEnProceso = IDEstadoPedido FROM EstadoPedido WHERE Nombre = 'EnProceso';


            -- Verificar stock del artículo
            SELECT @StockDisponible = CantidadStock, @Precio = Precio FROM ARTICULO 
            WHERE SKU = @SKU;

            IF @StockDisponible IS NULL
            BEGIN
                RAISERROR('El artículo no existe.', 16, 1);
                RETURN;
            END

            IF @StockDisponible < @Cantidad
            BEGIN
                RAISERROR('No hay stock suficiente para este artículo.', 16, 1);
                RETURN;
            END


            -- Buscar si el cliente ya tiene un pedido en proceso usando el ID
            SELECT TOP 1 @IDPedido = IDPedido FROM PEDIDO
            WHERE IDCliente = @IDCliente AND IDEstadoPedido = @IDEstadoEnProceso;


            -- Si no existe un pedido, crear un nuevo pedido...
            IF @IDPedido IS NULL
            BEGIN
                
                INSERT INTO PEDIDO (IDCliente, FechaCreacion, FechaUltMovimiento, IDEstadoPedido, MontoTotal)
                VALUES (@IDCliente, GETDATE(), GETDATE(), @IDEstadoEnProceso, 0);

                SET @IDPedido = SCOPE_IDENTITY();

                INSERT INTO DetallePedido (IDPedido, SKU, CantidadPedido, PrecioUnitario)
                VALUES (@IDPedido, @SKU, @Cantidad, @Precio);
            END
            ELSE
            BEGIN 
                UPDATE PEDIDO SET FechaUltMovimiento = GETDATE()
                WHERE IDPedido = @IDPedido;

                -- Si el articulo ya estaba en el pedido, sumamos cantidades...
                IF EXISTS (SELECT 1 FROM DetallePedido WHERE IDPedido = @IDPedido AND SKU = @SKU)
                BEGIN
                    UPDATE DetallePedido SET CantidadPedido = CantidadPedido + @Cantidad
                    WHERE IDPedido = @IDPedido AND SKU = @SKU;
                END
                ELSE
                -- Si no existia, insertamos el nuevo artículo...
                BEGIN 
                    INSERT INTO DetallePedido (IDPedido, SKU, CantidadPedido, PrecioUnitario)
                    VALUES (@IDPedido, @SKU, @Cantidad, @Precio);
                END
            END


            PRINT 'Artículo agregado correctamente al carrito.';
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH 
END;
GO