procedure ScrollD( Count: word); assembler; asm
                        { VÇgÅl a lefelÇ gîrd°tÇs kîvetkezik      }
 { 1. Sorok feljebb mozgat†sa a h†ttÇren }
   mov    ax,count      { A h†ttÇr (tÇrkÇp) m†sodik koordin†t†j†- }
   add    Y,ax          { nak nîvelÇse                            }
   les    di,background { A h†ttÇren dolgozunk                    }
   mov    si,di         { SI is felveszi a h†ttÇr ofszetc°mÇt     }
   mov    bx,320        { A h†ttÇr szÇlessÇge 320 pixel           }
   mul    bx            { Ezzel szorozva COUNT-ot megkapjuk,      }
   add    si,ax         { mennyit kell SI-hez adni                }
   mov    cx,32001      { CX a h†ttÇr hossza+1 (word-ben)         }
   shr    ax,1          { Ez tulajdonkÇppen oszt†s 2-vel          }
   sub    cx,ax         { Csak hogy gyorsabb legyen...            }
   cld                  { Ir†ny: nîvekvã                          }
   rep    seges movsw   { Sorok felcs£sztat†sa                    }

 { 2. Az alul megÅresedett rÇsz megjelen°tÇse }
   mov    cx,count      { COUNT db. sort kell ki°rni              }
@1:
   mov    ax,200        { 200-b¢l kell kivonni, hogy megkapjuk a  }
   sub    ax,cx         { HLINE-hoz a sor sz†m†t                  }
   push   cx            { CX a HLINE sor†n megv†ltozik, elmentjÅk }
   push   ax            { AX tartalmazza a rajzoland¢ sor sz†m†t  }
   call   hline         { Egy sor visszafejtÇse                   }
   pop    cx
   loop   @1            { A tîbbi sor ki°r†sa (ha mÇg van)        }
   end;
