# 4. Diseñador de informes

Los informes de Crystal Reports se organizan mediante **secciones**.

```text
┌──────────────────────────────┐
│ Encabezado del informe       │
├──────────────────────────────┤
│ Encabezado de página         │
├──────────────────────────────┤
│ Detalles                     │
├──────────────────────────────┤
│ Pie de página                │
├──────────────────────────────┤
│ Pie del informe              │
└──────────────────────────────┘
```

## Encabezado del informe

Aparece una vez al comienzo. Puede contener título, logotipo o información de la empresa.

## Encabezado de página

Se repite al principio de las páginas. Es apropiado para los títulos de las columnas.

## Detalles

Se repite para cada registro recuperado de la fuente de datos.

## Pie de página

Puede incluir número de página, fecha o información corporativa.

## Pie del informe

Aparece una vez al finalizar. Es habitual utilizarlo para totales y resúmenes.

## Ejercicio

Crea `Prueba.rpt` e incluye:

- Título: **MI PRIMER INFORME**.
- Subtítulo: **Sistema de Gestión Empresarial**.
- Encabezados: Producto, Precio y Stock.
- Pie: **SGE - Curso 2026/2027**.
