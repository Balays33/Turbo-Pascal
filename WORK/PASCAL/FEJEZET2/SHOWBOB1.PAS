{showbob1.pas}
{$X+}

uses Crt;               { A Crt egys‚gre csak a billentyûnyom s   }
                        { figyel‚s‚n‚l lesz szks‚g               }
type BOB = record       { A BOB nem grafikus adatai:              }
         X,Y: word;     {       sz‚less‚g, magass g               }
         CIM: word;     {       el‹z‹ c¡me a t”rl‚shez            }
         DT:  pointer;  {       a Shape mutat¢ja-grafikus adatok  }
         end;

var   B: BOB;           { B a BOB azonost¢ja                      }
      i: word;          { A FOR..TO..DO ciklusokhoz               }
const C= 1;             { A h tt‚r s”t‚tk‚k                       }

procedure ShowBOB; assembler; asm { A megjelent‹ elj r s          }

 { 1. BOB let”rl‚se, azaz fellr sa C (h tt‚r) sz¡nû b jtokkal }

   mov    es,sega000    { A segA000 ‚rt‚ke a Turbo Pascal 7.0-ban }
                        { el‹re megadott, $A000                   }
   lea    bx,B          { BX-be t”lti a BOB ofszetc¡m‚t           }
   mov    di,[bx+4]     { DI-be a BOB el‹z‹ helycet‚nek c¡m‚t     }
   mov    al,C          { AX b jtjaiba a h tt‚rsz¡n kerl, ezzel  }
   mov    ah,al         { ¡rjuk fell a BOB-ot                    }
   cld                  { N”vekv‹ sorrendben ¡runk                }
   mov    dx,16         { 16 sor van,                             }
@1:mov    cx,8          { ‚s 16 oszlop, aminek a fele 8 (az‚rt a  }
                        { fele, mert szavakat ¡runk, nem b jtokat)}
   rep    stosw         { Egy sor t”rl‚se                         }
   add    di,304        { DI a k”vetkez‹ sor kezd‹c¡me            }
   dec    dx            { A sorsz ml l¢ cs”kkent‚se               }
   jnz    @1            { Ism‚tl‚s, am¡g el nem fogynak a sorok   }

 { 2. BOB kirak sa az £j helyre }

   mov    ax,320        { éj c¡m sz m¡t sa a CIM=320Y+X k‚plettel}
   mul    word [bx+2]   { A B BOB c¡m‚hez (BX) 2-t adva megkaphat-}
                        { juk a BOB ordin t j t                   }
   add    ax,[bx]       { [BX] pedig pont az abszcissz t adja     }
   mov    di,ax         { DI-ben el‹ llt a k‚pc¡m,                }
   mov    [BX+4],DI     { amit el‹rel t¢an elmentnk, hogy a t”r- }
                        { l‚shez ne kelljen ism‚t sz molgatni     }
   push   ds            { Az adatszegmens megv ltozik a MOVSW     }
                        { utas¡t s miatt, ez‚rt el kell menteni   }
   lds    si,[bx+6]     { DS:SI a grafikus adatok kezd‹c¡me       }
   mov    dx,16         { 16 sor m sol sa,                        }
@2:mov    cx,8          { ‚s 16 oszlop‚                           }
   rep    movsw         { Az aktu lis sor megrajzol sa            }
   add    di,304        { DI a k”vetkez‹ sor kezd‹c¡me            }
   dec    dx            { Egy sort kirajzoltunk                   }
   jnz    @2            { A t”bbi sor kirajzol sa, am¡g DX>0      }
   pop    ds            { Vissza az eredeti adatszegmenset        }

   end;

begin
 with B do begin
  getmem( DT, 256);     { 1616=256 b jt lefoglal sa a Shape-nek  }
  CIM:= 0; X:= 0; Y:= 92; { Kezd‹‚rt‚ket adunk a nem grafikus     }
  randomize;            { adatoknak                               }
  for i:= 0 to 255 do mem[seg(DT^):ofs(DT^)+i]:= random( 256);
                        { A BOB pontjai v‚letlenszerûek           }
  asm mov ax,13h
      int 10h    end;   { MCGA zemm¢d bekapcsol sa               }
  fillchar( mem[$a000:0], 64000, C);
                        { A k‚perny‹ C sz¡nû (s”t‚tk‚k)           }
  repeat
   ShowBOB;             { BOB megjelen¡t‚se,                      }
   inc( X);             { mozgat sa balr¢l jobbra                 }
   if X=304 then x:=0;  { Ha a k‚perny‹ sz‚l‚re ‚rt, az elej‚re   }
                        { ugrik                                   }
   delay( 50);          { Kis v rakoz s, hogy l that¢ legyen      }
   until keypressed;    { Billentyûnyom sra kil‚p                 }
  readkey;              { Billentyûk¢d ki a pufferb¢l             }
  asm mov ax,3
      int 10h    end;   { MCGA zemm¢d kikapcsol sa               }
  end;
 end.