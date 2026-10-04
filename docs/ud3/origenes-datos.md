# 5. Orígenes de datos

Crystal Reports puede obtener información de diferentes fuentes de datos.

Durante esta unidad utilizaremos principalmente **PostgreSQL**.

## Base de datos de trabajo

Trabajaremos progresivamente con una base de datos empresarial:

```text
EMPRESA
│
├── categorias
├── productos
├── clientes
├── pedidos
└── detalle_pedido
```

## Conexión

Para acceder a PostgreSQL será necesario configurar el controlador compatible correspondiente.

Una vez establecida la conexión podremos:

1. Seleccionar la base de datos.
2. Seleccionar tablas.
3. Examinar sus campos.
4. Establecer relaciones.
5. Incorporar los campos al informe.

!!! info
    Utilizaremos la misma base de datos durante toda la unidad para construir informes cada vez más completos.
