USE ECOMMERCE_BD;
GO

INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Remeras', 'Remeras de manga corta y larga'),
('Pantalones', 'Pantalones largos y cortos'),
('Calzados', 'Zapatillas, zapatos y sandalias'),
('Accesorios', 'Gorros, cinturones y bufandas');
GO

INSERT INTO MARCA (Nombre) VALUES
('Nike'),
('Adidas'),
('Puma'),
('Zara'),
('H&M');
GO

INSERT INTO PRODUCTO (Nombre, Descripcion, Sexo, IDCategoria, IDMarca) VALUES
-- Nike Products (IDMarca = 1)
('Nike Air Max 270', 'Zapatillas de running con cámara de aire', 'U', 3, 1),
('Nike Sportswear Club Fleece', 'Pantalón de chándal de tejido Fleece', 'M', 2, 1),
('Nike Dri-FIT Legend', 'Remera de entrenamiento', 'M', 1, 1),
('Nike Air Force 1', 'Zapatillas clásicas de baloncesto', 'U', 3, 1),
('Nike Pro Shorts', 'Pantalones cortos de compresión', 'F', 2, 1),
('Nike Heritage86', 'Gorra ajustable', 'U', 4, 1),
('Nike Revolution 5', 'Zapatillas de running para principiantes', 'F', 3, 1),
('Nike Sportswear Essential', 'Remera de manga corta', 'F', 1, 1),
('Nike Phantom GT2', 'Botines de fútbol', 'U', 3, 1),
('Nike Yoga Dri-FIT', 'Pantalón de yoga', 'F', 2, 1),
('Nike Brasilia', 'Mochila de entrenamiento', 'U', 4, 1),
('Nike Court Vision Low', 'Zapatillas de estilo retro', 'U', 3, 1),
('Nike One Luxe', 'Leggings de tiro medio', 'F', 2, 1),
('Nike Everyday Plus', 'Calcetines de entrenamiento (3 pares)', 'U', 4, 1),
('Nike Victory', 'Remera de tenis', 'M', 1, 1),
-- Adidas Products (IDMarca = 2)
('Adidas Ultraboost 22', 'Zapatillas de running de alto rendimiento', 'U', 3, 2),
('Adidas Tiro 21', 'Pantalón de entrenamiento', 'M', 2, 2),
('Adidas Essentials', 'Remera con logo grande', 'M', 1, 2),
('Adidas Stan Smith', 'Zapatillas clásicas de tenis', 'U', 3, 2),
('Adidas Designed 2 Move', 'Pantalones cortos de training', 'F', 2, 2),
('Adidas Baseball Cap', 'Gorra de béisbol', 'U', 4, 2),
('Adidas Supernova', 'Zapatillas de running para uso diario', 'F', 3, 2),
('Adidas Trefoil', 'Remera clásica', 'F', 1, 2),
('Adidas Predator Freak', 'Botines de fútbol', 'U', 3, 2),
('Adidas Yoga Studio', 'Pantalón 7/8', 'F', 2, 2),
('Adidas Power 5', 'Mochila espaciosa', 'U', 4, 2),
('Adidas Gazelle', 'Zapatillas de ante estilo retro', 'U', 3, 2),
('Adidas Optime', 'Leggings de training', 'F', 2, 2),
('Adidas Cushioned Crew', 'Calcetines (3 pares)', 'U', 4, 2),
('Adidas Club', 'Remera de tenis', 'M', 1, 2),
-- Puma Products (IDMarca = 3)
('Puma RS-X³', 'Zapatillas de estilo urbano', 'U', 3, 3),
('Puma T7', 'Pantalón de chándal icónico', 'M', 2, 3),
('Puma Essentials Logo', 'Remera de algodón', 'M', 1, 3),
('Puma Suede Classic', 'Zapatillas de ante', 'U', 3, 3),
('Puma Active', 'Pantalones cortos tejidos', 'F', 2, 3),
('Puma Archive Logo', 'Gorra con logo', 'U', 4, 3),
('Puma Velocity Nitro', 'Zapatillas de running', 'F', 3, 3),
('Puma Essentials+', 'Remera con logo metálico', 'F', 1, 3),
('Puma Future Z', 'Botines de fútbol', 'U', 3, 3),
('Puma Studio', 'Pantalón de yoga acanalado', 'F', 2, 3),
('Puma Phase', 'Mochila', 'U', 4, 3),
('Puma Carina', 'Zapatillas de plataforma', 'F', 3, 3),
('Puma Modern Sports', 'Leggings', 'F', 2, 3),
('Puma Quarter', 'Calcetines (3 pares)', 'U', 4, 3),
('Puma Teamliga', 'Remera de entrenamiento', 'M', 1, 3),
-- Zara Products (IDMarca = 4)
('Remera Básica', 'Remera de cuello redondo', 'F', 1, 4),
('Jean Slim', 'Pantalón vaquero de corte slim', 'M', 2, 4),
('Blazer Estructura', 'Blazer con hombreras', 'F', 1, 4),
('Zapatilla Lona', 'Zapatillas casual de lona', 'U', 3, 4),
('Falda Midi Plisada', 'Falda por debajo de la rodilla', 'F', 2, 4),
('Cinturón Piel', 'Cinturón de cuero', 'M', 4, 4),
('Vestido Camisero', 'Vestido con botones', 'F', 1, 4),
('Pantalón Chino', 'Pantalón de sarga de algodón', 'M', 2, 4),
('Botín Tacón Piel', 'Botines de piel con tacón', 'F', 3, 4),
('Camisa Lino', 'Camisa de lino 100%', 'M', 1, 4),
('Bolso Shopper', 'Bolso grande de piel', 'F', 4, 4),
('Pantalón Cargo', 'Pantalón con bolsillos laterales', 'M', 2, 4),
('Top Lencero', 'Top con detalles de encaje', 'F', 1, 4),
('Bufanda Cuadros', 'Bufanda de lana', 'U', 4, 4),
('Sobrecamisa Pana', 'Chaqueta ligera de pana', 'M', 1, 4),
-- H&M Products (IDMarca = 5)
('Remera Algodón', 'Remera básica de algodón orgánico', 'M', 1, 5),
('Jean Regular', 'Vaquero de corte recto', 'M', 2, 5),
('Vestido Canalé', 'Vestido ajustado de punto', 'F', 1, 5),
('Zapatillas Deportivas', 'Zapatillas de malla', 'U', 3, 5),
('Pantalón Jogger', 'Pantalón de chándal', 'M', 2, 5),
('Gorro Lana', 'Gorro de punto en mezcla de lana', 'U', 4, 5),
('Camisa Oxford', 'Camisa de corte regular', 'M', 1, 5),
('Falda Circular', 'Falda corta con vuelo', 'F', 2, 5),
('Botas Chelsea', 'Botas de piel sintética', 'M', 3, 5),
('Sudadera Capucha', 'Sudadera con capucha y bolsillo canguro', 'U', 1, 5),
('Mochila Lona', 'Mochila de lona de algodón', 'U', 4, 5),
('Pantalón Traje', 'Pantalón de vestir slim fit', 'M', 2, 5),
('Blusa Volantes', 'Blusa con detalles de volantes', 'F', 1, 5),
('Calcetines (5 pares)', 'Pack de calcetines de algodón', 'U', 4, 5),
('Chaqueta Vaquera', 'Chaqueta vaquera clásica', 'U', 1, 5);
GO

