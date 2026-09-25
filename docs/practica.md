# Práctica: instalación y exploración técnica de Odoo 17

## Objetivo

En esta práctica se realizará la instalación de **Odoo 17 y PostgreSQL mediante Docker Compose** y se comprobará su correcto funcionamiento.

Una vez instalado Odoo, se activará el **modo desarrollador** para explorar cómo Odoo representa técnicamente sus modelos, campos, vistas y tablas.

!!! important "Entrega"
    El documento de entrega deberá incluir las capturas solicitadas como evidencias.  
    En cada captura debe apreciarse claramente la información que se pide comprobar.

---

## 1. Preparación del proyecto

Crea la estructura de carpetas utilizada durante la unidad:

```text
odoo/
├── docker-compose.yml
├── config_odoo/
│   └── odoo.conf
├── dev-addons/
└── log/
```

Configura `docker-compose.yml` y `odoo.conf` siguiendo los apuntes de la unidad.

### Evidencia 1 — Estructura del proyecto

Adjunta una captura donde pueda verse la estructura completa de carpetas y archivos.

**Debe apreciarse:**

- `docker-compose.yml`
- `config_odoo/odoo.conf`
- `dev-addons/`
- `log/`

---

## 2. Puesta en marcha

Desde la carpeta donde se encuentra `docker-compose.yml`, ejecuta:

```bash
docker compose up -d
```

Comprueba el estado de los contenedores:

```bash
docker compose ps
```

También puedes utilizar:

```bash
docker ps
```

### Evidencia 2 — Contenedores

Adjunta una captura donde aparezcan los contenedores de **Odoo y PostgreSQL en ejecución**.

En la captura deben poder identificarse:

- nombre o servicio;
- imagen utilizada;
- estado;
- puerto publicado de Odoo.

---

## 3. Comprobación de Odoo

Accede desde el navegador a:

```text
http://localhost:8069
```

Crea una base de datos para realizar la práctica.

Instala, como mínimo, las aplicaciones:

- **Contactos**
- **Ventas**

### Evidencia 3 — Odoo funcionando

Adjunta una captura de Odoo donde se pueda comprobar que la instalación funciona correctamente y que has accedido a la base de datos creada.

---

# 4. Activación del modo desarrollador

Para explorar la estructura interna de Odoo necesitaremos activar el **modo desarrollador**.

Puedes hacerlo desde:

**Ajustes → Herramientas de desarrollador → Activar modo desarrollador**

> Dependiendo de la interfaz instalada, la ubicación exacta puede variar.

Una vez activado aparecerán opciones técnicas adicionales.

### Evidencia 4 — Modo desarrollador

Adjunta una captura que permita comprobar que el modo desarrollador está activado.

---

# 5. Modelos de Odoo

Odoo utiliza un ORM (*Object Relational Mapping*). Los objetos de negocio se representan mediante **modelos**.

Accede a:

**Ajustes → Técnico → Estructura de la base de datos → Modelos**

Localiza los siguientes modelos:

| Modelo | Nombre técnico | Finalidad |
|---|---|---|
| Contacto | `res.partner` | Clientes, proveedores y contactos |
| Usuario | `res.users` | Usuarios de Odoo |
| Producto | `product.template` | Información general del producto |
| Pedido de venta | `sale.order` | Cabecera de los pedidos de venta |
| Línea de pedido | `sale.order.line` | Productos incluidos en cada pedido |

!!! question "Investiga"
    ¿Qué diferencia observas entre el **nombre descriptivo** de un modelo y su **nombre técnico**?

### Evidencia 5 — Modelo `res.partner`

Busca el modelo:

```text
res.partner
```

Adjunta una captura de su ficha técnica.

Localiza dentro del modelo algunos campos como:

```text
name
email
phone
city
```

Anota el **tipo de dato** de cada uno.

---

# 6. Del modelo a la tabla PostgreSQL

Una idea importante de Odoo es la relación entre el ORM y la base de datos.

Como regla general, el nombre técnico del modelo se transforma en el nombre de la tabla sustituyendo los puntos (`.`) por guiones bajos (`_`).

Ejemplo:

```text
Modelo Odoo        Tabla PostgreSQL

res.partner   →    res_partner
sale.order    →    sale_order
sale.order.line →  sale_order_line
```

Entra en PostgreSQL desde el contenedor:

```bash
docker compose exec db psql -U odoo -d NOMBRE_BASE_DATOS
```

Lista las tablas:

```sql
\dt
```

Busca algunas tablas:

```sql
\dt res_partner
\dt sale_order
\dt sale_order_line
```

Consulta la estructura de una tabla:

```sql
\d res_partner
```

También puedes realizar una consulta sencilla:

```sql
SELECT id, name, email
FROM res_partner
LIMIT 10;
```

### Evidencia 6 — Tablas de PostgreSQL

Adjunta una captura donde puedan verse al menos estas tablas:

```text
res_partner
sale_order
sale_order_line
```

### Evidencia 7 — Relación modelo/tabla

Adjunta:

