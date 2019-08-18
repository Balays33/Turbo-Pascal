{showbob3.pas}
{$X+}

uses Crt;

type BOB = record       { Egy BOB nem grafikus adatai             }
           X : word;    {  0  V¡zszintes koordin ta               }
           Y : word;    {  2  Fgg‹leges koordin ta               }
           A : word;    {  4  El‹z‹ helyzet‚nek ofszetc¡me        }
           G : pointer; {  6  Grafikus adatok kezd‹c¡me           }
           DX: shortint;{     V¡zszintes ir ny (1: jobb, -1: bal) }
           DY: shortint;{     Fgg‹leges ir ny (1: le  , -1: fel) }
                        { (A 0,2,4,6 sz mok a mez‹ t vols g t je- }
                        { lentik, b jtban, a SHOWBOB elj r shoz)  }
           end;

const
 Bnum = 15;             { BOB-ok   sz ma: BNUM+1 (itt: 16)        }
 Snum =  3;             { Shape-ek sz ma: SNUM+1                  }
 Blen = sizeof( BOB);   { A BOB nem grafikus adatainak hossza     }

var
 B: array[0..Bnum] of BOB; { Az ”sszes BOB nem grafikus adatai    }
 S: array[0..Snum] of pointer; { A grafikus adatok mutat¢i        }
 f: file;               { F jl v ltoz¢ a Shape-ek t”lt‚s‚hez      }
 n: string[1];          { Ugyancsak a t”lt‚shez kell              }
 i: word;               { µltal nos v ltoz¢ a FOR ciklusokhoz     }

 BackGround: pointer;   { A h tt‚r kezd‹c¡me                      }


procedure ShowBOB; assembler; asm

 { 1. V rakoz s, am¡g nincs vertik lis visszafut s }

   mov    dx,03dah      { Nagy hiba lenne ezt a r‚szt kihagyni,   }
@W:                     { az villog ssal j rhat. Lass£ g‚pekn‚l   }
   in     al,dx         { ez ¡gy is el‹fordulhat, ilyenkor nem ‚r }
   test   al,8          { v‚get egy elektronsug r-visszat‚r‚s     }
   jz     @W            { alatt az elj r s  2. ‚s 3. r‚sze        }

 { 2. A BOB-ok hely‚re az eredeti h tt‚r-r‚szletek vissza¡r sa }

   cld                  { D-bit elolt sa a sztring-mûveletekhez   }
   mov    cx,bnum       { BNUM(=16) db BOB elt vol¡t sa           }
@1:
   push   cx            { A REP utas¡t shoz is szks‚g lesz CX-re }
   lea    bx,b          { A BOB-adatokat t rol¢ t”mb c¡me         }
   mov    ax,blen       { BX-hez annyit kell adni, hogy az az ak- }
   mul    cx            { tu lis (CX.) BOB-ra mutasson            }
   add    bx,ax         { (BX:=BX+CXBOB t¡pus hossza)            }
   mov    es,sega000    { A k‚perny‹ szegmensc¡me                 }
   mov    di,[bx+4]     { A BOB el‹z‹ helyzet‚nek c¡me ('A' mez‹) }
   push   ds            { A MOVSW utas¡t shoz kell                }
   lds    si,background { A h tt‚r kezd‹c¡me DS:[SI]-be           }
   add    si,di         { SI-hez a k‚pc¡m hozz ad sa              }
   mov    dx,16         { Most is a DX sz ml lja a sorokat        }
@2:
   mov    cx,8          { s CX az egy sorban l‚v‹ szavakat       }
   rep    movsw         { 16 pixel vissza ll¡t sa h tt‚r sz¡nûre  }
   add    di,304        { K”vetkez‹ sor: DI:=DI+320-16            }
   add    si,304        { A h tt‚r sz‚less‚ge is 320 b jt         }
   dec    dx            { Eggyel kevesebb a vissza¡rand¢ sor      }
   jnz    @2            { Ism‚tl‚s, am¡g DX el nem ‚ri a null t   }
   pop    ds
   pop    cx            { CX £jra a BOB-okat sz ml lja            }
   loop   @1            { T”bbi BOB eltntet‚se                   }

 { 3. BOB-ok kirak sa }

   mov    cx,bnum       { CX most is BOB-sz ml l¢                 }
