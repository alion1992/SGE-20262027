# 4. Configuración de Odoo

En `config_odoo/odoo.conf`:

```ini
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo
admin_passwd = alia
logfile = /var/log/odoo/odoo-server.log
```

## `addons_path`

Indica dónde buscar módulos adicionales. Coincide con el montaje de `dev-addons`.

## `data_dir`

Directorio de datos de Odoo. En Docker Compose `/var/lib/odoo` está asociado al volumen `odoo-web-data`.

## `admin_passwd`

Es la **contraseña maestra para administrar bases de datos de Odoo**. No es la contraseña de un usuario normal.

## `logfile`

Los logs se escriben en `/var/log/odoo/odoo-server.log`. Gracias al bind mount podremos abrirlos desde `log/odoo-server.log`.

!!! danger
    No publiques una contraseña maestra real en un repositorio público. Para clase usamos valores sencillos únicamente con finalidad didáctica.
