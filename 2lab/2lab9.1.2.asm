.586
.model flat, stdcall

option casemap:none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data
a db 69
;b dw 45000

str_format db "result = %d ", 0
;str_formatt db "result = %u ", 0
str_buffer db 256 dup (0)
msg db "Program", 0

.code
start:
    mov al, a
    ;movsx ebx, al
    movzx ebx, al
    invoke wsprintf, ADDR str_buffer, ADDR str_format, ebx
    invoke MessageBox,0,ADDR str_buffer, ADDR msg, MB_OK
    invoke ExitProcess, 0
end start