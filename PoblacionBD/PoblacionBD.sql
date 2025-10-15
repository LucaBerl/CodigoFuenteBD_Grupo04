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
('Juan', 'Pérez', '11-5555-1234'),
('María', 'García', '11-4444-5678'),
('Carlos', 'Rodríguez', '351-777-8901'),
('Ana', 'Martínez', '223-666-2345'),
('Luis', 'López', '11-3333-6789'),
('Laura', 'Sánchez', '299-555-4321'),
('Miguel', 'González', '11-2222-1122'),
('Sofía', 'Fernández', '341-888-3456'),
('Diego', 'Gómez', '261-444-7890'),
('Valentina', 'Díaz', '11-6666-9876'),
('Javier', 'Romero', '381-555-5432'),
('Camila', 'Torres', '221-777-8765'),
('Andrés', 'Álvarez', '11-9999-3210'),
('Lucía', 'Ruiz', '379-444-6543'),
('Martín', 'Jiménez', '11-1010-2020');
GO

INSERT INTO ClienteUsuario (IDCliente, Email, ContraseniaHash) VALUES
(1, 'juan.perez@email.com', 'hash_jp_123'),
(2, 'maria.garcia@email.com', 'hash_mg_456'),
(3, 'carlos.rodriguez@email.com', 'hash_cr_789'),
(4, 'ana.martinez@email.com', 'hash_am_101'),
(5, 'luis.lopez@email.com', 'hash_ll_112'),
(6, 'laura.sanchez@email.com', 'hash_ls_131'),
(7, 'miguel.gonzalez@email.com', 'hash_mg_141'),
(8, 'sofia.fernandez@email.com', 'hash_sf_151'),
(9, 'diego.gomez@email.com', 'hash_dg_161'),
(10, 'valentina.diaz@email.com', 'hash_vd_171'),
(11, 'javier.romero@email.com', 'hash_jr_181'),
(12, 'camila.torres@email.com', 'hash_ct_191'),
(13, 'andres.alvarez@email.com', 'hash_aa_202'),
(14, 'lucia.ruiz@email.com', 'hash_lr_212'),
(15, 'martin.jimenez@email.com', 'hash_mj_222');
GO

INSERT INTO DomicilioCliente (IDCliente, Calle, Altura, Ciudad, Provincia, CodigoPostal) VALUES
(1, 'Av. Corrientes', '1234', 'CABA', 'Buenos Aires', 'C1043AAS'),
(1, 'Florida', '500', 'CABA', 'Buenos Aires', 'C1005AAL'),
(2, 'Bv. San Juan', '567', 'Córdoba', 'Córdoba', 'X5000ATR'),
(3, 'Av. Colón', '890', 'Córdoba', 'Córdoba', 'X5000EPC'),
(4, 'Alberti', '2345', 'Mar del Plata', 'Buenos Aires', 'B7600FQR'),
(5, 'Av. Santa Fe', '3456', 'Rosario', 'Santa Fe', 'S2000ATH'),
(6, 'Av. del Libertador', '7890', 'CABA', 'Buenos Aires', 'C1429BMM'),
(7, 'Julio A. Roca', '123', 'Neuquén', 'Neuquén', 'Q8300'),
(8, 'San Martín', '456', 'Mendoza', 'Mendoza', 'M5500'),
(9, 'Peatonal Sarmiento', '789', 'Mendoza', 'Mendoza', 'M5500'),
(10, '9 de Julio', '1011', 'San Miguel de Tucumán', 'Tucumán', 'T4000'),
(11, 'Av. Aconquija', '1213', 'Yerba Buena', 'Tucumán', 'T4107'),
(12, 'Calle 12', '1415', 'La Plata', 'Buenos Aires', 'B1900'),
(13, 'Av. Belgrano', '1617', 'Salta', 'Salta', 'A4400'),
(13, 'Av. Venezuela', '1888', 'Salta', 'salta', 'A4400'),
(14, 'Junín', '1819', 'Corrientes', 'Corrientes', 'W3400'),
(14, 'Avellaneda', '254', 'Corrientes', 'Corrientes', 'W3400'),
(15, 'Defensa', '2021', 'CABA', 'Buenos Aires', 'C1065AAS'),
(15, 'Honduras', '181', 'CABA', 'Buenos Aires', 'C1065AAS');
GO

