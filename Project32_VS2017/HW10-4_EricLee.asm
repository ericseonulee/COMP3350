TITLE HW10-4_EricLee.asm
INCLUDE Irvine32.inc

.data
	string1 BYTE "Touch me like you touch nobody", 0
	string2 BYTE "Put your hands all up on me", 0
	string3 BYTE "Tired of hearing sorry",0
	string4 BYTE "Kiss and make, kiss, kiss and make up",0
	string5 BYTE "How about we leave this party?", 0
	string6 BYTE "'Cause all I want is you up on me", 0

	array BYTE 50 DUP(?)

	char1 BYTE "b", 0
	char2 BYTE "l", 0
	char3 BYTE "i", 0
	char4 BYTE "n", 0
	char5 BYTE "k", 0
	char6 BYTE "s", 0

	stringDisplay BYTE "String: ",0
	charIndex BYTE "the index of ",0
	is BYTE " is ",0
	dash BYTE " - ",0
	notFound BYTE " was not found in the string...",0

.code
	MAIN PROC
		mov esi, offset string1
		mov eax, offset char1
		mov ecx, lengthof string1
		call find

		mov esi, offset string2
		mov eax, offset char2
		mov ecx, lengthof string2
		call find

		mov esi, offset string3
		mov eax, offset char3
		mov ecx, lengthof string3
		call find

		mov esi, offset string4
		mov eax, offset char4
		mov ecx, lengthof string4
		call find

		mov esi, offset string5
		mov eax, offset char5
		mov ecx, lengthof string5
		call find

		mov esi, offset string6
		mov eax, offset char6
		mov ecx, lengthof string6
		call find

		exit
	MAIN ENDP

	find PROC
		mov edx, esi
		call WriteString
		mov edx, offset dash
		call WriteString

		mov edi, offset array
		mov dl, BYTE PTR([eax])
		mov ebx, ecx
		L1:
			movsb
			cmp dl, BYTE PTR([edi - 1])
			jne next

			mov edi, ebx
			sub edi, ecx
			jmp exitLoop
			
			next:
		loop L1
		mov edi, -1

		exitLoop:
		cmp edi, -1
		je indexNotFound

		mov edx, offset charIndex
		call WriteString
		mov edx, eax
		call WriteString
		mov edx, offset is
		call WriteString
		mov eax, edi
		call WriteInt
		jmp return

		indexNotFound:
			mov edx, eax
			call WriteString
			mov edx, offset notFound
			call WriteString

		return:
			call Crlf
			ret
	find ENDP
END MAIN