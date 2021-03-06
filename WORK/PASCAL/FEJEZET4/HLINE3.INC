procedure HLine( L: word); assembler; asm

 { 1. C�mek sz�m�t�sa }

   mov    ax,L          { A = ((Y+L) SHR 3)*BPL+(X SHR 3)         }
   add    ax,Y
   mov    bx,ax         { Az Y+L �rt�ket elt�roljuk (helyet �s i- }
   shr    ax,3          { d�t takar�tunk meg vele)                }
   mul    BPL           { A t�rk�p sz�less�ge m�r b�rmennyi lehet }
   mov    cx,X          { (csak 40-n�l ne legyen kisebb)          }
   shr    cx,3
   add    ax,cx
   mov    word [@A],ax  { @A: els� t�rk�p-b�jt c�me               }

   mov    ax,320        { B = L�320                               }
   mul    L
   mov    word [@B],ax  { @B: els� h�tt�r-b�jt c�me               }

   and    bx,7          { C = ((Y+L) AND 7) SHL 3                 }
   shl    bx,3          { Y+L �rt�ket a BX-ben t�roltuk           }
   mov    word [@C],bx  { @C: els� b�jt egy BOX-on bel�l          }

   mov    ax,X          { D = X AND 7                             }
   and    ax,7
   mov    word [@D],ax  { @D: els� BOX nem l�tsz� pontjainak sz�ma}

   mov    bx,8          { E = 8-D                                 }
   sub    bx,ax
   mov    word [@E],bx  { @E: els� BOX l�that� pontjainak sz�ma   }

 { 2. Sor visszafejt�se, a h�tt�rre }

 { 2.1. Els� BOX }
   push   bp            { BP-re nincs sz�ks�g,                    }
   mov    bp,ds         { az adatszegmenset t�rolja               }
   lds    si,mapptr     { DS:[SI] a t�rk�p kezd�c�me              }
   add    si,word [@A]  { Az els� visszafejtend� b�jt c�me        }
   lodsb                { AL az els� BOX sorsz�m�t tartalmazza    }
   xor    ah,ah         { AH null�z�sa, a forgat�s miatt          }
   shl    ax,6          { 64-gyel szorzunk, AX a BOX eltol�si c�me}
   mov    ds,bp         { Vissza kell t�lteni az eredeti DS-t,    }
   les    di,background { mert a h�tt�r kezd�c�me abban van       }
   add    di,word [@B]  { ES:[DI] a c�lc�m, a kiv�lasztott sor    }
                        { els� b�jtj�ra mutat                     }
   lds    si,boxptr     { A forr�sc�m a BOXPTR n�h�ny b�jtja      }
   add    si,ax         { A kirakand� BOX els� b�jtja             }
   add    si,word [@C]  { A BOX �br�zoland� sor�nak els� b�jtja   }
   add    si,word [@D]  { Az els� megjelen�tend� pont c�me        }
   mov    cx,word [@E]  { 8-D db pontot kell kirajzolni           }
   rep    movsb         { Rajzol�s b�jtonk�nt, 'E' lehet p�ratlan }
   mov    ds,bp

 { 2.2. K�z�ps� 39 BOX }
   mov    cx,1          { Az els� BOX-szal m�r nem kell t�r�dn�nk }
@1:
   push   cx            { A sorkirak�sn�l sz�ml�l� lesz           }
   lds    si,mapptr     { MAPPTR a t�rk�p kezd�c�me               }
   add    si,word [@A]  { A megjelen�tend� sor m�sodik b�jtja     }
   add    si,cx         { Most m�r az aktu�lis (CX.) b�jt         }
   lodsb                { AL a t�rk�p aktu�lis b�jtja             }
   xor    ah,ah         { AX fels� b�jtja 0                       }
   shl    ax,6          { AX SHL 6 = AX�64, csak r�videbb         }
   mov    ds,bp         { DS ism�t az eredeti adatszegmens        }
   lds    si,boxptr     { A forr�sc�m a BOXPTR egy b�jtja         }
   add    si,ax         { DS:[SI] m�r a kirakand� BOX-ra mutat    }
   add    si,word [@C]  { �s m�r a megfelel� sor�nak 1. b�jtj�ra  }
   mov    cx,4          { 8 b�jt=4 sz� mozgat�sa k�vetkezik       }
   rep    movsw         { Egy BOX egy sor�nak megjelenit�se       }
   mov    ds,bp         { Az eredeti adatszegmens vissza�llit�sa  }
   pop    cx            { CX a BOX-okat sz�ml�lja                 }
   inc    cx            { Sz�ml�l� n�vel�se                       }
   cmp    cx,40         { Ha m�g nem �rte el a 40-et,             }
   jnz    @1            { megism�telj�k az ciklust                }

 { 2.3. utols� BOX }
   lds    si,mapptr     { MAPPTR a t�rk�p kezd�c�me               }
   add    si,word [@A]  { Ehhez hozz�adunk annyit, hogy a most    }
   add    si,40         { megjelen�tend� BOX-ra mutasson          }
   lodsb                { AL-be t�lti a BOX sorsz�m�t             }
   xor    ah,ah
   shl    ax,6          { AX=64�AL, AX a BOXPTR eltol�sa          }
   mov    ds,bp
   lds    si,boxptr
   add    si,ax
   add    si,word [@C]  { Most annyi pont l�tszik, amennyi az el- }
                        { s� BOX-n�l kil�gott, �s ennyit kell     }
   mov    cx,word [@D]  { csak kirajzolni                         }
   cmp    cx,0          { Ha ez nulla, nincs semmi dolgunk        }
   jz     @2
   rep    movsb         { Utols� BOX n�h�ny pontj�nak kirak�sa    }
@2:
   mov    ds,bp         { Sohase felejts�k el vissza�ll�tani a DS }
   pop    bp            { �rt�k�t, ha megv�ltoztattuk             }
   jmp    @exit

@A:dw     0             { Ezek a v�ltoz�k az�rt vannak a k�dszeg- }
@B:dw     0             { mensben, hogy el�r�s�kh�z ne kelljen az }
@C:dw     0             { eredeti adatszegmenst vissza�rni.       }
@D:dw     0
@E:dw     0             { A v�ltoz�k le�r�s�t l�sd feljebb        }
@exit:
   end;