INSERT INTO PEDIDO (IDCliente, FechaCreacion, FechaConcretado, EstadoPedido) VALUES
-- Pedidos Finalizados
(1, '2025-09-15T10:00:00', '2025-09-15T18:00:00', 'Finalizado'),
(7, '2025-09-16T11:30:00', '2025-09-17T09:00:00', 'Finalizado'),
(12, '2025-09-17T14:20:00', '2025-09-17T20:45:00', 'Finalizado'),
(4, '2025-09-18T09:00:00', '2025-09-19T11:00:00', 'Finalizado'),
(9, '2025-09-19T21:00:00', '2025-09-20T15:30:00', 'Finalizado'),
(2, '2025-09-20T13:15:00', '2025-09-21T10:00:00', 'Finalizado'),
(15, '2025-09-21T18:00:00', '2025-09-22T14:20:00', 'Finalizado'),
(5, '2025-09-22T22:30:00', '2025-09-23T19:00:00', 'Finalizado'),
(11, '2025-09-23T10:45:00', '2025-09-24T12:00:00', 'Finalizado'),
(8, '2025-09-24T12:00:00', '2025-09-24T22:10:00', 'Finalizado'),
(3, '2025-09-25T15:00:00', '2025-09-26T13:00:00', 'Finalizado'),
(14, '2025-09-26T17:30:00', '2025-09-27T16:00:00', 'Finalizado'),
(6, '2025-09-27T19:00:00', '2025-09-28T18:00:00', 'Finalizado'),
(10, '2025-09-28T08:00:00', '2025-09-28T20:00:00', 'Finalizado'),
(1, '2025-09-29T11:25:00', '2025-09-30T10:00:00', 'Finalizado'),
(13, '2025-09-30T16:00:00', '2025-10-01T15:30:00', 'Finalizado'),
(7, '2025-10-01T18:10:00', '2025-10-02T17:00:00', 'Finalizado'),
(2, '2025-10-02T20:00:00', '2025-10-03T19:00:00', 'Finalizado'),
(12, '2025-10-03T23:00:00', '2025-10-04T21:00:00', 'Finalizado'),
(5, '2025-10-04T09:30:00', '2025-10-05T12:00:00', 'Finalizado'),
(9, '2025-10-05T14:00:00', '2025-10-06T14:00:00', 'Finalizado'),
(14, '2025-10-06T15:15:00', '2025-10-07T15:00:00', 'Finalizado'),
(3, '2025-10-07T17:45:00', '2025-10-08T18:00:00', 'Finalizado'),
(11, '2025-10-08T19:00:00', '2025-10-09T20:00:00', 'Finalizado'),
(6, '2025-10-09T22:00:00', '2025-10-10T22:30:00', 'Finalizado'),
-- Pedidos En Proceso (Fecha actual)
(10, GETDATE(), NULL, 'EnProceso'),
(4, GETDATE(), NULL, 'EnProceso'),
(1, GETDATE(), NULL, 'EnProceso'),
(8, GETDATE(), NULL, 'EnProceso'),
(13, GETDATE(), NULL, 'EnProceso');
GO

