# 2. Instalación

Para trabajar con Crystal Reports utilizaremos **Visual Studio 2022** y **SAP Crystal Reports Developer for Microsoft Visual Studio**.

## 1. Visual Studio 2022

Instalamos Visual Studio 2022 Community.

Durante la instalación seleccionamos la carga de trabajo:

> **Desarrollo de escritorio de .NET**

## 2. Crystal Reports

Una vez instalado Visual Studio, instalamos **SAP Crystal Reports Developer for Microsoft Visual Studio** compatible con Visual Studio 2022.

!!! warning "Importante"
    Para diseñar informes necesitamos el paquete **Developer**, no únicamente el Runtime.

## 3. Developer y Runtime

### Developer

Integra el diseñador de Crystal Reports dentro de Visual Studio.

```text
Visual Studio
      +
Crystal Reports Developer
      ↓
Diseñador de informes
```

### Runtime

Se utiliza principalmente en equipos que deben ejecutar una aplicación que ya utiliza Crystal Reports.

## 4. Orden recomendado

```text
1. Visual Studio 2022
        ↓
2. Desarrollo de escritorio de .NET
        ↓
3. Crystal Reports Developer
        ↓
4. Reiniciar Visual Studio
```

## 5. Comprobación

Abrimos Visual Studio y comprobamos posteriormente que podemos agregar un elemento de tipo **Crystal Report (.rpt)**.

!!! success
    Si aparece la opción **Crystal Report**, la integración se ha realizado correctamente.
