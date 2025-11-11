USE ECOMMERCE_BD;
GO


CREATE VIEW vw_ProductosConStock AS
SELECT
    P.IDProducto,
    P.Nombre AS NombreProducto,
    P.Descripcion,
    A.SKU,
    A.Color,
    A.Talle,
    A.CantidadStock,
    A.Precio
FROM
    PRODUCTO P
INNER JOIN
    ARTICULO A ON P.IDProducto = A.IDProducto
INNER JOIN
    MARCA M ON P.IDMarca = M.IDMarca           
INNER JOIN
    CATEGORIA C ON P.IDCategoria = C.IDCategoria 
WHERE
    A.CantidadStock > 0
    AND A.Estado = 1        
    AND P.Estado = 1         
    AND M.Estado = 1         
    AND C.Estado = 1;      
GO