1. una captura del modelo `res.partner` desde Odoo;
2. una captura de la tabla `res_partner` desde PostgreSQL.

Explica brevemente qué relación existe entre ambas.

---

# 7. Vistas de Odoo

Un mismo modelo puede mostrarse de diferentes maneras.

Entre las vistas más habituales encontramos:

- **Form**: formulario de un único registro.
- **List**: listado de registros.
- **Kanban**: tarjetas.
- **Search**: filtros y opciones de búsqueda.
- **Calendar**: calendario.
- **Graph**: representación gráfica.
- **Pivot**: análisis mediante tabla dinámica.

Accede a:

**Ajustes → Técnico → Interfaz de usuario → Vistas**

Busca vistas relacionadas con:

```text
res.partner
```

Filtra utilizando el campo **Modelo**.

### Evidencia 8 — Vistas de `res.partner`

Adjunta una captura donde aparezcan varias vistas asociadas al modelo:

```text
res.partner
```

Identifica al menos:

- una vista de formulario;
- una vista de lista;
- una vista de búsqueda.

Anota para cada una:

- nombre;
- tipo de vista;
- modelo.

---

# 8. Analizando una vista XML

Abre una de las vistas de formulario asociadas a `res.partner`.

Localiza su definición o arquitectura XML.

En ella deberías encontrar referencias a campos mediante estructuras similares a:

```xml
<field name="name"/>
<field name="email"/>
<field name="phone"/>
```

### Evidencia 9 — XML de una vista

Adjunta una captura donde pueda verse parte del XML de una vista de `res.partner`.

Selecciona **tres campos** que aparezcan en el XML y comprueba posteriormente que existen en el modelo `res.partner`.

Completa:

| Campo XML | ¿Existe en el modelo? | Tipo |
|---|---|---|
| | | |
| | | |
| | | |

!!! tip "Idea clave"
    El **modelo** define los datos y su comportamiento.  
    La **vista** determina cómo se presentan esos datos al usuario.

---

# 9. Investigación: módulo de Ventas

Repite parte del proceso con el módulo **Ventas**.

Localiza:

```text
sale.order
sale.order.line
```

Investiga:

1. ¿Qué representa `sale.order`?
2. ¿Qué representa `sale.order.line`?
3. ¿Qué relación existe entre ambos?
4. Localiza en `sale.order` el campo relacionado con el cliente.
5. Localiza alguna vista de formulario asociada a `sale.order`.
6. Identifica la tabla PostgreSQL correspondiente a cada modelo.

### Evidencia 10 — Pedido de venta

Adjunta una captura del modelo `sale.order` y otra de una de sus vistas.

Identifica en la vista al menos **cinco campos** pertenecientes al modelo.

---

# 10. Reto final: seguir un dato de principio a fin

Crea desde la interfaz de Odoo un nuevo contacto con datos fácilmente identificables.

Por ejemplo:

```text
Nombre: Cliente Prueba DAM
Email: dam@example.com
Ciudad: Puertollano
```

Después:

1. Localiza el registro desde **Contactos**.
2. Localiza el modelo que gestiona esos datos.
3. Identifica la vista que los muestra.
4. Accede a PostgreSQL.
5. Busca el mismo contacto mediante SQL.

Por ejemplo:

```sql
SELECT id, name, email, city
FROM res_partner
WHERE name = 'Cliente Prueba DAM';
```

### Evidencia 11 — Del navegador a PostgreSQL

Incluye dos capturas:

- contacto visible desde Odoo;
- mismo contacto recuperado mediante SQL.

Explica el recorrido:

```text
Interfaz de Odoo
       ↓
Vista XML
       ↓
Modelo res.partner
       ↓
ORM de Odoo
       ↓
Tabla res_partner
       ↓
PostgreSQL
```

---

# 11. Conclusiones

Responde brevemente:

1. ¿Qué diferencia existe entre **modelo, vista y tabla**?
2. ¿Qué función realiza el ORM de Odoo?
3. ¿Puede un modelo tener varias vistas? Pon un ejemplo.
4. ¿Por qué no es recomendable modificar directamente las tablas de Odoo mediante SQL?
5. ¿Dónde desarrollaríamos nuestros propios módulos dentro de la estructura Docker utilizada en clase?

---

## Evidencias que debe contener la entrega

| Nº | Evidencia |
|---:|---|
| 1 | Estructura del proyecto |
| 2 | Contenedores Odoo/PostgreSQL funcionando |
| 3 | Acceso a Odoo |
| 4 | Modo desarrollador |
| 5 | Modelo `res.partner` |
| 6 | Tablas PostgreSQL |
| 7 | Relación `res.partner` / `res_partner` |
| 8 | Vistas de `res.partner` |
| 9 | XML de una vista |
| 10 | Modelo y vista de `sale.order` |
| 11 | Contacto en Odoo y PostgreSQL |

!!! warning "Importante"
    Las capturas deben permitir identificar claramente lo que se está demostrando. No se valorarán capturas genéricas que no permitan comprobar la realización del apartado.
