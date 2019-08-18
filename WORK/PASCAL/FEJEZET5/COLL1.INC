function Collision: boolean; assembler; asm
   mov    ax,X1         { A 2. BOB legal†bb az elsã oszlop†nak    }
   add    ax,W1         { legal†bb egy     pixele (mÇg ha †tl†t-  }
   cmp    ax,X2         { sz¢ is) belel¢g-e az 1. BOB tartom†ny†- }
   jng    @nocoll       { ba? (Ha nem - nem Çrintkezhetnek)       }

   mov    ax,Y1         { A 2. BOB fÅggãlegesen alulr¢l Çrinti-e  }
   add    ax,H1         { az 1. BOB-ot?                           }
   cmp    ax,Y2
   jng    @nocoll

   mov    ax,X2         { Az 1. BOB abszcissz†ja nagyobb-e a 2.   }
   add    ax,W2         { BOB abszcissz†j†nak Çs szÇlessÇgÇnek    }
   cmp    ax,X1         { îsszegÇnÇl? (Ha igen - nincs ÅtkîzÇs)   }
   jng    @nocoll

   mov    ax,Y2         { Ugyanez csak ordin†t†kra Çs magass†gra  }
   add    ax,H2         { megvizsg†lva                            }
   cmp    ax,Y1
   jng    @nocoll

   mov    al,1          { A fÅggvÇny visszatÇrÇsi ÇrtÇke 1, azaz  }
   jmp    @exit         { TRUE, ha mind a nÇgy kitÇtel igaznak    }
@nocoll:                { bizonyult.                              }
   mov    al,0
@exit:
   end;