INSERT INTO DetallePedido (IDPedido, SKU, CantidadPedido, PrecioUnitario) VALUES
-- Pedido 1: Compra Nike
(1, 1, 1, 120.00),   -- Nike Air Max 270 Negro
(1, 11, 1, 25.00),  -- Nike Heritage86 Gorra
-- Pedido 2: Compra Adidas
(2, 33, 1, 45.00),  -- Adidas Tiro 21 Pantalón
(2, 35, 2, 28.00),  -- Adidas Essentials Remera (x2)
-- Pedido 3: Compra Zara formal
(3, 95, 1, 79.99),  -- Zara Blazer Estructura
(3, 109, 1, 89.99), -- Zara Botín Tacón Piel
-- Pedido 4: Compra Puma deportiva
(4, 63, 1, 110.00), -- Puma RS-X³ Zapatillas
(4, 89, 1, 35.00),  -- Puma Teamliga Remera
-- Pedido 5: Compra H&M casual
(5, 129, 1, 19.99), -- H&M Pantalón Jogger
(5, 139, 1, 29.99), -- H&M Sudadera Capucha
-- Pedido 6: Compra de calzado clásico
(6, 7, 1, 90.00),   -- Nike Air Force 1
(6, 37, 1, 85.00),  -- Adidas Stan Smith
-- Pedido 7: Compra de básicos y accesorios
(7, 121, 3, 9.99),  -- H&M Remera Algodón (x3)
(7, 147, 1, 12.99), -- H&M Calcetines (5 pares)
(7, 101, 1, 25.99), -- Zara Cinturón Piel
-- Pedido 8: Compra de ropa femenina
(8, 103, 1, 45.99), -- Zara Vestido Camisero
(8, 99, 1, 49.99),  -- Zara Falda Midi Plisada
-- Pedido 9: Compra de equipamiento de fútbol
(9, 17, 1, 150.00), -- Nike Phantom GT2
(9, 57, 1, 16.00),  -- Adidas Cushioned Crew Calcetines
-- Pedido 10: Compra de zapatillas retro
(10, 53, 1, 80.00),  -- Adidas Gazelle
(10, 67, 1, 70.00),  -- Puma Suede Classic
-- Pedido 11: Compra de leggings y top
(11, 25, 1, 55.00),  -- Nike One Luxe Leggings
(11, 115, 1, 22.99), -- Zara Top Lencero
-- Pedido 12: Compra de mochila
(12, 81, 1, 40.00),  -- Puma Phase Mochila
-- Pedido 13: Compra grande de Nike
(13, 3, 1, 50.00),   -- Nike Sportswear Club Fleece
(13, 5, 1, 30.00),   -- Nike Dri-FIT Legend Remera
(13, 23, 1, 75.00),  -- Nike Court Vision Low
-- Pedido 14: Compra de ropa de training
(14, 39, 1, 35.00),  -- Adidas Designed 2 Move Shorts
(14, 87, 1, 45.00),  -- Puma Modern Sports Leggings
-- Pedido 15: Cliente 1 vuelve a comprar
(15, 119, 1, 59.99), -- Zara Sobrecamisa Pana
-- Pedido 16: Compra para yoga
(16, 19, 1, 70.00),  -- Nike Yoga Dri-FIT
(16, 49, 1, 65.00),  -- Adidas Yoga Studio Pantalón
-- Pedido 17: Cliente 7 compra jeans
(17, 93, 1, 39.99),  -- Zara Jean Slim
(17, 123, 1, 29.99), -- H&M Jean Regular
-- Pedido 18: Cliente 2 compra de todo un poco
(18, 13, 1, 60.00),  -- Nike Revolution 5
(18, 66, 1, 55.00),  -- Puma T7 Pantalón
(18, 143, 1, 39.99), -- H&M Pantalón Traje
-- Pedido 19: Cliente 12 compra un bolso grande
(19, 111, 1, 59.99), -- Zara Bolso Shopper
-- Pedido 20: Cliente 5 compra calcetines en cantidad
(20, 27, 2, 18.00),  -- Nike Everyday Plus (x2 packs)
(20, 57, 2, 16.00),  -- Adidas Cushioned Crew (x2 packs)
-- Pedido 21: Compra de remeras básicas
(21, 61, 2, 25.00),  -- Puma Essentials Logo (x2)
(21, 91, 3, 15.99),  -- Zara Remera Básica (x3)
-- Pedido 22: Compra de zapatillas de running
(22, 31, 1, 180.00), -- Adidas Ultraboost 22
(22, 73, 1, 130.00), -- Puma Velocity Nitro
-- Pedido 23: Compra de invierno
(23, 117, 1, 29.99), -- Zara Bufanda Cuadros
(23, 131, 1, 12.99), -- H&M Gorro Lana
-- Pedido 24: Compra de camisas
(24, 109, 1, 49.99), -- Zara Camisa Lino
(24, 133, 1, 24.99), -- H&M Camisa Oxford
-- Pedido 25: Compra de botines de fútbol caros
(25, 47, 1, 200.00), -- Adidas Predator Freak
(25, 77, 1, 180.00), -- Puma Future Z
-- Pedido 26 (En Proceso)
(26, 149, 1, 39.99), -- H&M Chaqueta Vaquera
-- Pedido 27 (En Proceso)
(27, 51, 1, 50.00),  -- Adidas Power 5 Mochila
(27, 41, 1, 22.00),  -- Adidas Baseball Cap
-- Pedido 28 (En Proceso): Cliente 1 compra otra vez
(28, 92, 2, 15.99),  -- Zara Remera Básica (x2)
(28, 4, 1, 50.00),   -- Nike Sportswear Club Fleece Gris
-- Pedido 29 (En Proceso)
(29, 69, 1, 30.00),  -- Puma Active Shorts
(29, 75, 1, 28.00),  -- Puma Essentials+ Remera
-- Pedido 30 (En Proceso)
(30, 24, 1, 75.00);  -- Nike Court Vision Low Negro/Blanco
GO

