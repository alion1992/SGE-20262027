# 12. Integración con .NET

Hasta este punto hemos utilizado Visual Studio principalmente como entorno para diseñar nuestros archivos `.rpt`.

En esta parte aprenderemos a integrar los informes dentro de una aplicación .NET.

!!! info
    Este contenido se realizará después de dominar el diseño de informes.

## Objetivo

La aplicación permitirá seleccionar y visualizar diferentes informes.

```text
┌───────────────────────────────┐
│      INFORMES EMPRESA         │
│                               │
│ [ Clientes ]                  │
│ [ Productos ]                 │
│ [ Ventas ]                    │
│ [ Stock ]                     │
└───────────────────────────────┘
             │
             ▼
      CrystalReportViewer
```

Estudiaremos posteriormente:

- CrystalReportViewer.
- Carga de archivos `.rpt`.
- Parámetros desde la aplicación.
- Conexión con la base de datos.
- Exportación.
