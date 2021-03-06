procedure ScrollL( Count: word); assembler; asm
                        { A h�tt�r balra mozgat�sa                }
 { 1. H�tt�r b�jtjainak �tmozgat�sa }
   mov    ax,count      { H�tt�r abszcissz�j�nak cs�kkent�se:     }
   sub    X,ax          {  X:= X-COUNT                            }
   les    di,background { A h�tt�r szegmens�n bel�l dolgozunk     }
   add    di,63999      { DI az utols� b�jtra mutat               }
   mov    si,di         { Most m�g SI is, de cs�kkentj�k, mert a  }
   sub    si,ax         { forr�s t�le balra tal�lhat�             }
   mov    cx,32000      { Megint 64000 b�jtot mozgatunk,          }
   std                  { de most a m�sik ir�nyba                 }
   rep    seges movsw   { H�tt�r jobbra cs�sztat�sa               }

 { 2. Baloldalt felszabadult oszlopok hely�re az �jakat �rjuk }
   mov    cx,ax         { CX sz�molja a kirakand� oszlopokat      }
@1:                     { (ez AX-ben m�g benne van)               }
   push   cx            { A VLINE elj�r�sban CX megv�ltozik       }
   dec    cx            { A visszafejtend� oszlop sorsz�ma CX-1   }
   push   cx            { A param�ter�tad�s a vermen kereszt�l    }
   call   vline         { val�sul meg                             }
   pop    cx            { CX ism�t az oszlopok sz�m�t tartalmazza }
   loop   @1            { Ha m�g nem nulla, ism�t                 }
   end;