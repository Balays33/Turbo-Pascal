{coll2.inc}

function BOB.Collision( var B: BOB): boolean; assembler; asm
   jmp    @start        { K�dszegmensben t�rolt v�ltoz�k �tugr�sa }

@W:dw     0             { ABW, a k�z�s r�sz sz�less�ge            }
@H:dw     0             { ABH, a k�z�s r�sz magass�ga             }
@A:dw     0             { AX1+AX2 �sszeget t�roljuk itt           }
@B:dw     0             { BX1+BX2 �sszeg                          }

@start:
   mov    di,word [Self] { [DI] az A BOB adatainak kezd�c�me      }
   mov    si,word [B]   { B BOB adataira pedig az [SI] mutat      }
   push   ds            { DS is kell                              }

 { 1. Megvizsg�ljuk, hogy vannak-e k�z�s pontjaik }

   mov    ax,[di]       { Ha valamelyik BOB nem akt�v, nem kell   }
   and    ax,[si]       { tov�bb vizsg�l�dni, nem �rintkezhetnek, }
   jz     @nocoll       { mert az egyik nem l�tszik               }
   mov    ax,[di+2]     { 'A' BOB abszcissz�ja                    }
   add    ax,[di+18]    { 'A' BOB sz�less�g�t hozz�adjuk          }
   cmp    ax,[si+2]     { 'B' BOB ett�l jobbra van-e?             }
   jng    @nocoll       { Ha igen, nem �rintkezhetnek             }
   mov    XA,ax         { Az �sszeget t�roljuk                    }
   mov    ax,[di+4]     { Ugyanezt megvizsg�ljuk, csak f�gg�lege- }
   add    ax,[di+20]    { sen                                     }
   cmp    ax,[si+4]
   jng    @nocoll
   mov    YA,ax         { Id�sp�rol�s miatt Y+H-t is elmentj�k    }
   mov    ax,[si+2]     { J�het a m�sik k�t vizsg�lat:            }
   add    ax,[si+18]    { v�zszintesen...                         }
   cmp    ax,[di+2]
   jng    @nocoll
   mov    XB,ax
   mov    ax,[si+4]     { ... �s f�gg�legesen                     }
   add    ax,[si+20]
   cmp    ax,[di+4]
   jng    @nocoll
   mov    YB,ax

 { 2. Most m�r biztos, hogy van a k�t BOB-nak k�z�s ter�lete,
      meg kell hat�rozni annak m�ret�t �s hely�t }

 { 2.1. �rt�ket adunk az AX1-BY2 v�ltoz�knak }
   mov    ax,[si+2]
   sub    ax,[di+2]
   mov    AX1,ax
   mov    ax,[si+4]
   sub    ax,[di+4]
   mov    AY1,ax
   mov    ax,[di+2]
   sub    ax,[si+2]
   mov    BX1,ax
   mov    ax,[di+4]
   sub    ax,[si+4]
   mov    BY1,ax
   mov    ax,XA
   sub    ax,XB
   mov    AX2,ax
   mov    ax,YA
   sub    ax,YB
   mov    AY2,ax
   mov    ax,XB
   sub    ax,XA
   mov    BX2,ax
   mov    ax,YB
   sub    ax,YA
   mov    BY2,ax

 { 2.2. Amelyik ezek k�z�l negat�v, null�ra v�ltozik }
     cmp  ax1,0
     jg   @A1
     mov  ax1,0
@A1: cmp  ax2,0
     jg   @A2
     mov  ax2,0
@A2: cmp  ay1,0
     jg   @A3
     mov  ay1,0
@A3: cmp  ay2,0
     jg   @A4
     mov  ay2,0
@A4: cmp  bx1,0
     jg   @B1
     mov  bx1,0
@B1: cmp  bx2,0
     jg   @B2
     mov  bx2,0
@B2: cmp  by1,0
     jg   @B3
     mov  by1,0
