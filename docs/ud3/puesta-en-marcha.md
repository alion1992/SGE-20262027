# 3. Puesta en marcha

En esta primera parte **no programaremos en C#**. Visual Studio será el entorno desde el que utilizaremos el diseñador.

## Crear el proyecto

Creamos un proyecto de escritorio basado en **.NET Framework** y una solución denominada:

```text
CrystalReportsSGE
```

Creamos una carpeta:

```text
Informes
```

La estructura será similar a:

```text
CrystalReportsSGE
│
└── Informes
    ├── Productos.rpt
    ├── Clientes.rpt
    └── Ventas.rpt
```

## Crear el primer informe

Sobre `Informes`:

1. Botón derecho.
2. **Agregar → Nuevo elemento**.
3. Seleccionar **Crystal Report**.
4. Nombre: `PrimerInforme.rpt`.

## Flujo de trabajo

```text
Crear informe
     ↓
Seleccionar origen de datos
     ↓
Seleccionar tablas
     ↓
Seleccionar campos
     ↓
Diseñar
     ↓
Vista previa
```
