{hline.pas}
{$G+}

var
 Background: pointer;   { H†ttÇr kezdãc°me                        }
 MAPPTR:     pointer;   { TÇrkÇp kezdãc°me                        }
 BOXPTR:     pointer;   { BOX-adatok kezdãc°me                    }
 X, Y:       word;      { H†ttÇr koordin†t†i a tÇrkÇpen           }
 BPL:        word;      { Egy sorban lÇvã BOX-ok sz†ma            }
 i,j:        word;      { V†ltoz¢k a FOR... ciklusokhoz           }

{$I HLINE3.INC}

begin
 getmem( BackGround, 64000); { A h†ttÇr marad 320û200-as          }
 getmem( MAPPTR, 41*26); { A tÇrkÇp (41û8)û(26û8)=328û208 pixel   }
 getmem( BOXPTR, 16384); { 256 db 8û8-as BOX=256û8û8=16384 b†jt   }
 randomize;             { VÇletlensz†m-gener†tor inicializ†l†sa   }
 for i:= 0 to 1065 do   { TÇrkÇp vÇletlenszer˚ feltîltÇse         }
  mem[seg(MAPPTR^):ofs(MAPPTR^)+i]:= random( 256);
 for i:= 0 to 255 do    { BOX-adatok feltîltÇse, minden BOX egy-  }
  for j:= 0 to 63 do    { sz°n˚, sz°ne sorsz†ma=saj†t sorsz†ma    }
   mem[seg(BOXPTR^):ofs(BOXPTR^)+i*64+j]:=i;
 X:=4; Y:=4; BPL:=41;   { A tÇrkÇp koordin†t†i: (4;4), egy sorban }
                        { 41 BOX tal†lhat¢                        }
 asm
  mov ax,13h
  int 10h
  end;                  { MCGA Åzemm¢d bekapcsol†sa               }

 for i:= 0 to 199 do    { Sorok megrajzol†sa, 200 db van          }
  HLine( i);            { Most mÇg csak a h†ttÇren l†tszik, ezÇrt }
 asm                    { a h†tteret a kÇpernyãre kell m†solni    }
   push   ds            { DS lesz a forr†sszegmens (h†ttÇr)       }
   mov    es,sega000    { A cÇlszegmens a kÇpmem¢ria szegmense    }
   xor    di,di         { A cÇlindex nulla                        }
   lds    si,background { A forr†sc°m a h†ttÇr kezdãc°me          }
   cld                  { Nîvekvã adatir†ny                       }
   mov    cx,32000      { 32000 sz¢ m†sol†sa                      }
   rep    movsw         { H†ttÇr megjelen°tÇse                    }
   pop    ds
   end;
 readln;                { Enter megnyom†s†ra kilÇp                }
 asm mov ax,3; int 10h end; { VisszatÇrÇs a szîveges m¢dhoz       }
 end.