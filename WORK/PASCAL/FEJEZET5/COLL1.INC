function Collision: boolean; assembler; asm
   mov    ax,X1         { A 2. BOB legal�bb az els� oszlop�nak    }
   add    ax,W1         { legal�bb egy     pixele (m�g ha �tl�t-  }
   cmp    ax,X2         { sz� is) belel�g-e az 1. BOB tartom�ny�- }
   jng    @nocoll       { ba? (Ha nem - nem �rintkezhetnek)       }

   mov    ax,Y1         { A 2. BOB f�gg�legesen alulr�l �rinti-e  }
   add    ax,H1         { az 1. BOB-ot?                           }
   cmp    ax,Y2
   jng    @nocoll

   mov    ax,X2         { Az 1. BOB abszcissz�ja nagyobb-e a 2.   }
   add    ax,W2         { BOB abszcissz�j�nak �s sz�less�g�nek    }
   cmp    ax,X1         { �sszeg�n�l? (Ha igen - nincs �tk�z�s)   }
   jng    @nocoll

   mov    ax,Y2         { Ugyanez csak ordin�t�kra �s magass�gra  }
   add    ax,H2         { megvizsg�lva                            }
   cmp    ax,Y1
   jng    @nocoll

   mov    al,1          { A f�ggv�ny visszat�r�si �rt�ke 1, azaz  }
   jmp    @exit         { TRUE, ha mind a n�gy kit�tel igaznak    }
@nocoll:                { bizonyult.                              }
   mov    al,0
@exit:
   end;
