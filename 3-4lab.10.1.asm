; y=a-x*b-d
.386
.model flat,stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
.data
str_format db "y=%d",0
str_buffer db 256 dup(0)
msg db "10 вариант",0
a db 15
x db -12
b db 2
d db 4
.code
start:
mov al,x ;al=x
cbw ; al=x
mul b ;al=x*b 
add al,a ; a= a-x/b
sub al,d ;y=a-x/b-d
cbw ; ax=al 
movsx edx, ax ;танбасыз кенейту, ebx=ax
invoke wsprintf, ADDR str_buffer, ADDR str_format, edx
invoke MessageBox, 0, ADDR str_buffer, ADDR msg, MB_OK
invoke ExitProcess, NULL
end start