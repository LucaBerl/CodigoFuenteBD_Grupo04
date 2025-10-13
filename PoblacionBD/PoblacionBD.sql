USE ECOMMERCE_BD;
GO

INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Remeras', 'Remeras de manga corta y larga'),
('Pantalones', 'Pantalones largos y cortos'),
('Calzados', 'Zapatillas, zapatos y sandalias'),
('Accesorios', 'Gorros, cinturones y bufandas');
GO

INSERT INTO MARCA (Nombre) VALUES
('Marca A'),
('Marca B'),
('Marca C');
GO

INSERT INTO PRODUCTO (Nombre, Descripcion, Sexo, IDCategoria, IDMarca) VALUES
('Remera Verano', 'Remera de algodón para el verano', 'U', 1, 1),
('Remera Invierno', 'Remera térmica para el invierno', 'U', 1, 2),
('Pantalón Jean', 'Pantalón de jean clásico', 'M', 2, 1),
('Pantalón Corto', 'Pantalón corto de gabardina', 'F', 2, 3),
('Zapatillas Deportivas', 'Zapatillas para correr', 'U', 3, 2),
('Sandalias de Cuero', 'Sandalias de cuero artesanales', 'F', 3, 1),
('Gorro de Lana', 'Gorro de lana para el frío', 'U', 4, 3),
('Cinturón de Cuero', 'Cinturón de cuero genuino', 'M', 4, 2);
GO

INSERT INTO ARTICULO (IDProducto, Color, Talle, CantidadStock, Precio) VALUES
(1, 'Blanco', 'S', 50, 25.00),
(1, 'Negro', 'M', 40, 25.00),
(2, 'Azul', 'L', 30, 35.00),
(2, 'Gris', 'XL', 25, 35.00),
(3, 'Azul Oscuro', '42', 60, 50.00),
(3, 'Negro', '44', 55, 50.00),
(4, 'Beige', '38', 45, 30.00),
(4, 'Verde', '40', 35, 30.00),
(5, 'Negro/Blanco', '41', 70, 80.00),
(5, 'Gris/Azul', '43', 65, 80.00),
(6, 'Marrón', '37', 20, 45.00),
(6, 'Negro', '38', 15, 45.00),
(7, 'Rojo', 'Único', 100, 15.00),
(7, 'Azul Marino', 'Único', 90, 15.00),
(8, 'Marrón', '95cm', 80, 20.00),
(8, 'Negro', '105cm', 75, 20.00);
GO

INSERT INTO ImagenesArticulo (SKU, URL) VALUES
(1, 'http://example.com/images/remera_verano_blanco.jpg'),
(2, 'http://example.com/images/remera_verano_negro.jpg'),
(3, 'http://example.com/images/remera_invierno_azul.jpg'),
(4, 'http://example.com/images/remera_invierno_gris.jpg');
GO

INSERT INTO CLIENTE (Nombre, Apellido, Telefono) VALUES
('Juan', 'Perez', '1122334455'),
('Maria', 'Gomez', '5566778899');
GO

INSERT INTO ClienteUsuario (IDCliente, Email, ContraseniaHash, Salt) VALUES
(1, 'juan.perez@example.com', HASHBYTES('SHA2_512', 'password123'), CAST(NEWID() AS VARBINARY(128))),
(2, 'maria.gomez@example.com', HASHBYTES('SHA2_512', 'password456'), CAST(NEWID() AS VARBINARY(128)));
GO

INSERT INTO DomicilioCliente (IDCliente, Calle, Altura, Ciudad, Provincia, CodigoPostal) VALUES
(1, 'Av. Siempre Viva', '742', 'Springfield', 'Provincia Ficticia', 'B1675'),
(2, 'Calle Falsa', '123', 'Ciudad Gótica', 'Otra Provincia', 'C1000');
GO

INSERT INTO PEDIDO (IDCliente, FechaConcretado, EstadoPedido, MontoTotal) VALUES (1, GETDATE(), 'Finalizado', 105.00);
DECLARE @IDPedido1 INT = SCOPE_IDENTITY();

INSERT INTO DetallePedido (IDPedido, SKU, CantidadPedido, PrecioUnitario) VALUES
(@IDPedido1, 1, 2, 25.00),
(@IDPedido1, 5, 1, 55.00);

INSERT INTO PAGO (IDPedido, MetodoPago, Monto) VALUES (@IDPedido1, 'Tarjeta de Crédito', 105.00);

INSERT INTO ENVIO (IDPedido, IDDomicilio, EstadoEnvio, Tracking) VALUES (@IDPedido1, 1, 'Entregado', 'TRACK123456');
GO

INSERT INTO PEDIDO (IDCliente, EstadoPedido) VALUES (2, 'EnProceso');
DECLARE @IDPedido2 INT = SCOPE_IDENTITY();

INSERT INTO DetallePedido (IDPedido, SKU, CantidadPedido, PrecioUnitario) VALUES
(@IDPedido2, 7, 3, 15.00);
GO