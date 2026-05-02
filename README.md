# 🖥️ Laboratorio POST-1 — Unidad 7: Pantalla y Teclado

**Curso:** Arquitectura de Computadores  
**Unidad:** 7 — Interacción con pantalla y teclado en modo real x86  
**Autor:** Diego Ardila ([@Dieg0ard](https://github.com/Dieg0ard))

---

## Descripción

Este repositorio contiene tres programas escritos en **ensamblador x86 (NASM)** como parte del laboratorio POST-1 de la Unidad 7 del curso de Arquitectura de Computadores. Los programas demuestran el uso de interrupciones del BIOS y del sistema operativo DOS para la salida de texto, el control del cursor y la escritura con atributos de color en modo real.

---

## Archivos

| Archivo | Descripción |
|---|---|
| `post1.asm` | Salida básica de texto usando INT 21h (función 09h) |
| `post1b.asm` | Control de cursor y escritura con colores usando INT 10h |
| `post1c.asm` | Título centrado con bucle carácter a carácter y color verde brillante (INT 10h) |
| `capturas/` | Capturas de pantalla de la ejecución de los programas |

---

## Detalle de los programas

### `post1.asm` — Salida de texto básica (INT 21h)

Imprime tres cadenas de texto en pantalla usando la interrupción `INT 21h` con la función `AH=09h` (mostrar cadena terminada en `$`).

**Salida esperada:**
```
Arquitectura de Computadores
Unidad 7: Pantalla y Teclado
Laboratorio POST-1
```

**Compilar y ejecutar:**
```bash
nasm -f bin post1.asm -o post1.com
post1.com
```

---

### `post1b.asm` — Cursor y color (INT 10h)

Demuestra el uso de la interrupción de video `INT 10h` para:

- **Limpiar la pantalla** (`AH=06h`): scroll completo con atributo blanco sobre negro.
- **Posicionar el cursor** (`AH=02h`): ubicar el cursor en una fila y columna específicas.
- **Escribir caracteres con atributo de color** (`AH=09h`): escritura directa con control del color de texto y fondo.
  - Carácter `"A"` en **amarillo sobre azul** (atributo `1Eh`) en fila 2, columna 10.
  - Cadena `"U7"` en **rojo claro sobre negro** (atributo `0Ch`) en fila 3, columna 10.
- **Esperar una tecla** (`INT 21h / AH=07h`) antes de salir.

**Atributos de color usados:**

| Atributo | Valor | Descripción |
|---|---|---|
| Fondo azul + texto amarillo | `1Eh` | `0001 1110b` |
| Fondo negro + texto rojo claro | `0Ch` | `0000 1100b` |

**Compilar y ejecutar:**
```bash
nasm -f bin post1b.asm -o post1b.com
post1b.com
```

---

### `post1c.asm` — Título centrado con bucle y color (INT 10h)

Muestra el título `"UNIDAD 7 - PANTALLA Y TECLADO"` centrado en la **fila 5** de la pantalla, con el texto en **verde brillante** sobre fondo negro (atributo `0Ah`).

A diferencia de `post1b.asm`, este programa no escribe toda la cadena de una vez: utiliza un **bucle** que recorre la cadena carácter a carácter, posicionando el cursor con `INT 10h / AH=02h` antes de escribir cada uno con `AH=09h`. Esto permite un control preciso de la columna de inicio para lograr el centrado visual.

**Atributo de color usado:**

| Atributo | Valor | Descripción |
|---|---|---|
| Fondo negro + texto verde brillante | `0Ah` | `0000 1010b` |

**Compilar y ejecutar:**
```bash
nasm -f bin post1c.asm -o post1c.com
post1c.com
```

---

## Requisitos

- **Ensamblador:** [NASM](https://www.nasm.us/) (Netwide Assembler)
- **Entorno de ejecución:** DOS o emulador compatible (ej. [DOSBox](https://www.dosbox.com/))
- Los archivos compilados generan ejecutables `.com` (formato binario plano, origen `100h`)

---

## Conceptos clave

- **INT 21h** — Interrupciones de servicios DOS (E/S de texto, salida del programa)
- **INT 10h** — Interrupciones de video del BIOS (control de cursor, escritura con color)
- **Formato COM** — Ejecutable DOS de segmento único, cargado en `ORG 100h`
- **Atributos de video** — Byte que codifica color de texto (bits 0-3) y color de fondo (bits 4-6)

---

## Capturas

Las capturas de pantalla de la ejecución se encuentran en la carpeta [`capturas/`](./capturas).

---

## Licencia

Repositorio de uso académico.