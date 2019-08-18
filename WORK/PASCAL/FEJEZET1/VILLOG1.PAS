{villog1.pas}
{$X+}

uses Crt;

procedure Fill( C: byte); assembler; asm
                        { K‚perny‹ befest‚se C sz¡nûre            }
   mov    es,sega000    { A SEGA000 ‚rt‚ke el‹re meghat rozott,   }
   xor    di,di         { A $A000:0000 c¡mt‹l indulunk (ES:[DI])  }
   mov    cx,32000      { 320200 b jt=32000 sz¢ ki¡r sa          }
   mov    al,C
   mov    ah,al
   rep    stosw         { Ögy a leggyorsabb ‚s a legr”videbb      }
   end;

begin
 asm mov ax,13h; int 10h end; { MCGA zemm¢d bekapcsol sa         }
 repeat
  Fill( 0); Fill(15);   { A k‚perny‹ v ltakozik, fekete vagy feh‚r}
  until keypressed;     { Billentyûnyom sra v‚ge                  }
 readkey;               { A gomb k¢dja ne maradjon a pufferben    }
 asm mov ax,03h; int 10h end; { Visszat‚r‚s a sz”veges m¢dhoz     }
 end.
