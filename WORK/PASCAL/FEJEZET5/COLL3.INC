@nextline:
   mov    cx,word [@cxsave] { Egy sorban ennyi pontot ellenãrzÅmk }
@scan:
   lodsb                  { Egy b†jt megvizsg†l†sa a Shape-en be- }
   cmp    al,0            { lÅl, ha nulla, †tl†tsz¢, akkor itt    }
   jz     @nil            { nem Çrintkezhet a h†ttÇrrel           }
   mov    al,es:[di]      { Ha nem nulla, Çs az ES:[DI] †ltal     }
   cmp    al,bl           { megc°mzett b†jt nem esik a megadott   }
   jc     @coll           { sz°nintervallumba, ÅtkîzÇs kîvetke-   }
   cmp    al,bh           { zett be, a @coll-ra ugrik, ahol 1-re  }
   ja     @coll           { †ll°tja a visszatÇrÇsi ÇrtÇket (AL)   }
@nil:
   inc    di              { Minden pont ellenãrzÇse ut†n nîvelni  }
   loop   @scan           { kell a DI-t is                        }
   add    di,word [@diplus] { Egy sor megvizsg†l†sa ut†n a DI Çs  }
   add    si,word [@siplus] { az SI is nîvekszik                  }
   dec    dx              { Sorsz†ml†l¢ csîkkentÇse, ha mÇg nem   }
   jnz    @nextline       { nulla, £jra vÇgrehajtjuk              }
