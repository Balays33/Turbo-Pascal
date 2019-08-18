procedure HLine( L: word); assembler; asm
                        { A tÇrkÇp L. sor†nak megjelen°tÇse       }
   mov    ax,L          { Elãszîr kisz†moljuk az elsã b†jt c°mÇt  }
   mov    cx,ax         { CX-be is bevisszÅk                      }
   shr    ax,3          { 8-cal val¢ oszt†s=3 bit forgat†s jobbra }
   mov    bx,40         { 40 BOX-b¢l †ll egy sor                  }
   mul    bx            { Az elsã tÇkÇp-b†jt eltol†si c°me AX-ben }
   mov    word [@A],ax  { Elt†roljuk, ne kelljen £jra kisz†molni  }
   mov    ax,320        { Az elsã pixel c°me: 320ûL               }
   mul    cx
   mov    word [@B],ax  { Ezt is elt†roluk, idãt sp¢rolunk vele   }
   and    cx,7          { Als¢ 3 bit marad, tîbbi 0               }
   shl    cx,3          { 8-cal szorzunk, CX: BOX-on belÅli elto- }
                        { l†si c°m                                }
   mov    word [@C],cx  { Ezt is megjegyezzÅk                     }
   push   bp            { A BP regiszterre nincs szÅksÇg, °gy az  }
   mov    bp,ds         { t†rolhatja az adatszegmensregisztert    }
   xor    cx,cx         { CX sz†ml†lja a b†jtokat, 8-as†val       }
@1:
   push   cx            { A sorkirak†sn†l pixelsz†ml†l¢ lesz      }
   lds    si,mapptr     { MAPPTR a tÇrkÇp kezdãc°me               }
   add    si,word [@A]  { A megjelen°tendã sor elsã b†jtja        }
   add    si,cx         { Most m†r az aktu†lis (CX.) b†jt         }
   lodsb                { AL a tÇrkÇp aktu†lis b†jtja             }
   xor    ah,ah         { AX felsã b†jtja 0                       }
   shl    ax,6          { AX SHL 6 = AXû64, csak gyorsabb         }
   mov    ds,bp         { DS ismÇt az eredeti adatszegmens        }
   les    di,background { A cÇlc°m a h†ttÇr egy b†jtja            }
   add    di,word [@B]  { NîveljÅk a cÇlc°met, a sor elsã b†jtja  }
   shl    cx,3          { MÇg nîveljÅk, hogy a k°v†nt b†jtra mu-  }
   add    di,cx         { tasson (DI:=DI+320ûL+CXû8)              }
   lds    si,boxptr     { A forr†sc°m a BOXPTR egy b†jtja         }
   add    si,ax         { DS:[SI] m†r a kirakand¢ BOX-ra mutat    }
   add    si,word [@C]  { ês m†r a megfelelã sor†nak 1. b†jtj†ra  }
   mov    cx,4          { 8 b†jt=4 sz¢ mozgat†sa kîvetkezik       }
   cld
   rep    movsw         { Egy BOX egy sor†nak megjelenitÇse       }
   mov    ds,bp         { Az eredeti adatszegmens vissza†llit†sa  }
   pop    cx            { CX a BOX-okat sz†ml†lja                 }
   inc    cx            { Sz†ml†l¢ nîvelÇse                       }
   cmp    cx,40         { ElÇrte-e a 40-et? (Ennyit kell kirakni) }
   jnz    @1            { Ha mÇg nem, megismÇteljÅk az egÇszet    }
   pop    bp
   jmp    @exit
@a:dw     0             { NÇh†ny v†ltoz¢t a k¢dszegmensben helye- }
@b:dw     0             { zÅnk el, °gy ÇrtÇkÅk kiolvas†s†hoz nem  }
@c:dw     0             { kell az eredeti adatszegmens            }
@exit:
   end;
