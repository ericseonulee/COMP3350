TITLE HW10-3_EricLee.asm
INCLUDE Irvine32.inc

.data
	celsiusIs BYTE " Celsius is ",0
	space BYTE " ",0
	slash BYTE "/",0
	Farhenheit BYTE " Farhenheit.",0

.code
	MAIN PROC
		; Freezing
		mov eax, 0
		call convert

		; Boiling
		mov eax, 100
		call convert

		; Room Temperature
		mov eax, 23
		call convert

		; Body Temperature
		mov eax, 37
		call convert

		exit
	MAIN ENDP

	convert PROC
		mov edx, offset celsiusIs
		call WriteInt
		call WriteString

		mov ebx, 9
		imul ebx
		mov ebx, 5
		idiv ebx
		add eax, 32

		call WriteInt

		cmp edx, 0
		jz skipFraction

		mov eax, edx
		mov edx, offset space
		call WriteString
		call WriteDec
		mov edx, offset slash
		call WriteString
		mov eax, 5
		call WriteDec

		skipFraction:
		mov edx, offset Farhenheit
		call WriteString
		call Crlf

		ret
	convert ENDP
end MAIN