        org     100h
        mov     di,0d           ;use un t de 180 mas o menos para correrlo todo por precaucion usa 2 que si lo haces de un solo me falla
        mov     cx,""

limpiar:                        ;Limpia las celdas de memoria a utilizar para los 3 ejercicios
        mov     [200h+di],cx
        mov     [210h+di],cx
        mov     [220h+di],cx
        cmp     di,000Fh
        je      eje1
        inc     di
        loop    limpiar

eje1:   mov     cx,5d           ;digitos del carnet pedidos en el enunciado
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
        mov     [200h],ax       ;moviendo a una celda de memoria para comprobar que este bien el calculo

        mov     cx,10d          ;seteando 10d en cx para comparar con el dato obtenido para dar el mensaje adecuado
        cmp     ax,cx           ;comprobando que sea igual a 10 ax y si no sigue probando otros casos hasta encontrar el mensaje para esa nota
        je      msg10           ;en resumen son muchos ifs para todos los casos 
        mov     cx,9d
        cmp     ax,cx
        je      msg9
        mov     cx,8d
        cmp     ax,cx
        je      msg8
        mov     cx,7d
        cmp     ax,cx
        je      msg7
        mov     cx,6d
        cmp     ax,cx
        je      msg6
        mov     cx,5d
        cmp     ax,cx
        je      msg5
        mov     cx,4d
        cmp     ax,cx
        je      msg4
        mov     cx,3d
        cmp     ax,cx
        je      msg3
        mov     cx,2d
        cmp     ax,cx
        je      msg2
        mov     cx,1d
        cmp     ax,cx
        je      msg1

msg10:                          ;de aqui hasta la funcion  eje2 son los mensajes que al final no pude aplicar el metodo de nelson de db me fallaba sino hubiera sido mucho mas corto realmente
        mov     bl, "P"         ;esta funcion tiene el mensaje ademas tiene un jump para saltar a la funcion eje2 y asi evitar que sobreescriba en la respuesta correcta simulando un switch
        mov     [200h],bl
        mov     bl, "e"
        mov     [201h],bl
        mov     bl, "r"
        mov     [202h],bl
        mov     bl, "f"
        mov     [203h],bl
        mov     bl, "e"
        mov     [204h],bl
        mov     bl, "c"
        mov     [205h],bl
        mov     bl, "t"
        mov     [206h],bl
        mov     bl, "o"
        mov     [207h],bl
        mov     bl, " "
        mov     [208h],bl
        mov     bl, "s"
        mov     [209h],bl
        mov     bl, "o"
        mov     [20Ah],bl
        mov     bl, "l"
        mov     [20Bh],bl
        mov     bl, "o"
        mov     [20Ch],bl
        mov     bl, ""
        mov     [20Dh],bl
        mov     bl, "d"
        mov     [20Eh],bl
        mov     bl, "i"
        mov     [20Fh],bl
        mov     bl, "o"
        mov     [240h],bl
        mov     bl, "s"
        mov     [241h],bl
        jmp     eje2

msg9:   
        mov     bl, "S"
        mov     [200h],bl
        mov     bl, "i"
        mov     [201h],bl
        mov     bl, "e"
        mov     [202h],bl
        mov     bl, "m"
        mov     [203h],bl
        mov     bl, "p"
        mov     [204h],bl
        mov     bl, "r"
        mov     [205h],bl
        mov     bl, "e"
        mov     [206h],bl
        mov     bl, " "
        mov     [207h],bl
        mov     bl, "m"
        mov     [208h],bl
        mov     bl, "e"
        mov     [209h],bl
        mov     bl, " "
        mov     [20Ah],bl
        mov     bl, "e"
        mov     [20Bh],bl
        mov     bl, "s"
        mov     [20Ch],bl
        mov     bl, "f"
        mov     [20Dh],bl
        mov     bl, "u"
        mov     [20Eh],bl
        mov     bl, "e"
        mov     [20Fh],bl
        mov     bl, "r"
        mov     [240h],bl
        mov     bl, "z"
        mov     [241h],bl
        mov     bl, "o"
        mov     [242h],bl
        jmp     eje2
msg8:   
        mov     bl, "C"
        mov     [200h],bl
        mov     bl, "o"
        mov     [201h],bl
        mov     bl, "l"
        mov     [202h],bl
        mov     bl, "o"
        mov     [203h],bl
        mov     bl, "c"
        mov     [204h],bl
        mov     bl, "h"
        mov     [205h],bl
        mov     bl, "o"
        mov     [206h],bl
        jmp     eje2
msg7:   
        mov     bl, "M"
        mov     [200h],bl
        mov     bl, "u"
        mov     [201h],bl
        mov     bl, "y"
        mov     [202h],bl
        mov     bl, " "
        mov     [203h],bl
        mov     bl, "b"
        mov     [204h],bl
        mov     bl, "i"
        mov     [205h],bl
        mov     bl, "e"
        mov     [206h],bl
        mov     bl, "n"
        mov     [207h],bl
        jmp     eje2
msg6:   
        mov     bl, "P"
        mov     [200h],bl
        mov     bl, "e"
        mov     [201h],bl
        mov     bl, "o"
        mov     [202h],bl
        mov     bl, "r"
        mov     [203h],bl
        mov     bl, " "
        mov     [204h],bl
        mov     bl, "e"
        mov     [205h],bl
        mov     bl, "s"
        mov     [206h],bl
        mov     bl, " "
        mov     [207h],bl
        mov     bl, "n"
        mov     [208h],bl
        mov     bl, "a"
        mov     [209h],bl
        mov     bl, "d"
        mov     [20Ah],bl
        mov     bl, "a"
        mov     [20Bh],bl
        jmp     eje2
