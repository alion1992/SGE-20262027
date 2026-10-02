# ☁️ Instalación y configuración de Salesforce

## 1. Introducción

Salesforce es una plataforma **CRM (Customer Relationship Management)** que permite gestionar clientes, ventas, servicios y otros procesos empresariales.

A diferencia de otras herramientas como Odoo, Salesforce no se instala de forma local en nuestro ordenador. La plataforma se ejecuta en la **nube** y nosotros trabajaremos contra una organización de Salesforce denominada **Org**.

Para desarrollar utilizaremos:

- **Salesforce Developer Edition**
- **Visual Studio Code**
- **Salesforce CLI**
- **Salesforce Extension Pack**

---

## 2. Crear una cuenta Developer Edition

Salesforce ofrece una edición gratuita destinada al aprendizaje y desarrollo denominada **Developer Edition**.

Accedemos a:

[Salesforce Developer Edition](https://developer.salesforce.com/signup)

Rellenamos el formulario de registro.

!!! warning "Importante"
    El correo electrónico debe ser válido, ya que recibiremos un mensaje para activar nuestra cuenta.

    El **Username de Salesforce debe ser único**, aunque tenga formato de correo electrónico no tiene por qué coincidir con nuestro correo real.

Una vez realizado el registro:

1. Recibimos el correo de activación.
2. Activamos nuestra cuenta.
3. Establecemos una contraseña.
4. Accedemos a nuestra organización Salesforce.

Nuestra organización constituye nuestro entorno independiente de trabajo.

---

## 3. Conocer Salesforce Setup

Una vez dentro de Salesforce, pulsamos:

**⚙️ → Configuración**

Accederemos a **Setup**, desde donde se administra nuestra organización.

Uno de los apartados más importantes será:

**Object Manager / Gestor de objetos**

Desde aquí podremos:

- Consultar objetos existentes.
- Crear objetos personalizados.
- Crear campos.
- Establecer relaciones.
- Configurar páginas.
- Gestionar reglas y restricciones.

Más adelante utilizaremos estas herramientas para crear nuestro propio modelo de datos.

---

## 4. Instalar Visual Studio Code

Para desarrollar utilizaremos **Visual Studio Code**.

Podemos descargarlo desde:

[Visual Studio Code](https://code.visualstudio.com/)

Una vez instalado, lo utilizaremos como entorno principal para desarrollar aplicaciones Salesforce.

---

## 5. Instalar Salesforce CLI

Salesforce proporciona una herramienta de línea de comandos denominada **Salesforce CLI**.

El comando principal es:

```bash
sf
```

Salesforce CLI nos permitirá:

- Crear proyectos.
- Conectar VS Code con Salesforce.
- Gestionar organizaciones.
- Descargar metadatos.
- Desplegar código.
- Ejecutar consultas.
- Ejecutar pruebas.

### Instalación en macOS

Descargamos el instalador oficial desde:

[Salesforce CLI](https://developer.salesforce.com/tools/salesforcecli)

Seleccionamos la versión correspondiente a nuestro procesador.

Podemos comprobar nuestra arquitectura mediante:

```bash
uname -m
```

Si obtenemos:

```text
arm64
```

nuestro Mac utiliza **Apple Silicon**.

Si obtenemos:

```text
x86_64
```

utiliza un procesador **Intel**.

!!! warning "Homebrew"
    No utilizaremos `brew install salesforce-cli`, ya que actualmente el paquete correspondiente de Homebrew puede aparecer deshabilitado. Utilizaremos el instalador oficial proporcionado por Salesforce.

Después de instalar Salesforce CLI debemos **cerrar y volver a abrir Visual Studio Code**.

Comprobamos la instalación:

```bash
sf --version
```

Obtendremos una salida similar a:

```text
@salesforce/cli/2.x.x darwin-arm64 node-v...
```

También podemos ejecutar:

```bash
sf
```

para visualizar los comandos disponibles.

---

## 6. Instalar Salesforce Extension Pack

Abrimos Visual Studio Code y accedemos a:

**Extensions**

o mediante:

```text
Cmd + Shift + X
```

En Windows/Linux:

```text
Ctrl + Shift + X
```

Buscamos:

```text
Salesforce Extension Pack
```

Instalamos el paquete oficial publicado por **Salesforce**.

Este paquete proporciona soporte para tecnologías como:

- Apex
- SOQL
- Lightning Web Components
- Visualforce
- Salesforce DX

---

## 7. Crear un proyecto Salesforce

Creamos una carpeta donde almacenaremos nuestros proyectos.

Por ejemplo:

```bash
cd ~
mkdir Salesforce
cd Salesforce
```

Creamos nuestro primer proyecto:

```bash
sf project generate --name salesforce-sge
```

Entramos en él:

```bash
cd salesforce-sge
```

Podemos comprobar su contenido:

```bash
ls
```

Encontraremos una estructura similar a:

```text
salesforce-sge/
│
├── config/
├── force-app/
│   └── main/
│       └── default/
├── scripts/
│
├── .forceignore
├── .gitignore
├── package.json
└── sfdx-project.json
```

El fichero:

```text
sfdx-project.json
```

identifica el directorio como un **proyecto Salesforce DX**.

---

## 8. Abrir el proyecto en Visual Studio Code

Podemos abrirlo directamente desde el terminal:

```bash
code .
```

También podemos utilizar:

**File → Open Folder**

y seleccionar:

```text
salesforce-sge
```

!!! important
    Debemos abrir `salesforce-sge` como carpeta principal del proyecto en Visual Studio Code.

---

## 9. Conectar VS Code con Salesforce

Abrimos la paleta de comandos:

=== "macOS"

    ```text
    Cmd + Shift + P
    ```

=== "Windows / Linux"

    ```text
    Ctrl + Shift + P
    ```

Buscamos:

```text
SFDX: Authorize an Org
```

Seleccionamos:

```text
Production
```

!!! note
    La opción **Production** también se utiliza para conectarnos a una **Developer Edition**.

Introducimos un alias para identificar nuestra organización.

Por ejemplo:

```text
SGE-DESARROLLO
```

Se abrirá automáticamente el navegador.

Iniciamos sesión utilizando nuestra cuenta de **Salesforce Developer Edition** y autorizamos el acceso.

---

## 10. Comprobar la conexión

Desde el terminal ejecutamos:

```bash
sf org list
```

Deberíamos obtener nuestra organización con estado:

```text
Alias            Status
SGE-DESARROLLO   Connected
```

Esto significa que VS Code está conectado correctamente con Salesforce.

---

## 11. Abrir Salesforce desde VS Code

Podemos abrir nuestra organización directamente desde el terminal:

```bash
sf org open --target-org SGE-DESARROLLO
```

Si nuestra organización está configurada como predeterminada podemos utilizar simplemente:

```bash
sf org open
```

Se abrirá automáticamente Salesforce en nuestro navegador.

---

## 12. Nuestro entorno de desarrollo

Una vez finalizado el proceso tendremos:

```text
┌──────────────────────┐
│  Visual Studio Code  │
│    salesforce-sge    │
└──────────┬───────────┘
           │
           │ Salesforce CLI
           │
           ▼
┌──────────────────────┐
│ Salesforce Developer │
│       Edition        │
│    SGE-DESARROLLO    │
└──────────────────────┘
```

A partir de este momento podemos comenzar a desarrollar aplicaciones para Salesforce.