{scroll.pas}
{$G+}

uses Game;              { Most m‚g csak a billentyûzet-kezel‹ r‚- }
                        { sz‚t haszn ljuk a GAME egys‚gnek        }
var
 BackGround: pointer;     { A h tt‚r kezd‹c¡me                    }
 MAPPTR, BOXPTR: pointer; { T‚rk‚p, BOX-adatt”mb kezd‹c¡me        }
 X, Y, BPL: word;         { Koordin t k, BOX/sor                  }
 i: byte;                 { A FOR... ciklushoz                    }
 f: file;

{$I HLine.inc}          { Ezek az include f jlok a fejezet sor n  }
{$I VLine.inc}          { megismert elj r sokat tartalmazz k,     }
{$I ScrollR.inc}        { mindegyik azt, aminek azonos¡t¢ja a     }
{$I ScrollL.inc}        { f jln‚vvel megegyezik. P‚ld ul a        }
{$I ScrollU.inc}        { ScrollU.inc f jl a felfel‚ g”rd¡t‹ el-  }
{$I ScrollD.inc}        { j r st foglalja mag ba.                 }

begin

 { 1. Adatok be ll¡t sa, bet”lt‚se }

   getmem( BOXPTR, 16384);    { Helyfoglal sok                    }
   getmem( MAPPTR, 80*50);    { A t‚rk‚p 80ž50 BOX                }
   getmem( BackGround, 64000);
   X:= 0; Y:= 0;              { A h tt‚r kezd‹poz¡ci¢ja           }
   BPL:= 80;                  { A t‚rk‚p sz‚less‚ge 80 BOX        }


   assign( f, 'PELDA.MAP');       { T‚rk‚p, grafikus adatok be-   }
   reset( f, 1);                  { t”lt‚se. A f jl els‹ 5 b jt-  }
   seek( f, 5);                   { j t nyugodtan  tugorhatjuk,   }
   blockread( f, BOXPTR^, 16384); { mert az ott t rolt adatokat   }
   blockread( f, MAPPTR^, 80*50); { (pl. BPL) m r ismerjk        }
   close( f);

   InitKey;                     { Saj t billentyûzet-megszak¡t s  }
   asm mov ax,13h; int 10h end; { MCGA k‚pm¢d bekapcsol sa        }
   for i:= 0 to 199 do
    HLine( i);                  { Kezd‹k‚p ki¡r sa                }

 { 2. F‹ciklus: mozgat s }

   repeat
    if KEY[$C8] and (y>0  ) then ScrollU(1);
    if KEY[$D0] and (y<199) then ScrollD(1);
    if KEY[$CB] and (x>0  ) then ScrollL(1);
    if KEY[$CD] and (x<319) then ScrollR(1);


asm
   mov   dx,3dah        { Az egyenletesebb fut s ‚rdek‚ben v ra-  }
@1:in    al,dx          { kozunk egy vertik lis visszafut sra     }
   test  al,8
   jz    @1
   cld                  { Megjelen¡t‚s: a h tt‚r b jtjait, sza-   }
   push   ds            { vank‚nt, n”vekv‹ sorrendben  tm soljuk  }
   mov    cx,32000      { az $A000-s szegmens els‹ 64000 b jtj ra }
   mov    es,SegA000
   xor    di,di
   lds    si,background
   rep    movsw
   pop    ds
   end;

    until KEY[1];       { ESC megnyom s ra l‚phetnk ki           }

 asm mov ax,3; int 10h end; { Sz”veges m¢d                        }
 DoneKey;                   { BIOS-megszak¡t s vissza ll¡t sa     }
 end.
