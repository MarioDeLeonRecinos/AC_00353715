        org     100h

section .text

        mov     di,5d   ;digitos del carnet pedidos en el enunciado
        mov     ax,5d   ;primer digito del carnet
        mov     bx,1d   ;segundo digito del carnet
        add     ax,bx   ;primera suma de los primeros dos digitos
        mov     bx,7d   ;sobreescribiendo dx para que tenga el tercer digito del carnet
        add     ax,bx   ;sumando nuevamente para obtener de resultado la suma de los primeros 3 digitos
        

        int 20h

section .data

comnt   db      "Me recupero"
len     equ     $-comnt