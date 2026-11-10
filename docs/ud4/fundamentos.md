# UD1. Estructuras de control en Python

> **Módulo Profesional 5099: Estructuras de control en Python**  
> **Resultados de aprendizaje:** RA1, RA2 y RA3  
> **Duración orientativa:** primer trimestre

---

## 📑 Índice

- [1. Introducción](#1-introducción)
- [2. Resultados de aprendizaje](#2-resultados-de-aprendizaje)

- [3. ¿Qué es el flujo de ejecución?](#3-qué-es-el-flujo-de-ejecución)
- [4. Tipos de estructuras de control](#4-tipos-de-estructuras-de-control)
- [5. La importancia de la indentación en Python](#5-la-importancia-de-la-indentación-en-python)
- [6. Operadores necesarios para trabajar con condiciones](#6-operadores-necesarios-para-trabajar-con-condiciones)
- [7. Operadores lógicos](#7-operadores-lógicos)
- [8. Tablas de verdad básicas](#8-tablas-de-verdad-básicas)
- [9. Estructuras secuenciales](#9-estructuras-secuenciales)
- [10. Estructuras de selección](#10-estructuras-de-selección)
- [11. `if`](#11-if)
- [12. `if...else`](#12-ifelse)
- [13. `if...elif...else`](#13-ifelifelse)
- [14. Condiciones compuestas](#14-condiciones-compuestas)
- [15. Condicionales anidados](#15-condicionales-anidados)
- [16. Condicionales compactos](#16-condicionales-compactos)
- [17. Valores booleanos](#17-valores-booleanos)
- [18. Comparación de cadenas](#18-comparación-de-cadenas)
- [19. Comprobar si un dato está vacío](#19-comprobar-si-un-dato-está-vacío)
- [20. Bucles](#20-bucles)
- [21. Bucle `for`](#21-bucle-for)
- [22. `range()`](#22-range)
- [23. Ejemplo: tabla de multiplicar](#23-ejemplo-tabla-de-multiplicar)
- [24. Recorrer una cadena](#24-recorrer-una-cadena)
- [25. Recorrer una lista](#25-recorrer-una-lista)
- [26. Bucle `while`](#26-bucle-while)
- [27. Bucle infinito](#27-bucle-infinito)
- [28. `break`](#28-break)
- [29. `continue`](#29-continue)
- [30. Bucles anidados](#30-bucles-anidados)
- [31. Combinación de estructuras](#31-combinación-de-estructuras)
- [32. Ejemplo práctico: cajero automático](#32-ejemplo-práctico-cajero-automático)
- [33. Ejemplo práctico: sistema de notas](#33-ejemplo-práctico-sistema-de-notas)
- [34. Ejemplo práctico: contraseña](#34-ejemplo-práctico-contraseña)
- [35. Ejemplo práctico: menú de aplicación](#35-ejemplo-práctico-menú-de-aplicación)
- [36. Ejemplo práctico: programación de drones](#36-ejemplo-práctico-programación-de-drones)
- [37. Buenas prácticas](#37-buenas-prácticas)
- [38. Errores frecuentes](#38-errores-frecuentes)
- [39. Actividades propuestas](#39-actividades-propuestas)
- [40. Reto final de la unidad](#40-reto-final-de-la-unidad)
- [41. Resumen](#41-resumen)

---

## 1. Introducción

[⬆️ Volver al índice](#-índice)


Un programa informático está formado por una serie de instrucciones que el ordenador ejecuta siguiendo unas determinadas reglas. En los programas más sencillos, las instrucciones se ejecutan una detrás de otra, pero en aplicaciones reales necesitamos tomar decisiones y repetir determinadas operaciones.

Las **estructuras de control** permiten modificar el flujo normal de ejecución de un programa.

En Python podemos trabajar principalmente con:

- **Estructuras secuenciales:** las instrucciones se ejecutan en orden.
- **Estructuras de selección:** permiten tomar decisiones.
- **Estructuras de repetición:** permiten ejecutar un bloque varias veces.

En esta unidad aprenderemos a utilizar estas estructuras y a combinarlas para resolver problemas reales.

---

## 2. Resultados de aprendizaje

[
# 3. ¿Qué es el flujo de ejecución?

El **flujo de ejecución** indica el orden en el que se ejecutan las instrucciones de un programa.

Por defecto, Python ejecuta las instrucciones de arriba hacia abajo.

```python
print("Inicio")

nombre = "Ana"

print("Hola", nombre)

print("Fin")
```

El resultado será:

```text
Inicio
Hola Ana
Fin
```

Podemos representar este funcionamiento mediante un esquema:

![alt text](image.png)

Sin estructuras de control, nuestros programas serían muy limitados.

---

# 4. Tipos de estructuras de control

Podemos clasificar las estructuras de control en tres grandes grupos:

![alt text](image-1.png)

## 4.1. Secuencia

[⬆️ Volver al índice](#-índice)


Las instrucciones se ejecutan una detrás de otra.

```python
nombre = input("Nombre: ")
edad = int(input("Edad: "))

print("Hola", nombre)
print("Tienes", edad, "años")
```

## 4.2. Selección

[⬆️ Volver al índice](#-índice)


El programa decide qué instrucciones ejecutar dependiendo de una condición.

```python
edad = int(input("Edad: "))

if edad >= 18:
    print("Eres mayor de edad")
```

## 4.3. Repetición

[⬆️ Volver al índice](#-índice)


Permite ejecutar varias veces un bloque de instrucciones.

```python
for i in range(5):
    print("Hola")
```

---

# 5. La importancia de la indentación en Python

Una de las características fundamentales de Python es que utiliza la **indentación para delimitar bloques de código**.

En otros lenguajes se utilizan llaves:

```text
if (edad >= 18) {
    mostrar("Mayor de edad");
}
```

En Python utilizamos dos puntos y sangrado:

```python
if edad >= 18:
    print("Mayor de edad")
```

La indentación forma parte de la sintaxis del lenguaje.

## Ejemplo correcto

```python
edad = 20

if edad >= 18:
    print("Puedes acceder")
```

## Ejemplo incorrecto

```python
edad = 20

if edad >= 18:
print("Puedes acceder")
```

Python producirá un error porque la instrucción que pertenece al `if` no está indentada.

## Recomendación

Utilizaremos normalmente **4 espacios** para cada nivel de indentación.

```python
if condicion:
    instruccion_1()
    instruccion_2()
```

Para estructuras anidadas:

```python
if edad >= 18:
    if tiene_entrada:
        print("Puede acceder")
```

Cada bloque aumenta un nivel de indentación.

---

# 6. Operadores necesarios para trabajar con condiciones

Las estructuras de selección e iteración utilizan condiciones.

## 6.1. Operadores de comparación

[⬆️ Volver al índice](#-índice)


| Operador | Significado | Ejemplo |
|---|---|---|
| `==` | Igual | `edad == 18` |
| `!=` | Distinto | `edad != 18` |
| `>` | Mayor que | `edad > 18` |
| `<` | Menor que | `edad < 18` |
| `>=` | Mayor o igual | `edad >= 18` |
| `<=` | Menor o igual | `edad <= 18` |

### Ejemplos

```python
edad = 25

print(edad == 25)
print(edad > 18)
print(edad < 30)
print(edad != 20)
```

Resultado:

```text
True
True
True
True
```

---

# 7. Operadores lógicos

Podemos combinar varias condiciones utilizando:

- `and`
- `or`
- `not`

## 7.1. `and`

[⬆️ Volver al índice](#-índice)


Todas las condiciones deben cumplirse.

```python
edad = 25
tiene_entrada = True

if edad >= 18 and tiene_entrada:
    print("Puede acceder")
```

## 7.2. `or`

[⬆️ Volver al índice](#-índice)


Es suficiente con que se cumpla una condición.

```python
es_admin = False
es_profesor = True

if es_admin or es_profesor:
    print("Puede acceder")
```

## 7.3. `not`

[⬆️ Volver al índice](#-índice)


Invierte el resultado de una condición.

```python
activo = False

if not activo:
    print("El usuario está inactivo")
```

---

# 8. Tablas de verdad básicas

## `and`

| A | B | A and B |
|---|---|---|
| False | False | False |
| False | True | False |
| True | False | False |
| True | True | True |

## `or`

| A | B | A or B |
|---|---|---|
| False | False | False |
| False | True | True |
| True | False | True |
| True | True | True |

## `not`

| A | not A |
|---|---|
| False | True |
| True | False |

---

# 9. Estructuras secuenciales

La estructura secuencial es la más sencilla.

Las instrucciones se ejecutan en el mismo orden en el que aparecen.

## Ejemplo: cálculo de precio

```python
precio = 25
cantidad = 3

total = precio * cantidad

print("Total:", total)
```

Flujo:

```text
precio
  ↓
cantidad
  ↓
calcular total
  ↓
mostrar total
```

## Ejemplo: área de un rectángulo

```python
base = float(input("Base: "))
altura = float(input("Altura: "))

area = base * altura

print("Área:", area)
```

## Ejemplo: conversión de temperatura

```python
celsius = float(input("Temperatura en ºC: "))

fahrenheit = celsius * 9 / 5 + 32

print("Temperatura:", fahrenheit, "ºF")
```

---

# 10. Diagramas de flujo

Los diagramas de flujo permiten representar gráficamente un algoritmo.

Elementos habituales:

| Elemento | Uso |
|---|---|
| Óvalo | Inicio / fin |
| Rectángulo | Proceso |
| Rombo | Decisión |
| Paralelogramo | Entrada / salida |
| Flecha | Dirección del flujo |

Ejemplo conceptual:

```text
       ┌───────────┐
       │  INICIO   │
       └─────┬─────┘
             ↓
      ┌──────────────┐
      │ Pedir edad   │
      └──────┬───────┘
             ↓
       ◇ edad >= 18? ◇
          /       \
       Sí           No
        ↓            ↓
  "Mayor"        "Menor"
        \            /
         └─────┬──────┘
               ↓
          ┌─────────┐
          │   FIN   │
          └─────────┘
```

---

# 11. Estructuras de selección

Las estructuras de selección permiten que un programa tome decisiones.

La estructura básica es:

```python
if condicion:
    instrucciones
```

Ejemplo:

```python
edad = int(input("Introduce tu edad: "))

if edad >= 18:
    print("Eres mayor de edad")
```

Si la condición es `True`, se ejecuta el bloque.

Si es `False`, se continúa después del bloque.

---

# 12. `if...else`

Cuando necesitamos ejecutar una alternativa si la condición no se cumple:

```python
edad = int(input("Edad: "))

if edad >= 18:
    print("Mayor de edad")
else:
    print("Menor de edad")
```

Tenemos dos caminos:

```text
             edad >= 18?
              /       \
            Sí         No
             ↓          ↓
          Mayor       Menor
```

---

# 13. `if...elif...else`

Cuando existen varias posibilidades podemos utilizar `elif`.

```python
nota = float(input("Nota: "))

if nota < 5:
    print("Suspenso")
elif nota < 7:
    print("Aprobado")
elif nota < 9:
    print("Notable")
else:
    print("Sobresaliente")
```

Python evalúa las condiciones de arriba hacia abajo.

En cuanto encuentra una condición verdadera, ejecuta ese bloque y continúa después de toda la estructura.

---

# 14. Condiciones compuestas

Podemos combinar operadores.

```python
edad = 25
nacionalidad = "ES"

if edad >= 18 and nacionalidad == "ES":
    print("Puede realizar el trámite")
```

Otro ejemplo:

```python
dia = "sábado"

if dia == "sábado" or dia == "domingo":
    print("Fin de semana")
```

---

# 15. Condicionales anidados

Una estructura condicional puede contener otra estructura condicional.

```python
edad = int(input("Edad: "))

if edad >= 18:
    carnet = input("¿Tienes carnet? ")

    if carnet == "si":
        print("Puedes conducir")
    else:
        print("Necesitas carnet")
else:
    print("No puedes conducir")
```

Debemos prestar especial atención a la indentación.

---

# 16. Operadores lógicos: AND, OR y NOT

Hasta ahora hemos utilizado condiciones para tomar decisiones con `if`, `elif` y `else`.

Sin embargo, en Python podemos necesitar comprobar varias condiciones al mismo tiempo. Para ello utilizamos los **operadores lógicos**.

Python dispone de tres operadores lógicos principales:

| Operador | Significado | Funcionamiento |
|---|---|---|
| `and` | Y | Todas las condiciones deben cumplirse. |
| `or` | O | Al menos una condición debe cumplirse. |
| `not` | NO | Invierte el resultado de una condición. |

## 16.1. Operador AND (Y)

El operador `and` permite combinar varias condiciones. Para que el resultado sea verdadero, **todas las condiciones deben cumplirse**.

**Ejemplo:** una persona puede obtener un descuento especial si tiene entre 18 y 25 años, ambos incluidos.

```python
edad = 22

if edad >= 18 and edad <= 25:
    print("Tienes derecho al descuento")
else:
    print("No tienes derecho al descuento")
```

En este ejemplo se comprueban dos condiciones:

- `edad >= 18`: comprueba que tenga al menos 18 años.
- `edad <= 25`: comprueba que tenga como máximo 25 años.

Las dos condiciones deben ser verdaderas para ejecutar el bloque del `if`.

**Tabla de verdad de AND:**

| Condición A | Condición B | Resultado |
|---|---|---|
| Verdadero | Verdadero | Verdadero |
| Verdadero | Falso | Falso |
| Falso | Verdadero | Falso |
| Falso | Falso | Falso |

**Recuerda:** con `and`, si una de las condiciones es falsa, el resultado completo será falso.

## 16.2. Operador OR (O)

El operador `or` permite combinar varias condiciones. En este caso, **basta con que al menos una de ellas sea verdadera**.

**Ejemplo:** un visitante puede entrar gratuitamente al parque si tiene menos de 4 años o si dispone de un pase VIP.

```python
edad = 30
pase_vip = "s"

if edad < 4 or pase_vip == "s":
    print("Entrada gratuita")
else:
    print("Debes pagar la entrada")
```

Se comprueban dos condiciones:

- `edad < 4`: comprueba si el visitante tiene menos de 4 años.
- `pase_vip == "s"`: comprueba si dispone de un pase VIP.

Si cualquiera de las dos condiciones se cumple, podrá entrar gratuitamente.

**Tabla de verdad de OR:**

| Condición A | Condición B | Resultado |
|---|---|---|
| Verdadero | Verdadero | Verdadero |
| Verdadero | Falso | Verdadero |
| Falso | Verdadero | Verdadero |
| Falso | Falso | Falso |

**Recuerda:** con `or`, solamente será falso cuando todas las condiciones sean falsas.

## 16.3. Operador NOT (NO)

El operador `not` permite negar una condición, es decir, invertir su resultado.

**Ejemplo:** comprobar si un visitante no quiere menú.

```python
menu = "n"

if not menu == "s":
    print("No has seleccionado menú")
else:
    print("Has seleccionado menú")
```

También podemos escribirlo utilizando el operador `!=`:

```python
if menu != "s":
    print("No has seleccionado menú")
```

El operador `not` transforma:

- Verdadero en falso.
- Falso en verdadero.

**Tabla de verdad de NOT:**

| Condición | Resultado de NOT |
|---|---|
| Verdadero | Falso |
| Falso | Verdadero |

## 16.4. Combinar varios operadores lógicos

Podemos combinar `and` y `or` dentro de una misma condición para realizar comprobaciones más complejas.

**Ejemplo:** el parque permite acceder a una zona especial a los visitantes que tengan entre 18 y 25 años o que dispongan de un pase VIP.

```python
edad = 30
pase_vip = "s"

if (edad >= 18 and edad <= 25) or pase_vip == "s":
    print("Puedes acceder a la zona especial")
else:
    print("No puedes acceder a la zona especial")
```

En este caso:

1. Primero comprobamos si la edad está entre 18 y 25 años.
2. Después comprobamos si tiene un pase VIP.
3. Si se cumple cualquiera de las dos opciones, podrá acceder.

### ¿Para qué sirven los paréntesis?

Los paréntesis permiten agrupar condiciones y establecer qué comprobaciones queremos realizar conjuntamente.

Por ejemplo:

```python
if (edad >= 18 and edad <= 25) or pase_vip == "s":
```

Primero se evalúa el grupo de condiciones de la edad y después se combina su resultado con la condición del pase VIP.

**Importante:** En Python, `and` tiene prioridad sobre `or`. Aunque los paréntesis no siempre son obligatorios, es recomendable utilizarlos para mejorar la claridad del código.


---

# 17. Métodos de cadenas de texto

Python dispone de numerosos métodos que permiten trabajar y manipular cadenas de texto (`str`). Estos métodos facilitan tareas como convertir textos a mayúsculas, eliminar espacios, buscar palabras o comprobar el contenido de una cadena.

## 17.1. Convertir mayúsculas y minúsculas

| Método | Funcionamiento | Ejemplo |
|---|---|---|
| `.lower()` | Convierte todo a minúsculas. | `"HOLA".lower()` → `"hola"` |
| `.upper()` | Convierte todo a mayúsculas. | `"hola".upper()` → `"HOLA"` |
| `.capitalize()` | Primera letra en mayúscula. | `"pedro".capitalize()` → `"Pedro"` |
| `.title()` | Primera letra de cada palabra en mayúscula. | `"juan perez".title()` → `"Juan Perez"` |
| `.swapcase()` | Invierte mayúsculas y minúsculas. | `"Hola".swapcase()` → `"hOLA"` |

Ejemplo:

```python
nombre = input("Introduce tu nombre: ")

nombre = nombre.strip().title()

print(f"Hola, {nombre}")
```

## 17.2. Eliminar espacios

| Método | Funcionamiento |
|---|---|
| `.strip()` | Elimina espacios al principio y al final. |
| `.lstrip()` | Elimina espacios de la izquierda. |
| `.rstrip()` | Elimina espacios de la derecha. |

Ejemplo:

```python
texto = "   Hola Python   "

print(texto.strip())
print(texto.lstrip())
print(texto.rstrip())
```

**Importante:** estos métodos no eliminan los espacios que existen entre palabras.

## 17.3. Buscar y sustituir texto

| Método | Funcionamiento |
|---|---|
| `.find("texto")` | Busca un texto y devuelve su posición. Si no existe, devuelve -1. |
| `.count("texto")` | Cuenta cuántas veces aparece un texto. |
| `.replace("a", "b")` | Sustituye una parte del texto por otra. |

Ejemplo:

```python
frase = "Me gusta programar en Python"

print(frase.find("Python"))
print(frase.count("a"))
print(frase.replace("Python", "Java"))
```

## 17.4. Comprobar el contenido de una cadena

Estos métodos devuelven un valor booleano (`True` o `False`) y son especialmente útiles para validar datos.

| Método | Funcionamiento | Ejemplo |
|---|---|---|
| `.isdigit()` | Comprueba si contiene únicamente dígitos. | `"123".isdigit()` |
| `.isalpha()` | Comprueba si contiene únicamente letras. | `"Hola".isalpha()` |
| `.isalnum()` | Comprueba si contiene letras o números. | `"Hola123".isalnum()` |
| `.isspace()` | Comprueba si contiene únicamente espacios. | `"   ".isspace()` |
| `.islower()` | Comprueba si las letras están en minúsculas. | `"hola".islower()` |
| `.isupper()` | Comprueba si las letras están en mayúsculas. | `"HOLA".isupper()` |

Ejemplo:

```python
edad = input("Introduce tu edad: ")

if edad.isdigit():
    print(f"Tu edad es {edad}")
else:
    print("Debes introducir un número entero positivo")
```

## 17.5. Dividir y unir cadenas

También podemos dividir una cadena en varias partes o unir diferentes cadenas.

| Método | Funcionamiento |
|---|---|
| `.split()` | Divide una cadena y devuelve una lista. |
| `.join()` | Une los elementos de una lista en una cadena. |

Ejemplo con `split()`:

```python
nombres = "Ana,Juan,Pedro"

lista_nombres = nombres.split(",")

print(lista_nombres)
```

Resultado:

```text
['Ana', 'Juan', 'Pedro']
```

Ejemplo con `join()`:

```python
nombres = ["Ana", "Juan", "Pedro"]

texto = ", ".join(nombres)

print(texto)
```

Resultado:

```text
Ana, Juan, Pedro
```

## 17.6. Importante: los métodos no modifican la cadena original

Los métodos de las cadenas devuelven una nueva cadena. No modifican directamente el contenido de la variable original.

```python
nombre = "  PEDRO  "

nombre.strip().lower()

print(nombre)
```

El resultado seguirá siendo `"  PEDRO  "`.

Para guardar el resultado debemos asignarlo nuevamente:

```python
nombre = nombre.strip().lower()

print(nombre)
```

Resultado:

```text
pedro
```

---

# 18. Comparación de cadenas de texto

En Python podemos comparar cadenas de texto para comprobar si dos palabras o frases son iguales, diferentes o si una cadena cumple determinadas condiciones.

Las comparaciones de cadenas se utilizan habitualmente para validar respuestas introducidas por teclado, comprobar usuarios o controlar opciones de un programa.

## 18.1. Operadores de comparación

Podemos utilizar los mismos operadores de comparación que utilizamos con números.

| Operador | Significado | Ejemplo |
|---|---|---|
| `==` | Igual que | `"hola" == "hola"` → `True` |
| `!=` | Distinto de | `"hola" != "adios"` → `True` |
| `>` | Mayor que | `"b" > "a"` → `True` |
| `<` | Menor que | `"a" < "b"` → `True` |
| `>=` | Mayor o igual | `"c" >= "b"` → `True` |
| `<=` | Menor o igual | `"a" <= "b"` → `True` |

**Importante:** Python compara las cadenas carácter a carácter utilizando el orden Unicode. Por ejemplo, distingue entre mayúsculas y minúsculas.

## 18.2. Diferencia entre mayúsculas y minúsculas

Python distingue entre mayúsculas y minúsculas (*case-sensitive*).

Por tanto, estas cadenas no son iguales:

```python
usuario = "Admin"

if usuario == "admin":
    print("Acceso de administrador")
else:
    print("Usuario normal")
```

El resultado será `Usuario normal`, porque `"Admin"` y `"admin"` son cadenas diferentes.

Para evitar este problema podemos utilizar `.lower()` o `.upper()`.

```python
usuario = input("Introduce tu usuario: ")

if usuario.lower() == "admin":
    print("Acceso de administrador")
else:
    print("Usuario normal")
```

## 18.3. Eliminar espacios antes de comparar

Cuando solicitamos información mediante `input()`, el usuario puede introducir espacios al principio o al final del texto.

Podemos utilizar `.strip()` para eliminarlos.

```python
respuesta = input("¿Quieres continuar? (s/n): ")

if respuesta.strip().lower() == "s":
    print("Continuamos")
else:
    print("Finalizamos")
```

De esta manera, todas estas respuestas se interpretarán correctamente:

- `"s"`
- `"S"`
- `" s"`
- `"s "`
- `" S "`

## 18.4. Comprobar si una cadena contiene otra cadena

Podemos utilizar el operador `in` para comprobar si una palabra o carácter aparece dentro de otra cadena.

```python
correo = input("Introduce tu correo electrónico: ")

if "@" in correo:
    print("El correo contiene una arroba")
else:
    print("El correo no contiene una arroba")
```

También podemos utilizar `not in` para comprobar que una cadena no contiene determinado texto.

```python
nombre = input("Introduce tu nombre: ")

if " " not in nombre:
    print("El nombre no contiene espacios")
else:
    print("Has introducido más de una palabra")
```

Estas comprobaciones son básicas y no garantizan que un correo electrónico o un nombre sean válidos.

## 18.5. Comprobar cómo empieza o termina una cadena

Python dispone de dos métodos especialmente útiles:

- `.startswith()`: comprueba si una cadena comienza por un texto determinado.
- `.endswith()`: comprueba si una cadena termina por un texto determinado.

Ejemplo:

```python
archivo = input("Introduce el nombre del archivo: ")

if archivo.endswith(".pdf"):
    print("Es un documento PDF")
else:
    print("No es un documento PDF")
```

Otro ejemplo:

```python
telefono = input("Introduce tu teléfono: ")

if telefono.startswith("6"):
    print("El teléfono comienza por 6")
else:
    print("El teléfono no comienza por 6")
```

## 18.6. Ejemplo práctico: validar usuario y contraseña

Vamos a desarrollar un pequeño programa que solicita un usuario y una contraseña.

El acceso solamente estará permitido si se cumplen las dos condiciones:

- El usuario es `admin`.
- La contraseña es `python123`.

```python
usuario = input("Usuario: ").strip().lower()
password = input("Contraseña: ")

if usuario == "admin" and password == "python123":
    print("Acceso permitido")
else:
    print("Usuario o contraseña incorrectos")
```

En este ejemplo utilizamos:

- `.strip()` para eliminar espacios sobrantes.
- `.lower()` para normalizar el nombre de usuario.
- `==` para comparar las cadenas.
- `and` para exigir que se cumplan las dos condiciones.

**Importante:** en este ejemplo la contraseña sí distingue entre mayúsculas y minúsculas.

---

# 19. Comprobar si un dato está vacío

Las cadenas vacías se consideran falsas en un contexto booleano.

```python
nombre = input("Nombre: ")

if nombre:
    print("Nombre introducido")
else:
    print("No has introducido ningún nombre")
```

---

# 20. Bucles

Los bucles permiten repetir instrucciones.

Python dispone principalmente de:

```python
for
while
```

La elección depende del problema.

---

# 21. Bucle `for`

Utilizamos `for` cuando normalmente conocemos el conjunto de elementos que queremos recorrer o el número de repeticiones.

```python
for i in range(5):
    print(i)
```

Resultado:

```text
0
1
2
3
4
```

Importante: `range(5)` genera valores desde `0` hasta `4`.

---

# 22. `range()`

Podemos utilizar diferentes formas.

## Un parámetro

```python
for i in range(5):
    print(i)
```

Genera:

```text
0 1 2 3 4
```

## Dos parámetros

```python
for i in range(2, 6):
    print(i)
```

Genera:

```text
2 3 4 5
```

## Tres parámetros

```python
for i in range(0, 10, 2):
    print(i)
```

Genera:

```text
0 2 4 6 8
```

También podemos utilizar pasos negativos:

```python
for i in range(10, 0, -1):
    print(i)
```

---

# 23. Ejemplo: tabla de multiplicar

```python
numero = int(input("Número: "))

for i in range(1, 11):
    print(numero, "x", i, "=", numero * i)
```

Ejemplo de salida:

```text
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
...
5 x 10 = 50
```

---

# 24. Recorrer una cadena

`for` también permite recorrer caracteres.

```python
nombre = "Python"

for letra in nombre:
    print(letra)
```

Resultado:

```text
P
y
t
h
o
n
```

---

# 25. Recorrer una lista

```python
frutas = ["manzana", "pera", "plátano"]

for fruta in frutas:
    print(fruta)
```

Podemos utilizar condiciones dentro del bucle:

```python
notas = [4, 7, 9, 3, 8]

for nota in notas:
    if nota >= 5:
        print(nota, "Aprobado")
    else:
        print(nota, "Suspenso")
```

---

# 26. Bucle `while`

`while` repite un bloque mientras una condición sea verdadera.

```python
contador = 0

while contador < 5:
    print(contador)
    contador += 1
```

Resultado:

```text
0
1
2
3
4
```

Es fundamental modificar las variables que intervienen en la condición para evitar bucles infinitos.

---

# 27. Bucle infinito

Este código genera un bucle infinito:

```python
contador = 0

while contador < 5:
    print(contador)
```

La variable `contador` nunca cambia.

La condición siempre será verdadera.

La solución:

```python
contador = 0

while contador < 5:
    print(contador)
    contador += 1
```

---

# 28. `break`

`break` permite salir inmediatamente de un bucle.

```python
while True:
    palabra = input("Escribe una palabra: ")

    if palabra == "salir":
        break

    print("Has escrito:", palabra)
```

El bucle continúa hasta que el usuario escribe `salir`.

---

# 29. `continue`

`continue` hace que Python pase directamente a la siguiente iteración.

```python
for numero in range(1, 11):

    if numero % 2 == 0:
        continue

    print(numero)
```

Resultado:

```text
1
3
5
7
9
```

Estamos ignorando los números pares.

---

# 30. Bucles anidados

Podemos colocar un bucle dentro de otro.

```python
for fila in range(3):
    for columna in range(4):
        print(fila, columna)
```

Esto resulta especialmente útil para trabajar con estructuras bidimensionales.

Ejemplo:

```python
for fila in range(3):
    for columna in range(3):
        print("*", end=" ")
    print()
```

Resultado:

```text
* * *
* * *
* * *
```

---

# 31. Combinación de estructuras

Los programas reales combinan secuencias, condiciones y bucles.

Ejemplo:

```python
for numero in range(1, 11):

    if numero % 2 == 0:
        print(numero, "es par")
    else:
        print(numero, "es impar")
```

Aquí tenemos:

- Un bucle `for`.
- Una condición `if`.
- Un `else`.
- Un operador `%`.
- Una secuencia de instrucciones.

---

# 32. Uso de ficheros en Python

Hasta ahora hemos trabajado con datos almacenados en variables, listas y diccionarios. Sin embargo, cuando finaliza la ejecución de un programa, estos datos desaparecen.

Para conservar información y poder recuperarla posteriormente, podemos utilizar **ficheros**.

En aplicaciones empresariales es habitual trabajar con ficheros para almacenar información, generar informes, guardar registros de actividad o intercambiar datos entre aplicaciones.

## 32.1. Abrir un fichero

Python proporciona la función `open()` para abrir ficheros.

Su sintaxis básica es:

```python
fichero = open("nombre_fichero.txt", "modo")
```

Tiene dos parámetros principales:

- **Nombre del fichero:** indica el fichero que queremos abrir.
- **Modo:** indica qué operación queremos realizar.

Los modos más habituales son:

| Modo | Descripción |
|---|---|
| `r` | Lectura. El fichero debe existir. |
| `w` | Escritura. Si existe, sobrescribe su contenido. |
| `a` | Añadir contenido al final del fichero. |
| `r+` | Lectura y escritura. |
| `x` | Crea un fichero nuevo. Si ya existe, genera un error. |

También podemos indicar la codificación mediante el parámetro `encoding`.

```python
fichero = open("clientes.txt", "r", encoding="utf-8")
```

Es recomendable utilizar UTF-8 para trabajar correctamente con caracteres especiales, como tildes y eñes.

## 32.2. Leer información de un fichero

Podemos utilizar diferentes métodos para recuperar el contenido de un fichero.

### Método `read()`

Lee todo el contenido del fichero y lo devuelve como una cadena de texto.

```python
fichero = open("clientes.txt", "r", encoding="utf-8")

contenido = fichero.read()

print(contenido)

fichero.close()
```

### Método `readline()`

Lee una única línea del fichero.

```python
fichero = open("clientes.txt", "r", encoding="utf-8")

linea = fichero.readline()

print(linea)

fichero.close()
```

Si queremos recorrer todas las líneas:

```python
fichero = open("clientes.txt", "r", encoding="utf-8")

linea = fichero.readline()

while linea:
    print(linea, end="")
    linea = fichero.readline()

fichero.close()
```

### Método `readlines()`

Lee todas las líneas y las devuelve en una lista.

```python
fichero = open("clientes.txt", "r", encoding="utf-8")

lineas = fichero.readlines()

for linea in lineas:
    print(linea, end="")

fichero.close()
```

## 32.3. Cerrar un fichero

Cuando terminamos de trabajar con un fichero, debemos cerrarlo mediante el método `close()`.

```python
fichero = open("clientes.txt", "r", encoding="utf-8")

contenido = fichero.read()

fichero.close()
```

Cerrar los ficheros permite liberar recursos del sistema y evitar problemas relacionados con su utilización.

### Utilizar `with`

Python proporciona una forma más segura y cómoda de trabajar con ficheros mediante la instrucción `with`.

El fichero se cierra automáticamente cuando termina el bloque de código, incluso si se produce una excepción.

```python
with open("clientes.txt", "r", encoding="utf-8") as fichero:
    contenido = fichero.read()
    print(contenido)
```

**Recomendación:** utiliza siempre `with` para trabajar con ficheros, salvo que exista una razón concreta para gestionar manualmente su apertura y cierre.

## 32.4. Escribir información en un fichero

Para escribir información utilizamos el modo `w`.

Si el fichero no existe, Python lo crea. Si ya existe, elimina su contenido anterior y escribe el nuevo.

### Método `write()`

Permite escribir una cadena de texto.

```python
with open("clientes.txt", "w", encoding="utf-8") as fichero:
    fichero.write("Cliente: Ana García\n")
    fichero.write("Cliente: Pedro López\n")
    fichero.write("Cliente: María Sánchez\n")
```

El carácter `\n` representa un salto de línea.

### Método `writelines()`

Permite escribir una colección de cadenas de texto.

```python
clientes = [
    "Ana García\n",
    "Pedro López\n",
    "María Sánchez\n"
]

with open("clientes.txt", "w", encoding="utf-8") as fichero:
    fichero.writelines(clientes)
```

**Importante:** `writelines()` no añade automáticamente los saltos de línea. Debemos incluirlos en cada cadena cuando sean necesarios.

## 32.5. Añadir contenido a un fichero

Si queremos añadir información sin eliminar el contenido existente, utilizaremos el modo `a`.

```python
with open("clientes.txt", "a", encoding="utf-8") as fichero:
    fichero.write("Nuevo cliente: Juan Martínez\n")
```

Esta opción resulta especialmente útil para registrar nuevas operaciones sin perder los datos anteriores.

## 32.6. Ejemplo práctico: registro de operaciones

Imaginemos que desarrollamos una pequeña aplicación empresarial que registra las operaciones realizadas.

Podemos guardar cada operación en un fichero de texto.

```python
from datetime import datetime

def registrar_operacion(mensaje):

    fecha = datetime.now()

    with open("operaciones.txt", "a", encoding="utf-8") as fichero:

        fichero.write(
            f"{fecha} - {mensaje}\n"
        )


registrar_operacion("Alta de un nuevo cliente")
registrar_operacion("Creación de un pedido")
registrar_operacion("Actualización de inventario")
```

Cada vez que ejecutemos la función, se añadirá una nueva línea al fichero `operaciones.txt`.

Este tipo de registros permite mantener un historial de las operaciones realizadas por una aplicación.

---

# 33. Excepciones en Python

Durante la ejecución de un programa pueden producirse errores.

Por ejemplo:

- Intentar dividir un número entre cero.
- Acceder a una posición inexistente de una lista.
- Intentar convertir un texto que no contiene un número a entero.
- Abrir un fichero que no existe.
- Acceder a una clave inexistente de un diccionario.

Estos errores pueden interrumpir la ejecución del programa.

Python dispone de un mecanismo denominado **excepciones**, que permite detectar y gestionar estos errores para evitar que una aplicación termine inesperadamente.

## 33.1. ¿Qué es una excepción?

Una excepción es un evento que se produce durante la ejecución de un programa cuando ocurre una situación que impide continuar con la ejecución normal de una instrucción.

Por ejemplo:

```python
numero1 = 10
numero2 = 0

resultado = numero1 / numero2

print(resultado)
```

Este código genera una excepción:

```text
ZeroDivisionError: division by zero
```

El problema es que estamos intentando dividir entre cero.

Si no gestionamos la excepción, el programa se interrumpe.

## 33.2. Gestionar excepciones con `try` y `except`

Python permite controlar los errores utilizando las instrucciones `try` y `except`.

- `try`: contiene el código que puede generar una excepción.
- `except`: contiene las instrucciones que se ejecutarán si se produce una excepción.

Ejemplo:

```python
try:

    numero1 = 10
    numero2 = 0

    resultado = numero1 / numero2

    print(resultado)

except ZeroDivisionError:

    print("No se puede dividir entre cero.")

print("El programa continúa ejecutándose")
```

Aunque se produzca el error, el programa puede continuar después de gestionar la excepción.

## 33.3. Gestionar diferentes excepciones

Podemos utilizar varios bloques `except` para controlar diferentes tipos de errores.

```python
try:

    numero = int(input("Introduce un número: "))

    resultado = 100 / numero

    print("Resultado:", resultado)

except ValueError:

    print("Debes introducir un número entero.")

except ZeroDivisionError:

    print("No se puede dividir entre cero.")
```

En este ejemplo podemos encontrarnos con dos situaciones:

1. El usuario introduce un texto que no puede convertirse a entero.
2. El usuario introduce el número cero y se produce una división por cero.

Cada excepción tiene su propio tratamiento.

## 33.4. Excepciones estándar más comunes

Python incorpora numerosas excepciones que permiten identificar distintos tipos de errores.

| Excepción | Descripción |
|---|---|
| `ZeroDivisionError` | División entre cero. |
| `ValueError` | Valor incorrecto para una operación. |
| `TypeError` | Operación aplicada a un tipo de dato incorrecto. |
| `IndexError` | Índice fuera del rango de una secuencia. |
| `KeyError` | Clave inexistente en un diccionario. |
| `NameError` | Variable o nombre no definido. |
| `AttributeError` | Atributo inexistente en un objeto. |
| `FileNotFoundError` | Fichero que no existe. |
| `PermissionError` | Falta de permisos para realizar una operación. |
| `ImportError` | Error al importar un módulo. |
| `ModuleNotFoundError` | No se encuentra un módulo. |
| `OSError` | Error relacionado con el sistema operativo. |
| `AssertionError` | Error producido por una aserción que no se cumple. |

### Ejemplo de `ValueError`

```python
try:

    edad = int("veinte")

except ValueError:

    print("La edad debe ser un número.")
```

### Ejemplo de `IndexError`

```python
numeros = [10, 20, 30]

try:

    print(numeros[5])

except IndexError:

    print("La posición indicada no existe.")
```

### Ejemplo de `KeyError`

```python
cliente = {
    "nombre": "Ana",
    "edad": 30
}

try:

    print(cliente["telefono"])

except KeyError:

    print("El cliente no tiene registrado un teléfono.")
```

## 33.5. Capturar información de una excepción

Podemos recuperar el mensaje de error utilizando `as`.

```python
try:

    numero = int("hola")

except ValueError as error:

    print("Se ha producido un error:")
    print(error)
```

La variable `error` contiene información sobre la excepción producida.

Esto resulta especialmente útil para mostrar mensajes más descriptivos o registrar errores en una aplicación.

## 33.6. La instrucción `else`

Podemos utilizar `else` junto con `try` y `except`.

El bloque `else` se ejecuta únicamente cuando no se ha producido ninguna excepción dentro del bloque `try`.

```python
try:

    numero = int(input("Introduce un número: "))

except ValueError:

    print("Debes introducir un número válido.")

else:

    print("Número introducido correctamente:", numero)
```

## 33.7. La instrucción `finally`

El bloque `finally` se ejecuta siempre, independientemente de que se produzca una excepción o no.

Se utiliza especialmente para realizar operaciones de limpieza o liberar recursos.

```python
try:

    numero = int(input("Introduce un número: "))

    print("Número:", numero)

except ValueError:

    print("El valor introducido no es válido.")

finally:

    print("Fin del proceso.")
```

### Ejemplo con ficheros

```python
fichero = None

try:

    fichero = open("clientes.txt", "r", encoding="utf-8")

    contenido = fichero.read()

    print(contenido)

except FileNotFoundError:

    print("El fichero no existe.")

finally:

    if fichero is not None:
        fichero.close()
```

En este ejemplo:

1. Intentamos abrir el fichero.
2. Si no existe, capturamos `FileNotFoundError`.
3. Independientemente del resultado, el bloque `finally` se ejecuta.
4. Si el fichero llegó a abrirse, lo cerramos.

Como hemos visto anteriormente, al utilizar `with` no necesitamos gestionar manualmente el cierre del fichero.

## 33.8. Lanzar excepciones con `raise`

Hasta ahora hemos visto cómo capturar excepciones que se producen durante la ejecución.

Sin embargo, también podemos generar nuestras propias excepciones utilizando la instrucción `raise`.

Esto resulta especialmente útil para controlar las reglas de negocio de una aplicación.

Ejemplo:

```python
def validar_precio(precio):

    if precio < 0:
        raise ValueError("El precio no puede ser negativo.")

    return precio


try:

    precio = validar_precio(-25)

    print("Precio:", precio)

except ValueError as error:

    print("Error:", error)
```

En este caso, somos nosotros quienes generamos la excepción cuando detectamos que el precio no cumple las condiciones establecidas.

## 33.9. Jerarquía de excepciones

Python organiza las excepciones mediante una jerarquía de clases.

La clase `BaseException` es la clase base de todas las excepciones.

De ella hereda `Exception`, que es la clase base habitual para las excepciones que debemos gestionar en nuestras aplicaciones.

Algunos ejemplos:

- `ArithmeticError`: errores relacionados con operaciones aritméticas.
  - `ZeroDivisionError`
  - `OverflowError`
- `LookupError`: errores al buscar elementos.
  - `IndexError`
  - `KeyError`
- `OSError`: errores relacionados con el sistema operativo.
  - `FileNotFoundError`
  - `PermissionError`

Podemos utilizar `Exception` para capturar diferentes excepciones de forma genérica:

```python
try:

    numero = int(input("Introduce un número: "))

    resultado = 100 / numero

except Exception as error:

    print("Se ha producido un error:", error)
```

**Recomendación:** es preferible capturar excepciones concretas siempre que sea posible. Utilizar `except Exception` indiscriminadamente puede ocultar errores que deberíamos detectar y corregir.

No es recomendable utilizar `except BaseException` para gestionar errores habituales, ya que también captura interrupciones del programa como `KeyboardInterrupt` y solicitudes de salida como `SystemExit`.

## 33.10. Buenas prácticas al trabajar con excepciones

Cuando desarrollamos aplicaciones debemos tener en cuenta algunas recomendaciones:

1. Utilizar `try` únicamente alrededor del código que puede generar una excepción.
2. Capturar excepciones específicas en lugar de utilizar siempre `Exception`.
3. Mostrar mensajes comprensibles para el usuario.
4. No ocultar errores utilizando bloques `except` vacíos.
5. Utilizar `finally` cuando necesitemos liberar recursos.
6. Utilizar `with` para gestionar automáticamente la apertura y cierre de ficheros.
7. Utilizar `raise` cuando una operación incumpla una regla de negocio.

### Ejemplo práctico: gestión de clientes

Vamos a combinar el uso de ficheros y excepciones para desarrollar una pequeña funcionalidad de gestión empresarial.

El programa permitirá registrar clientes en un fichero de texto y consultar posteriormente su información.

```python
def registrar_cliente(nombre, email):

    if not nombre.strip():
        raise ValueError("El nombre del cliente es obligatorio.")

    if not email.strip():
        raise ValueError("El email del cliente es obligatorio.")

    with open("clientes.txt", "a", encoding="utf-8") as fichero:

        fichero.write(f"{nombre};{email}\n")


def mostrar_clientes():

    try:

        with open("clientes.txt", "r", encoding="utf-8") as fichero:

            for linea in fichero:

                nombre, email = linea.strip().split(";")

                print(f"Cliente: {nombre} - Email: {email}")

    except FileNotFoundError:

        print("Todavía no existen clientes registrados.")

    except ValueError:

        print("Existe un registro con un formato incorrecto.")


try:

    registrar_cliente("Ana García", "ana@email.com")
    registrar_cliente("Pedro López", "pedro@email.com")

    mostrar_clientes()

except ValueError as error:

    print("Error:", error)
```

Este ejemplo combina varios conceptos:

- Definición de funciones.
- Validación de datos.
- Uso de excepciones.
- Lectura y escritura de ficheros.
- Gestión de información empresarial.

Son conceptos fundamentales para desarrollar aplicaciones que trabajen con información y necesiten controlar posibles errores durante su ejecución.

---

# Ejemplo práctico: cajero automático

Podemos utilizar las estructuras de control para crear un pequeño cajero.

```python
saldo = 1000

opcion = ""

while opcion != "4":

    print("\n--- CAJERO ---")
    print("1. Consultar saldo")
    print("2. Ingresar dinero")
    print("3. Retirar dinero")
    print("4. Salir")

    opcion = input("Opción: ")

    if opcion == "1":
        print("Saldo:", saldo)

    elif opcion == "2":
        cantidad = float(input("Cantidad: "))
        saldo += cantidad
        print("Ingreso realizado")

    elif opcion == "3":
        cantidad = float(input("Cantidad: "))

        if cantidad <= saldo:
            saldo -= cantidad
            print("Retirada realizada")
        else:
            print("Saldo insuficiente")

    elif opcion == "4":
        print("Hasta pronto")

    else:
        print("Opción incorrecta")
```

Este ejemplo combina:

- Variables.
- Entrada de datos.
- Secuencia.
- Condicionales.
- Condicionales anidados.
- Bucles.
- Operadores.
- Control del flujo.

---

#  Ejemplo práctico: sistema de notas

```python
cantidad = int(input("Número de alumnos: "))

aprobados = 0
suspensos = 0

for i in range(cantidad):

    nota = float(input(f"Nota del alumno {i + 1}: "))

    if nota >= 5:
        aprobados += 1
    else:
        suspensos += 1

print("Aprobados:", aprobados)
print("Suspensos:", suspensos)
```

---

# 34. Ejemplo práctico: contraseña

```python
usuario_correcto = "admin"
password_correcta = "1234"

intentos = 0
acceso = False

while intentos < 3:

    usuario = input("Usuario: ")
    password = input("Contraseña: ")

    if usuario == usuario_correcto and password == password_correcta:
        acceso = True
        break

    print("Datos incorrectos")
    intentos += 1

if acceso:
    print("Acceso permitido")
else:
    print("Cuenta bloqueada")
```

Este ejemplo permite trabajar con:

- `while`.
- `if`.
- `and`.
- `break`.
- Variables booleanas.
- Contadores.

---

#  Ejemplo práctico: menú de aplicación

Los menús son un caso habitual de utilización de estructuras de control.

```python
opcion = ""

while opcion != "0":

    print("""
    1. Alta de usuario
    2. Mostrar usuarios
    3. Eliminar usuario
    0. Salir
    """)

    opcion = input("Selecciona una opción: ")

    if opcion == "1":
        print("Alta de usuario")

    elif opcion == "2":
        print("Mostrar usuarios")

    elif opcion == "3":
        print("Eliminar usuario")

    elif opcion == "0":
        print("Saliendo...")

    else:
        print("Opción no válida")
```

Este patrón aparecerá posteriormente en aplicaciones más complejas.

---

# Ejemplo práctico: programación de drones

Las estructuras de control también pueden utilizarse para automatizar dispositivos físicos.

Por ejemplo, una secuencia conceptual de vuelo podría ser:

```python
despegar()

for i in range(4):
    avanzar()
    girar_derecha(90)

aterrizar()
```

Podemos introducir condiciones:

```python
if bateria > 20:
    despegar()
    ejecutar_ruta()
    aterrizar()
else:
    print("Batería insuficiente")
```

Y un control de seguridad:

```python
while bateria > 20:

    avanzar()

    if obstaculo_detectado:
        parar()
        girar_derecha()
```

En unidades posteriores aplicaremos estos conceptos a la **programación de drones con Python**.

---

#  Buenas prácticas

## Utilizar nombres descriptivos

Mejor:

```python
numero_alumnos = 20
```

que:

```python
x = 20
```

## Evitar condiciones innecesariamente complejas

Mejor:

```python
if edad >= 18:
    print("Mayor")
```

que crear expresiones difíciles de interpretar.

## Mantener una indentación consistente

```python
if usuario_activo:
    print("Usuario activo")
    mostrar_menu()
```

## Evitar bucles infinitos accidentales

Comprobar siempre que un `while` pueda terminar.

## Dividir problemas grandes

Si una solución empieza a crecer demasiado, posteriormente podremos utilizar funciones para dividirla en partes más pequeñas.

---

#  Errores frecuentes

### Confundir `=` con `==`

Incorrecto:

```python
if edad = 18:
```

Correcto:

```python
if edad == 18:
```

`=` asigna un valor.

`==` compara valores.

---

### Olvidar los dos puntos

Incorrecto:

```python
if edad >= 18
    print("Mayor")
```

Correcto:

```python
if edad >= 18:
    print("Mayor")
```

---

### Incorrecta indentación

Incorrecto:

```python
if edad >= 18:
print("Mayor")
```

Correcto:

```python
if edad >= 18:
    print("Mayor")
```

---

### Error en `range()`

```python
for i in range(5):
    print(i)
```

No imprime 5.

Imprime:

```text
0
1
2
3
4
```

---

# 39. Actividades propuestas

## Actividad 1. Mayor de edad

Solicita la edad de una persona e indica si es mayor o menor de edad.

---

## Actividad 2. Número positivo, negativo o cero

Solicita un número e indica:

- Positivo.
- Negativo.
- Cero.

---

## Actividad 3. Calculadora

Solicita dos números y una operación:

```text
+
-
*
/
```

Realiza la operación correspondiente.

Controla también la división entre cero.

---

## Actividad 4. Calificación

Solicita una nota entre 0 y 10 e indica:

- Suspenso.
- Aprobado.
- Notable.
- Sobresaliente.

---

## Actividad 5. Tabla de multiplicar

Solicita un número y muestra su tabla del 1 al 10.

---

## Actividad 6. Contador

Muestra los números del 1 al 100.

Posteriormente modifica el programa para mostrar solamente los números pares.

---

## Actividad 7. Suma acumulada

Solicita números al usuario hasta que introduzca `0`.

Al finalizar muestra la suma total.

Ejemplo:

```text
Número: 5
Número: 8
Número: 10
Número: 0

Suma: 23
```

---

## Actividad 8. Contraseña

Permite al usuario introducir una contraseña.

El usuario tendrá un máximo de tres intentos.

Si introduce la contraseña correcta:

```text
Acceso permitido
```

Si agota los tres intentos:

```text
Usuario bloqueado
```

---

## Actividad 9. Menú

Crea un menú con:

```text
1. Saludar
2. Mostrar fecha
3. Mostrar información
0. Salir
```

El menú debe repetirse hasta seleccionar `0`.

---

## Actividad 10. Número secreto

El programa debe almacenar un número secreto.

El usuario tendrá que adivinarlo.

Después de cada intento el programa indicará:

- "El número es mayor".
- "El número es menor".
- "¡Correcto!"

---

# 40. Reto final de la unidad

## Sistema de gestión de acceso

Desarrolla un programa que simule el control de acceso a una instalación.

El programa deberá:

1. Solicitar usuario y contraseña.
2. Permitir un máximo de tres intentos.
3. Mostrar un menú después del acceso.
4. El menú tendrá:

```text
1. Registrar entrada
2. Registrar salida
3. Consultar estado
4. Salir
```

5. El programa deberá mantenerse funcionando hasta seleccionar `4`.
6. No se permitirá registrar una salida si no existe una entrada.
7. No se permitirá registrar una segunda entrada si el usuario ya está dentro.
8. El programa deberá mostrar mensajes apropiados en cada situación.

### Ejemplo

```text
=== CONTROL DE ACCESO ===

Usuario: alumno
Contraseña: 1234

Acceso permitido.

1. Registrar entrada
2. Registrar salida
3. Consultar estado
4. Salir

Opción: 1

Entrada registrada.

Opción: 3

Estado: DENTRO

Opción: 1

Error: ya existe una entrada registrada.
```

---

# 41. Resumen

En esta unidad hemos aprendido que las estructuras de control permiten modificar el flujo de ejecución de un programa.

Las tres estructuras fundamentales son:

### Secuencia

```python
instruccion_1()
instruccion_2()
instruccion_3()
```

### Selección

```python
if condicion:
    instrucciones
else:
    instrucciones
```

### Repetición

```python
for elemento in elementos:
    instrucciones
```

o:

```python
while condicion:
    instrucciones
```

También hemos trabajado:

- Operadores de comparación.
- Operadores lógicos.
- Valores booleanos.
- Indentación.
- Diagramas de flujo.
- Condicionales anidados.
- `range()`.
- `break`.
- `continue`.
- Bucles anidados.
- Resolución de problemas.
- Aplicaciones prácticas.

Estos conocimientos serán la base para las siguientes unidades y, posteriormente, para desarrollar aplicaciones con **Django** y realizar proyectos de **programación de drones con Python**.
