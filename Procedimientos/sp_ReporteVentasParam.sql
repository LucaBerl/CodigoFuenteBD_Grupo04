-- Este procedimiento es un reporte de ventas agrupado y parametrizado. Permite ver un resumen de cuánto se vendió y cuántos pedidos se hicieron, 
-- agrupando esos totales por Mes, Marca y Categoría.

USE ECOMMERCE_BD;
GO

CREATE PROCEDURE sp_ReporteVentasParam
    @Desde DATE,
    @Hasta DATE,
    @IDMarca INT = NULL,
    @IDCategoria INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    
    DECLARE @HastaDateTime DATETIME = DATEADD(day, 1, @Hasta);

    SELECT 
        YEAR(pg.FechaPago) AS Anio,
        MONTH(pg.FechaPago) AS Mes,
        m.Nombre AS Marca,
        c.Nombre AS Categoria,
        COUNT(DISTINCT p.IDPedido) AS CantPedidos,
        
        
        SUM(d.Subtotal) AS TotalVendido 
        
    FROM PAGO pg
    JOIN PEDIDO p ON p.IDPedido = pg.IDPedido
    JOIN DetallePedido d ON d.IDPedido = p.IDPedido
    JOIN ARTICULO a ON a.SKU = d.SKU
    JOIN PRODUCTO pr ON pr.IDProducto = a.IDProducto
    JOIN MARCA m ON m.IDMarca = pr.IDMarca
    JOIN CATEGORIA c ON c.IDCategoria = pr.IDCategoria
    
    
    WHERE pg.FechaPago >= @Desde AND pg.FechaPago < @HastaDateTime
      AND (@IDMarca IS NULL OR m.IDMarca = @IDMarca)
      AND (@IDCategoria IS NULL OR c.IDCategoria = @IDCategoria)
      
    GROUP BY YEAR(pg.FechaPago), MONTH(pg.FechaPago), m.Nombre, c.Nombre
    ORDER BY Anio, Mes, Marca, Categoria;
END;
GO