@3:
   push   cx            { Most is menteni kell, pontsz ml l¢ lesz }
   lea    bx,b          { Megint £gy j runk el, mint a 2. r‚szben }
   mov    ax,blen       { (ahhoz, hogy a BX regiszter az aktu lis }
   mul    cx            { BOB-ra mutasson)                        }
   add    bx,ax
   mov    ax,320        { K‚pc¡m sz m¡t sa a szok sos m¢don       }
   mul    word [bx+2]   { A 3. b jtt¢l tal lhat¢ az ordin ta      }
   add    ax,[bx]       { Az 1. k‚t b jt pedig az abszcissza      }
   mov    di,ax         { DI-ben el‹ llt a k‚pc¡m (320Y+X),      }
   mov    [bx+4],ax     { amit elmentnk a BOB elt vol¡t s hoz    }
   push   ds            { Most a LODSB-hez kell                   }
   lds    si,[bx+6]     { A forr sc¡m a BOB t¡pus 7. b jtj t¢l    }
                        { kezd‹dik, ez a Shape-re mutat           }
   mov    dx,16         { M‚g mindig 16 sorb¢l  ll a BOB          }
@4:
   mov    cx,16         { s ugyan£gy 16 pontb¢l egy sor          }
@5:
   lodsb                { DS:[SI]-vel c¡mzett b jt t”lt‚se, SI n‹ }
   cmp    al,0          { Ha ez a b jt nulla, nem kell ki¡rni a   }
   jz     @6            { k‚perny‹re, mert itt a BOB  tl tsz¢     }
   mov    es:[di],al    { Egy‚bk‚nt igen                          }
@6:
   inc    di            { DI a k”vetkez‹ k‚ppontot c¡mzi          }
   loop   @5            { Egy eg‚sz sor megjelen¡tve, ha CX=0     }
   add    di,304        { ES:[DI] a k”vetkez‹ k‚psor (X-1). b jt- }
                        { j nak c¡me                              }
   dec    dx            { Sorsz ml l¢ cs”kken                     }
   jnz    @4            { Sorok kirak sa, am¡g sz ml l¢juk (DX)>0 }
   pop    ds
   pop    cx
   loop   @3            { T”bbi BOB megjelen¡t‚se                 }
   end;


begin

 { 1. H tt‚r, k‚perny‹ be ll¡t sa }

  asm mov ax,13h; int 10h end; { MCGA videom¢d be ll¡t sa         }
  getmem( BackGround, 64000);
  randomize;
  for i:= 1 to 1000 do mem[$a000:random( 64000)]:= random( 256);
  move( ptr($A000, 0)^, BackGround^, 64000);
   { A h tt‚r ugyanazt a k‚pet tartalmazza, mint a k‚perny‹ }

 { 2. Grafikus adatok bet”lt‚se }

  for i:= 0 to Snum do begin
   getmem( S[i], 256);  { A Shape hossza 1616=256 b jt           }
   str( i, n);
   assign( f, 'bob'+n+'.dat');
   reset( f, 1);
   seek( f, 7);         { Az els‹ 7 b jt l‚nyegtelen (pl. m‚ret)  }
   blockread( f, s[i]^, 256);
   close( f);
   end;

 { 3. Nem grafikus adatok v‚letlenszerû be ll¡t sa }

  for i:= 0 to Bnum do with B[i] do begin
   G:= S[random( Snum+1)]; { V‚letlenszerû minta kiv laszt sa     }
   X:= random( 303)+1;
   Y:= random( 183)+1;
   DX:= shortint(2)*random( 2)-1; { rt‚ke csak -1 vagy +1 lehet            }
   DY:= shortint(2)*random( 2)-1; { rt‚ke csak -1 vagy +1 lehet            }
   end;

 { 4. F‹ciklus, megjelen¡t‚s ‚s mozgat s billentyûnyom sig }

  repeat
   ShowBOB;
   for i:= 0 to Bnum do with B[i] do begin
    inc( X, DX); if (X=0) or (X=304) then DX:=-DX;
    inc( Y, DY); if (Y=0) or (Y=184) then DY:=-DY;
                        { Falr¢l lepattan¢ mozg s                 }
    end;
   until keypressed;
  readkey;

 { 5. Visszat‚r‚s a sz”veges m¢dhoz, v‚ge }

  asm mov ax,3; int 10h end;
 end.
