procedure ScrollU( Count: word); assembler; asm
                        { SCROLL-oz�s felfel�, a t�rk�p: lefel�   }
 { 1. Minden sor lejjebb cs�szik }
   mov    ax,count      { Mindenekel�tt cs�kkentj�k a h�tt�r or-  }
   sub    Y,ax          { din�t�j�t                               }
   les    di,background { ES:[DI] a h�tt�rre mutat                }
   add    di,63999      { M�r annak az utols� b�jtj�ra            }
   mov    si,di         { Most m�r SI is                          }
   mov    bx,320        { Kivon�s el�tt szorzunk, 320�COUNT-tal   }
   mul    bx            { lesz SI �rt�ke kevesebb, �gy m�r a kel- }
   sub    si,ax         { l� sorra mutat                          }
   mov    cx,32000      { A h�tt�r 32000 sz�, de nem kell ennyit  }
   shr    ax,1          { mozgatni, el�g enn�l COUNT*160-nal ke-  }
   sub    cx,ax         { sebbet (COUNT�160=COUNT�320 SHR 1)      }
   std                  { Az ir�ny most is cs�kken�               }
   rep    seges movsw   { Az ES-en bel�l t�rt�nik az adatm�sol�s  }
   inc    di            { A h�tt�r bal fels� sark�ban l�v� b�jtot }
   inc    si            { is lejjebb rakjuk, mert azt eddig ki-   }
   seges  movsb         { hagytuk                                 }

 { 2. Fels� COUNT darab sor megrajzol�sa }
   mov    cx,count      { AX �rt�ke m�r megv�ltozott, ez�rt itt   }
@1:                     { COUNT-ot �runk helyette                 }
   push   cx
   dec    cx
   push   cx
   call   hline         { Most v�zszintesen jelen�tj�k meg a b�j- }
   pop    cx            { tokat                                   }
   loop   @1
   end;
