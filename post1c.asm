; post1c.asm - Cadena en posicion exacta con color
ORG 100h
section .data
titulo db "UNIDAD 7 - PANTALLA Y TECLADO", "$"
filaT equ 5
colT equ 25
section .text
start:
; Limpiar pantalla
mov ah, 06h
xor al, al
xor cx, cx
mov dx, 184Fh
mov bh, 07h
int 10h
; Dibujar titulo caracter a caracter
mov si, titulo ; SI apunta al inicio de la cadena
mov dl, colT ; columna inicial
mov dh, filaT ; fila fija
.bucle:
mov al, [si] ; cargar siguiente caracter
cmp al, "$" ; fin de cadena?
je .fin
; Posicionar cursor
mov ah, 02h
xor bh, bh
int 10h
; Escribir caracter con atributo verde brillante (0Ah)
mov ah, 09h
xor bh, bh
mov bl, 0Ah ; texto verde brillante, fondo negro
mov cx, 1
int 10h
inc si ; avanzar en la cadena
inc dl ; avanzar columna
jmp .bucle
.fin:
mov ah, 07h
int 21h
mov ah, 4Ch
xor al, al
int 21h