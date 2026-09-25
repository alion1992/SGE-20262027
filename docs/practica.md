# 7. Práctica guiada

## Tarea

1. Crear la estructura de carpetas.
2. Crear `docker-compose.yml`.
3. Crear `config_odoo/odoo.conf`.
4. Levantar los servicios.
5. Comprobar los contenedores.
6. Acceder a Odoo desde el navegador.
7. Crear una base de datos de prueba.
8. Localizar el fichero de log.
9. Entrar en el contenedor de Odoo.
10. Localizar `/etc/odoo`, `/mnt/extra-addons` y `/var/log/odoo`.
11. Detener y arrancar el entorno.
12. Comprobar que la base de datos persiste.

## Cuestiones

- ¿Qué diferencia hay entre imagen y contenedor?
- ¿Para qué sirve PostgreSQL?
- ¿Para qué sirven los volúmenes?
- ¿Qué significa `8069:8069`?
- ¿Por qué `HOST=db` y no `HOST=localhost`?
- ¿Qué función tiene `admin_passwd`?
- ¿Qué ocurriría con `docker compose down -v`?
