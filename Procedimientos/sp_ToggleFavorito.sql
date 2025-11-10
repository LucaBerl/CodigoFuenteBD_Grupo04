--Este procedimiento almacenado sirve para agregar o quitar un artículo de la lista de favoritos de un cliente, todo en una sola acción

USE ECOMMERCE_BD;
GO

CREATE OR ALTER PROCEDURE sp_ToggleFavorito
    @IDCliente INT,
    @SKU INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF EXISTS (SELECT 1 FROM FavoritosCliente WHERE IDCliente = @IDCliente AND SKU = @SKU)
        BEGIN
            
            DELETE FROM FavoritosCliente WHERE IDCliente = @IDCliente AND SKU = @SKU;
            DELETE FROM AlertasStockPendientes WHERE IDCliente = @IDCliente AND SKU = @SKU AND Estado = 1;
            
            PRINT 'Artículo quitado de favoritos.';
        END
        ELSE
        BEGIN
            
            IF NOT EXISTS (SELECT 1 FROM ClienteUsuario WHERE IDCliente = @IDCliente AND Estado = 1)
            BEGIN
                RAISERROR('El cliente no existe o se encuentra inactivo. No se puede agregar el favorito.', 16, 1);
                RETURN; 
            END

            
            IF NOT EXISTS (SELECT 1 FROM ARTICULO WHERE SKU = @SKU AND Estado = 1)
            BEGIN
                RAISERROR('El artículo no existe o no se encuentra disponible. No se puede agregar el favorito.', 16, 1);
                RETURN; 
            END

            
            INSERT INTO FavoritosCliente (IDCliente, SKU) VALUES (@IDCliente, @SKU);
            
            PRINT 'Artículo agregado a favoritos.';
        END
    END TRY
    BEGIN CATCH
        
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO