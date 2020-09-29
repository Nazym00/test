; y = a - (x + b)/c
.386
.model flat, stdcall

option casemap:none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data
str_format db "y = %u", 0
str_buffer db 256 dup (0)
msg db "Labka 3-4", 0

a db 2
x db 5
b db 7
q db 4 ;вместо названия переменной c используем q

.code
start:
    xor ax, ax    ; чистка регистра
    
    
    
    mov al, x    ; al = x
    cbw            ; ax = x
    mov bl, b    ; bl = b
    add al, bl  ; al = al + b
    idiv q        ; al = al/c
    cbw            ; ax = al
    mov bl, a    ; bx = a
    cbw
    sub ax, bx    ; al = al - ax
    cbw            ; ax = al
    
    movsx edx, ax ;
    invoke wsprintf, ADDR str_buffer, ADDR str_format, ebx
    invoke wsprintf, ADDR str_buffer, ADDR str_format, ebx
    invoke MessageBox,0,ADDR str_buffer, ADDR msg, MB_OK
    invoke ExitProcess, 0
end start