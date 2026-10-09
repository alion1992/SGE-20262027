# Uso de campos de PostgreSQL en Jaspersoft Studio

## 1. Objetivo

Aprender a conectar un informe de **Jaspersoft Studio** con una base de
datos PostgreSQL, ejecutar una consulta SQL y utilizar los campos
obtenidos para mostrar información en el informe.

## 2. Conectar Jaspersoft Studio con PostgreSQL

Jaspersoft Studio puede conectarse a PostgreSQL mediante un adaptador de
datos JDBC.

1.  Abre **Repository Explorer**.
2.  Haz clic con el botón derecho sobre **Data Adapters** y selecciona
    **Create Data Adapter**.
3.  Elige **Database JDBC Connection**.
4.  Introduce los datos de conexión:
    -   **JDBC Driver:** PostgreSQL.
    -   **JDBC URL:** `jdbc:postgresql://localhost:5432/mi_base_datos`
    -   **Username:** el usuario de PostgreSQL.
    -   **Password:** la contraseña.
5.  Pulsa **Test** para comprobar la conexión y guarda el adaptador.

> Sustituye `localhost` por la dirección del servidor si PostgreSQL está
> en otro equipo, y `mi_base_datos` por el nombre real de la base de
> datos. El puerto habitual de PostgreSQL es `5432`.

**Captura de referencia:** [Configuración de una conexión JDBC en la
documentación
oficial](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/data-adapters/data-adapters-jdbc-connection/).

## 3. Crear una consulta SQL

Crea un informe nuevo o abre uno existente. En las propiedades del
informe, abre el editor de consultas (*Dataset and Query Dialog*) y
selecciona el adaptador de PostgreSQL.

Por ejemplo, utilizaremos una tabla llamada `productos` con los campos
`nombre`, `precio` y `stock`:

``` sql
SELECT nombre, precio, stock
FROM productos
WHERE stock > 0
ORDER BY nombre;
```

La consulta obtiene los productos que tienen existencias y los ordena
alfabéticamente.

Después de escribir la consulta:

1.  Pulsa **Read Fields** para que Jaspersoft Studio detecte los campos
    devueltos por el `SELECT`.
2.  Comprueba que aparecen `nombre`, `precio` y `stock`.
3.  Pulsa **OK** para volver al diseñador.

**Capturas de referencia:** - [Editor de consultas y botón Read Fields:
documentación
oficial](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/simple-report/reports-add-delete-elements/). -
[Guía oficial de adaptadores
JDBC](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/data-adapters/data-adapters-jdbc-connection/).

## 4. ¿Dónde aparecen los campos?

En el panel **Outline**, despliega el apartado **Fields**. Allí
aparecerán los campos detectados a partir de la consulta.

Por ejemplo:

-   `nombre`
-   `precio`
-   `stock`

Jaspersoft Studio representa cada campo mediante una expresión. En el
informe se utilizan así:

  -----------------------------------------------------------------------
  Expresión                           Contenido
  ----------------------------------- -----------------------------------
  `$F{nombre}`                        El nombre del producto de la fila
                                      actual.

  `$F{precio}`                        El precio del producto de la fila
                                      actual.

  `$F{stock}`                         Las unidades disponibles del
                                      producto de la fila actual.
  -----------------------------------------------------------------------

`$F{...}` significa **Field** (campo). No hay que escribir manualmente
el valor que devuelve la base de datos: JasperReports lo recupera al
ejecutar la consulta.

## 5. Colocar los campos en el diseño

La pestaña **Design** contiene bandas horizontales. Para crear un
listado sencillo, utilizaremos dos:

-   **Column Header:** encabezados de las columnas. Se muestra el texto
    fijo `Nombre`, `Precio` y `Stock`.
-   **Detail:** datos de cada registro. Esta banda se repite una vez por
    cada fila que devuelve la consulta.

Pasos:

