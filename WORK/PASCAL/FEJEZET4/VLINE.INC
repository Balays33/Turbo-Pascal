procedure VLine( C: word); assembler; asm
                        { A h�tt�r C. oszlopa alatti t�rk�p-r�sz- }
                        { let visszafejt�se a h�tt�rre            }
 { 1. K�pletek alkalmaz�sa, @A-E v�ltoz�knak �rt�kad�s }

   mov    ax,Y          { A = (Y SHR 3)�BPL+((X+C) SHR 3)         }
   shr    ax,3
   mul    BPL           { AX-ben az sor els� b�jtj�nak c�me       }
   mov    bx,X          { A t�rk�p els� koordin�t�ja              }
   add    bx,C          { BX tartalma: X+C, ezt az �sszeget C-n�l }
   mov    cx,bx         { m�g felhaszn�ljuk, ez�rt t�roljuk       }
   shr    bx,3
   add    ax,bx
   mov    word [@A],ax  { @A: els� BOX eltol�si c�me              }

   and    cx,7          { C = (X+C) AND 7, CX-ben volt az X+C     }
   mov    word [@C],cx  { @C: BOX-okon bel�li kirajzoland� oszlop }

   mov    ax,Y          { D = Y AND 7                             }
   and    ax,7          { BX tartalma most: Y AND 7               }
   mov    word [@D],ax  { @D: fels� BOX nem l�tsz� sorainak sz�ma }

   neg    ax            { E = 8-(Y AND 7)                         }
   add    ax,8          { AX �rt�ke: -(Y AND 7)+8                 }
   mov    word [@E],ax  { @E: als� BOX nem l�that� sorainak sz�ma }

 { 2. Oszlop megjelen�t�se }

 { 2.1. Legfels� BOB [@C]. oszlopa [@E] db pontj�nak �tm�sol�sa }
   les    di,background { A c�lc�met m�r most be�ll�tjuk          }
   add    di,C          { az els� m�dos�tand� h�tt�r-b�jtra       }
   push   bp            { BP ebben az elj�r�sban csak az          }
   mov    bp,ds         { adatszegmens-c�met t�rolja              }
   lds    si,mapptr     { MAPPTR a t�rk�p kezd�c�me               }
   add    si,word [@A]  { DS:[SI] az els� �rintett BOX-ra mutat   }
   lodsb                { AL az els� BOX sorsz�ma, ebb�l          }
   xor    ah,ah         { sz�m�tjuk ki az eltol�si c�m�t,         }
   shl    ax,6          { 64-gyel val� szorz�ssal                 }
   mov    ds,bp         { A k�v. m�velethez az eredeti DS kell    }
   lds    si,boxptr     { BOXPTR a BOX-adatok kezd�c�me           }
   add    si,ax         { A kirajzoland� BOX kezd�c�me            }
   add    si,word [@C]  { Kirajzoland� oszlop                     }
   mov    ax,8          { Egy BOX sz�less�ge 8 b�jtnyi            }
   mul    word [@D]     { [@D]�8, ennyit kell adni SI-hez, hogy   }
   add    si,ax         { a fels� [@D] sor ne l�tsz�djon          }
   mov    cx,word [@E]  { [@E] db b�jt �tm�sol�sa k�vetkezik      }
   cld                  { Az ir�ny: n�vekv�                       }
@1:                     { Most sajnos nem haszn�lhat� a REP       }
   movsb                { Egy b�jt �t�r�sa                        }
   add    si,7          { Forr�sc�m n�vel�se 1+7-tel              }
   add    di,319        { C�lc�m a k�vetkez� sor kell� pontja     }
   loop   @1            { CX-szer van ism�tl�s                    }
   mov    ds,bp         { DS vissza                               }

 { 2.2. K�z�ps� 24 db BOX [@C]. oszlop�nak �trajzol�sa }
   mov    bx,1          { Az els� BOX-szal m�r nincs dolgunk      }
@2:
   mov    ax,BPL        { A szorz�shoz kell majd                  }
   lds    si,mapptr     { DS:[SI] a t�rk�pre mutat                }
   add    si,word [@A]  { Az els� megjelen�tend� BOX b�jtj�ra     }
   mul    bx            { Szorz�s, AX-ben el��llt a BX. BOX       }
   add    si,ax         { eltol�si c�me                           }
   lodsb                { AL-be t�ltj�k az �rintett BOX sz�m�t    }
   mov    ds,bp         { A r�gi DS visszat�lt�se                 }
   xor    ah,ah         { AH null�z�sa a forgat�shoz              }
   shl    ax,6          { Szorz�s, AX:= AX�64 (egy BOX hossza)    }
   lds    si,boxptr     { A forr�sc�m a BOXPTR egy b�jtja         }
   add    si,ax         { Az �rintett BOX els� b�jtja DS:[SI]^    }
   add    si,word [@C]  { Most m�r az els� �trajzoland� pontja    }
   mov    cx,8          { 8 b�jt �tm�sol�sa, most nem lehet       }
@3:                     { szavank�nt, mert nem egybef�gg�k        }
   movsb                { Egy b�jt �tm�sol�sa                     }
   add    di,319        { C�lindex n�vel�se                       }
   add    si,7          { Forr�sindex n�vel�se                    }
   loop   @3            { Am�g CX 0-ra nem cs�kken                }
   mov    ds,bp         { DS vissza                               }
   inc    bx            { Egy BOX-oszlopot �trajzoltunk           }
   cmp    bx,25         { �sszesen 25 k�z�ps� BOX van             }
   jnz    @2            { Ki�rjuk azokat is                       }

 { 2.3. Az utols� BOX-oszlop megrajzol�sa, ha l�tszik }
   mov    cx,word [@D]  { Als� BOX l�that� sorai, akkor nulla,    }
   cmp    cx,0          { ha a h�tt�r sz�le BOX-hat�rra esik,     }
   jz     @exit         { ekkor nincs t�bb dolgunk                }
   mov    ax,BPL        { El�re be�rjuk BPL-t a szorz�shoz, DS    }
                        { m�dos�t�sa ut�n m�r nem tudjuk          }
   lds    si,mapptr     { T�rk�p kezd�c�me                        }
   add    si,word [@A]  { H�tt�r C. sora alatti fels� b�jt c�me   }
   mov    bx,25         { 26. BOX egy oszlop�nak �tm�sol�sa       }
   mul    bx            { AX-ben el��llt az eltol�si c�m          }
   add    si,ax         { El is toljuk az SI regisztert           }
   lodsb                { Megvan a BOX sorsz�ma                   }
   mov    ds,bp         { DS ism�t az eredeti adatszegmens        }
   lds    si,boxptr     { A forr�sc�m be�ll�t�sa                  }
   xor    ah,ah         { AX fels� b�jtja nulla                   }
   shl    ax,6
   add    ax,word [@C]  { @C a BOX �br�zoland� oszlopa            }
   add    si,ax         { SI:= SI+64�AX+[@C]                      }
@4:
   movsb                { Egy BOX-pont m�sol�sa a h�tt�rre        }
   add    si,7          { Forr�s- �s c�lindex n�vel�se,           }
   add    di,319        { a f�gg�leges sorokhoz                   }
   loop   @4            { CX-szer kell ism�telni                  }
   mov    ds,bp
   jmp    @exit

@a:dw     0             { A k�dszegmensben elhelyezked�           }
@c:dw     0             { v�ltoz�k                                }
@d:dw     0
@e:dw     0
@exit:
   pop    bp            { BP kiv�tele a veremb�l                  }
   end;