WITH PedidoTotales AS (
    SELECT 
        IDPedido, 
        SUM(Subtotal) AS MontoCalculado
    FROM DetallePedido
    GROUP BY IDPedido
)
UPDATE p
SET p.MontoTotal = pt.MontoCalculado
FROM PEDIDO p
JOIN PedidoTotales pt ON p.IDPedido = pt.IDPedido;
GO
  
  
INSERT INTO PAGO (IDPedido, MetodoPago, FechaPago, Monto) VALUES
(1, 'Tarjeta de Crédito', '2025-09-15T18:00:00', 145.00),
(2, 'Mercado Pago', '2025-09-17T09:00:00', 101.00),
(3, 'Tarjeta de Débito', '2025-09-17T20:45:00', 169.98),
(4, 'Transferencia Bancaria', '2025-09-19T11:00:00', 145.00),
(5, 'Tarjeta de Crédito', '2025-09-20T15:30:00', 49.98),
(6, 'Mercado Pago', '2025-09-21T10:00:00', 175.00),
(7, 'Tarjeta de Débito', '2025-09-22T14:20:00', 68.96),
(8, 'Transferencia Bancaria', '2025-09-23T19:00:00', 95.98),
(9, 'Tarjeta de Crédito', '2025-09-24T12:00:00', 166.00),
(10, 'Mercado Pago', '2025-09-24T22:10:00', 150.00),
(11, 'Tarjeta de Débito', '2025-09-26T13:00:00', 77.99),
(12, 'Transferencia Bancaria', '2025-09-27T16:00:00', 40.00),
(13, 'Tarjeta de Crédito', '2025-09-28T18:00:00', 155.00),
(14, 'Mercado Pago', '2025-09-28T20:00:00', 80.00),
(15, 'Tarjeta de Débito', '2025-09-30T10:00:00', 59.99),
(16, 'Transferencia Bancaria', '2025-10-01T15:30:00', 135.00),
(17, 'Tarjeta de Crédito', '2025-10-02T17:00:00', 69.98),
(18, 'Mercado Pago', '2025-10-03T19:00:00', 114.99),
(19, 'Tarjeta de Débito', '2025-10-04T21:00:00', 59.99),
(20, 'Transferencia Bancaria', '2025-10-05T12:00:00', 68.00),
(21, 'Tarjeta de Crédito', '2025-10-06T14:00:00', 97.97),
(22, 'Mercado Pago', '2025-10-07T15:00:00', 310.00),
(23, 'Tarjeta de Débito', '2025-10-08T18:00:00', 42.98),
(24, 'Transferencia Bancaria', '2025-10-09T20:00:00', 74.98),
(25, 'Tarjeta de Crédito', '2025-10-10T22:30:00', 380.00);
GO


INSERT INTO ENVIO (IDPedido, IDDomicilio, EstadoEnvio, FechaUltMovimiento, Tracking) VALUES
-- Pedidos Entregados
(1, 1, 'Entregado', '2025-09-19T18:00:00', 'OCA1024'),
(2, 8, 'Entregado', '2025-09-21T09:00:00', 'CORREOARG2048'),
(3, 13, 'Entregado', '2025-09-21T20:45:00', 'ANDREANI3072'),
(4, 5, 'Entregado', '2025-09-23T11:00:00', 'OCA4096'),
(5, 10, 'Entregado', '2025-09-24T15:30:00', 'CORREOARG5120'),
(6, 3, 'Entregado', '2025-09-25T10:00:00', 'ANDREANI6144'),
(7, 18, 'Entregado', '2025-09-26T14:20:00', 'OCA7168'),
(8, 6, 'Entregado', '2025-09-27T19:00:00', 'CORREOARG8192'),
(9, 14, 'Entregado', '2025-09-28T12:00:00', 'ANDREANI9216'),
(10, 9, 'Entregado', '2025-09-28T22:10:00', 'OCA10240'),
(11, 12, 'Entregado', '2025-09-30T13:00:00', 'CORREOARG11264'),
(12, 16, 'Entregado', '2025-10-01T16:00:00', 'ANDREANI12288'),
(13, 7, 'Entregado', '2025-10-02T18:00:00', 'OCA13312'),
(14, 11, 'Entregado', '2025-10-02T20:00:00', 'CORREOARG14336'),
(15, 2, 'Entregado', '2025-10-04T10:00:00', 'ANDREANI15360'),
(16, 15, 'Entregado', '2025-10-05T15:30:00', 'OCA16384'),
(17, 8, 'Entregado', '2025-10-06T17:00:00', 'CORREOARG17408'),
(18, 3, 'Entregado', '2025-10-07T19:00:00', 'ANDREANI18432'),
(19, 13, 'Entregado', '2025-10-08T21:00:00', 'OCA19456'),
(20, 6, 'Entregado', '2025-10-09T12:00:00', 'CORREOARG20480'),
(21, 10, 'Entregado', '2025-10-10T14:00:00', 'ANDREANI21504'),
(22, 17, 'Entregado', '2025-10-11T15:00:00', 'OCA22528'),
-- Pedidos En Tránsito (con fecha y hora actual)
(23, 4, 'EnTransito', GETDATE(), 'CORREOARG23552'),
(24, 12, 'EnTransito', GETDATE(), 'ANDREANI24576'),
(25, 7, 'EnTransito', GETDATE(), 'OCA25600');
GO
