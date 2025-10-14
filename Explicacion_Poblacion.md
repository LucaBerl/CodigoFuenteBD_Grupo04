# Explicación del Script de Población de Datos (`PoblacionBD.sql`)

## ¿Qué es este archivo?

Imagina que acabamos de construir una casa nueva (la base de datos). La casa está vacía. Este archivo, `PoblacionBD.sql`, es como el camión de mudanzas que trae los primeros muebles y objetos para que la casa no esté vacía.

En términos simples, este script **inserta datos de ejemplo** en nuestra base de datos de E-Commerce. Esto es útil para que los programadores puedan probar el sitio web con productos, clientes y pedidos falsos sin tener que registrarlos a mano uno por uno.

---

## ¿Qué hace cada parte del script?

El script está dividido en bloques. Cada bloque se encarga de "poblar" o "llenar" una tabla específica de la base de datos.

### `USE ECOMMERCE_BD;`

*   **Qué hace:** Le dice al sistema: "Oye, todas las siguientes operaciones que voy a hacer, quiero que las hagas dentro de la base de datos llamada `ECOMMERCE_BD`". Es como elegir en qué habitación de la casa vamos a empezar a poner los muebles.

### `INSERT INTO CATEGORIA`

*   **Qué hace:** Agrega las categorías de productos que venderemos.
*   **Ejemplo:** Crea categorías como 'Remeras', 'Pantalones', 'Calzados' y 'Accesorios'. Así, cada producto que agreguemos después puede ser clasificado en una de estas.

### `INSERT INTO MARCA`

*   **Qué hace:** Agrega las marcas de los productos.
*   **Ejemplo:** Añade marcas famosas como 'Nike', 'Adidas', 'Puma', 'Zara' y 'H&M'.

### `INSERT INTO PRODUCTO`

*   **Qué hace:** Este es uno de los bloques más grandes. Crea los productos generales que se venderán en la tienda.
*   **Detalle:** Cada línea es un producto nuevo. Se le da un nombre (ej: 'Nike Air Max 270'), una descripción, para qué sexo está pensado ('M' para masculino, 'F' para femenino, 'U' para unisex), y se le asigna una **categoría** y una **marca** de las que creamos antes.

### `INSERT INTO ARTICULO`

*   **Qué hace:** Un "producto" (como una zapatilla) puede tener variaciones. A estas variaciones las llamamos "artículos". Este bloque crea esas variaciones.
*   **Detalle:** Para cada producto que creamos antes, aquí se definen sus variantes específicas. Por ejemplo, para el producto 'Nike Air Max 270', creamos dos "artículos": uno de color 'Negro' y talle '42', y otro de color 'Blanco' y talle '43'. A cada uno se le asigna un precio y una cantidad inicial en el inventario (stock).

### `INSERT INTO ImagenesArticulo`

*   **Qué hace:** Asigna URLs de imágenes a los artículos.
*   **Detalle:** Aquí se guardan los enlaces a las fotos de cada artículo. Por ejemplo, se dice que al artículo con código (SKU) `1` le corresponde la imagen que se encuentra en `http://example.com/images/nike_air_max_270_black.jpg`.

### `INSERT INTO CLIENTE`

*   **Qué hace:** Crea perfiles de clientes falsos.
*   **Ejemplo:** Registra a 'Juan Perez' y 'Maria Gomez' como clientes en el sistema.

### `INSERT INTO ClienteUsuario`

*   **Qué hace:** Crea la información de "login" (inicio de sesión) para los clientes.
*   **Detalle:** A cada cliente (como 'Juan Perez') se le asigna un email y una contraseña para que pueda acceder a su cuenta en la tienda online.

### `INSERT INTO DomicilioCliente`

*   **Qué hace:** Guarda las direcciones de los clientes.
*   **Detalle:** Añade una dirección de envío para cada cliente, con calle, ciudad, etc. Esto es necesario para poder simular el envío de pedidos.

### `INSERT INTO PEDIDO`, `DetallePedido`, `PAGO` y `ENVIO`

*   **Qué hacen (en conjunto):** Estos últimos bloques simulan una compra completa.
*   **Paso a paso:**
    1.  `INSERT INTO PEDIDO`: Se crea un pedido para un cliente. Por ejemplo, uno para 'Juan Perez' que ya está 'Finalizado'.
    2.  `INSERT INTO DetallePedido`: Se especifica qué artículos compró el cliente en ese pedido. Por ejemplo, 2 unidades del artículo `1` y 1 unidad del artículo `5`.
    3.  `INSERT INTO PAGO`: Se registra el pago del pedido, indicando el método (ej: 'Tarjeta de Crédito') y el monto total.
    4.  `INSERT INTO ENVIO`: Se crea el registro del envío para ese pedido a la dirección del cliente, con un estado (ej: 'Entregado') y un número de seguimiento.
*   **Simulación:** También se crea un segundo pedido para 'Maria Gomez' que está 'EnProceso' para mostrar un estado diferente.

---

En resumen, el script `PoblacionBD.sql` es fundamental para tener un entorno de desarrollo funcional y realista, permitiendo a los desarrolladores trabajar y probar la aplicación web con un conjunto completo de datos desde el principio.
