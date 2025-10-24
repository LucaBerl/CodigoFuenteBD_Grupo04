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
WHERE
    A.CantidadStock > 0;
GO