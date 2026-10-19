# 6. Agrupaciones y subtotales en JasperReports

# PASAR EL SIGUIENTE SCRIPT

[Descargar script SQL](script.sql)

## 6.1. ¿Qué es una agrupación?

Una agrupación permite organizar los registros de un informe según el valor de uno de sus campos.

Por ejemplo, tenemos una base de datos con tres tablas:

- `centro`: almacena los centros.
- `departamento`: almacena los departamentos de cada centro.
- `gastos`: almacena los gastos de cada departamento.

Queremos mostrar los gastos organizados por departamento. En lugar de mostrar una lista continua, el informe separará los gastos de cada departamento y podrá mostrar el subtotal correspondiente.

Ejemplo de resultado:

```text
Departamento: Administración
    Material de oficina       180,50 €
    Impresora                 320,00 €
    Subtotal departamento:    500,50 €

Departamento: Informática
    Compra de ordenadores   2.400,00 €
    Licencias de software     650,00 €
    Subtotal departamento:  3.050,00 €

TOTAL GENERAL:              5.000,00 €
```

*Los importes son ilustrativos; el resultado real dependerá de los registros de la base de datos.*

## 6.2. Consulta SQL del informe

Para crear el informe, necesitamos una consulta que devuelva los gastos junto con el nombre del centro y del departamento.

```sql
SELECT
    c.nombre AS centro,
    d.id_departamento,
    d.nombre AS departamento,
    g.concepto,
    g.fecha,
    g.importe
FROM clase.gastos g
JOIN clase.departamento d
    ON g.id_departamento = d.id_departamento
JOIN clase.centro c
    ON d.id_centro = c.id_centro
ORDER BY
    d.id_departamento,
    g.fecha;
```

La consulta utiliza `JOIN` para relacionar las tres tablas y `ORDER BY` para ordenar los registros.

**Importante:** para que los grupos aparezcan correctamente, los registros deben estar ordenados por el campo que se utiliza para agrupar. En este ejemplo, se ordenan por `id_departamento`.

No necesitamos utilizar `GROUP BY` en SQL porque queremos conservar el detalle de cada gasto. JasperReports se encargará de organizar visualmente esos registros.

## 6.3. Crear un grupo en Jaspersoft Studio

Vamos a agrupar los gastos por departamento.

1. Abre el informe en Jaspersoft Studio.
2. En el panel **Outline**, haz clic derecho sobre el informe.
3. Selecciona **Create Group**.
4. Escribe `GrupoDepartamento` como nombre del grupo.
5. Establece como expresión de agrupación:

   ```java
   $F{id_departamento}
   ```

   Si la consulta no devuelve ese campo, puedes agrupar por `$F{departamento}`, aunque utilizar el identificador evita juntar departamentos distintos que tengan el mismo nombre.

Al crear el grupo, JasperReports añade dos bandas:

- **Group Header:** se imprime al comenzar cada grupo.
- **Group Footer:** se imprime al terminar cada grupo.

### ¿Qué colocamos en cada banda?

| Banda | Contenido |
|---|---|
| `Group Header` | Nombre del departamento. |
| `Detail` | Concepto, fecha e importe de cada gasto. |
| `Group Footer` | Subtotal del departamento. |
| `Summary` | Total general de todos los gastos. |

En `Group Header`, arrastra el campo `$F{departamento}`.

En `Detail`, coloca los campos `$F{concepto}`, `$F{fecha}` y `$F{importe}`. Si quieres, también puedes mostrar `$F{centro}`.

## 6.4. Crear una variable para calcular el subtotal

Una variable de JasperReports permite almacenar un valor calculado durante la generación del informe. Podemos utilizarla para sumar los importes de los gastos.

En el panel **Outline**, busca **Variables** y crea una variable con estas propiedades:

| Propiedad | Valor |
|---|---|
| Name | `SubtotalDepartamento` |
| Value Class Name | `java.math.BigDecimal` |
| Calculation | `Sum` |
| Expression | `$F{importe}` |
| Reset type | `Group` |
| Reset Group | `GrupoDepartamento` |

### ¿Qué significa cada propiedad?

- **Name:** nombre con el que identificamos la variable.
- **Value Class Name:** tipo de dato del resultado. `BigDecimal` es adecuado para cantidades decimales y monetarias.
- **Calculation = Sum:** suma los valores de la expresión.
- **Expression:** indica qué valor se acumula en cada registro.
- **Reset type = Group:** reinicia el cálculo cuando comienza un nuevo grupo.
- **Reset Group:** indica el grupo que provoca el reinicio.

La expresión `$F{importe}` hace que se acumule el importe de cada gasto.

Por ejemplo, si un departamento tiene gastos de 180,50 € y 320,00 €, el subtotal será:

```text
180,50 + 320,00 = 500,50 €
```

Cuando comienza otro departamento, la variable se reinicia y comienza a calcular su subtotal.

### Mostrar el subtotal en el informe

1. Selecciona la banda `Group Footer` del grupo `GrupoDepartamento`.
2. Añade un `Static Text` con el texto `Subtotal departamento:`.
3. Añade un `Text Field` con la expresión:

   ```java
   $V{SubtotalDepartamento}
   ```

4. Para mostrar dos decimales y el símbolo del euro, configura el patrón:

   ```text
   #,##0.00 €
   ```

Ajusta la posición y la anchura de los elementos para que el texto y la cantidad no se solapen.

