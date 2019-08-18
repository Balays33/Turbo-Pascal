{palette.pas}
{$X+}

uses Crt, Game;

var
 f: file;               { V ltoz¢ a paletta bet”lt‚s‚hez          }
 i: word;               { A FOR ciklusokhoz                       }

begin
 assign( f, 'default.pal');
 reset( f, 1);
 blockread( f, Colors, 768);
                        { Paletta beolvas sa - m‚g nem l that¢    }
 close( f);
 asm
  mov ax,13h
  int 10h               { MCGA zemm¢d bekapcsol sa               }
  end;
 for i:= 0 to 255 do SetRGB( i, 0, 0, 0); { Minden sz¡n fekete    }
 randomize;
 for i:= 0 to 64000 do mem[$a000:i]:= random( 256);
                        { K‚perny‹ v‚letlenszerû felt”lt‚se       }
 ShowPal( 100, 1, 255); { Paletta lass£ megjelen¡t‚se             }
 ReadKey;
 asm
  mov ax,3
  int 10h               { Sz”veges m¢d                            }
  end;
 end.
