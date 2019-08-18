procedure VLine( C: word); assembler; asm
                        { A h†ttÇr C. oszlopa alatti tÇrkÇp-rÇsz- }
                        { let visszafejtÇse a h†ttÇrre            }
 { 1. KÇpletek alkalmaz†sa, @A-E v†ltoz¢knak ÇrtÇkad†s }

   mov    ax,Y          { A = (Y SHR 3)ûBPL+((X+C) SHR 3)         }
   shr    ax,3
   mul    BPL           { AX-ben az sor elsã b†jtj†nak c°me       }
   mov    bx,X          { A tÇrkÇp elsã koordin†t†ja              }
   add    bx,C          { BX tartalma: X+C, ezt az îsszeget C-nÇl }
   mov    cx,bx         { mÇg felhaszn†ljuk, ezÇrt t†roljuk       }
   shr    bx,3
   add    ax,bx
   mov    word [@A],ax  { @A: elsã BOX eltol†si c°me              }

   and    cx,7          { C = (X+C) AND 7, CX-ben volt az X+C     }
   mov    word [@C],cx  { @C: BOX-okon belÅli kirajzoland¢ oszlop }

   mov    ax,Y          { D = Y AND 7                             }
   and    ax,7          { BX tartalma most: Y AND 7               }
   mov    word [@D],ax  { @D: felsã BOX nem l†tsz¢ sorainak sz†ma }

   neg    ax            { E = 8-(Y AND 7)                         }
   add    ax,8          { AX ÇrtÇke: -(Y AND 7)+8                 }
   mov    word [@E],ax  { @E: als¢ BOX nem l†that¢ sorainak sz†ma }

 { 2. Oszlop megjelen°tÇse }

 { 2.1. Legfelsã BOB [@C]. oszlopa [@E] db pontj†nak †tm†sol†sa }
   les    di,background { A cÇlc°met m†r most be†ll°tjuk          }
   add    di,C          { az elsã m¢dos°tand¢ h†ttÇr-b†jtra       }
   push   bp            { BP ebben az elj†r†sban csak az          }
   mov    bp,ds         { adatszegmens-c°met t†rolja              }
   lds    si,mapptr     { MAPPTR a tÇrkÇp kezdãc°me               }
   add    si,word [@A]  { DS:[SI] az elsã Çrintett BOX-ra mutat   }
   lodsb                { AL az elsã BOX sorsz†ma, ebbãl          }
   xor    ah,ah         { sz†m°tjuk ki az eltol†si c°mÇt,         }
   shl    ax,6          { 64-gyel val¢ szorz†ssal                 }
   mov    ds,bp         { A kîv. m˚velethez az eredeti DS kell    }
   lds    si,boxptr     { BOXPTR a BOX-adatok kezdãc°me           }
   add    si,ax         { A kirajzoland¢ BOX kezdãc°me            }
   add    si,word [@C]  { Kirajzoland¢ oszlop                     }
   mov    ax,8          { Egy BOX szÇlessÇge 8 b†jtnyi            }
   mul    word [@D]     { [@D]û8, ennyit kell adni SI-hez, hogy   }
   add    si,ax         { a felsã [@D] sor ne l†tsz¢djon          }
   mov    cx,word [@E]  { [@E] db b†jt †tm†sol†sa kîvetkezik      }
   cld                  { Az ir†ny: nîvekvã                       }
@1:                     { Most sajnos nem haszn†lhat¢ a REP       }
   movsb                { Egy b†jt †t°r†sa                        }
   add    si,7          { Forr†sc°m nîvelÇse 1+7-tel              }
   add    di,319        { CÇlc°m a kîvetkezã sor kellã pontja     }
   loop   @1            { CX-szer van ismÇtlÇs                    }
   mov    ds,bp         { DS vissza                               }

 { 2.2. KîzÇpsã 24 db BOX [@C]. oszlop†nak †trajzol†sa }
   mov    bx,1          { Az elsã BOX-szal m†r nincs dolgunk      }
