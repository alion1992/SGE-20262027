# 12. Gráficos

Podemos crear gráficos de barras, sectores o líneas.

```sql
SELECT c.nombre, SUM(dp.cantidad * dp.precio_unitario) AS facturacion
FROM clientes c
JOIN pedidos p ON p.cliente_id=c.id
JOIN detalle_pedido dp ON dp.pedido_id=p.id
GROUP BY c.id,c.nombre
ORDER BY facturacion DESC;
```

## Práctica
Mostrar la facturación por cliente mediante tabla y gráfico de barras.
