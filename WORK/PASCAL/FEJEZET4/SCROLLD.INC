procedure ScrollU( Count: word); assembler; asm
                        { SCROLL-oz†s felfelÇ, a tÇrkÇp: lefelÇ   }
 { 1. Minden sor lejjebb cs£szik }
   mov    ax,count      { Mindenekelãtt csîkkentjÅk a h†ttÇr or-  }
   sub    Y,ax          { din†t†j†t                               }
   les    di,background { ES:[DI] a h†ttÇrre mutat                }
   add    di,63999      { M†r annak az utols¢ b†jtj†ra            }
   mov    si,di         { Most m†r SI is                          }
   mov    bx,320        { Kivon†s elãtt szorzunk, 320ûCOUNT-tal   }
   mul    bx            { lesz SI ÇrtÇke kevesebb, °gy m†r a kel- }
   sub    si,ax         { lã sorra mutat                          }
   mov    cx,32000      { A h†ttÇr 32000 sz¢, de nem kell ennyit  }
   shr    ax,1          { mozgatni, elÇg ennÇl COUNT*160-nal ke-  }
   sub    cx,ax         { sebbet (COUNTû160=COUNTû320 SHR 1)      }
   std                  { Az ir†ny most is csîkkenã               }
   rep    seges movsw   { Az ES-en belÅl tîrtÇnik az adatm†sol†s  }
   inc    di            { A h†ttÇr bal felsã sark†ban lÇvã b†jtot }
   inc    si            { is lejjebb rakjuk, mert azt eddig ki-   }
   seges  movsb         { hagytuk                                 }

 { 2. Felsã COUNT darab sor megrajzol†sa }
   mov    cx,count      { AX ÇrtÇke m†r megv†ltozott, ezÇrt itt   }
@1:                     { COUNT-ot °runk helyette                 }
   push   cx
   dec    cx
   push   cx
   call   hline         { Most v°zszintesen jelen°tjÅk meg a b†j- }
   pop    cx            { tokat                                   }
   loop   @1
   end;
