{coll2.inc}

function BOB.Collision( var B: BOB): boolean; assembler; asm
   jmp    @start        { K¢dszegmensben t†rolt v†ltoz¢k †tugr†sa }

@W:dw     0             { ABW, a kîzîs rÇsz szÇlessÇge            }
@H:dw     0             { ABH, a kîzîs rÇsz magass†ga             }
@A:dw     0             { AX1+AX2 îsszeget t†roljuk itt           }
@B:dw     0             { BX1+BX2 îsszeg                          }

@start:
   mov    di,word [Self] { [DI] az A BOB adatainak kezdãc°me      }
   mov    si,word [B]   { B BOB adataira pedig az [SI] mutat      }
   push   ds            { DS is kell                              }

 { 1. Megvizsg†ljuk, hogy vannak-e kîzîs pontjaik }

   mov    ax,[di]       { Ha valamelyik BOB nem akt°v, nem kell   }
   and    ax,[si]       { tov†bb vizsg†l¢dni, nem Çrintkezhetnek, }
   jz     @nocoll       { mert az egyik nem l†tszik               }
   mov    ax,[di+2]     { 'A' BOB abszcissz†ja                    }
   add    ax,[di+18]    { 'A' BOB szÇlessÇgÇt hozz†adjuk          }
   cmp    ax,[si+2]     { 'B' BOB ettãl jobbra van-e?             }
   jng    @nocoll       { Ha igen, nem Çrintkezhetnek             }
   mov    XA,ax         { Az îsszeget t†roljuk                    }
   mov    ax,[di+4]     { Ugyanezt megvizsg†ljuk, csak fÅggãlege- }
   add    ax,[di+20]    { sen                                     }
   cmp    ax,[si+4]
   jng    @nocoll
   mov    YA,ax         { Idãsp¢rol†s miatt Y+H-t is elmentjÅk    }
   mov    ax,[si+2]     { Jîhet a m†sik kÇt vizsg†lat:            }
   add    ax,[si+18]    { v°zszintesen...                         }
   cmp    ax,[di+2]
   jng    @nocoll
   mov    XB,ax
   mov    ax,[si+4]     { ... Çs fÅggãlegesen                     }
   add    ax,[si+20]
   cmp    ax,[di+4]
   jng    @nocoll
   mov    YB,ax

 { 2. Most m†r biztos, hogy van a kÇt BOB-nak kîzîs terÅlete,
      meg kell hat†rozni annak mÇretÇt Çs helyÇt }

 { 2.1. êrtÇket adunk az AX1-BY2 v†ltoz¢knak }
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

 { 2.2. Amelyik ezek kîzÅl negat°v, null†ra v†ltozik }
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

   mov    ax,ax1        { Az AX1+AX2 îsszeg a sorok vÇgÇn az ug-  }
   add    ax,ax2        { r†shoz szÅksÇgesek, ezÇrt t†roljuk a    }
   mov    word [@A],ax  { k¢dszegmensben                          }
   mov    ax,bx1        { Ugyan°gy a BX1+BX2 îsszeget is          }
   add    ax,bx2
   mov    word [@B],ax
   mov    ax,[di+18]    { M†r csak az îsszehasonl°tand¢ terÅlet   }
   sub    ax,word [@A]  { mÇreteit kell megadni:                  }
   mov    word [@W],ax  {  szÇlessÇge: A.W-(AX1+AX2)              }
   mov    ax,[di+20]
   sub    ax,ay1
   sub    ax,ay2
   mov    word [@H],ax  {  magass†ga:  A.H-AY1-AY2                }

 { 2.3. Regiszterek be†ll°t†sa, kezdãc°mek kisz†mol†sa }
   mov    ax,[di+10]    { AX: az aktu†lis f†zis t†vols†ga         }
   mul    word [di+16]  {     (f†zissz†mûf†zishossz)              }
   mov    cx,ax         { AX ideiglenes t†rol†sa                  }
   mov    ax,[di+18]    { Meghat†rozzuk az A BOB-on belÅl a vizs- }
   mul    ay1           { g†lt tartom†ny kezdãpontj†t:            }
   add    ax,cx
   add    ax,ax1        { A.WûAY1+AX1 (+f†zisûf†zishossz)         }
   les    di,[di+12]    { ES:[DI] a Shape kezdãc°mÇre mutat       }
   add    di,ax         { Most m†r az elsã vizsg†land¢ pontra     }

   mov    ax,[si+10]    { Ugyanezeket a sz†m°t†sokat B-re is el-  }
   mul    word [si+16]  { vÇgezzÅk                                }
   mov    cx,ax
   mov    ax,[si+18]
   mul    by1           { Kezdã pont: B.PûB.PL+B.WûBY1+BX1        }
   add    ax,cx
   add    ax,bx1
   lds    si,[si+12]    { A B Shape-re a DS:[SI] mutat            }
   add    si,ax         { SI-hez hozz†adjuk a fenti ÇrtÇket       }

 { 3. ôsszehasonl°t†s }

   mov    dx,word [@H]  { DX szok†s szerint a sorsz†ml†l¢         }
@nextline:
   mov    cx,word [@W]  { CX pedig a pontokat sz†ml†lja           }
@scan:
   lodsb                { Egy pont a B-Shape-bãl                  }
   cmp    al,0          { Ha nulla, akkor ott a kÇt BOB nem       }
   jz     @nil          { Çrintkezhet                             }
   mov    al,es:[di]    { Ha nem nulla, megvizsg†ljuk, hogy az A  }
   cmp    al,0          { BOB ezen a helyen †tl†tsz¢-e            }
   jnz    @coll         { Ha nem, ÅtkîzÇs van                     }
@nil:
   inc    di            { DI nîvelÇse (SI a LODSB miatt nãtt)     }
   loop   @scan         { Egy sor letapogat†sa                    }
   add    di,word [@A]  { DI Çs SI nîvelÇse, hogy a kîvetkezã sor }
   add    si,word [@B]  { AX1. ill BX1. oszlop†ra mutasson        }
   dec    dx            { Sorsz†ml†l¢ csîkkentÇse                 }
   jnz    @nextline     { ôsszes sor letapogat†sa                 }

@nocoll:                { Ha nincs ÅtkîzÇs                        }
   mov    al,0          { AL=0, teh†t a fÅggvÇnyÇrtÇk FALSE       }
   jmp    @exit
@coll:
   mov    al,1          { Ellenben AL=1, TRUE                     }
@exit:
   pop    ds            { Eredeti DS                              }

 end;
