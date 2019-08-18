{showbob2.pas}
{$X+}

uses Crt;               { Megint csak a billenty˚ miatt           }

type BOB = record       { B†jt  Le°r†s                            }
           X: word;     {  0.   A BOB abszcissz†ja, ez a 0. Çs az }
                        {       1. b†jt a BOB t°pusban            }
           Y: word;     {  2.   Ordin†ta, 2-3. b†jt               }
           A: word;     {  4.   Elãzã helyzetÇnek c°me (4-5.)     }
           S: pointer;  {  6.   Shape mutat¢ja (6-9. b†jt)        }
           H: pointer;  { 10.   Ide kerÅl a BOB mîgîtti rÇsz      }
           end;

var
 B: BOB;
 f: file;               { A grafikus adatokat f†jlb¢l tîltjÅk be  }
 i: word;

const
 dx: shortint = 1;      { V°zszintes ir†ny jelzãje (1=jobbra)     }
 dy: shortint = 1;      { FÅggãleges ir†ny jelzãje (1=le)         }


procedure ClearBOB; assembler; asm
                        { BOB-ot letîrlã elj†r†s                  }
   lea    bx,B          { BX a BOB c°me                           }
   mov    es,sega000    { $A000 az ÇrtÇke a SEGA000 konstansnak   }
   mov    di,[bx+4]     { Elãzã helyzetÇnek c°me, elt†roltuk, °gy }
                        { nem kell ismÇt kisz†molni (gyorsabb)    }
   push   ds            { A DS regiszter kell majd a MOVSW-hez    }
   lds    si,[bx+10]    { A BOB alatti h†ttÇr-rÇsz mutat¢ja (H)   }
   mov    dx,16         { 16 sor van                              }
@1:mov    cx,8          { ês 8 sz¢nyi oszlop (16)                 }
   rep    movsw         { Egy sor vissza†ll°t†sa                  }
   add    di,304        { A kîvetkezã kezdãc°me 304-gyel nagyobb  }
   dec    dx            { Sorsz†ml†l¢ csîkkentÇse,                }
   jnz    @1            { ismÇtlÇs, am°g el nem Çri a null†t      }
   pop    ds
   end;


procedure ShowBOB; assembler; asm
                        { BOB megjelen°tÇse                       }

 { 1. Az £j koordin†t†k szerinti 16û16-os rÇsz mentÇse }

   lea    bx,B          { BX a BOB ofszetc°me (szegmensc°me: DS)  }
   mov    ax,320        { KÇpc°m kisz†mol†sa a szok†sos m¢don     }
   mul    word [bx+2]   { Sor c°me=320ûY                          }
   add    ax,[bx]       { KÇppont c°me=sor c°me+X                 }
   mov    [bx+4],ax     { KÇpc°m elmentÇse (B.A sz¢ba)            }
   mov    si,ax         { A forr†sindex a kÇpc°m, innen olvasunk  }
   les    di,[bx+10]    { A cÇlc°m a BOB rekord H mezãje          }
   push   ds            { Ugyancsak a MOVSW miatt kell a DS       }
   mov    ds,sega000    { A kÇpmem¢ri†b¢l tîrtÇnik az olvas†s     }
   mov    dx,16         { 16 sor                                  }
@1:mov    cx,8          { 16 pixel soronkÇnt (16 b†jt, 8 sz¢)     }
   rep    movsw         { Egy sor elmentÇse                       }
   add    si,304        { Forr†sindex a kîvetkezãre mutat         }
   dec    dx            { Egy sort †tm†soltunk                    }
   jnz    @1            { A tîbbi sor mentÇse (ha mÇg van)        }
   pop    ds

 { 2. BOB megjelen°tÇse }

   mov    es,sega000    { Most ES tartalmazza a kÇpszegmenset     }
   mov    di,[bx+4]     { SzerencsÇre egyszer m†r kisz†moltuk a   }
                        { kÇpc°met, °gy idãt Çs helyet sp¢rolunk  }
   push   ds            { Megint kell a DS, de most a LODSB miatt }
   lds    si,[bx+6]     { A BOB grafikus adatainak kezdãc°me      }
   mov    dx,16         { DX ismÇt a sorokat sz†ml†lja            }
@2:mov    cx,16         { CX pedig a pontokat (16 pixel, 16 b†jt) }
@3:lodsb                { DS:[SI] †ltal c°mzett b†jt AL-be tîltÇse}
   cmp    al,0          { Ha ez nulla, nem °runk semmit a kÇper-  }
   jz     @4            { nyãre                                   }
   mov    es:[di],al    { EgyÇbkÇnt kirajzoljuk                   }
@4:inc    di            { DI a kîvetkezzã kÇpb†jtot c°mzi meg     }
   loop   @3            { Kîvetkezã pixel megjelen°tÇse           }
   add    di,304        { A kîvetkezã sor c°me                    }
   dec    dx            { Sorsz†ml†l¢ csîkkentÇse                 }
   jnz    @2            { Am°g nagyobb null†n†l                   }
   pop    ds
   end;


procedure Retrace; assembler; asm
                        { V†rakoz†s egy vertik†lis visszafut†sra, }
   mov    dx,03dah      { hogy a megjelen°tÇs ne legyen darabos,  }
@1:in     al,dx         { vill¢dz¢. A vertik†lis visszafut†s ide- }
   test   al,8          { je alatt a $3DA port 3. bitje 1. Ezt    }
   jz     @1            { kell vizsg†lni                          }
   end;


begin
 with B do begin        { A B rekord mezãivel foglalkozunk        }
  getmem( S, 256);      { 16û16=256 b†jt a Shape sz†m†ra,         }
  getmem( H, 256);      { 16û16=256 b†jt a h†ttÇr rÇszletnek      }
  assign( f,'rec.dat'); { A grafikus adatok a lemezen vannak, a   }
  reset( f, 1);         { REC.DAT f†jlban, sorfolytonosan         }
  blockread( f, s^, 256);
  close( f);
  x:= 0; y:= 0;         { A BOB kiindul¢pontja a bal felsã sarok  }
  asm mov ax,13h; int 10h end; { MCGA                             }
  randomize;
  for i:= 1 to 1000 do mem[$a000:random( 64000)]:=random( 256);
                        { A h†ttÇr tetszãleges besz°nezÇse        }
  ShowBOB;              { BOB megjelen°tÇse                       }
  repeat
   Retrace;             { A szÇp, egyenletes fut†s miatt v†rako-  }
   ClearBOB;            { z†s a visszafut†sra, majd ez idã alatt  }
   ShowBOB;             { letîrîljÅk Çs £jra kirakjuk a BOB-ot    }
                        { °gy nem villog, igaz, lassabb lesz      }
   inc( X, dx);         { BOB v°zszintes mozgat†sa                }
   if (X=0) or (X=304) then dx:= -dx; { KÇp szÇlÇn ir†nyv†lt†s    }
   inc( Y, dy);         { BOB fÅggãleges mozgat†sa                }
   if (Y=0) or (Y=184) then dy:= -dy; { KÇp szÇlÇn ir†nyv†lt†s    }
   until keypressed;
  readkey;              { A lenyomott billenty˚ kiolvas†sa        }
  asm mov ax,3; int 10h; end; { Szîveges Åzemm¢d                  }
  end;
 end.