1.  Localiza `nombre`, `precio` y `stock` en **Outline \> Fields**.
2.  Arrastra cada campo desde **Fields** hasta la banda **Detail**.
3.  Añade elementos de texto estático en **Column Header** y escribe
    `Nombre`, `Precio` y `Stock`.
4.  Coloca cada encabezado encima del campo correspondiente y ajusta el
    ancho de los elementos.

Al arrastrar un campo a **Detail**, Jaspersoft Studio crea un elemento
de texto con la expresión correspondiente, por ejemplo `$F{nombre}`.

**Captura de referencia:** [Añadir campos al informe y arrastrarlos al
diseño](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/simple-report/reports-add-delete-elements/).

### Ejemplo del resultado esperado

Si la consulta devuelve estos datos:

  nombre      precio   stock
  --------- -------- -------
  Teclado      25,50      10
  Ratón        15,00      20
  Monitor     180,00       5

El informe mostrará un listado parecido a este:

  Nombre      Precio   Stock
  --------- -------- -------
  Teclado      25,50      10
  Ratón        15,00      20
  Monitor     180,00       5

No es necesario programar un bucle: **la banda Detail se repite
automáticamente para cada registro**.

## 6. Previsualizar el informe

Pulsa **Preview**. Jaspersoft Studio ejecutará la consulta utilizando el
adaptador seleccionado y mostrará los resultados en el informe.

Si no aparecen datos, comprueba: - Que la conexión JDBC funciona. - Que
el nombre de la tabla y de los campos es correcto. - Que la consulta
devuelve registros. - Que has pulsado **Read Fields** después de
modificar la consulta. - Que el informe utiliza el adaptador de datos
correcto.

## 7. Diferencias entre Fields, Parameters y Variables

En JasperReports se utilizan expresiones especiales para acceder a
distintos tipos de información:

  -----------------------------------------------------------------------
  Expresión               Significado             Ejemplo
  ----------------------- ----------------------- -----------------------
  `$F{nombre}`            **Field:** dato         Nombre de un producto.
                          procedente de la        
                          consulta o del origen   
                          de datos.               

  `$P{categoria}`         **Parameter:** valor de Categoría elegida por
                          entrada que recibe el   el usuario.
                          informe.                

  `$V{REPORT_COUNT}`      **Variable:** valor     Contador de registros
                          calculado o mantenido   procesados.
                          durante la generación   
                          del informe.            
  -----------------------------------------------------------------------

Los parámetros se pueden utilizar, por ejemplo, para filtrar los
resultados. Para hacerlo hay que crear el parámetro y utilizarlo
correctamente en la consulta SQL.

## 8. Dar formato a los valores

Se puede modificar el aspecto de cada campo desde el panel
**Properties**.

Por ejemplo, para mostrar un precio con dos decimales: 1. Selecciona el
campo `$F{precio}` en el diseñador. 2. Busca las propiedades del
elemento de texto. 3. Configura el formato numérico (*Pattern*) adecuado
para el tipo de dato.

También puedes cambiar la fuente, alineación, bordes, tamaño y otras
propiedades visuales.

**Referencia:** [Documentación oficial sobre propiedades de los
elementos](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/elements/elements-advanced-properties/).

## 9. Resumen del proceso

1.  Crear el adaptador JDBC para PostgreSQL.
2.  Escribir la consulta SQL.
3.  Pulsar **Read Fields**.
4.  Localizar los campos en **Outline \> Fields**.
5.  Arrastrar los campos a la banda **Detail**.
6.  Añadir encabezados en **Column Header**.
7.  Ejecutar **Preview** para comprobar el resultado.

## Fuentes

-   [Jaspersoft Studio: conexiones
    JDBC](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/data-adapters/data-adapters-jdbc-connection/)
-   [Jaspersoft Studio: añadir campos a un
    informe](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/simple-report/reports-add-delete-elements/)
-   [Jaspersoft Studio: diseño y
    bandas](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/design-tab/)
-   [Jaspersoft Studio:
    Fields](https://docs.actian.com/jaspersoft/jaspersoft-studio/user-guide/fields/fields-intro/)
