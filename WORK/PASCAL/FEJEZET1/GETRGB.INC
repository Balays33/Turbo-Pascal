procedure GetRGB( N: byte; var R, G, B: byte); assembler; asm
                        { Az N. sz�n RGB-komponensei              }
   mov    dx,03c7h      { RGB olvas�s c�mregiszter                }
   mov    al,N          { Jelezz�k a k�rty�nak, hogy az N. sz�n-  }
   out    dx,al         { nel fogunk dolgozni (most: olvasni)     }
   mov    dx,03c9h      { RGB afatregiszter                       }
   in     al,dx         { Els� �sszetev� lek�rdez�se              }
   les    di,R
   stosb
   in     al,dx         { M�sodik �sszetev� lek�rdez�se           }
   les    di,G
   stosb
   in     al,dx         { Harmadik �sszetev� lek�rdez�se          }
   les    di,B
   stosb
   end;
