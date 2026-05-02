; post1b.asm - INT 10h: cursor y color
ORG 100h
section .text
start:
; Limpiar pantalla con scroll (INT 10h / AH=06h)
mov ah, 06h ; scroll hacia arriba
xor al, al ; 0 = limpiar toda la ventana
xor cx, cx ; fila 0, columna 0 (esquina superior izq.)
mov dx, 184Fh ; fila 24, columna 79 (esquina inferior der.)
mov bh, 07h ; atributo de relleno: blanco sobre negro
int 10h
; Posicionar cursor en fila 2, columna 10
mov ah, 02h
xor bh, bh ; página 0
mov dh, 02h ; fila 2
mov dl, 0Ah ; columna 10
int 10h
; Escribir "A" con atributo: texto amarillo (0Eh) sobre fondo azul (1h) = 1Eh
mov ah, 09h
mov al, "A" ; carácter a escribir
xor bh, bh ; página 0
mov bl, 1Eh ; atributo: 0001 1110b = fondo azul, texto amarillo
mov cx, 1 ; repetir 1 vez
int 10h
; Posicionar cursor en fila 3, columna 10
mov ah, 02h
xor bh, bh
mov dh, 03h
mov dl, 0Ah
int 10h
; Escribir "U7" con atributo rojo claro (0Ch) sobre negro (0) = 0Ch
mov ah, 09h
mov al, "U"
xor bh, bh
mov bl, 0Ch
mov cx, 1
int 10h
; Avanzar cursor manualmente a columna 11
mov ah, 02h
xor bh, bh
mov dh, 03h
mov dl, 0Bh
int 10h
mov ah, 09h
mov al, "7"
xor bh, bh
mov bl, 0Ch
mov cx, 1
int 10h
; Esperar tecla y salir
mov ah, 07h
int 21h
mov ah, 4Ch
xor al, al
int 21h
