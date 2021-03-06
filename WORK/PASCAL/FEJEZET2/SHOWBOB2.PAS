{showbob2.pas}
{$X+}

uses Crt;               { Megint csak a billenty� miatt           }

type BOB = record       { B�jt  Le�r�s                            }
           X: word;     {  0.   A BOB abszcissz�ja, ez a 0. �s az }
                        {       1. b�jt a BOB t�pusban            }
           Y: word;     {  2.   Ordin�ta, 2-3. b�jt               }
           A: word;     {  4.   El�z� helyzet�nek c�me (4-5.)     }
           S: pointer;  {  6.   Shape mutat�ja (6-9. b�jt)        }
           H: pointer;  { 10.   Ide ker�l a BOB m�g�tti r�sz      }
           end;

var
 B: BOB;
 f: file;               { A grafikus adatokat f�jlb�l t�ltj�k be  }
 i: word;

const
 dx: shortint = 1;      { V�zszintes ir�ny jelz�je (1=jobbra)     }
 dy: shortint = 1;      { F�gg�leges ir�ny jelz�je (1=le)         }


procedure ClearBOB; assembler; asm
                        { BOB-ot let�rl� elj�r�s                  }
   lea    bx,B          { BX a BOB c�me                           }
   mov    es,sega000    { $A000 az �rt�ke a SEGA000 konstansnak   }
   mov    di,[bx+4]     { El�z� helyzet�nek c�me, elt�roltuk, �gy }
                        { nem kell ism�t kisz�molni (gyorsabb)    }
   push   ds            { A DS regiszter kell majd a MOVSW-hez    }
   lds    si,[bx+10]    { A BOB alatti h�tt�r-r�sz mutat�ja (H)   }
   mov    dx,16         { 16 sor van                              }
@1:mov    cx,8          { �s 8 sz�nyi oszlop (16)                 }
   rep    movsw         { Egy sor vissza�ll�t�sa                  }
   add    di,304        { A k�vetkez� kezd�c�me 304-gyel nagyobb  }
   dec    dx            { Sorsz�ml�l� cs�kkent�se,                }
   jnz    @1            { ism�tl�s, am�g el nem �ri a null�t      }
   pop    ds
   end;


procedure ShowBOB; assembler; asm
                        { BOB megjelen�t�se                       }

 { 1. Az �j koordin�t�k szerinti 16�16-os r�sz ment�se }

   lea    bx,B          { BX a BOB ofszetc�me (szegmensc�me: DS)  }
   mov    ax,320        { K�pc�m kisz�mol�sa a szok�sos m�don     }
   mul    word [bx+2]   { Sor c�me=320�Y                          }
   add    ax,[bx]       { K�ppont c�me=sor c�me+X                 }
   mov    [bx+4],ax     { K�pc�m elment�se (B.A sz�ba)            }
   mov    si,ax         { A forr�sindex a k�pc�m, innen olvasunk  }
   les    di,[bx+10]    { A c�lc�m a BOB rekord H mez�je          }
   push   ds            { Ugyancsak a MOVSW miatt kell a DS       }
   mov    ds,sega000    { A k�pmem�ri�b�l t�rt�nik az olvas�s     }
   mov    dx,16         { 16 sor                                  }
@1:mov    cx,8          { 16 pixel soronk�nt (16 b�jt, 8 sz�)     }
   rep    movsw         { Egy sor elment�se                       }
   add    si,304        { Forr�sindex a k�vetkez�re mutat         }
   dec    dx            { Egy sort �tm�soltunk                    }
   jnz    @1            { A t�bbi sor ment�se (ha m�g van)        }
   pop    ds

 { 2. BOB megjelen�t�se }

   mov    es,sega000    { Most ES tartalmazza a k�pszegmenset     }
   mov    di,[bx+4]     { Szerencs�re egyszer m�r kisz�moltuk a   }
                        { k�pc�met, �gy id�t �s helyet sp�rolunk  }
   push   ds            { Megint kell a DS, de most a LODSB miatt }
   lds    si,[bx+6]     { A BOB grafikus adatainak kezd�c�me      }
   mov    dx,16         { DX ism�t a sorokat sz�ml�lja            }
@2:mov    cx,16         { CX pedig a pontokat (16 pixel, 16 b�jt) }
@3:lodsb                { DS:[SI] �ltal c�mzett b�jt AL-be t�lt�se}
   cmp    al,0          { Ha ez nulla, nem �runk semmit a k�per-  }
   jz     @4            { ny�re                                   }
   mov    es:[di],al    { Egy�bk�nt kirajzoljuk                   }
@4:inc    di            { DI a k�vetkezz� k�pb�jtot c�mzi meg     }
   loop   @3            { K�vetkez� pixel megjelen�t�se           }
   add    di,304        { A k�vetkez� sor c�me                    }
   dec    dx            { Sorsz�ml�l� cs�kkent�se                 }
   jnz    @2            { Am�g nagyobb null�n�l                   }
   pop    ds
   end;


procedure Retrace; assembler; asm
                        { V�rakoz�s egy vertik�lis visszafut�sra, }
   mov    dx,03dah      { hogy a megjelen�t�s ne legyen darabos,  }
@1:in     al,dx         { vill�dz�. A vertik�lis visszafut�s ide- }
   test   al,8          { je alatt a $3DA port 3. bitje 1. Ezt    }
   jz     @1            { kell vizsg�lni                          }
   end;


begin
 with B do begin        { A B rekord mez�ivel foglalkozunk        }
  getmem( S, 256);      { 16�16=256 b�jt a Shape sz�m�ra,         }
  getmem( H, 256);      { 16�16=256 b�jt a h�tt�r r�szletnek      }
  assign( f,'rec.dat'); { A grafikus adatok a lemezen vannak, a   }
  reset( f, 1);         { REC.DAT f�jlban, sorfolytonosan         }
  blockread( f, s^, 256);
  close( f);
  x:= 0; y:= 0;         { A BOB kiindul�pontja a bal fels� sarok  }
  asm mov ax,13h; int 10h end; { MCGA                             }
  randomize;
  for i:= 1 to 1000 do mem[$a000:random( 64000)]:=random( 256);
                        { A h�tt�r tetsz�leges besz�nez�se        }
  ShowBOB;              { BOB megjelen�t�se                       }
  repeat
   Retrace;             { A sz�p, egyenletes fut�s miatt v�rako-  }
   ClearBOB;            { z�s a visszafut�sra, majd ez id� alatt  }
   ShowBOB;             { let�r�lj�k �s �jra kirakjuk a BOB-ot    }
                        { �gy nem villog, igaz, lassabb lesz      }
   inc( X, dx);         { BOB v�zszintes mozgat�sa                }
   if (X=0) or (X=304) then dx:= -dx; { K�p sz�l�n ir�nyv�lt�s    }
   inc( Y, dy);         { BOB f�gg�leges mozgat�sa                }
   if (Y=0) or (Y=184) then dy:= -dy; { K�p sz�l�n ir�nyv�lt�s    }
   until keypressed;
  readkey;              { A lenyomott billenty� kiolvas�sa        }
  asm mov ax,3; int 10h; end; { Sz�veges �zemm�d                  }
  end;
 end.

