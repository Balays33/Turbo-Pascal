procedure HLine; assembler; asm { H=Horizontal Line-v�zsz. sor    }
   push   bp            { BP is a DS-t t�rolja, hogy ne kelljen   }
   mov    bp,ds         { a vermbe menteni, mert az sok id�       }
   xor    cx,cx         { CX sz�ml�lja majd a kirakott BOX-sorokat}
@1:
   push   cx            { Itt a CX a REP utas�t�shoz kell         }
   les    di,mapptr     { MAPPTR a t�rk�p kezd�c�me               }
   add    di,cx         { DI a t�rk�p CX. b�jtj�ra mutat          }
   mov    al,es:[di]    { AL a t�rk�p aktu�lis b�jtja             }
   xor    ah,ah         { A szorz�s miatt az AX fels� b�jtja 0    }
   mov    bx,64         { Egy BOX m�rete 64 b�jt                  }
   mul    bx            { AX a kirakand� BOX eltol�si c�me        }
   les    di,background { A c�lc�m a h�tt�r egy b�jtja            }
   lds    si,boxptr     { A forr�sc�m a BOXPTR egy b�jtja         }
   add    si,ax         { DS:[SI] m�r a kirakand� BOX-ra mutat    }
   mov    ax,8          { DI c�lindexet is be�llitjuk, hogy a     }
   mul    cx            { h�tt�r kell� b�jtj�ra mutasson          }
   add    di,ax         { DI:= DI+CX*8 (CX a sz�ml�l�)            }
   mov    cx,4          { 8 b�jt=4 sz� mozgat�sa k�vetkezik       }
   cld
   rep    movsw         { Egy BOX egy sor�nak megjelenit�se       }
   mov    ds,bp         { Az eredeti adatszegmens vissza�llit�sa  }
   pop    cx            { CX a BOX-okat sz�ml�lja                 }
   inc    cx            { Sz�ml�l� n�vel�se                       }
   cmp    cx,40         { El�rte-e a 40-et? (Ennyit kell kirakni) }
   jnz    @1            { Ha m�g nem, megism�telj�k az eg�szet    }
   pop    bp
   end;