@2:
   mov    ax,BPL        { A szorz†shoz kell majd                  }
   lds    si,mapptr     { DS:[SI] a tÇrkÇpre mutat                }
   add    si,word [@A]  { Az elsã megjelen°tendã BOX b†jtj†ra     }
   mul    bx            { Szorz†s, AX-ben elã†llt a BX. BOX       }
   add    si,ax         { eltol†si c°me                           }
   lodsb                { AL-be tîltjÅk az Çrintett BOX sz†m†t    }
   mov    ds,bp         { A rÇgi DS visszatîltÇse                 }
   xor    ah,ah         { AH null†z†sa a forgat†shoz              }
   shl    ax,6          { Szorz†s, AX:= AXû64 (egy BOX hossza)    }
   lds    si,boxptr     { A forr†sc°m a BOXPTR egy b†jtja         }
   add    si,ax         { Az Çrintett BOX elsã b†jtja DS:[SI]^    }
   add    si,word [@C]  { Most m†r az elsã †trajzoland¢ pontja    }
   mov    cx,8          { 8 b†jt †tm†sol†sa, most nem lehet       }
@3:                     { szavankÇnt, mert nem egybefÅggãk        }
   movsb                { Egy b†jt †tm†sol†sa                     }
   add    di,319        { CÇlindex nîvelÇse                       }
   add    si,7          { Forr†sindex nîvelÇse                    }
   loop   @3            { Am°g CX 0-ra nem csîkken                }
   mov    ds,bp         { DS vissza                               }
   inc    bx            { Egy BOX-oszlopot †trajzoltunk           }
   cmp    bx,25         { ôsszesen 25 kîzÇpsã BOX van             }
   jnz    @2            { Ki°rjuk azokat is                       }

 { 2.3. Az utols¢ BOX-oszlop megrajzol†sa, ha l†tszik }
   mov    cx,word [@D]  { Als¢ BOX l†that¢ sorai, akkor nulla,    }
   cmp    cx,0          { ha a h†ttÇr szÇle BOX-hat†rra esik,     }
   jz     @exit         { ekkor nincs tîbb dolgunk                }
   mov    ax,BPL        { Elãre be°rjuk BPL-t a szorz†shoz, DS    }
                        { m¢dos°t†sa ut†n m†r nem tudjuk          }
   lds    si,mapptr     { TÇrkÇp kezdãc°me                        }
   add    si,word [@A]  { H†ttÇr C. sora alatti felsã b†jt c°me   }
   mov    bx,25         { 26. BOX egy oszlop†nak †tm†sol†sa       }
   mul    bx            { AX-ben elã†llt az eltol†si c°m          }
   add    si,ax         { El is toljuk az SI regisztert           }
   lodsb                { Megvan a BOX sorsz†ma                   }
   mov    ds,bp         { DS ismÇt az eredeti adatszegmens        }
   lds    si,boxptr     { A forr†sc°m be†ll°t†sa                  }
   xor    ah,ah         { AX felsã b†jtja nulla                   }
   shl    ax,6
   add    ax,word [@C]  { @C a BOX †br†zoland¢ oszlopa            }
   add    si,ax         { SI:= SI+64ûAX+[@C]                      }
@4:
   movsb                { Egy BOX-pont m†sol†sa a h†ttÇrre        }
   add    si,7          { Forr†s- Çs cÇlindex nîvelÇse,           }
   add    di,319        { a fÅggãleges sorokhoz                   }
   loop   @4            { CX-szer kell ismÇtelni                  }
   mov    ds,bp
   jmp    @exit

@a:dw     0             { A k¢dszegmensben elhelyezkedã           }
@c:dw     0             { v†ltoz¢k                                }
@d:dw     0
@e:dw     0
@exit:
   pop    bp            { BP kivÇtele a verembãl                  }
   end;
