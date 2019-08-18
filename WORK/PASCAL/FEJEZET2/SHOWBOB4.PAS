{showbob4.pas}
{$X+}

uses Crt;

type BOB = record       { B†jt Tartalom                           }
         X,Y: word;     { 0;2  Koordin†t†k                        }
         P:   word;     {  4   Aktu†lis f†zis sorsz†ma (0-t¢l)    }
         Shp: pointer;  {  6   Grafikus adatok kezdãc°me          }
         V,F: shortint; {      V°zsz. Çs fÅgg. ir†nyjelzã b†jtok  }
         end;

const
 Bnum = 15;             { Megjelen°tendã BOB-ok sz†ma -1          }
 Snum =  3;             { A BOB-okhoz tartoz¢ mint†k sz†ma -1     }
 Blen = sizeof( BOB);   { Egy BOB tîmbelem hossza a mem¢ri†ban    }
 Pspd = 10;             { F†zisv†lt†si kÇsleltetÇs                }

 Pcur: word    = 0;     { Sz†ml†l¢ a f†ziskÇsleltetÇshez          }
 Retr: boolean = true;  { Vertik†lis visszatÇrÇs figyelÇse        }

var
 B: array[0..Bnum] of BOB; { BOB nem grafikus adatok tîmbje       }
 S: array[0..Snum] of pointer; { Grafikus adatok tîmbje           }
 BackGround, Workarea: pointer; { H†ttÇr Çs munkaterÅlet c°me     }
 f: file; i: word; n: string[1]; { µltal†nos cÇl£ v†ltoz¢k        }


procedure ShowBOB; assembler; asm

 { 1. H†ttÇr m†sol†sa a munkaterÅletre, 32000 sz¢ mozgat†sa }

   cld                  { D-bit elolt†sa, °gy az indexregiszte-   }
                        { rek nãnek a karakterl†nc-m˚veleteknÇl   }
   mov    cx,32000      { 320û200 b†jt = 32000 sz¢                }
   push   ds            { A DS regisztert megv†ltoztatjuk         }
   les    di,workarea   { A cÇlc°m a munkaterÅlet kezdãc°me       }
   lds    si,background { A forr†sc°m pedig a h†ttÇr kezdãc°me    }
   rep    movsw         { A be†ll°t†sok ut†n lehet m†solni        }
   pop    ds            { Csak hogy ne fagyjon le                 }

 { 2. BOB-ok felrak†sa a munkaterÅletre }

   mov    cx,bnum       { BNUM a BOB-ok sz†ma                     }
@1:
   push   cx            { CX majd m†sra is kell                   }
   lea    bx,B          { A BOB-adatok tîmbjÇnek kezdãc°me BX-be  }
   mov    ax,blen       { BX-hez CXûBLEN-t adva megkapjuk az ak-  }
   mul    cx            { tu†lis (CX-edik) BOB nem grafikus ada-  }
   add    bx,ax         { tainak kezdãc°mÇt                       }
   les    di,workarea   { A cÇlc°m nem a kÇpernyã, hanem a        }
                        { munkaterÅlet kezdãc°me                  }
   mov    ax,320        { Kisz†m°tjuk annak a b†jtnak a c°mÇt, a- }
   mul    word [bx+2]   { mi a BOB bal felsã sarka alatt lesz     }
   add    ax,[bx]       { A kÇplet j¢l ismert: c°m=320ûY+X        }
   add    di,ax         { ES:[DI] m†r a megfelelã b†jt c°me       }
   push   ds            { DS forr†sszegmenset fog j†tszani        }
   mov    ax,256        { A Shape kezdãc°mÇhez Pû256-ot kell adni,}
   mul    word [bx+4]   { hogy az aktu†lis f†zis (P) c°me legyen  }
   lds    si,[bx+6]     { A forr†sc°m a Shape c°me, csak mÇg hoz- }
   add    si,ax         { z†adunk Pû256-ot. (F†zishossz: 16û16 b) }
   mov    dx,16         { Ahogy megszoktuk, DX a sorok sz†ml†l¢ja }
@2:
   mov    cx,16         { CX pedig a soron belÅli pixelekÇ        }
@3:
   lodsb                { A Shape egy b†jtj†nak betîltÇse         }
   cmp    al,0          { Ha ez nulla, nem kell a munkaterÅletre  }
   jz     @4            { °rni semmit                             }
   mov    es:[di],al    { Egy pixel kigy£jt†sa a munkaterÅleten   }
