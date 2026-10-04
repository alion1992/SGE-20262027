# 8. Filtros y parámetros

No siempre queremos mostrar todos los registros de una base de datos.

## Filtros

Los filtros permiten seleccionar qué registros formarán parte del informe.

Ejemplos:

- Productos con stock inferior a 10.
- Clientes de una determinada ciudad.
- Pedidos de un determinado año.

## Parámetros

Los parámetros permiten solicitar información al usuario antes de generar el informe.

Ejemplo:

```text
Fecha inicial: 01/01/2026
Fecha final:   31/01/2026
```

El informe mostrará únicamente las ventas comprendidas entre ambas fechas.

## Práctica

Crear un informe parametrizado que permita consultar las ventas realizadas entre dos fechas.
