USE Ventas_Tech_DB


-- Consulta 1: resumen ejecutivo mensual

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado, 
    COUNT(id_venta) AS cantidad_pedidos, 
    CAST(SUM(cantidad * precio_unitario) / COUNT(id_venta) AS DECIMAL(10,2)) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- Consulta 2: ranking de productos

SELECT TOP 5
    id_producto AS producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

-- Consulta 3: clientes recurrentes

SELECT
    id_cliente AS cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT (*) > 1;

-- Consulta 4: meses por encima/por debajo del promedio

WITH ventas_mensuales AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado >= (SELECT AVG(total_facturado) FROM ventas_mensuales)
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparativa_promedio
FROM ventas_mensuales
ORDER BY mes;

/*
======== CONCLUSIONES ========
-- El producto 1 (Laptop Pro 15) es el que mayores ingresos generó en el período evaluado ($3.600) pese a no ser el de mayor volumen de ventas (3 unidades).
-- Todos los clientes del período evaluado presentan una frecuencia de compra similar (2 visitas), aunque con claras diferencias en el monto que gastan. Podrían enfocarse acciones de UP-SELL con los clientes de menor monto y acciones enfocadas en la recompra con clientes de mayor monto.
-- En base a un ticket promedio mensual de $6444,40 obtenido del período evaluado, podrán implementarse acciones y campañas que eleven este indicador en el meses próximos.
*/