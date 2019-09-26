TITLE HW9-1_EricLee.asm
INCLUDE Irvine32.inc

.data
myArray WORD 10 DUP(?)
comma BYTE ", ", 0
.code
MAIN PROC
	mov esi, OFFSET myArray
	mov eax, LENGTHOF myArray
	lea ecx, [eax]
		
	call fibonacci
	call printFibonacci

	invoke ExitProcess,0
MAIN ENDP

fibonacci PROC
	push ecx
	mov edx, ecx
	L1:
		mov ebx, edx
		sub ebx, ecx
		jz continue
		cmp ebx, 1
		je one

		mov al, [esi[ebx-2]]
		mov ah, [esi[ebx-1]]
		mov byte ptr [esi[ebx]], al
		add byte ptr [esi[ebx]], ah
		jmp continue

		one:
			mov byte ptr [esi[ebx]], 1
		continue:
	loop L1

	pop ecx
	ret
fibonacci ENDP 

printFibonacci PROC
	push ecx
	xor eax, eax
	mov edx, ecx

	print:
		mov ebx, edx
		sub ebx, ecx
		mov al, [esi[ebx]]
		call WriteInt
		cmp ecx, 1
		je continue
		push edx
		mov edx, offset comma
		call WriteString
		pop edx

		continue:
	loop print

	call Crlf
	pop ecx
	ret
printFibonacci ENDP

end main