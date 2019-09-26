TITLE HW6-3_EricLee.asm
Include Irvine32.inc

.data
	oranges SWORD 10 DUP(?)
	minVal SWORD 7FFFh
	nextToMin SWORD ?
	minIndex BYTE ?
	nextToMinIndex BYTE ?
	maxVal SWORD 8000h
	nextToMax SWORD ?
	nextToMaxIndex BYTE ?
	maxIndex BYTE ?

	prompt  BYTE "Please input a value: ",0
	spacing BYTE ", ",0
	String1 BYTE "The next to minimum value of inputs is: ",0
	String2 BYTE "and is located at index: ",0
	String3 BYTE "The next to maximum value of inputs is: ",0

.code
main PROC
	xor ebx, ebx
	xor ecx, ecx

	mov cl, LENGTHOF oranges

	promptUser:
		mov bx, SIZEOF oranges
		sub bx, cx
		sub bx, cx

		mov edx, OFFSET prompt
		call WriteString

		call ReadInt
		mov oranges[bx], ax
	loop promptUser

	call MinMax

	mov edx, OFFSET String1
	movsx eax, nextToMin
	call WriteString
	call WriteInt
	mov edx, OFFSET spacing
	call WriteString
	mov edx, OFFSET String2
	movzx eax, minIndex
	call WriteString
	call WriteDec
	call Crlf

	mov edx, OFFSET String3
	movsx eax, nextToMax
	call WriteString
	call WriteInt
	mov edx, OFFSET spacing
	call WriteString
	mov edx, OFFSET String2
	movzx eax, maxIndex
	dec eax
	call WriteString
	call WriteDec
	call Crlf
main ENDP

MinMax proc
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	mov cx, LENGTHOF oranges
	traverse:
		mov bx, SIZEOF oranges
		sub bx, cx
		sub bx, cx

		mov ax, oranges[bx]

		cmp ax, minVal 
		jl changeMin 		

		cmp ax, nextToMin
		jl changeNextToMin

		jmp compareMax

		changeNextToMin:
			mov nextToMin, ax
			mov minIndex, bl
			jmp compareMax

		changeMin:
			mov dx, minVal
			mov nextToMin, dx 
			mov minVal, ax
			jmp compareMax

		compareMax:
			cmp ax, maxVal
			jg changeMax
			jmp doNothing
				
		changeMax:
			mov dx, maxVal
			mov nextToMax, dx
			mov maxIndex, bl
			mov maxVal, ax
			jmp doNothing


		doNothing:
	loop traverse

	xor eax, eax
	xor edx, edx
	mov ah, maxIndex
	mov al, minIndex
	mov ebx, 2
	div ebx
	mov maxIndex, ah
	mov minIndex, al
	ret
MinMax endp
END main