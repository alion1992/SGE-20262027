# Práctica: Informe de notas con JasperReports

## Objetivo

Crear un informe académico con JasperReports y PostgreSQL a partir de las tablas `clase.alumnos`, `clase.asignaturas` y `clase.notas_asignaturas`.

## 1. Preparación de la base de datos

1. Descarga el [script SQL de creación y carga de datos](script_notas_alumnos.sql).
2. Abre pgAdmin o tu cliente PostgreSQL.
3. Ejecuta el script en la base de datos de prácticas.
4. Comprueba que se han creado las tres tablas dentro del esquema `clase`.

El script crea ocho alumnos, seis asignaturas y las notas de cada alumno en todas las asignaturas. Se considera **suspenso** una nota inferior a 5 y **aprobado** una nota igual o superior a 5.

> Atención: el script elimina las tablas de esta práctica si ya existen, para poder ejecutarse de nuevo. No lo ejecutes sobre tablas que quieras conservar.

## 2. Informe individual de notas

Crea un informe nuevo en Jaspersoft Studio conectado a la base de datos.

El informe debe mostrar:

- Nombre y apellidos del alumno.
- Asignatura.
- Nota obtenida.
- Estado: `Aprobado` o `Suspenso`.

Utiliza una consulta SQL que relacione las tres tablas mediante sus claves foráneas. Ordena los resultados por alumno y asignatura.

## 3. Agrupar las notas por alumno

Crea un grupo llamado `GrupoAlumno`.

- **Expresión del grupo:** utiliza el identificador del alumno (`id_alumno`).
- **Group Header:** muestra el nombre y los apellidos del alumno.
- **Detail:** muestra la asignatura, la nota y el estado.
- **Group Footer:** muestra el resumen de resultados del alumno.

Cada alumno debe aparecer como encabezado de su bloque, seguido de sus asignaturas y notas.

## 4. Número de asignaturas suspensas y aprobadas

En el pie del grupo de cada alumno, muestra:

- Número de asignaturas suspensas.
- Número de asignaturas aprobadas.

Puedes resolverlo mediante variables de JasperReports o mediante una consulta SQL auxiliar. Si utilizas variables, recuerda que el cálculo debe reiniciarse en el grupo del alumno.


## 5. Media de las notas del alumno

Añade también la media de las notas de cada alumno.


Comprueba que el tipo de la variable sea compatible con el tipo numérico de la nota.

## 6. Resumen general del curso



1. Número total de alumnos.
2. Número total de notas registradas.
3. Número total de asignaturas suspensas.
4. Número total de asignaturas aprobadas.
5. **Media de todas las notas suspensas del curso.**

Para el último indicador, ten en cuenta que solo se deben incluir las notas estrictamente inferiores a 5. No calcules la media de todas las notas del alumnado.

Puedes resolver este resumen con variables de JasperReports o con una consulta SQL independiente. Si utilizas una variable para la media de suspensos, utiliza una expresión condicional que devuelva la nota cuando sea inferior a 5 y `null` en caso contrario; configura el cálculo para que ignore los valores nulos y verifica el comportamiento de tu versión. 

## 7. Diseño del informe

El informe debe cumplir estas condiciones:

- Título: `Informe académico de notas`.
- Cada alumno debe aparecer en un grupo independiente.
- Las notas deben mostrarse con dos decimales.
- Debe indicarse claramente si cada asignatura está aprobada o suspensa.
- Los recuentos y las medias deben estar identificados con etiquetas.
- El resumen general debe aparecer al final del informe.
- El diseño debe ser legible y no debe cortar nombres ni conceptos.

## 8. Entrega

Entrega:

1. El archivo `.jrxml` del informe.
2. Un PDF exportado desde JasperReports.
3. Una captura de la vista previa donde se vea el resumen de un alumno y el resumen general.

## 9. Comprobaciones antes de entregar

- [ ] Aparecen los ocho alumnos.
- [ ] Cada alumno muestra sus seis asignaturas.
- [ ] Una nota de 4,99 se considera suspensa y una nota de 5,00 aprobada.
- [ ] Los recuentos de aprobadas y suspensas son correctos.
- [ ] La media individual se calcula solo con las notas de ese alumno.
- [ ] La media general de suspensos utiliza únicamente notas inferiores a 5.
- [ ] El informe tiene un resumen final y se exporta correctamente a PDF.
