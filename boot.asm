    org 0x7c00

BaseOfStack equ 0x7c00

Lable_Start:

    mov ax,cs
    mov dx,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStack