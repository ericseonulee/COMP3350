TITLE Addressing Modes			(main.asm)
INCLUDE Irvine32.inc
.data
alpha 	DWORD	10203040h, 50607080h  
beta 	DWORD	090A0B0C0h, 0D0E0F000h
gamma  	DWORD 	01234h

.code		
main PROC	
	mov eax, 0ABCDh;			Immediate
	mov ecx, eax;			Register to Register	
	mov edi, OFFSET beta;		Immediate	
	mov [gamma], eax; 		Direct	
	mov esi, gamma;			Direct	
	mov esi, 4;  			Immediate	
	mov eax, beta[esi];		Indirect-offset	
	mov ebx, OFFSET alpha;		Immediate	
	mov eax, [ebx];  			Indirect	
	mov eax, 4[ebx]; 			Indirect-displacement	
	mov eax, 4[ebx][esi];  		Base-Indirect-displacement	
exit
main ENDP
END main
