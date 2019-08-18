procedure FillBack( C: byte); assembler; asm
   mov    al,C
   mov    ah,al
   mov    cx,32000
   cld
   les    di,background
   rep    stosw
   end;