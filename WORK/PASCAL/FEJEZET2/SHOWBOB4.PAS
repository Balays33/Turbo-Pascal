{showbob4.pas}
{$X+}

uses Crt;

type BOB = record       { B�jt Tartalom                           }
         X,Y: word;     { 0;2  Koordin�t�k                        }
         P:   word;     {  4   Aktu�lis f�zis sorsz�ma (0-t�l)    }
         Shp: pointer;  {  6   Grafikus adatok kezd�c�me          }
         V,F: shortint; {      V�zsz. �s f�gg. ir�nyjelz� b�jtok  }
         end;

const
 Bnum = 15;             { Megjelen�tend� BOB-ok sz�ma -1          }
 Snum =  3;             { A BOB-okhoz tartoz� mint�k sz�ma -1     }
 Blen = sizeof( BOB);   { Egy BOB t�mbelem hossza a mem�ri�ban    }
 Pspd = 10;             { F�zisv�lt�si k�sleltet�s                }

 Pcur: word    = 0;     { Sz�ml�l� a f�zisk�sleltet�shez          }
 Retr: boolean = true;  { Vertik�lis visszat�r�s figyel�se        }

var
 B: array[0..Bnum] of BOB; { BOB nem grafikus adatok t�mbje       }
 S: array[0..Snum] of pointer; { Grafikus adatok t�mbje           }
 BackGround, Workarea: pointer; { H�tt�r �s munkater�let c�me     }
 f: file; i: word; n: string[1]; { �ltal�nos c�l� v�ltoz�k        }


procedure ShowBOB; assembler; asm

 { 1. H�tt�r m�sol�sa a munkater�letre, 32000 sz� mozgat�sa }

   cld                  { D-bit elolt�sa, �gy az indexregiszte-   }
                        { rek n�nek a karakterl�nc-m�veletekn�l   }
   mov    cx,32000      { 320�200 b�jt = 32000 sz�                }
   push   ds            { A DS regisztert megv�ltoztatjuk         }
   les    di,workarea   { A c�lc�m a munkater�let kezd�c�me       }
   lds    si,background { A forr�sc�m pedig a h�tt�r kezd�c�me    }
   rep    movsw         { A be�ll�t�sok ut�n lehet m�solni        }
   pop    ds            { Csak hogy ne fagyjon le                 }

 { 2. BOB-ok felrak�sa a munkater�letre }

   mov    cx,bnum       { BNUM a BOB-ok sz�ma                     }
@1:
   push   cx            { CX majd m�sra is kell                   }
   lea    bx,B          { A BOB-adatok t�mbj�nek kezd�c�me BX-be  }
   mov    ax,blen       { BX-hez CX�BLEN-t adva megkapjuk az ak-  }
   mul    cx            { tu�lis (CX-edik) BOB nem grafikus ada-  }
   add    bx,ax         { tainak kezd�c�m�t                       }
   les    di,workarea   { A c�lc�m nem a k�perny�, hanem a        }
                        { munkater�let kezd�c�me                  }
   mov    ax,320        { Kisz�m�tjuk annak a b�jtnak a c�m�t, a- }
   mul    word [bx+2]   { mi a BOB bal fels� sarka alatt lesz     }
   add    ax,[bx]       { A k�plet j�l ismert: c�m=320�Y+X        }
   add    di,ax         { ES:[DI] m�r a megfelel� b�jt c�me       }
   push   ds            { DS forr�sszegmenset fog j�tszani        }
   mov    ax,256        { A Shape kezd�c�m�hez P�256-ot kell adni,}
   mul    word [bx+4]   { hogy az aktu�lis f�zis (P) c�me legyen  }
   lds    si,[bx+6]     { A forr�sc�m a Shape c�me, csak m�g hoz- }
   add    si,ax         { z�adunk P�256-ot. (F�zishossz: 16�16 b) }
   mov    dx,16         { Ahogy megszoktuk, DX a sorok sz�ml�l�ja }
@2:
   mov    cx,16         { CX pedig a soron bel�li pixelek�        }
@3:
   lodsb                { A Shape egy b�jtj�nak bet�lt�se         }
   cmp    al,0          { Ha ez nulla, nem kell a munkater�letre  }
   jz     @4            { �rni semmit                             }
   mov    es:[di],al    { Egy pixel kigy�jt�sa a munkater�leten   }
