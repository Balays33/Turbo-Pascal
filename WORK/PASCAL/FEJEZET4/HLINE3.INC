procedure HLine( L: word); assembler; asm

 { 1. C°mek sz†m°t†sa }

   mov    ax,L          { A = ((Y+L) SHR 3)*BPL+(X SHR 3)         }
   add    ax,Y
   mov    bx,ax         { Az Y+L ÇrtÇket elt†roljuk (helyet Çs i- }
   shr    ax,3          { dãt takar°tunk meg vele)                }
   mul    BPL           { A tÇrkÇp szÇlessÇge m†r b†rmennyi lehet }
   mov    cx,X          { (csak 40-nÇl ne legyen kisebb)          }
   shr    cx,3
   add    ax,cx
   mov    word [@A],ax  { @A: elsã tÇrkÇp-b†jt c°me               }

   mov    ax,320        { B = Lû320                               }
   mul    L
   mov    word [@B],ax  { @B: elsã h†ttÇr-b†jt c°me               }

   and    bx,7          { C = ((Y+L) AND 7) SHL 3                 }
   shl    bx,3          { Y+L ÇrtÇket a BX-ben t†roltuk           }
   mov    word [@C],bx  { @C: elsã b†jt egy BOX-on belÅl          }

   mov    ax,X          { D = X AND 7                             }
   and    ax,7
   mov    word [@D],ax  { @D: elsã BOX nem l†tsz¢ pontjainak sz†ma}

   mov    bx,8          { E = 8-D                                 }
   sub    bx,ax
   mov    word [@E],bx  { @E: elsã BOX l†that¢ pontjainak sz†ma   }

 { 2. Sor visszafejtÇse, a h†ttÇrre }

 { 2.1. Elsã BOX }
   push   bp            { BP-re nincs szÅksÇg,                    }
   mov    bp,ds         { az adatszegmenset t†rolja               }
   lds    si,mapptr     { DS:[SI] a tÇrkÇp kezdãc°me              }
   add    si,word [@A]  { Az elsã visszafejtendã b†jt c°me        }
   lodsb                { AL az elsã BOX sorsz†m†t tartalmazza    }
   xor    ah,ah         { AH null†z†sa, a forgat†s miatt          }
   shl    ax,6          { 64-gyel szorzunk, AX a BOX eltol†si c°me}
   mov    ds,bp         { Vissza kell tîlteni az eredeti DS-t,    }
   les    di,background { mert a h†ttÇr kezdãc°me abban van       }
   add    di,word [@B]  { ES:[DI] a cÇlc°m, a kiv†lasztott sor    }
                        { elsã b†jtj†ra mutat                     }
   lds    si,boxptr     { A forr†sc°m a BOXPTR nÇh†ny b†jtja      }
   add    si,ax         { A kirakand¢ BOX elsã b†jtja             }
   add    si,word [@C]  { A BOX †br†zoland¢ sor†nak elsã b†jtja   }
   add    si,word [@D]  { Az elsã megjelen°tendã pont c°me        }
   mov    cx,word [@E]  { 8-D db pontot kell kirajzolni           }
   rep    movsb         { Rajzol†s b†jtonkÇnt, 'E' lehet p†ratlan }
   mov    ds,bp

 { 2.2. KîzÇpsã 39 BOX }
   mov    cx,1          { Az elsã BOX-szal m†r nem kell tîrãdnÅnk }
@1:
   push   cx            { A sorkirak†sn†l sz†ml†l¢ lesz           }
   lds    si,mapptr     { MAPPTR a tÇrkÇp kezdãc°me               }
   add    si,word [@A]  { A megjelen°tendã sor m†sodik b†jtja     }
   add    si,cx         { Most m†r az aktu†lis (CX.) b†jt         }
   lodsb                { AL a tÇrkÇp aktu†lis b†jtja             }
   xor    ah,ah         { AX felsã b†jtja 0                       }
   shl    ax,6          { AX SHL 6 = AXû64, csak rîvidebb         }
   mov    ds,bp         { DS ismÇt az eredeti adatszegmens        }
   lds    si,boxptr     { A forr†sc°m a BOXPTR egy b†jtja         }
   add    si,ax         { DS:[SI] m†r a kirakand¢ BOX-ra mutat    }
   add    si,word [@C]  { ês m†r a megfelelã sor†nak 1. b†jtj†ra  }
   mov    cx,4          { 8 b†jt=4 sz¢ mozgat†sa kîvetkezik       }
   rep    movsw         { Egy BOX egy sor†nak megjelenitÇse       }
   mov    ds,bp         { Az eredeti adatszegmens vissza†llit†sa  }
   pop    cx            { CX a BOX-okat sz†ml†lja                 }
   inc    cx            { Sz†ml†l¢ nîvelÇse                       }
   cmp    cx,40         { Ha mÇg nem Çrte el a 40-et,             }
   jnz    @1            { megismÇteljÅk az ciklust                }

 { 2.3. utols¢ BOX }
   lds    si,mapptr     { MAPPTR a tÇrkÇp kezdãc°me               }
   add    si,word [@A]  { Ehhez hozz†adunk annyit, hogy a most    }
   add    si,40         { megjelen°tendã BOX-ra mutasson          }
   lodsb                { AL-be tîlti a BOX sorsz†m†t             }
   xor    ah,ah
   shl    ax,6          { AX=64ûAL, AX a BOXPTR eltol†sa          }
   mov    ds,bp
   lds    si,boxptr
   add    si,ax
   add    si,word [@C]  { Most annyi pont l†tszik, amennyi az el- }
                        { sã BOX-n†l kil¢gott, Çs ennyit kell     }
   mov    cx,word [@D]  { csak kirajzolni                         }
   cmp    cx,0          { Ha ez nulla, nincs semmi dolgunk        }
   jz     @2
   rep    movsb         { Utols¢ BOX nÇh†ny pontj†nak kirak†sa    }
@2:
   mov    ds,bp         { Sohase felejtsÅk el vissza†ll°tani a DS }
   pop    bp            { ÇrtÇkÇt, ha megv†ltoztattuk             }
   jmp    @exit

@A:dw     0             { Ezek a v†ltoz¢k azÇrt vannak a k¢dszeg- }
@B:dw     0             { mensben, hogy elÇrÇsÅkhîz ne kelljen az }
@C:dw     0             { eredeti adatszegmenst vissza°rni.       }
@D:dw     0
@E:dw     0             { A v†ltoz¢k le°r†s†t l†sd feljebb        }
@exit:
   end;
