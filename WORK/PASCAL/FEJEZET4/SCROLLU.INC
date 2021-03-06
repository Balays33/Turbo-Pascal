procedure ScrollD( Count: word); assembler; asm
                        { V�g�l a lefel� g�rd�t�s k�vetkezik      }
 { 1. Sorok feljebb mozgat�sa a h�tt�ren }
   mov    ax,count      { A h�tt�r (t�rk�p) m�sodik koordin�t�j�- }
   add    Y,ax          { nak n�vel�se                            }
   les    di,background { A h�tt�ren dolgozunk                    }
   mov    si,di         { SI is felveszi a h�tt�r ofszetc�m�t     }
   mov    bx,320        { A h�tt�r sz�less�ge 320 pixel           }
   mul    bx            { Ezzel szorozva COUNT-ot megkapjuk,      }
   add    si,ax         { mennyit kell SI-hez adni                }
   mov    cx,32001      { CX a h�tt�r hossza+1 (word-ben)         }
   shr    ax,1          { Ez tulajdonk�ppen oszt�s 2-vel          }
   sub    cx,ax         { Csak hogy gyorsabb legyen...            }
   cld                  { Ir�ny: n�vekv�                          }
   rep    seges movsw   { Sorok felcs�sztat�sa                    }

 { 2. Az alul meg�resedett r�sz megjelen�t�se }
   mov    cx,count      { COUNT db. sort kell ki�rni              }
@1:
   mov    ax,200        { 200-b�l kell kivonni, hogy megkapjuk a  }
   sub    ax,cx         { HLINE-hoz a sor sz�m�t                  }
   push   cx            { CX a HLINE sor�n megv�ltozik, elmentj�k }
   push   ax            { AX tartalmazza a rajzoland� sor sz�m�t  }
   call   hline         { Egy sor visszafejt�se                   }
   pop    cx
   loop   @1            { A t�bbi sor ki�r�sa (ha m�g van)        }
   end;
