procedure ScrollL( Count: word); assembler; asm
                        { A h†ttÇr balra mozgat†sa                }
 { 1. H†ttÇr b†jtjainak †tmozgat†sa }
   mov    ax,count      { H†ttÇr abszcissz†j†nak csîkkentÇse:     }
   sub    X,ax          {  X:= X-COUNT                            }
   les    di,background { A h†ttÇr szegmensÇn belÅl dolgozunk     }
   add    di,63999      { DI az utols¢ b†jtra mutat               }
   mov    si,di         { Most mÇg SI is, de csîkkentjÅk, mert a  }
   sub    si,ax         { forr†s tãle balra tal†lhat¢             }
   mov    cx,32000      { Megint 64000 b†jtot mozgatunk,          }
   std                  { de most a m†sik ir†nyba                 }
   rep    seges movsw   { H†ttÇr jobbra cs£sztat†sa               }

 { 2. Baloldalt felszabadult oszlopok helyÇre az £jakat °rjuk }
   mov    cx,ax         { CX sz†molja a kirakand¢ oszlopokat      }
@1:                     { (ez AX-ben mÇg benne van)               }
   push   cx            { A VLINE elj†r†sban CX megv†ltozik       }
   dec    cx            { A visszafejtendã oszlop sorsz†ma CX-1   }
   push   cx            { A paramÇter†tad†s a vermen keresztÅl    }
   call   vline         { val¢sul meg                             }
   pop    cx            { CX ismÇt az oszlopok sz†m†t tartalmazza }
   loop   @1            { Ha mÇg nem nulla, ismÇt                 }
   end;