INSERT INTO ARTICULO (IDProducto, Color, Talle, CantidadStock, Precio) VALUES
-- Nike Articles (Products 1-15)
(1, 'Negro', '42', 100, 120.00), (1, 'Blanco', '43', 80, 120.00),
(2, 'Gris', 'L', 150, 50.00), (2, 'Negro', 'M', 200, 50.00),
(3, 'Azul', 'M', 250, 30.00), (3, 'Blanco', 'L', 300, 30.00),
(4, 'Blanco', '41', 120, 90.00), (4, 'Negro', '42', 110, 90.00),
(5, 'Negro', 'S', 90, 40.00), (5, 'Gris', 'M', 100, 40.00),
(6, 'Negro', 'Único', 500, 25.00), (6, 'Blanco', 'Único', 450, 25.00),
(7, 'Rosa', '38', 80, 60.00), (7, 'Negro', '39', 90, 60.00),
(8, 'Blanco', 'S', 300, 25.00), (8, 'Negro', 'M', 350, 25.00),
(9, 'Verde', '44', 60, 150.00), (9, 'Naranja', '45', 50, 150.00),
(10, 'Negro', 'M', 70, 70.00), (10, 'Gris', 'L', 60, 70.00),
(11, 'Negro', 'Único', 100, 45.00), (11, 'Azul', 'Único', 120, 45.00),
(12, 'Blanco/Rojo', '42', 90, 75.00), (12, 'Negro/Blanco', '43', 80, 75.00),
(13, 'Negro', 'M', 110, 55.00), (13, 'Azul', 'S', 130, 55.00),
(14, 'Blanco', 'L', 400, 18.00), (14, 'Negro', 'L', 450, 18.00),
(15, 'Blanco', 'M', 100, 40.00), (15, 'Azul', 'L', 90, 40.00),
-- Adidas Articles (Products 16-30)
(16, 'Blanco/Azul', '42', 110, 180.00), (16, 'Negro/Blanco', '43', 100, 180.00),
(17, 'Negro', 'M', 200, 45.00), (17, 'Azul Marino', 'L', 180, 45.00),
(18, 'Blanco', 'L', 300, 28.00), (18, 'Negro', 'M', 320, 28.00),
(19, 'Blanco/Verde', '41', 150, 85.00), (19, 'Blanco/Negro', '42', 140, 85.00),
(20, 'Negro', 'S', 100, 35.00), (20, 'Gris', 'M', 120, 35.00),
(21, 'Negro', 'Único', 400, 22.00), (21, 'Blanco', 'Único', 380, 22.00),
(22, 'Celeste', '38', 90, 110.00), (22, 'Negro', '39', 100, 110.00),
(23, 'Blanco', 'S', 350, 30.00), (23, 'Negro', 'M', 400, 30.00),
(24, 'Rojo/Negro', '44', 70, 200.00), (24, 'Azul/Blanco', '45', 60, 200.00),
(25, 'Negro', 'M', 80, 65.00), (25, 'Gris', 'L', 70, 65.00),
(26, 'Negro', 'Único', 110, 50.00), (26, 'Rojo', 'Único', 130, 50.00),
(27, 'Verde', '42', 100, 80.00), (27, 'Gris', '43', 90, 80.00),
(28, 'Negro', 'M', 120, 50.00), (28, 'Azul', 'S', 140, 50.00),
(29, 'Blanco', 'L', 450, 16.00), (29, 'Negro', 'L', 500, 16.00),
(30, 'Blanco', 'M', 110, 42.00), (30, 'Negro', 'L', 100, 42.00),
-- Puma Articles (Products 31-45)
(31, 'Blanco/Negro', '42', 90, 110.00), (31, 'Gris/Naranja', '43', 80, 110.00),
(32, 'Negro', 'M', 180, 55.00), (32, 'Rojo', 'L', 160, 55.00),
(33, 'Blanco', 'L', 280, 25.00), (33, 'Negro', 'M', 300, 25.00),
(34, 'Negro', '41', 130, 70.00), (34, 'Rojo', '42', 120, 70.00),
(35, 'Negro', 'S', 90, 30.00), (35, 'Azul', 'M', 110, 30.00),
(36, 'Negro', 'Único', 350, 20.00), (36, 'Blanco', 'Único', 330, 20.00),
(37, 'Naranja', '38', 80, 130.00), (37, 'Negro', '39', 90, 130.00),
(38, 'Rosa', 'S', 300, 28.00), (38, 'Blanco', 'M', 320, 28.00),
(39, 'Amarillo/Negro', '44', 60, 180.00), (39, 'Naranja/Negro', '45', 50, 180.00),
(40, 'Negro', 'M', 70, 60.00), (40, 'Gris', 'L', 60, 60.00),
(41, 'Negro', 'Único', 150, 40.00), (41, 'Rosa', 'Único', 170, 40.00),
(42, 'Blanco', '37', 100, 65.00), (42, 'Negro', '38', 90, 65.00),
(43, 'Negro', 'M', 110, 45.00), (43, 'Gris', 'S', 130, 45.00),
(44, 'Blanco', 'L', 400, 15.00), (44, 'Negro', 'L', 420, 15.00),
(45, 'Rojo', 'M', 100, 35.00), (45, 'Azul', 'L', 90, 35.00),
-- Zara Articles (Products 46-60)
(46, 'Blanco', 'M', 400, 15.99), (46, 'Negro', 'L', 350, 15.99),
(47, 'Azul Oscuro', '32', 200, 39.99), (47, 'Negro', '34', 180, 39.99),
(48, 'Negro', 'S', 100, 79.99), (48, 'Beige', 'M', 90, 79.99),
(49, 'Blanco', '41', 150, 29.99), (49, 'Negro', '42', 140, 29.99),
(50, 'Verde', 'M', 120, 49.99), (50, 'Negro', 'S', 130, 49.99),
(51, 'Marrón', '90cm', 250, 25.99), (51, 'Negro', '95cm', 230, 25.99),
(52, 'Blanco', 'S', 110, 45.99), (52, 'Azul', 'M', 100, 45.99),
(53, 'Beige', '32', 180, 35.99), (53, 'Gris', '34', 170, 35.99),
(54, 'Negro', '38', 90, 89.99), (54, 'Marrón', '39', 80, 89.99),
(55, 'Blanco', 'M', 200, 49.99), (55, 'Celeste', 'L', 180, 49.99),
(56, 'Negro', 'Único', 100, 59.99), (56, 'Marrón', 'Único', 90, 59.99),
(57, 'Verde Militar', '31', 150, 49.99), (57, 'Negro', '32', 140, 49.99),
(58, 'Blanco', 'S', 180, 22.99), (58, 'Negro', 'M', 200, 22.99),
(59, 'Gris', 'Único', 300, 29.99), (59, 'Azul', 'Único', 280, 29.99),
(60, 'Azul Medio', 'M', 120, 59.99), (60, 'Negro', 'L', 110, 59.99),
-- H&M Articles (Products 61-75)
(61, 'Blanco', 'M', 500, 9.99), (61, 'Negro', 'L', 450, 9.99),
(62, 'Azul Claro', '32', 300, 29.99), (62, 'Negro', '33', 280, 29.99),
(63, 'Negro', 'S', 150, 24.99), (63, 'Rojo', 'M', 140, 24.99),
(64, 'Gris', '42', 200, 34.99), (64, 'Negro', '43', 180, 34.99),
(65, 'Gris Oscuro', 'M', 250, 19.99), (65, 'Negro', 'L', 230, 19.99),
(66, 'Gris', 'Único', 400, 12.99), (66, 'Negro', 'Único', 380, 12.99),
(67, 'Blanco', 'M', 220, 24.99), (67, 'Azul', 'L', 200, 24.99),
(68, 'Negro', 'S', 180, 14.99), (68, 'Rosa', 'M', 170, 14.99),
(69, 'Negro', '43', 100, 49.99), (69, 'Marrón', '44', 90, 49.99),
(70, 'Gris Jaspeado', 'M', 300, 29.99), (70, 'Negro', 'L', 280, 29.99),
(71, 'Negro', 'Único', 120, 29.99), (71, 'Verde', 'Único', 110, 29.99),
(72, 'Gris Oscuro', '32', 150, 39.99), (72, 'Negro', '34', 140, 39.99),
(73, 'Blanco', 'S', 200, 17.99), (73, 'Crema', 'M', 190, 17.99),
(74, 'Multicolor', 'L', 600, 12.99), (74, 'Blanco y Negro', 'L', 550, 12.99),
(75, 'Azul', 'M', 140, 39.99), (75, 'Negro', 'L', 130, 39.99);
GO

INSERT INTO ImagenesArticulo (SKU, URL) VALUES
(1, 'http://example.com/images/nike_air_max_270_black.jpg'),
(2, 'http://example.com/images/nike_air_max_270_white.jpg'),
(3, 'http://example.com/images/nike_club_fleece_grey.jpg'),
(4, 'http://example.com/images/nike_club_fleece_black.jpg'),
(31, 'http://example.com/images/adidas_ultraboost_22_white.jpg'),
(32, 'http://example.com/images/adidas_ultraboost_22_black.jpg');
GO

INSERT INTO CLIENTE (Nombre, Apellido, Telefono) VALUES
('Juan', 'Perez', '1122334455'),
('Maria', 'Gomez', '5566778899');
GO

INSERT INTO ClienteUsuario (IDCliente, Email, ContraseniaHash) VALUES
(1, 'juan.perez@example.com', 'password123'),
(2, 'maria.gomez@example.com', 'password456');
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