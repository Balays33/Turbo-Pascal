{rgbset.pas}

uses Crt;

const
 R: byte = 0;           { Alap†llapotban a h†ttÇr Çs a keret,     }
 G: byte = 0;           { vagyis a 0. sorsz†m£ sz°n fekete, RGB   }
 B: byte = 0;           { îsszetevãinek ÇrtÇke nulla              }

var
 C: char;

procedure SetRGB( N, R, G, B: byte); assembler; asm
                        { Az N. sz°n îsszetevãinek v†ltoztat†sa   }
   mov    dx,03c8h      { RGB °r†s c°mregiszter                   }
   mov    al,N
   out    dx,al         { N. sz°n m¢dos°t†sa                      }
   mov    dx,03c9h      { RGB afatregiszter                       }
   mov    al,R
   out    dx,al         { R îsszetevã °r†sa                       }
   mov    al,G
   out    dx,al         { G îsszetevã °r†sa                       }
   mov    al,B
   out    dx,al         { B îsszetevã °r†sa                       }
   end;

begin
 textbackground( black); { KivÇtelesen szîveges Åzemm¢dot alkal-  }
 textcolor( white);      { mazunk, a palett†t itt is meg lehet    }
 clrscr;                 { v†ltoztatni, de csak 16 sz°n l†tszik   }
 gotoxy( 1, 3);
 writeln('Billenty˚k:  Q/A: R+/-;  W/S: G+/-;  E/D: B+/-;  ESC: KilÇpÇs');
 repeat
  gotoxy( 1, 1);
  write( R:3,' ', G:3,' ', B:3);
  C:= readkey;
  case upcase( C) of
   'Q': if R<63 then inc(R); { R îsszetevã nîvelÇse               }
   'A': if R>00 then dec(R); { R îsszetevã csîkkentÇse            }
   'W': if G<63 then inc(G); { G îsszetevã nîvelÇse               }
   'S': if G>00 then dec(G); { G îsszetevã csîkkentÇse            }
   'E': if B<63 then inc(B); { B îsszetevã nîvelÇse               }
   'D': if B>00 then dec(B); { B îsszetevã csîkkentÇse            }
   end;
  SetRGB( 0, R, G, B);  { RGB îsszetevãk v†ltoztat†sa             }
  until c=#27;          { ESC-re kilÇpÇs a programb¢l             }
 SetRGB( 0, 0, 0, 0);   { A m¢dos°tott sz°n vissza†ll°t†sa        }
 end.
