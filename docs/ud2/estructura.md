# 2. Estructura del proyecto

```text
odoo-docker/
├── docker-compose.yml
├── config_odoo/
│   └── odoo.conf
├── dev-addons/
└── log/
```

- `config_odoo`: configuración del servidor Odoo.
- `dev-addons`: módulos propios que desarrollaremos posteriormente.
- `log`: logs generados por Odoo.

## Crear la estructura

```bash
mkdir odoo-docker
cd odoo-docker
mkdir config_odoo dev-addons log
touch docker-compose.yml
touch config_odoo/odoo.conf
```
