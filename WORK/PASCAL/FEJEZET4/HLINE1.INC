procedure HLine; assembler; asm { H=Horizontal Line-v°zsz. sor    }
   push   bp            { BP is a DS-t t†rolja, hogy ne kelljen   }
   mov    bp,ds         { a vermbe menteni, mert az sok idã       }
   xor    cx,cx         { CX sz†ml†lja majd a kirakott BOX-sorokat}
@1:
   push   cx            { Itt a CX a REP utas°t†shoz kell         }
   les    di,mapptr     { MAPPTR a tÇrkÇp kezdãc°me               }
   add    di,cx         { DI a tÇrkÇp CX. b†jtj†ra mutat          }
   mov    al,es:[di]    { AL a tÇrkÇp aktu†lis b†jtja             }
   xor    ah,ah         { A szorz†s miatt az AX felsã b†jtja 0    }
   mov    bx,64         { Egy BOX mÇrete 64 b†jt                  }
   mul    bx            { AX a kirakand¢ BOX eltol†si c°me        }
   les    di,background { A cÇlc°m a h†ttÇr egy b†jtja            }
   lds    si,boxptr     { A forr†sc°m a BOXPTR egy b†jtja         }
   add    si,ax         { DS:[SI] m†r a kirakand¢ BOX-ra mutat    }
   mov    ax,8          { DI cÇlindexet is be†llitjuk, hogy a     }
   mul    cx            { h†ttÇr kellã b†jtj†ra mutasson          }
   add    di,ax         { DI:= DI+CX*8 (CX a sz†ml†l¢)            }
   mov    cx,4          { 8 b†jt=4 sz¢ mozgat†sa kîvetkezik       }
   cld
   rep    movsw         { Egy BOX egy sor†nak megjelenitÇse       }
   mov    ds,bp         { Az eredeti adatszegmens vissza†llit†sa  }
   pop    cx            { CX a BOX-okat sz†ml†lja                 }
   inc    cx            { Sz†ml†l¢ nîvelÇse                       }
   cmp    cx,40         { ElÇrte-e a 40-et? (Ennyit kell kirakni) }
   jnz    @1            { Ha mÇg nem, megismÇteljÅk az egÇszet    }
   pop    bp
   end;
