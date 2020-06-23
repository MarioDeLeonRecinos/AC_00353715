org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 100d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_v

	mov 	si, 145d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_v_60

        mov 	si, 110d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
	call 	linea_v_90

	mov 	si, 145d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	call 	linea_v

        mov 	si, 100d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_h

        mov 	si, 110d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
	call 	linea_h

        mov 	si, 110d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	call 	linea_h

        mov 	si, 100d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
	call 	linea_h

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 145d
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 100d
	jne 	lupi_v
	ret

linea_v_60:
lupi_v_1:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 60d
	jne 	lupi_v_1
	ret

linea_v_90:
lupi_v_2:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 90d
	jne 	lupi_v_2
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data