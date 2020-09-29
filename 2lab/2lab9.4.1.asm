.586
.model flat, stdcall

option casemap:none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data
;a dd 38513
b dw 38513

str_format db "result = %d ", 0 ;знаковый
;str_format db "result = %u ", 0 ;беззнаковый
str_buffer db 256 dup (0)
msg db "Program", 0

.code
start:
    mov ax, b
   movsx ebx, ax ;знаковый
     ;movzx ebx, ax ;беззнаковый
    invoke wsprintf, ADDR str_buffer, ADDR str_format, ebx
    invoke MessageBox,0,ADDR str_buffer, ADDR msg, MB_OK
    invoke ExitProcess, 0
end start