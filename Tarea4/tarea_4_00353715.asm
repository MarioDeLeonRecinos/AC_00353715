org 	100h

section .text
        mov     si,0d
        mov     ax,0d
        mov     cx,5d
        mov     bx,0d

	call 	texto
	call 	cursor
	call	phrase2
	call 	kbwait
	int	20h
lupi:	
	call 	kbwait
	cmp 	si, 5d
	jbe	mostrar
	mov	[300h], al
        call    gd
	inc 	si
	jmp 	lupi

	int 	20h

gd:     
        mov     bx,[300h]
        mov     ax,0d
        add     ax,bx
        mov     [301h],ax
        ret


mostrar:
        mov     ax,[301h]
        div     cx
        call 	cursor
                 
        cmp     ax,10d   
        je      phrase1 

        cmp     ax,9d
        je      phrase2

        cmp     ax,8d
        je      phrase3
        
        cmp     ax,7d
        je      phrase1
        
        cmp     ax,6d
        je      phrase2
        
        cmp     ax,5d
        je      phrase3
        
        cmp     ax,4d
        je      phrase1
        
        cmp     ax,3d
        je      phrase2
        
        cmp     ax,2d
        je      phrase3
        
        cmp     ax,1d
        je      phrase1

        call    kbwait

        int 20h

texto:	
        mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: 
        mov     ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b;   IRGB
	int 	10h
	ret

w_char:	
        mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: 
        mov 	ax, 0000h
	int 	16h
	ret

m_cursr1:
        mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 3d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase1:	
        mov 	di, 0d

lupi1:	
        mov 	cl, [msg1+di]
	call    m_cursr1
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi1
	ret

phrase2:	
        mov 	di, 0d

lupi2:	
        mov 	cl, [msg2+di]
	call    m_cursr1
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

phrase3:	
        mov 	di, 0d

lupi3:	
        mov 	cl, [msg3+di]
	call    m_cursr1
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret

section .data

msg1    db 	"Perfecto solo Dios"
len 	equ	$-msg1

msg2	db 	"Siempre me esfuerzo"
len2	equ	$-msg2

msg3	db 	"Colocho"
len3 	equ	$-msg3

msg4	db 	"Muy bien"
len4 	equ	$-msg4

msg5	db 	"Peor es nada"
len5 	equ	$-msg5

msg6	db 	"En el segundo"
len6 	equ	$-msg6

msg7	db 	"Me recupero"
len7 	equ	$-msg7

msg8	db 	"Hay salud"
len8 	equ	$-msg8

msg9	db 	"Aun se pasa"
len9 	equ	$-msg9

msg10	db 	"Solo necesito el 0"
len10 	equ	$-msg10