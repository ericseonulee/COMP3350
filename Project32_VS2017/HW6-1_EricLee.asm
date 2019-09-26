TITLE HW6-1_EricLee.asm
Include Irvine32.inc
.data
Dog SWORD 8
Cat SWORD -25
Mouse SWORD 36
Horse SWORD -102
.code
Main PROC
      movsx eax, Dog
      movsx ebx, Cat
      add eax, ebx
      movsx ebx, Mouse
      neg ebx
      push eax
      movsx eax, Horse
      add ebx, eax
      pop eax
      add eax, ebx
      exit
   main ENDP
END main