@B3: cmp  by2,0
     jg   @B4
     mov  by2,0
@B4:

   mov    ax,ax1        { Az AX1+AX2 �sszeg a sorok v�g�n az ug-  }
   add    ax,ax2        { r�shoz sz�ks�gesek, ez�rt t�roljuk a    }
   mov    word [@A],ax  { k�dszegmensben                          }
   mov    ax,bx1        { Ugyan�gy a BX1+BX2 �sszeget is          }
   add    ax,bx2
   mov    word [@B],ax
   mov    ax,[di+18]    { M�r csak az �sszehasonl�tand� ter�let   }
   sub    ax,word [@A]  { m�reteit kell megadni:                  }
   mov    word [@W],ax  {  sz�less�ge: A.W-(AX1+AX2)              }
   mov    ax,[di+20]
   sub    ax,ay1
   sub    ax,ay2
   mov    word [@H],ax  {  magass�ga:  A.H-AY1-AY2                }

 { 2.3. Regiszterek be�ll�t�sa, kezd�c�mek kisz�mol�sa }
   mov    ax,[di+10]    { AX: az aktu�lis f�zis t�vols�ga         }
   mul    word [di+16]  {     (f�zissz�m�f�zishossz)              }
   mov    cx,ax         { AX ideiglenes t�rol�sa                  }
   mov    ax,[di+18]    { Meghat�rozzuk az A BOB-on bel�l a vizs- }
   mul    ay1           { g�lt tartom�ny kezd�pontj�t:            }
   add    ax,cx
   add    ax,ax1        { A.W�AY1+AX1 (+f�zis�f�zishossz)         }
   les    di,[di+12]    { ES:[DI] a Shape kezd�c�m�re mutat       }
   add    di,ax         { Most m�r az els� vizsg�land� pontra     }

   mov    ax,[si+10]    { Ugyanezeket a sz�m�t�sokat B-re is el-  }
   mul    word [si+16]  { v�gezz�k                                }
   mov    cx,ax
   mov    ax,[si+18]
   mul    by1           { Kezd� pont: B.P�B.PL+B.W�BY1+BX1        }
   add    ax,cx
   add    ax,bx1
   lds    si,[si+12]    { A B Shape-re a DS:[SI] mutat            }
   add    si,ax         { SI-hez hozz�adjuk a fenti �rt�ket       }

 { 3. �sszehasonl�t�s }

   mov    dx,word [@H]  { DX szok�s szerint a sorsz�ml�l�         }
@nextline:
   mov    cx,word [@W]  { CX pedig a pontokat sz�ml�lja           }
@scan:
   lodsb                { Egy pont a B-Shape-b�l                  }
   cmp    al,0          { Ha nulla, akkor ott a k�t BOB nem       }
   jz     @nil          { �rintkezhet                             }
   mov    al,es:[di]    { Ha nem nulla, megvizsg�ljuk, hogy az A  }
   cmp    al,0          { BOB ezen a helyen �tl�tsz�-e            }
   jnz    @coll         { Ha nem, �tk�z�s van                     }
@nil:
   inc    di            { DI n�vel�se (SI a LODSB miatt n�tt)     }
   loop   @scan         { Egy sor letapogat�sa                    }
   add    di,word [@A]  { DI �s SI n�vel�se, hogy a k�vetkez� sor }
   add    si,word [@B]  { AX1. ill BX1. oszlop�ra mutasson        }
   dec    dx            { Sorsz�ml�l� cs�kkent�se                 }
   jnz    @nextline     { �sszes sor letapogat�sa                 }

@nocoll:                { Ha nincs �tk�z�s                        }
   mov    al,0          { AL=0, teh�t a f�ggv�ny�rt�k FALSE       }
   jmp    @exit
@coll:
   mov    al,1          { Ellenben AL=1, TRUE                     }
@exit:
   pop    ds            { Eredeti DS                              }

 end;
