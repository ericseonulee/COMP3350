TITLE Question2
; Question 2, from HW8

INCLUDE Irvine32.inc

.data

.code
	main PROC
		
	;mov dx, 0
	;mov ax, 2534h
	;mov cx, 2222h
	;mul cx
	mov ax, 0h
	mov dx, 0h
	sub ax, 1h
	sbb dx, 0


	exit
	main ENDP
END main
