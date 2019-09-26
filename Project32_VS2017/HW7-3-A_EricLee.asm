TITLE HW7-3-A_EricLee.asm
INCLUDE Irvine32.inc
.data
	Apple BYTE ?
	val1 WORD 0h
	message BYTE "Apple: ", 0

.code
	main PROC
		xor ebx, ebx
		xor ecx, ecx

		mov cx, 0
		mov bx, 0
		mov val1, 0
		call A

		mov cx, 0
		mov bx, 0
		mov val1, 1
		call A

		mov cx, 0
		mov bx, 1
		mov val1, 0
		call A

		mov cx, 0
		mov bx, 1
		mov val1, 1
		call A

		mov cx, 1
		mov bx, 0
		mov val1, 0
		call A

		mov cx, 1
		mov bx, 0
		mov val1, 1
		call A

		mov cx, 1
		mov bx, 1
		mov val1, 0
		call A

		mov cx, 1
		mov bx, 1
		mov val1, 1
		call A
	
		exit
		main ENDP
	
	A PROC
		cmp bx, cx
		jne setToOne

		cmp cx, val1
		jl setToOne

		mov Apple, 1
		jmp done

	setToOne:
		mov Apple, 0

	done:
		mov edx, OFFSET message
		call WriteString

		mov eax, 0
		mov al, Apple
		call WriteInt
		call Crlf
		ret

		exit 
	A ENDP
END main