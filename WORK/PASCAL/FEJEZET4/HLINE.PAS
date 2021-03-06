{hline.pas}
{$G+}

var
 Background: pointer;   { H�tt�r kezd�c�me                        }
 MAPPTR:     pointer;   { T�rk�p kezd�c�me                        }
 BOXPTR:     pointer;   { BOX-adatok kezd�c�me                    }
 X, Y:       word;      { H�tt�r koordin�t�i a t�rk�pen           }
 BPL:        word;      { Egy sorban l�v� BOX-ok sz�ma            }
 i,j:        word;      { V�ltoz�k a FOR... ciklusokhoz           }

{$I HLINE3.INC}

begin
 getmem( BackGround, 64000); { A h�tt�r marad 320�200-as          }
 getmem( MAPPTR, 41*26); { A t�rk�p (41�8)�(26�8)=328�208 pixel   }
 getmem( BOXPTR, 16384); { 256 db 8�8-as BOX=256�8�8=16384 b�jt   }
 randomize;             { V�letlensz�m-gener�tor inicializ�l�sa   }
 for i:= 0 to 1065 do   { T�rk�p v�letlenszer� felt�lt�se         }
  mem[seg(MAPPTR^):ofs(MAPPTR^)+i]:= random( 256);
 for i:= 0 to 255 do    { BOX-adatok felt�lt�se, minden BOX egy-  }
  for j:= 0 to 63 do    { sz�n�, sz�ne sorsz�ma=saj�t sorsz�ma    }
   mem[seg(BOXPTR^):ofs(BOXPTR^)+i*64+j]:=i;
 X:=4; Y:=4; BPL:=41;   { A t�rk�p koordin�t�i: (4;4), egy sorban }
                        { 41 BOX tal�lhat�                        }
 asm
  mov ax,13h
  int 10h
  end;                  { MCGA �zemm�d bekapcsol�sa               }

 for i:= 0 to 199 do    { Sorok megrajzol�sa, 200 db van          }
  HLine( i);            { Most m�g csak a h�tt�ren l�tszik, ez�rt }
 asm                    { a h�tteret a k�perny�re kell m�solni    }
   push   ds            { DS lesz a forr�sszegmens (h�tt�r)       }
   mov    es,sega000    { A c�lszegmens a k�pmem�ria szegmense    }
   xor    di,di         { A c�lindex nulla                        }
   lds    si,background { A forr�sc�m a h�tt�r kezd�c�me          }
   cld                  { N�vekv� adatir�ny                       }
   mov    cx,32000      { 32000 sz� m�sol�sa                      }
   rep    movsw         { H�tt�r megjelen�t�se                    }
   pop    ds
   end;
 readln;                { Enter megnyom�s�ra kil�p                }
 asm mov ax,3; int 10h end; { Visszat�r�s a sz�veges m�dhoz       }
 end.