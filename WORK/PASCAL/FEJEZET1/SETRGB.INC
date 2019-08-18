procedure SetRGB( N, R, G, B: byte); assembler; asm
                        { Az N. sz¡n ”sszetev‹inek v ltoztat sa   }
   mov    dx,03c8h      { RGB ¡r s c¡mregiszter                   }
   mov    al,N
   out    dx,al         { N. sz¡n m¢dos¡t sa                      }
   mov    dx,03c9h      { RGB afatregiszter                       }
   mov    al,R
   out    dx,al         { R ”sszetev‹ ¡r sa                       }
   mov    al,G
   out    dx,al         { G ”sszetev‹ ¡r sa                       }
   mov    al,B
   out    dx,al         { B ”sszetev‹ ¡r sa                       }
   end;
