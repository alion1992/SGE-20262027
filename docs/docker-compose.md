# 3. Docker Compose

Usaremos esta configuración. En los apuntes se normalizan las rutas de PostgreSQL a `/var/lib/postgresql/data` y se fija PostgreSQL 16 para disponer de un entorno reproducible.

```yaml
version: '3.1'

services:
  web:
    image: odoo:17.0
    depends_on:
      - db
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./config_odoo:/etc/odoo
      - ./dev-addons:/mnt/extra-addons
      - ./log:/var/log/odoo
    environment:
      - HOST=db
      - USER=odoo
      - PASSWORD=odoo

  db:
    image: postgres:16
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
      - PGDATA=/var/lib/postgresql/data/pgdata
    volumes:
      - odoo-db-data:/var/lib/postgresql/data

volumes:
  odoo-web-data:
  odoo-db-data:
```

## Servicio `web`

`image: odoo:17.0` indica la imagen de Odoo.

`depends_on: db` establece la dependencia con PostgreSQL.

```yaml
ports:
  - "8069:8069"
```

El puerto izquierdo pertenece al anfitrión y el derecho al contenedor. Accederemos mediante `http://localhost:8069`.

### Volúmenes

```yaml
- odoo-web-data:/var/lib/odoo
```
Persistencia de datos utilizados por Odoo.

```yaml
- ./config_odoo:/etc/odoo
```
Nuestra configuración local aparece en `/etc/odoo` dentro del contenedor.

```yaml
- ./dev-addons:/mnt/extra-addons
```
Los módulos que programemos estarán disponibles en `/mnt/extra-addons`.

```yaml
- ./log:/var/log/odoo
```
Los logs quedan accesibles desde la carpeta `log`.

### Variables de entorno

```yaml
HOST=db
USER=odoo
PASSWORD=odoo
```

Odoo puede resolver `db` porque es el nombre del servicio PostgreSQL dentro de la red de Docker Compose.

## Servicio `db`

PostgreSQL utiliza el usuario `odoo`, contraseña `odoo` y conserva sus datos mediante un volumen.

!!! warning
    Estas credenciales son adecuadas para una práctica local. En producción deben utilizarse contraseñas robustas y secretos.
