# 5. Puesta en marcha

## 1. Levantar el entorno

```bash
cd odoo-docker
docker compose up -d
```

## 2. Comprobar contenedores

```bash
docker compose ps
```

## 3. Consultar logs

```bash
docker compose logs
docker compose logs -f web
```

También podemos consultar `log/odoo-server.log`.

## 4. Abrir Odoo

Accedemos a:

```text
http://localhost:8069
```

La primera vez aparecerá la creación de la base de datos. La **Master Password** debe coincidir con `admin_passwd`.

## 5. Crear la base de datos

Indicaremos nombre de base de datos, correo y contraseña del administrador, idioma y país.
