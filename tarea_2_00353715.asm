        org     100h



        mov     cx,5d           ;digitos del carnet pedidos en el enunciado
        mov     ax,5d           ;primer digito del carnet
        mov     bx,1d           ;segundo digito del carnet
        add     ax,bx           ;primera suma de los primeros dos digitos
        mov     bx,7d           ;sobreescribiendo dx para que tenga el tercer digito del carnet
        add     ax,bx           ;sumando nuevamente para obtener de resultado la suma de los primeros 3 digitos
        mov     bx,3d           ;sobreescribiendo dx para que tenga el cuarto digito del carnet
        add     ax,bx           ;sumando nuevamente para obtener de resultado la suma de los primeros 4 digitos
        mov     bx,5d           ;sobreescribiendo dx para que tenga el quinto digito del carnet
        add     ax,bx           ;sumando nuevamente para obtener de resultado la suma de los primeros 5 digitos
        div     cx              ;dx residuo y ax cociente <-DX:AX/BX
        mov     [220h],ax       ;moviendo a una celda de memoria para comprobar que este bien

        mov     di, 0d          ;limpiando di para su uso como contador de la posicion

        mov     cx,[len4]
        mov     dx,0000h

write4: mov     bl, [cmt4+di]
        mov     [di+200h], bl
        inc     di
        cmp     di,000Bh
        jb      lupi
        jbe     final

lupi:   loop write4

final:  mov     ax,0000h
        int 20h

section .data

cmt4    db      "Me recupero" ;trate de hacer un switch y no funciono asi que quite tambien hay una interaccion que no me gusta como queria terminar en las siguiente celda de memoria mis condiciones eso creaba parte de la palabra guarda en db siguiente y quedaba feo