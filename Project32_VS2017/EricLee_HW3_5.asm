TITLE Add three integers
; This program adds three signed byte sized integers using only 8-bit registers.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

INCLUDE Irvine32.inc
.data
integer1 SBYTE 1h
integer2 SBYTE 2h
integer3 SBYTE 3h

.code
MAIN PROC
mov al, integer1;
add al, integer2;
add al, integer3;

exit
main ENDP

END main
