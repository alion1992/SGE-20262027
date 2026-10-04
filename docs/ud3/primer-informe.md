# 7. Primer informe con datos

Crear `productos.jrxml` con:

```sql
SELECT p.id, p.nombre, c.nombre AS categoria, p.precio, p.stock
FROM productos p
JOIN categorias c ON c.id=p.categoria_id
ORDER BY p.nombre;
```

## Actividad
Añadir los campos, crear encabezados, formatear el precio y comprobar el resultado con **Preview**.
