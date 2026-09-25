# SGE · UD2 · Odoo 17 con Docker

Apuntes MkDocs para desplegar Odoo 17 y PostgreSQL con Docker Compose.

## Ejecutar en local

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Después abre `http://127.0.0.1:8000`.

## Publicar en GitHub Pages

```bash
mkdocs gh-deploy
```
