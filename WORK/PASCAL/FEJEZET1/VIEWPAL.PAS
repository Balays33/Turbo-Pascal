{viewpal.pas}
{$X+}

uses Crt;

type Colors = record    { Egy sz°n komponensei                    }
              R,G,B: byte;
              end;

var
 f: file;               { V†ltoz¢ a f†jlm˚veletekhez              }
 x,y: byte;             { A FOR... ciklusokhoz v†ltoz¢k           }
 Palette: array[0..255] of Colors; { Paletta sz°nei               }

procedure Box8x8( X,Y: word; C: byte);
 var                    { 8û8-as nÇgyzet kirajzol†sa, bal felsã   }
  i,j: byte;            { sarka koordin†t†i: (X;Y)                }
 begin
  for i:= 0 to 7 do     { Most nem Assembly utas°t†sokat °runk,   }
   for j:= 0 to 7 do    { mert a sebessÇg annyira nem fontos      }
    mem[$A000:320*(y+i)+(x+j)]:= C;
  end;

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
 if paramcount=0 then halt; { Ha a paramÇterben nem adunk meg     }
                            { semmit, le†ll a program fut†sa      }
 asm mov ax,13h; int 10h end; { MCGA Åzemm¢d bekapcsol†sa         }
 assign( f, paramstr( 1));
 reset( f, 1);
 blockread( f, Palette, 768); { F†jl tartalm†nak tîltÇse          }
 close( f);
 for x:= 0 to 255 do with Palette[x] do SetRGB( x, R, G, B);
                        { Paletta be†ll°t†sa (a 'Palette' v†ltoz¢ }
 for x:= 0 to 15 do     { adatai szerint) ...                     }
  for y:= 0 to 15 do
   Box8x8( x*8, y*8, 16*y+x); { ... Çs megjelen°tÇse              }
 readkey;
 asm mov ax,03h; int 10h end; { MCGA Åzemm¢d kikapcsol†sa         }
 end.