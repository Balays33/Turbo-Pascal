@nextline:
   mov    cx,word [@cxsave] { Egy sorban ennyi pontot ellen�rz�mk }
@scan:
   lodsb                  { Egy b�jt megvizsg�l�sa a Shape-en be- }
   cmp    al,0            { l�l, ha nulla, �tl�tsz�, akkor itt    }
   jz     @nil            { nem �rintkezhet a h�tt�rrel           }
   mov    al,es:[di]      { Ha nem nulla, �s az ES:[DI] �ltal     }
   cmp    al,bl           { megc�mzett b�jt nem esik a megadott   }
   jc     @coll           { sz�nintervallumba, �tk�z�s k�vetke-   }
   cmp    al,bh           { zett be, a @coll-ra ugrik, ahol 1-re  }
   ja     @coll           { �ll�tja a visszat�r�si �rt�ket (AL)   }
@nil:
   inc    di              { Minden pont ellen�rz�se ut�n n�velni  }
   loop   @scan           { kell a DI-t is                        }
   add    di,word [@diplus] { Egy sor megvizsg�l�sa ut�n a DI �s  }
   add    si,word [@siplus] { az SI is n�vekszik                  }
   dec    dx              { Sorsz�ml�l� cs�kkent�se, ha m�g nem   }
   jnz    @nextline       { nulla, �jra v�grehajtjuk              }
