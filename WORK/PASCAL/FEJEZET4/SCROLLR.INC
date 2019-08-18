procedure ScrollR( Count: word); assembler; asm
                        { A h tt‚r jobbra mozog, a t‚rk‚p balra   }
 { 1. H tt‚r b jtjainak  tmozgat sa }
   mov    ax,count      { Legel‹sz”r megn”veljk a h tt‚r absz-   }
   add    X,ax          { cissz j t                               }
   les    di,background { A c‚l- ‚s a forr sszegmens egyar nt a   }
   mov    si,di         { h tt‚r szegmense                        }
   add    si,ax         { A forr s a c‚lt¢l jobbra tal lhat¢      }
   mov    cx,32000      { A h tt‚r 32000 sz¢b¢l  ll               }
   cld                  { N”vekv‹ direkci¢ban haladunk            }
   rep    seges movsw   { H tt‚r sorainak eltol sa                }

 { 2. Jobboldalt felszabadul¢ oszlop(ok) kit”lt‚se }
   mov    cx,ax         { AX tartalma m‚g mindig COUNT, ennyi     }
@1:                     { oszlopot kell visszafejteni             }
   push   cx            { Csak a CX ‚rt‚k‚t kell megjegyezni      }
   mov    ax,320        { Az oszlop sorsz m nak kisz m¡t sa:      }
   sub    ax,cx         {  oszlop = 320-CX                        }
   push   ax            { Ezt a veremen keresztl adjuk  t a      }
   call   vline         { VLINE elj r snak, aminek futtat sa so-  }
   pop    cx            { r n CX megv ltozik, ez‚rt visszat”ltjk }
   loop   @1            { Ism‚tl‚s, am¡g CX (oszlopsz ml l¢) > 0  }
   end;