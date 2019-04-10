    org 0x7c00

BaseOfStack equ 0x7c00

Lable_Start:
    mov ax,cs
    mov dx,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStack
; CLEAR SCREEN 
    mov ax,0600h
    mov bx,0700h ;BH=00000111 bit:3=word highlighted,0-2:11=3 fonts color  
    mov cx,0
    mov dx,0184h
    int 10h
; SET FOUCS
    mov ax,0200h
    mov bx,0000h
    mov dx,0000h
    int 10h

; DISPLAY ON SCREEN
    mov ax,1301h ;AH=13 AL=01
    mov bx,000fh
    mov dx,0000h
    mov cx,10 ;the length of the string
    push ax
    mov ax,ds
    mov es,ax
    pop ax
    mov bp,StartBootMessage ;ES:BP the RAM address of the string
    int 10h

;RESET FLOPPY
    xor ah,ah
    xor dl,dl
    int 1301h
    jmp $

StartBootMessage: db "Start Boot"
;FILL ZERO
    times 510-($-$$) db 0
    dw 0xaa55 ;the boot sector must end with 0xaa 0x55
