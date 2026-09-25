# 1. Docker

Docker permite ejecutar aplicaciones en **contenedores aislados y reproducibles**.

- **Imagen:** plantilla para crear contenedores.
- **Contenedor:** instancia ejecutable de una imagen.
- **Volumen:** almacenamiento persistente.
- **Docker Compose:** define varios servicios relacionados mediante YAML.

En esta instalación utilizaremos `odoo:17.0` y PostgreSQL.

## Comprobaciones

```bash
docker --version
docker compose version
docker ps
docker ps -a
```

!!! tip
    `docker run` crea un contenedor nuevo. `docker start` arranca uno que ya existe.