## 6.5. Calcular el total general

El total general suma los importes de todos los registros del informe, sin reiniciarse cuando cambia el departamento.

Crea otra variable con esta configuración:

| Propiedad | Valor |
|---|---|
| Name | `TotalGeneral` |
| Value Class Name | `java.math.BigDecimal` |
| Calculation | `Sum` |
| Expression | `$F{importe}` |
| Reset type | `Report` |

La diferencia está en `Reset type`:

- `Group`: reinicia la suma para cada grupo.
- `Report`: mantiene la suma durante todo el informe y la reinicia al comenzar una nueva ejecución del informe.

Para mostrar el total general:

1. Selecciona la banda `Summary`.
2. Añade un `Static Text` con el texto `TOTAL GENERAL:`.
3. Añade un `Text Field` con la expresión:

   ```java
   $V{TotalGeneral}
   ```

4. Aplica el patrón monetario `#,##0.00 €`.

La banda `Summary` se imprime al final del informe. Si el informe ocupa varias páginas, el resumen aparecerá después de los registros, normalmente al final de la última página, siempre que la configuración y el espacio disponible lo permitan.

## 6.6. Diferencia entre agrupar en SQL y agrupar en JasperReports

No debemos confundir estas dos operaciones.

### Agrupar y sumar en SQL

```sql
SELECT
    d.nombre AS departamento,
    SUM(g.importe) AS subtotal
FROM clase.gastos g
JOIN clase.departamento d
    ON g.id_departamento = d.id_departamento
GROUP BY d.nombre
ORDER BY d.nombre;
```

Esta consulta devuelve una fila por departamento con su subtotal. No devuelve cada gasto individual.

### Agrupar en JasperReports

La consulta devuelve todos los gastos detallados. JasperReports los organiza en grupos y calcula los subtotales mediante variables.

Este enfoque resulta útil cuando necesitamos mostrar simultáneamente:

- Los detalles de cada gasto.
- El subtotal de cada departamento.
- El total general del informe.

## 6.7. Agrupaciones anidadas por centro y departamento

También podemos organizar los gastos en dos niveles:

1. Centro.
2. Departamento dentro de cada centro.

Para hacerlo, crea dos grupos y ordénalos en el mismo orden en la consulta:

```sql
ORDER BY
    c.id_centro,
    d.id_departamento,
    g.fecha;
```

El grupo exterior será `GrupoCentro`, con expresión `$F{id_centro}`. El grupo interior será `GrupoDepartamento`, con expresión `$F{id_departamento}`.

Para esta variante, añade `c.id_centro` a la consulta.

Puedes calcular:

- Un subtotal por departamento, reiniciado en `GrupoDepartamento`.
- Un subtotal por centro, reiniciado en `GrupoCentro`.
- Un total general, reiniciado en `Report`.

Cuando hay varios niveles, comprueba que el orden de los grupos coincide con el orden de los datos y que cada variable tiene configurado el grupo de reinicio correcto.

## 6.8. Errores frecuentes

### El subtotal siempre muestra cero o un valor incorrecto

Comprueba que la expresión sea `$F{importe}`, que el cálculo sea `Sum` y que el campo `importe` tenga un tipo numérico, por ejemplo `java.math.BigDecimal`.

### Aparece el error “Reset group missing for variable”

La variable tiene `Reset type = Group`, pero no tiene asignado un grupo. Selecciona `GrupoDepartamento` en `Reset Group`.

### El subtotal no se reinicia al cambiar de departamento

Comprueba que `Reset type` sea `Group` y que `Reset Group` sea el grupo correcto.

### El mismo departamento aparece varias veces

Revisa el `ORDER BY` de la consulta y la expresión de agrupación. Es recomendable agrupar por el identificador del departamento y ordenar por ese mismo identificador.

### No aparece el total general

Comprueba que la variable `TotalGeneral` tenga `Calculation = Sum`, expresión `$F{importe}` y `Reset type = Report`. Verifica también que el campo `$V{TotalGeneral}` esté dentro de la banda `Summary`.

## 6.9. Actividad práctica

Crea un informe de gastos usando las tablas `clase.centro`, `clase.departamento` y `clase.gastos`.

Requisitos:

1. Mostrar el centro, el departamento, el concepto, la fecha y el importe.
2. Agrupar los gastos por departamento.
3. Mostrar el nombre del departamento en la cabecera del grupo.
4. Calcular y mostrar el subtotal de cada departamento.
5. Mostrar el total general en la banda `Summary`.
6. Formatear todos los importes con dos decimales y el símbolo del euro.
7. Ordenar los gastos por departamento y fecha.

**Ampliación:** crea una segunda versión con agrupación por centro y, dentro de cada centro, por departamento. Añade subtotales por departamento y centro, además del total general.

## Resumen

- Los grupos organizan visualmente los registros del informe.
- `Group Header` muestra información al comenzar un grupo.
- `Group Footer` permite mostrar el subtotal del grupo.
- Una variable con `Calculation = Sum` acumula valores.
- `Reset type = Group` reinicia el cálculo en cada grupo.
- `Reset type = Report` permite calcular el total general.
- SQL puede agrupar datos, pero si necesitamos mostrar el detalle de cada registro, podemos dejar que JasperReports realice la agrupación visual.


[Practica UD3](practica_informe_notas_jasperreports.md).