@4:
   inc    di            { A kîvetkezã b†jt c°me eggyel nagyobb    }
   loop   @3            { EgÇsz sor kirak†sa ciklus alja          }
   add    di,304        { Kîvetkezã sor elsã b†jtj†nak c°me       }
   dec    dx            { Eggyel kevesebb sort kell mÇg kirakni   }
   jnz    @2            { 16 sort kell kirakni, ismÇtlÇs          }
   pop    ds
   pop    cx
   loop   @1            { Tîbbi BOB megrajzol†sa a munkaterÅletre }

 { 3. MunkaterÅlet m†sol†sa a kÇpernyãre, maga a megjelen°tÇs }

 { 3.1. Ha a RETR logikai v†ltoz¢ igaz, v†rakoz†s az elektronsu-
        g†r fÅggãleges ir†ny£ visszatÇrÇsÇre }

   cmp    retr,0
   jz     @6            { Ha a RETR hamis, nem kell v†rni         }
   mov    dx,3dah
@5:
   in     al,dx
   test   al,8
   jz     @5            { Csak visszafut†s alatt folytat¢dhat     }

 { 3.2. Az 1. rÇszhez hasonl¢an 32000 sz¢ mozgat†sa }

@6:
   mov    es,sega000    { MCGA kÇpmem¢ria szegmensc°me $A000      }
   xor    di,di         { A bal felsã sarokb¢l kezdÅnk (DI=0)     }
   mov    cx,32000      { 32000 sz¢, 64000=320û200 b†jt           }
   push   ds
   lds    si,workarea   { A forr†sc°m a munkaterÅlet kezdãc°me    }
   rep    movsw         { M†sol†s                                 }
   pop    ds            { Soha ne felejtsÅk a DS regiszter erede- }
                        { ti ÇrtÇkÇt vissza†ll°tani!              }
   end;


procedure Pixel( A: word; C: byte); assembler; asm
 { C sz°n˚ pont kirak†sa a h†ttÇrre, A=320ûY+X (X;Y-koordin†t†k) }

   les    di,background { Most a h†ttÇrre rajzolunk               }
   add    di,A
   mov    al,C
   stosb
   end;


begin

 { 1. Be†ll°t†sok, inicializ†l†sok, helyfoglal†sok }

  randomize;
  getmem( BackGround, 64000);
  getmem( Workarea,   64000);
  for i:= 0 to Snum do begin
   getmem( S[i], 1024); { A Shape hossza 4û16û16, 4 f†zisb¢l †ll  }
   str( i, n);
   assign( f, 'anim'+n+'.dat');
   reset( f, 1);
   seek( f, 7);         { Az elsã 7 b†jt sz†munkra nem fontos,    }
                        { le°r†suk a kîvetkezã rÇszben (2.5.)     }
   blockread( f, s[i]^, 1024);
   close( f);
   end;
  for i:= 0 to Bnum do with B[i] do begin
   Shp:= S[random( Snum+1)];
   X:= random( 303)+1;
   Y:= random( 183)+1;
   P:= random( 4);
   V:= shortint(random( 3))-1;    { A BOB egyszerre kÇt, egy vagy nulla i-  }
   F:= shortint(random( 3))-1;    { r†nyba mozoghat                         }
   end;
  asm
   mov    ax,0013h
   int    10h
   end;
  for i:= 0 to 63999 do Pixel( i, 0); { A h†ttÇr kezdetben fekete }

 { 2. Fãciklus, megjelen°tÇs Çs mozgat†s, anim†ci¢ }

  repeat
   ShowBOB;
   for i:= 0 to 3 do Pixel( random( 64000), random( 256));
                        { H†ttÇr v†ltoztat†sa                     }
   for i:= 0 to Bnum do with B[i] do begin
    inc( X, V); if (X=0) or (X=304) then V:=-V;
    inc( Y, F); if (Y=0) or (Y=184) then F:=-F;
    end;
   inc( Pcur);
   if Pcur=Pspd then begin { F†ziskÇsleltetÇs, csak minden        }
                           { PSPD-edik Åtemben van f†zisv†lt†s    }
    Pcur:= 0;
    for i:= 0 to Bnum do with B[i] do begin
     inc( P);
     if P=4 then P:= 0;
     end;
    end;
   until keypressed;
  readkey;

 { 3. Videom¢d vissza†ll°t†sa, vÇge }

  asm
   mov    ax,3
   int    10h
   end;
 end.
