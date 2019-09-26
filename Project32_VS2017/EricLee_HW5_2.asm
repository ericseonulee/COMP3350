TITLE Sum of n even integers
INCLUDE IRVINE32.INC
.code
main PROC
	call Clrscr
	call PromptN
	mov ecx, eax	 
	call EvenInteger
	call DisplaySum
	exit
main ENDP

PromptN PROC
.data
	string1 BYTE "Enter an integer value for n: ", 0
.code
	mov edx, OFFSET string1
	call WriteString 
	call ReadInt	 
	call Crlf
	ret
PromptN ENDP

DisplaySum PROC USES edx
.data
	string2 BYTE "Sum: ", 0
.code
	mov edx, OFFSET string2
	call WriteString
	call WriteInt
	call Crlf
	ret
DisplaySum ENDP

EvenInteger PROC USES ecx esi edx
	mov eax, 2h ;constant multiplier
	mov esi, 1h ;increment multiplier
	mov ebx, 0h ;zero out the ebx reg for calculations
	Loop1:
		push eax	
		mul esi		
		add ebx, eax
		pop eax 
		inc esi 
	loop Loop1
	mov eax, ebx
	ret
EvenInteger ENDP
END main