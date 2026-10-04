# 6. Conexión con PostgreSQL

Configuraremos un **Data Adapter JDBC**.

```text
Servidor: localhost
Puerto: 5432
BD: empresa_jasper
Usuario: postgres
```

URL:

```text
jdbc:postgresql://localhost:5432/empresa_jasper
```

## Pasos
1. Crear Data Adapter.
2. Elegir JDBC.
3. Configurar driver PostgreSQL.
4. Introducir conexión y credenciales.
5. Probar conexión.

```sql
SELECT * FROM productos;
```