msg5:   
        mov     bl, "E"
        mov     [200h],bl
        mov     bl, "n"
        mov     [201h],bl
        mov     bl, ""
        mov     [202h],bl
        mov     bl, "e"
        mov     [203h],bl
        mov     bl, "l"
        mov     [204h],bl
        mov     bl, " "
        mov     [205h],bl
        mov     bl, "s"
        mov     [206h],bl
        mov     bl, "e"
        mov     [207h],bl
        mov     bl, "g"
        mov     [208h],bl
        mov     bl, "u"
        mov     [209h],bl
        mov     bl, "n"
        mov     [20Ah],bl
        mov     bl, "d"
        mov     [20Bh],bl
        mov     bl, "o"
        mov     [20Ch],bl
        jmp     eje2
msg4:   
        mov     bl, "M"
        mov     [200h],bl
        mov     bl, "e"
        mov     [201h],bl
        mov     bl, " "
        mov     [202h],bl
        mov     bl, "r"
        mov     [203h],bl
        mov     bl, "e"
        mov     [204h],bl
        mov     bl, "c"
        mov     [205h],bl
        mov     bl, "u"
        mov     [206h],bl
        mov     bl, "p"
        mov     [207h],bl
        mov     bl, "e"
        mov     [208h],bl
        mov     bl, "r"
        mov     [209h],bl
        mov     bl, "o"
        mov     [20Ah],bl
        jmp     eje2
msg3:   
        mov     bl, "H"
        mov     [200h],bl
        mov     bl, "a"
        mov     [201h],bl
        mov     bl, "y"
        mov     [202h],bl
        mov     bl, " "
        mov     [203h],bl
        mov     bl, "s"
        mov     [204h],bl
        mov     bl, "a"
        mov     [205h],bl
        mov     bl, "l"
        mov     [206h],bl
        mov     bl, "u"
        mov     [207h],bl
        mov     bl, "d"
        mov     [208h],bl
        jmp     eje2
msg2:   
        mov     bl, "A"
        mov     [200h],bl
        mov     bl, "u"
        mov     [201h],bl
        mov     bl, "n"
        mov     [202h],bl
        mov     bl, " "
        mov     [203h],bl
        mov     bl, "s"
        mov     [204h],bl
        mov     bl, "e"
        mov     [205h],bl
        mov     bl, " "
        mov     [206h],bl
        mov     bl, "p"
        mov     [207h],bl
        mov     bl, "a"
        mov     [208h],bl
        mov     bl, "s"
        mov     [209h],bl
        mov     bl, "a"
        mov     [20Ah],bl
        jmp     eje2
msg1:   
        mov     bl, "S"
        mov     [200h],bl
        mov     bl, "o"
        mov     [201h],bl
        mov     bl, "l"
        mov     [202h],bl
        mov     bl, "o"
        mov     [203h],bl
        mov     bl, " "
        mov     [204h],bl
        mov     bl, "n"
        mov     [205h],bl
        mov     bl, "e"
        mov     [206h],bl
        mov     bl, "c"
        mov     [207h],bl
        mov     bl, "e"
        mov     [208h],bl
        mov     bl, "s"
        mov     [209h],bl
        mov     bl, "i"
        mov     [20Ah],bl
        mov     bl, "t"
        mov     [20Bh],bl
        mov     bl, "o"
        mov     [20Ch],bl
        mov     bl, " "
        mov     [20Dh],bl
        mov     bl, "e"
        mov     [20Eh],bl
        mov     bl, "l"
        mov     [20Fh],bl
        mov     bl, " "
        mov     [240h],bl
        mov     bl, "0"
        mov     [241h],bl

eje2:   mov     di,0d           ;limpiando di cx y seteando ax y bx para realizar las multiplicaciones teniendo en cuenta que ax sera el resultado y valor inicial a usar
        mov     cx,0d
        mov     ax,2d
        mov     bx,2d

grf:                            ;grafica sin desbordamiento utilizando ah como bandera para evitar arruinar el resultado anterior
        mul     bx
        mov     [210h+di],ax
        inc     di
        inc     cx
        cmp     ah,0d
        je      grf
        call    grf1

grf1:                           ;grafica 1 con desbordamiento usando di dos veces para aumentar el salto y evitar arruinar el resultado anteriro
        mul     bx
        inc     di
        mov     [210h+di],ax
        inc     di
        inc     cx
        cmp     cx,11d
        je      eje3
        call    grf1

eje3:   mov     di,0d
        mov     ax, 0d
        mov     [220h],ax
        mov     bx, 1d
        mov     [221h],bx

fibo:                           ;fibonacci para numeros de una celda de memoria usando bh como bandera para saltar a fibo2 que evita arruinar el resultado anterior
        add     ax,bx
        mov     [222h+di],ax
        mov     cx, bx
        mov     bx, ax
        mov     ax, cx
        inc     di
        cmp     di,16d
        je      final
        cmp     bh,0h     
        je      fibo
        call    fibo2

fibo2:                          ;fibonacci para numeros que necesitan dos celdas de memoria usando di dos veces para evitar arruinar el resultado anterior
        add     ax,bx
        inc     di
        mov     [222h+di],ax
        mov     cx, bx
        mov     bx, ax
        mov     ax, cx
        cmp     di,16d
        je      final
        inc     di
        loop    fibo2

final:  int 20h                 ;final del programa