USE Ventas_Tech_DB

CREATE TABLE segmentacion (
	id_segmentacion INT PRIMARY KEY,
	nombre_segmento VARCHAR(50)
	);

INSERT INTO segmentacion (id_segmentacion, nombre_segmento)
VALUES
	(1, 'importante'),
	(2, 'no importante');

ALTER TABLE clientes
ADD id_segmentacion INT,

FOREIGN KEY (id_segmentacion)
REFERENCES segmentacion(id_segmentacion);

UPDATE clientes
SET id_segmentacion = 1
WHERE id_cliente IN (1, 3, 5);

UPDATE clientes
SET id_segmentacion = 2
WHERE id_cliente IN (2, 4);

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro, id_segmentacion)
VALUES 
    (6, 'Federico Romero', 'federico@example.com', 'La Rioja', '2024-04-07', 2),
    (7, 'Lucía Morales', 'lucia@example.com', 'Buenos Aires', '2024-10-21', 1);

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES 
    (7, 'Pen drive 128gb', 4, 50.00, 35, 1),
    (8, 'Mouse Pad genérico', 2, 18.00, 23, 1);

SELECT *
FROM clientes;

SELECT *
FROM categorias;

SELECT *
FROM segmentacion;

SELECT *
FROM productos;

SELECT *
FROM ventas;


--Consulta 1. Vista base del proyecto--

SELECT V.fecha_venta, c.nombre AS nombre_cliente, s.nombre_segmento AS segmento_cliente, p.nombre_producto AS detalle_producto, ca.nombre_categoria, v.cantidad, v.precio_unitario, (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas V
JOIN clientes C
ON v.id_cliente = c.id_cliente
JOIN productos P
ON v.id_producto = p.id_producto
JOIN segmentacion S
ON c.id_segmentacion = s.id_segmentacion
JOIN categorias CA
ON p.id_categoria = ca.id_categoria
ORDER BY v.fecha_venta;


--Consulta 2. Clientes sin ventas--

SELECT c.nombre, c.email, c.fecha_registro AS ingreso
FROM clientes c
LEFT JOIN ventas v
ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;


--Consulta 3. Productos sin ventas--

SELECT p.nombre_producto, c.nombre_categoria AS categoria, p.precio
FROM productos p
LEFT JOIN ventas v
ON p.id_producto = v.id_producto
LEFT JOIN categorias c
ON c.id_categoria = p.id_categoria
WHERE v.id_producto IS NULL;


--Consulta 4. Consolidado por canal--

SELECT canal, SUM(total_venta) AS total_por_canal
FROM (
    SELECT v.fecha_venta, (v.cantidad * v.precio_unitario) AS total_venta,'Online' AS canal
    FROM ventas v
    WHERE v.cantidad * v.precio_unitario >= 1000.00
    UNION ALL
    SELECT v.fecha_venta,(v.cantidad * v.precio_unitario) AS total_venta,'Presencial' AS canal
    FROM ventas v
    WHERE v.cantidad * v.precio_unitario < 1000.00
) AS ventas_consolidadas
GROUP BY canal;