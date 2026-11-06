# UD4. Desarrollo y personalización de módulos en Odoo

## Presentación de la unidad

En esta unidad aprenderemos a desarrollar y personalizar funcionalidades
en Odoo mediante la creación y modificación de módulos. Partiremos de
los conocimientos de Python y de la estructura de Odoo adquiridos en
unidades anteriores para construir aplicaciones adaptadas a las
necesidades de una empresa.

Trabajaremos con los modelos, las vistas, el ORM y los mecanismos de
seguridad de Odoo. A lo largo de la unidad desarrollaremos ejemplos
prácticos que nos permitirán comprender cómo se relacionan los distintos
elementos de un módulo y cómo podemos ampliar las funcionalidades del
ERP.

El objetivo final será ser capaces de crear un módulo funcional que
incorpore modelos propios, formularios de gestión, menús, acciones,
reglas de validación y permisos de acceso.

## 1. Fundamentos de Python aplicados a Odoo

Antes de desarrollar modelos y funcionalidades, repasaremos los
elementos de Python que utilizaremos habitualmente en Odoo.

-   Variables y tipos de datos.
-   Estructuras de control: condicionales y bucles.
-   Funciones y parámetros.
-   Clases y objetos.
-   Atributos y métodos.
-   Herencia de clases.
-   Decoradores utilizados en Odoo.

Aplicaremos estos conceptos mediante pequeños ejemplos relacionados con
la lógica de negocio de una aplicación empresarial.

## 2. Desarrollo de modelos

Los modelos representan los datos y la lógica de negocio de una
aplicación en Odoo. Aprenderemos a definir nuestros propios modelos y a
relacionarlos con otros modelos del sistema.

-   Creación de modelos mediante clases Python.
-   Uso de `models.Model`.
-   Definición de campos y sus principales tipos:
    -   `Char`, `Text` y `Html`.
    -   `Integer`, `Float` y `Monetary`.
    -   `Boolean` y `Date`.
    -   `Selection`.
    -   `Binary`.
-   Campos relacionales:
    -   `Many2one`.
    -   `One2many`.
    -   `Many2many`.
-   Atributos de los campos: `string`, `required`, `readonly`, `default`
    y `help`.
-   Métodos y lógica de negocio.
-   Uso del ORM de Odoo para crear, consultar, modificar y eliminar
    registros.
-   Campos calculados y campos relacionados.
-   Restricciones y validaciones mediante Python.

## 3. Desarrollo de vistas

Las vistas permiten mostrar y gestionar la información de los modelos.
Aprenderemos a construir interfaces de usuario utilizando archivos XML.

-   Definición de vistas mediante XML.
-   Vistas de tipo formulario (`form`).
-   Vistas de tipo lista (`list`).
-   Vistas kanban (`kanban`).
-   Organización de campos mediante grupos y páginas.
-   Botones y métodos asociados.
-   Acciones de ventana (`ir.actions.act_window`).
-   Creación de menús (`menuitem`).
-   Relación entre modelos, vistas, acciones y menús.
-   Uso de atributos y condiciones para controlar la visualización de
    campos.

## 4. Personalización y ampliación de módulos

Además de crear funcionalidades nuevas, Odoo permite ampliar y adaptar
módulos existentes sin modificar directamente su código original.

-   Herencia de modelos.
-   Ampliación de modelos existentes.
-   Incorporación y modificación de campos.
-   Sobrescritura y ampliación de métodos.
-   Uso de `super()` para conservar el comportamiento original.
-   Herencia de vistas mediante XML.
-   Localización de elementos con `xpath`.
-   Modificación de formularios, listas y otras vistas existentes.
-   Buenas prácticas para mantener las personalizaciones y facilitar las
    actualizaciones.

## 5. Seguridad y permisos

En una aplicación empresarial no todos los usuarios deben poder acceder
a toda la información ni realizar las mismas operaciones. Estudiaremos
los mecanismos que proporciona Odoo para controlar el acceso.

-   Usuarios y grupos.
-   Grupos de seguridad.
-   Permisos de acceso a modelos.
-   Fichero `ir.model.access.csv`.
-   Operaciones de lectura, escritura, creación y eliminación.
-   Reglas de registro (`record rules`).
-   Restricción de registros según el usuario o el grupo.
-   Comprobación del funcionamiento de los permisos con distintos
    usuarios.

## 6. Desarrollo de un módulo completo

Aplicaremos los contenidos de la unidad mediante el desarrollo de un
módulo propio para Odoo. El proyecto integrará modelos, campos,
relaciones, vistas, menús, acciones, validaciones y permisos.

Durante el desarrollo seguiremos un proceso incremental:

1.  Definir el problema que resolverá el módulo y sus requisitos.
2.  Diseñar los modelos y las relaciones entre ellos.
3.  Implementar los modelos y sus campos en Python.
4.  Crear las vistas XML necesarias para gestionar la información.
5.  Incorporar acciones y menús para acceder a las funcionalidades.
6.  Añadir métodos, campos calculados y validaciones.
7.  Configurar los permisos y las reglas de acceso.
8.  Instalar, probar y corregir el módulo.
9.  Documentar el funcionamiento y presentar el resultado.

Como posibles proyectos se pueden plantear módulos de gestión de torneos
deportivos, préstamos de material, incidencias informáticas o reservas
de instalaciones.

Al finalizar la unidad, el alumnado deberá ser capaz de desarrollar y
personalizar un módulo de Odoo que responda a unas necesidades concretas
de gestión empresarial.
