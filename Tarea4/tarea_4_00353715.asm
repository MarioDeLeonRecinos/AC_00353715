org 	100h

section .text
        ;para correrlo poner un numero mas del carnet por ejemplo el mio es 00353715 los ultimos 5 son 53715 pero en el input seria 537150 o cualquier otro numero extra para que termine el loop
	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	
        call 	kb
	cmp 	si,5d 
	je	promedio
        sub     al, 30h
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

promedio:
        mov     bx, 0d
        mov     ax, 0d

lupi2:    
        add     al, [300h+bx]
        inc     bx
        cmp     bx, 5d
        jb      lupi2
        mov     [310h], al
        mov     [320h], bl
        mov     cl, bl
        div     cl
        mov     [330h], al

mostrar:
        mov 	dx, nl
	call	w_strng
	cmp     al, 10d
        je      phrase1
        cmp     al, 9d
        je      phrase2
        cmp     al, 8d
        je      phrase3
        cmp     al, 7d
        je      phrase4
        cmp     al, 6d
        je      phrase5
        cmp     al, 5d
        je      phrase6
        cmp     al, 4d
        je      phrase7
        cmp     al, 3d
        je      phrase8
        cmp     al, 2d
        je      phrase9
        cmp     al, 1d
        je      phrase10

phrase1:	
        mov 	dx, msg1
        jmp     comm

phrase2:	
        mov 	dx, msg2
        jmp     comm

phrase3:	
        mov 	dx, msg3
        jmp     comm

phrase4:	
        mov 	dx, msg4
        jmp     comm

phrase5:	
        mov 	dx, msg5
        jmp     comm

phrase6:	
        mov 	dx, msg6
        jmp     comm

phrase7:	
        mov 	dx, msg7
        jmp     comm

phrase8:	
        mov 	dx, msg8
        jmp     comm

phrase9:	
        mov 	dx, msg9
        jmp     comm

phrase10:	
        mov 	dx, msg0
        jmp     comm
	
comm:   
        call 	w_strng
	call 	kb
	int 	20h

texto:	
        mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	
        mov	ah, 1h
	int 	21h
	ret

w_strng:
        mov	ah, 09h
	int 	21h
	ret

section .data

msg1 	db 	"Perfecto solo Dios$"
msg2 	db 	"Siempre me esfuerzo$"
msg3 	db 	"Colocho$"
msg4 	db 	"Muy bien$"
msg5 	db 	"Peor es nada$"
msg6 	db 	"En el segundo$"
msg7 	db 	"Me recupero$"
msg8 	db 	"Hay salud$"
msg9 	db 	"Aun se pasa$"
msg0 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"