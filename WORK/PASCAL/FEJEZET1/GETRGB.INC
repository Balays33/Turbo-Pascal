procedure GetRGB( N: byte; var R, G, B: byte); assembler; asm
                        { Az N. sz°n RGB-komponensei              }
   mov    dx,03c7h      { RGB olvas†s c°mregiszter                }
   mov    al,N          { JelezzÅk a k†rty†nak, hogy az N. sz°n-  }
   out    dx,al         { nel fogunk dolgozni (most: olvasni)     }
   mov    dx,03c9h      { RGB afatregiszter                       }
   in     al,dx         { Elsã îsszetevã lekÇrdezÇse              }
   les    di,R
   stosb
   in     al,dx         { M†sodik îsszetevã lekÇrdezÇse           }
   les    di,G
   stosb
   in     al,dx         { Harmadik îsszetevã lekÇrdezÇse          }
   les    di,B
   stosb
   end;