@4:
   inc    di            { A k�vetkez� b�jt c�me eggyel nagyobb    }
   loop   @3            { Eg�sz sor kirak�sa ciklus alja          }
   add    di,304        { K�vetkez� sor els� b�jtj�nak c�me       }
   dec    dx            { Eggyel kevesebb sort kell m�g kirakni   }
   jnz    @2            { 16 sort kell kirakni, ism�tl�s          }
   pop    ds
   pop    cx
   loop   @1            { T�bbi BOB megrajzol�sa a munkater�letre }

 { 3. Munkater�let m�sol�sa a k�perny�re, maga a megjelen�t�s }

 { 3.1. Ha a RETR logikai v�ltoz� igaz, v�rakoz�s az elektronsu-
        g�r f�gg�leges ir�ny� visszat�r�s�re }

   cmp    retr,0
   jz     @6            { Ha a RETR hamis, nem kell v�rni         }
   mov    dx,3dah
@5:
   in     al,dx
   test   al,8
   jz     @5            { Csak visszafut�s alatt folytat�dhat     }

 { 3.2. Az 1. r�szhez hasonl�an 32000 sz� mozgat�sa }

@6:
   mov    es,sega000    { MCGA k�pmem�ria szegmensc�me $A000      }
   xor    di,di         { A bal fels� sarokb�l kezd�nk (DI=0)     }
   mov    cx,32000      { 32000 sz�, 64000=320�200 b�jt           }
   push   ds
   lds    si,workarea   { A forr�sc�m a munkater�let kezd�c�me    }
   rep    movsw         { M�sol�s                                 }
   pop    ds            { Soha ne felejts�k a DS regiszter erede- }
                        { ti �rt�k�t vissza�ll�tani!              }
   end;


procedure Pixel( A: word; C: byte); assembler; asm
 { C sz�n� pont kirak�sa a h�tt�rre, A=320�Y+X (X;Y-koordin�t�k) }

   les    di,background { Most a h�tt�rre rajzolunk               }
   add    di,A
   mov    al,C
   stosb
   end;


begin

 { 1. Be�ll�t�sok, inicializ�l�sok, helyfoglal�sok }

  randomize;
  getmem( BackGround, 64000);
  getmem( Workarea,   64000);
  for i:= 0 to Snum do begin
   getmem( S[i], 1024); { A Shape hossza 4�16�16, 4 f�zisb�l �ll  }
   str( i, n);
   assign( f, 'anim'+n+'.dat');
   reset( f, 1);
   seek( f, 7);         { Az els� 7 b�jt sz�munkra nem fontos,    }
                        { le�r�suk a k�vetkez� r�szben (2.5.)     }
   blockread( f, s[i]^, 1024);
   close( f);
   end;
  for i:= 0 to Bnum do with B[i] do begin
   Shp:= S[random( Snum+1)];
   X:= random( 303)+1;
   Y:= random( 183)+1;
   P:= random( 4);
   V:= shortint(random( 3))-1;    { A BOB egyszerre k�t, egy vagy nulla i-  }
   F:= shortint(random( 3))-1;    { r�nyba mozoghat                         }
   end;
  asm
   mov    ax,0013h
   int    10h
   end;
  for i:= 0 to 63999 do Pixel( i, 0); { A h�tt�r kezdetben fekete }

 { 2. F�ciklus, megjelen�t�s �s mozgat�s, anim�ci� }

  repeat
   ShowBOB;
   for i:= 0 to 3 do Pixel( random( 64000), random( 256));
                        { H�tt�r v�ltoztat�sa                     }
   for i:= 0 to Bnum do with B[i] do begin
    inc( X, V); if (X=0) or (X=304) then V:=-V;
    inc( Y, F); if (Y=0) or (Y=184) then F:=-F;
    end;
   inc( Pcur);
   if Pcur=Pspd then begin { F�zisk�sleltet�s, csak minden        }
                           { PSPD-edik �temben van f�zisv�lt�s    }
    Pcur:= 0;
    for i:= 0 to Bnum do with B[i] do begin
     inc( P);
     if P=4 then P:= 0;
     end;
    end;
   until keypressed;
  readkey;

 { 3. Videom�d vissza�ll�t�sa, v�ge }

  asm
   mov    ax,3
   int    10h
   end;
 end.
