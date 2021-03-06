procedure HLine( L: word); assembler; asm
                        { A t�rk�p L. sor�nak megjelen�t�se       }
   mov    ax,L          { El�sz�r kisz�moljuk az els� b�jt c�m�t  }
   mov    cx,ax         { CX-be is bevissz�k                      }
   shr    ax,3          { 8-cal val� oszt�s=3 bit forgat�s jobbra }
   mov    bx,40         { 40 BOX-b�l �ll egy sor                  }
   mul    bx            { Az els� t�k�p-b�jt eltol�si c�me AX-ben }
   mov    word [@A],ax  { Elt�roljuk, ne kelljen �jra kisz�molni  }
   mov    ax,320        { Az els� pixel c�me: 320�L               }
   mul    cx
   mov    word [@B],ax  { Ezt is elt�roluk, id�t sp�rolunk vele   }
   and    cx,7          { Als� 3 bit marad, t�bbi 0               }
   shl    cx,3          { 8-cal szorzunk, CX: BOX-on bel�li elto- }
                        { l�si c�m                                }
   mov    word [@C],cx  { Ezt is megjegyezz�k                     }
   push   bp            { A BP regiszterre nincs sz�ks�g, �gy az  }
   mov    bp,ds         { t�rolhatja az adatszegmensregisztert    }
   xor    cx,cx         { CX sz�ml�lja a b�jtokat, 8-as�val       }
@1:
   push   cx            { A sorkirak�sn�l pixelsz�ml�l� lesz      }
   lds    si,mapptr     { MAPPTR a t�rk�p kezd�c�me               }
   add    si,word [@A]  { A megjelen�tend� sor els� b�jtja        }
   add    si,cx         { Most m�r az aktu�lis (CX.) b�jt         }
   lodsb                { AL a t�rk�p aktu�lis b�jtja             }
   xor    ah,ah         { AX fels� b�jtja 0                       }
   shl    ax,6          { AX SHL 6 = AX�64, csak gyorsabb         }
   mov    ds,bp         { DS ism�t az eredeti adatszegmens        }
   les    di,background { A c�lc�m a h�tt�r egy b�jtja            }
   add    di,word [@B]  { N�velj�k a c�lc�met, a sor els� b�jtja  }
   shl    cx,3          { M�g n�velj�k, hogy a k�v�nt b�jtra mu-  }
   add    di,cx         { tasson (DI:=DI+320�L+CX�8)              }
   lds    si,boxptr     { A forr�sc�m a BOXPTR egy b�jtja         }
   add    si,ax         { DS:[SI] m�r a kirakand� BOX-ra mutat    }
   add    si,word [@C]  { �s m�r a megfelel� sor�nak 1. b�jtj�ra  }
   mov    cx,4          { 8 b�jt=4 sz� mozgat�sa k�vetkezik       }
   cld
   rep    movsw         { Egy BOX egy sor�nak megjelenit�se       }
   mov    ds,bp         { Az eredeti adatszegmens vissza�llit�sa  }
   pop    cx            { CX a BOX-okat sz�ml�lja                 }
   inc    cx            { Sz�ml�l� n�vel�se                       }
   cmp    cx,40         { El�rte-e a 40-et? (Ennyit kell kirakni) }
   jnz    @1            { Ha m�g nem, megism�telj�k az eg�szet    }
   pop    bp
   jmp    @exit
@a:dw     0             { N�h�ny v�ltoz�t a k�dszegmensben helye- }
@b:dw     0             { z�nk el, �gy �rt�k�k kiolvas�s�hoz nem  }
@c:dw     0             { kell az eredeti adatszegmens            }
@exit:
   end;
