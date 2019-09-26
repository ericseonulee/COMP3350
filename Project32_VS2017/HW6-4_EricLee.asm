TITLE HW6-4_EricLee.asm
INCLUDE Irvine32.inc

.data
	myArray SWORD 10, 20 , 30, 40, 50, 60, 70, 80, 90, 100
	arrayLength WORD ?
	index WORD ?
	spacing BYTE ", ",0
	original BYTE "The original array is: ",0
	swapped BYTE "The swapped array is: ",0

.code
	main PROC
		
		xor eax, eax 
		mov edx, OFFSET original
		call WriteString 

		mov edi, 0
		mov cx, LENGTHOF myArray
		L1:
			mov ax, myArray[edi]
			call WriteInt

			mov edx, OFFSET spacing
			call WriteString

			inc edi
			inc edi
			dec cx
			cmp cx, 0
			jne L1
			call crlf
        
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		mov cx, LENGTHOF myArray
		mov bx, 2
		L2:
			mov ax, myArray[bx]
			mov dx, myArray[bx + 4]

			mov myArray[bx], dx
			mov myArray[bx + 4], ax

			mov ax, myArray[bx]
			mov dx, myArray[bx + 4] 

			add bx, 8

			sub cx, 4
			cmp cx, 3
			jg L2


		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		mov edx, OFFSET swapped
		call WriteString 
		mov edi, 0 
		mov cx, LENGTHOF myArray 
		L3:
			mov ax, myArray[edi]
			call WriteInt

			mov edx, OFFSET spacing
			call WriteString

			inc edi
			inc edi
			dec cx
			cmp cx, 0
			jne L3 
			call crlf
	invoke ExitProcess,0
main endp
end main