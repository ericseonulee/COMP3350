TITLE HW7-3-B_EricLee.asm
INCLUDE Irvine32.inc
.data
	Pear BYTE ?
	val1 WORD 0h
	message BYTE "Pear: ", 0

.code
	main PROC
		xor ebx, ebx
		xor ecx, ecx

		mov cx, 0
		mov bx, 0
		mov val1, 0
		call B

		mov cx, 0
		mov bx, 0
		mov val1, 1
		call B

		mov cx, 0
		mov bx, 1
		mov val1, 0
		call B

		mov cx, 0
		mov bx, 1
		mov val1, 1
		call B

		mov cx, 1
		mov bx, 0
		mov val1, 0
		call B

		mov cx, 1
		mov bx, 0
		mov val1, 1
		call B

		mov cx, 1
		mov bx, 1
		mov val1, 0
		call B

		mov cx, 1
		mov bx, 1
		mov val1, 1
		call B
	
		exit
		main ENDP
	
	B PROC
		cmp bx, cx
		je setToOne

		cmp cx, val1
		jge setToOne

		mov Pear, 0
		jmp done

	setToOne:
		mov Pear, 1

	done:
		mov edx, OFFSET message
		call WriteString

		xor eax, eax
		mov al, Pear
		call WriteInt
		call Crlf
		ret

	exit 
	B ENDP
END main