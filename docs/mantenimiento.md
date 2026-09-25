# 6. Administración y mantenimiento

```bash
# detener
docker compose stop

# arrancar de nuevo
docker compose start

# reiniciar Odoo
docker compose restart web

# eliminar contenedores y red
docker compose down

# ver volúmenes
docker volume ls
```

## Entrar en Odoo

```bash
docker compose exec web bash
ls /mnt/extra-addons
ls /etc/odoo
ls /var/log/odoo
```

## Entrar en PostgreSQL

```bash
docker compose exec db psql -U odoo -d postgres
```

## Borrar también los volúmenes

```bash
docker compose down -v
```

!!! danger
    `down -v` elimina los volúmenes asociados al proyecto y puede provocar la pérdida de la base de datos. Utilízalo solo cuando quieras reiniciar completamente el entorno.
