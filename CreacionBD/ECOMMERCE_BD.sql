-- =============================================
-- CREACIÓN DE BASE DE DATOS
-- =============================================
CREATE DATABASE ECOMMERCE_BD;
GO
USE ECOMMERCE_BD;
GO


-- TABLAS MAESTRAS


CREATE TABLE CATEGORIA (
    IDCategoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255) NULL
);

CREATE TABLE MARCA (
    IDMarca INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);


-- TABLAS MAESTRAS DE ESTADOS 


CREATE TABLE EstadoPedido (
    IDEstadoPedido INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE EstadoEnvio (
    IDEstadoEnvio INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- Insertamos los estados definidos

INSERT INTO EstadoPedido (Nombre) VALUES
('EnProceso'),    -- ID 1
('Finalizado'),   -- ID 2
('Expirado');     -- ID 3
GO

INSERT INTO EstadoEnvio (Nombre) VALUES
('Pendiente'),    -- ID 1
('EnTransito'),   -- ID 2
('Entregado'),    -- ID 3
('Cancelado'),    -- ID 4
('RetiraLocal');  -- ID 5
GO


-- PRODUCTO Y ARTICULO

CREATE TABLE PRODUCTO (
    IDProducto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255) NULL,
    Sexo CHAR(1) NOT NULL CHECK (Sexo IN ('M','F','U')),
    IDCategoria INT NOT NULL,
    IDMarca INT NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (IDCategoria) REFERENCES CATEGORIA(IDCategoria),
    CONSTRAINT FK_Producto_Marca FOREIGN KEY (IDMarca) REFERENCES MARCA(IDMarca)
);

CREATE TABLE ARTICULO (
    SKU INT IDENTITY(1,1) PRIMARY KEY,
    IDProducto INT NOT NULL,
    Color NVARCHAR(50) NOT NULL,
    Talle NVARCHAR(20) NOT NULL,
    CantidadStock INT NOT NULL DEFAULT 0 CHECK (CantidadStock >= 0),
    Precio DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (Precio >= 0),
    CONSTRAINT FK_Item_Producto FOREIGN KEY (IDProducto) REFERENCES PRODUCTO(IDProducto) ON DELETE CASCADE,
    CONSTRAINT UQ_Item_Variante UNIQUE (IDProducto, Color, Talle)
);

CREATE TABLE ImagenesArticulo (
    IDImagen INT IDENTITY(1,1) PRIMARY KEY,
    SKU INT NOT NULL,
    URL NVARCHAR(2083) NOT NULL,
    CONSTRAINT FK_Imagen_Sku FOREIGN KEY (SKU) REFERENCES ARTICULO(SKU)
);


-- CLIENTES Y USUARIOS

CREATE TABLE CLIENTE (
    IDCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(30) NULL
);

CREATE TABLE ClienteUsuario (
    IDUsuario INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL UNIQUE,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    ContraseniaHash NVARCHAR(200) NOT NULL,
    FechaAlta DATETIME NOT NULL DEFAULT GETDATE(),
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_ClienteUsuario_Cliente FOREIGN KEY (IDCliente) REFERENCES CLIENTE(IDCliente)
);

CREATE TABLE DomicilioCliente (
    IDDomicilio INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    Calle NVARCHAR(150) NOT NULL,
    Altura NVARCHAR(20) NULL,
    Ciudad NVARCHAR(100) NOT NULL,
    Provincia NVARCHAR(100) NOT NULL,
    CodigoPostal NVARCHAR(20) NOT NULL,
    EsPredeterminado BIT NULL DEFAULT 0,
    CONSTRAINT FK_Domicilio_Cliente FOREIGN KEY (IDCliente) REFERENCES CLIENTE(IDCliente)
);
GO

CREATE UNIQUE INDEX UQ_Cliente_Predeterminado_Unico ON DomicilioCliente(IDCliente) WHERE EsPredeterminado = 1; 
GO


-- PEDIDOS, DETALLES, PAGOS Y ENVÍOS

CREATE TABLE PEDIDO (
    IDPedido INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT NOT NULL,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaUltMovimiento DATETIME NULL,
    MontoTotal DECIMAL(12,2) NULL,
    IDEstadoPedido INT NOT NULL DEFAULT 1, -- 1 = 'EnProceso'
    
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (IDCliente) REFERENCES CLIENTE(IDCliente),
    CONSTRAINT FK_Pedido_EstadoPedido FOREIGN KEY (IDEstadoPedido) REFERENCES EstadoPedido(IDEstadoPedido)
);

CREATE TABLE DetallePedido (
    IDDetalle INT IDENTITY(1,1) PRIMARY KEY,
    IDPedido INT NOT NULL,
    SKU INT NOT NULL,
    CantidadPedido INT NOT NULL CHECK (CantidadPedido > 0),
    PrecioUnitario DECIMAL(10,2) NOT NULL CHECK (PrecioUnitario >= 0),
    Subtotal AS (CantidadPedido * PrecioUnitario) PERSISTED,
    CONSTRAINT FK_Detalle_Pedido FOREIGN KEY (IDPedido) REFERENCES PEDIDO(IDPedido),
    CONSTRAINT FK_Detalle_Item FOREIGN KEY (SKU) REFERENCES ARTICULO(SKU)
);

CREATE TABLE PAGO (
    IDPago INT IDENTITY(1,1) PRIMARY KEY,
    IDPedido INT NOT NULL UNIQUE,
    MetodoPago NVARCHAR(100) NULL,
    FechaPago DATETIME NOT NULL DEFAULT GETDATE(),
    Monto DECIMAL(12,2) NOT NULL CHECK (Monto >= 0),
    CONSTRAINT FK_Pago_Pedido FOREIGN KEY (IDPedido) REFERENCES PEDIDO(IDPedido)
);

CREATE TABLE ENVIO (
    IDEnvio INT IDENTITY(1,1) PRIMARY KEY,
    IDPedido INT NOT NULL,
    IDDomicilio INT NULL, 
    IDEstadoEnvio INT NOT NULL DEFAULT 1, -- 1 = 'Pendiente'
    FechaUltMovimiento DATETIME NOT NULL DEFAULT GETDATE(),
    Tracking NVARCHAR(100) NULL,

    CONSTRAINT FK_Envio_Pedido FOREIGN KEY (IDPedido) REFERENCES PEDIDO(IDPedido),
    CONSTRAINT FK_Envio_Domicilio FOREIGN KEY (IDDomicilio) REFERENCES DomicilioCliente(IDDomicilio),
    CONSTRAINT FK_Envio_EstadoEnvio FOREIGN KEY (IDEstadoEnvio) REFERENCES EstadoEnvio(IDEstadoEnvio),

    -- Constraint Lógica para Domicilio/RetiraLocal
    CONSTRAINT CK_Envio_Domicilio_Logica CHECK (
  
         (IDEstadoEnvio = 5 AND IDDomicilio IS NULL) -- Opción 1: Es "RetiraLocal" (5) Y el domicilio es NULO
         OR
         (IDEstadoEnvio IN (1, 2, 4) AND IDDomicilio IS NOT NULL) -- Opción 2: Es un envío estándar (1, 2, 4) Y el domicilio NO ES NULO
         OR
         (IDEstadoEnvio = 3) -- Opción 3: Es "Entregado" (3). En este estado, se permite tanto NULL (si fue RetiraLocal) como NOT NULL (si fue envío).
    
    )    
);
GO
