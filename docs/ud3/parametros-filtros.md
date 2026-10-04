# 10. Parámetros y filtros

Ejemplo:

```sql
SELECT * FROM clientes
WHERE ciudad = $P{CIUDAD};
```

Para fechas:

```sql
SELECT pe.id, pe.fecha, c.nombre AS cliente
FROM pedidos pe
JOIN clientes c ON c.id=pe.cliente_id
WHERE pe.fecha BETWEEN $P{FECHA_INICIO} AND $P{FECHA_FIN};
```

## Práctica
Informe de pedidos entre dos fechas introducidas como parámetros.
