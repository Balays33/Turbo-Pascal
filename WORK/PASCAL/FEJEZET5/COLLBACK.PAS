{collback.pas }

uses Crt, DOS;

type BOB = object
       A : wordbool;    { Aktivit†s-jelzã. Ha TRUE akkor l†that¢  }
       X : integer;     { X koordin†ta (abszcissza)               }
       Y : integer;     { Y koordin†ta (ordin†ta)                 }
       LX: word;        { SzÇlessÇg (lx=0-n†l ez 1 kÇppont)       }
       LY: word;        { Magass†g  (ly=0-n†l ez 1 kÇppont)       }
       P : word;        { F†zissz†ml†l¢ (p=0 : elsã f†zis)        }
       DT: pointer;     { Shape helye a mem¢ri†ban                }
       PL: word;        { Egy f†zis helyfoglal†sa                 }
       W : word;        { Val¢s†gos szÇlessÇg (width )            }
       H : word;        { Val¢s†gos magass†g  (height)            }
       LN: word;        { Shape helyfoglal†sa b†jtban             }
       PN: word;        { F†zissz†m (f†zisok 0-val kezdãdnek)     }
       procedure Load( FileName: string);
                        { Shape betîltÇse lemezrãl                }
       function CollColors: boolean;
                        { H†ttÇrrel ÅtkîzÇs vizsg†lata            }
       end;


const Bnum = 0;         { Egy BOB megjelen°tÇse                   }
      Blen = sizeof(BOB); { BOB t°pus hossza }
      Retrace: boolean = true; { Vertik†lis visszafut†s-jelzã     }
 CFirst:     byte    = 0;
 CLast:      byte    = 0;


var B: array[0..Bnum] of BOB; { BOB-ok nem-grafikus adatai        }
    BackGround:pointer; { H†ttÇr mutat¢ja                         }
    WorkArea:  pointer; { MunkaterÅlet mutat¢ja                   }
    u,v: integer;       { A SHOWBOB elj†r†s haszn†lja ãket        }
    x1, y1, x2, y2, dxx, pnt, bobseg, daa,
    xa,xb,ya,yb,
    ax1,ax2,ay1,ay2,
    bx1,bx2,by1,by2: word;  { V†ltoz¢k az ÅtkîzÇsvizsg†lathoz     }
    i: word;            { µltal†nos cÇl£ v†ltoz¢ (FOR ciklushoz)  }

     KEY: array [0..255] of boolean;
                        { Most 2û128 elem˚ a tîmb                 }
     OLD: procedure;    { A rÇgi megszakt†svektor                 }

function BOB.CollColors; assembler; asm
   push   bp               { BP regisztert adatt†rol†sra haszn†ljuk }
   cld
   mov    bx,word ptr (self) { [BX]: offset BOB }

   mov    al,[bx]
   cmp    al,0
   jz     @noColl         { Ha nem aktiv: kîvetkezã }
   mov    ax,[bx+2]        { AX = X koordin†ta }
   cmp    ax,320
   jge    @noColl
   mov    x1,ax            { X1 = X }
   mov    ax,[bx+4]        { Y }
   cmp    ax,200
   jge    @noColl
   mov    y1,ax            { Y1 = Y }
   mov    ax,[bx+6]        { lx }
   add    ax,[bx+2]
   jnge   @noColl
   mov    x2,ax            { X2 = X+LX }
   mov    ax,[bx+8]        { ly }
   add    ax,[bx+4]
   jnge   @noColl
   mov    y2,ax            { Y2 = Y+LY }

   les    si,[bx+12]       { ES:[SI]^ = DT }
   mov    ax,[bx+16]       { AX = PL }
   mul    word ptr [bx+10]
   add    si,ax            { ES:[SI]^ = kîvetkezã f†zis }

   cmp    x1,0
   jnge   @halfout
   cmp    y1,0
   jnge   @halfout
   cmp    x2,319
   jg     @halfout
   mov    ax,200
   cmp    y2,ax
   jge    @halfout         { Ha kil¢g valamerre a @HALFOUT-ra ugrik }

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã kirakand¢ pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    dxx,dx
   mov    dl,cfirst
   mov    dh,clast
   mov    bp,ds            { DS elmentÇse }
   pop    bobseg           { Az elãzãleg elmentett ES->BOBSeg }

   mov    cx,[bx+20]       { CX = kirakand¢ sorok sz†ma }
@NextLine:
   push   cx
   mov    cx,[bx+18]       { CX = 1 sorban lÇvã pontok }
   mov    ds,BOBSeg        { DS:[SI]^ = shape (aktu†lis f†zis) }
@Controll:
   lodsb
   cmp    al,0
   jz     @nil
   mov    al,es:[di]
   cmp    al,dl
   jc     @Coll
   cmp    al,dh
   ja     @Coll
@Nil:
   inc    di
   loop   @Controll
   mov    ds,bp            { Vissza az eredeti DS a BP-bãl }
   add    di,dxx           { DI = kîv. sor }
   pop    cx
   loop   @NextLine        { kîv. sor }

@NoColl:
   mov    al,0
   jmp    @exit

@HalfOut:
   mov    cx,[bx+20]      { CX-be a BOB magass†ga }
   cmp    y1,0
   jge    @notup           { Ha nem felÅl l¢g ki a @NOTUP-ra ugrik }
   mov    ax,y1
   neg    ax               { AX=-AX }
   sub    cx,ax            { A kirakand¢ sorok csîkkennek }
   mov    dx,[bx+18]       { DX-be a szÇlessÇg }
   mul    dx
   add    si,ax            { SI most a shape kezdã sor†ra mutat }
   mov    y1,0             { Y koordin†ta null†z†sa }
@NotUp:
   mov    dxx,0            { A shape-en belÅli lÇpÇskîz null†z†sa }
   mov    ax,[bx+18]
   mov    pnt,ax           { PNT = 1 sorban kirakand¢ pontok sz†ma }
   cmp    x1,0
   jge    @notleft         { Ha nem baloldalt l¢g ki a @NOTLEFT-re ugrik }
   mov    ax,x1
   neg    ax
   add    si,ax
   mov    dxx,ax           { A lÇpÇskîz AX-szel nã }
   sub    pnt,ax           { A kirakand¢ pontok sz†ma -X1-gyel csîkken }
   mov    x1,0             { X koordin†ta null†z†sa }
@NotLeft:
   cmp    x2,319
   jng    @NotRight
   mov    ax,x2
   sub    ax,319
   add    dxx,ax          { A lÇpÇskîz X2-319-cel nã }
   sub    pnt,ax          { A kirakand¢ pontok sz†ma X2-319-cel csîkken }
   mov    x2,319
@NotRight:
   mov    ax,y2
   cmp    ax,200
   jnge   @NotDown
   sub    ax,200
   sub    cx,ax           { CX=CX-(Y2-AREAY) }
   sub    cx,1
@NotDown:

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    daa,dx
   mov    dl,cfirst
   mov    dh,clast
   pop    ax               { Az elãzãleg elmentett ES->AX }

@2NextLine:
   push   cx
   mov    cx,pnt           { CX = 1 sorban lÇvã kirakand¢ pontok }
   push   ds
   push   ax
   mov    ds,ax            { DS:[SI]^ = shape (aktu†lis f†zis) }
@2Controll:
   lodsb
   cmp    al,0
   jz     @2nil
   mov    al,es:[di]
   cmp    al,dl
   jc     @2Coll
   cmp    al,dh
   ja     @2Coll
@2Nil:
   inc    di
   loop   @2Controll
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   add    di,daa           { DI = kîv. sor }
   add    si,dxx           { SI = kîv. shape sor }
   loop   @2NextLine       { kîv. sor }

   mov    al,0
   jmp    @exit
@2Coll:
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   mov    al,1
   jmp    @exit
@Coll:
   pop    cx
   mov    ds,bp
   mov    al,1
@Exit:
   pop    bp
 end;

procedure BOB.Load;
 var f: file;
 begin
  assign( f, FileName);
  reset( f, 1);
  seek( f, 1);          { A f†jl elsã b†jtja nem haszn†latos      }
  blockread( f, LX, 2); { A 2-3. b†jt a Shape szÇlessÇgÇt adja    }
  blockread( f, LY, 2); { A 4-5. pedig a magass†g†t               }
  blockread( f, PN, 2); { Ezt kîvetã sz¢ a f†zisok sz†ma          }
  W:= LX+1; H:= LY+1;   { Az igazi mÇretek eggyel nagyobbak       }
  PL:= W*H;             { Egy f†zis hossza = szÇlessÇg û magass†g }
  LN:= PL*(PN+1);       { Shape hossza = f†zishossz û f†zissz†m   }
  getmem( DT, LN);      { Helyfoglal†s a Shape-nek                }
  blockread( f,DT^,LN); { Grafikus adatok betîltÇse               }
  close( f);
  A:= true;             { Bekapcsoljuk, hogy l†that¢ legyen       }
  P:= 0;                { A f†zismutat¢t az elsãre †ll°tjuk       }
  end;

procedure ShowBOB; assembler; asm
                        { Ez a fã elj†r†s, a megjelen°tÇst vÇgzi  }
 { 1. H†ttÇr m†sol†sa a munkaterÅletre }

   push   bp            { BP regisztert m†sra haszn†ljuk,         }
   mov    bp,ds         { az adatszegmenset t†roljuk benne        }
   mov    cx,32000      { A h†ttÇr hossza 32000 sz¢ (64000 b†jt)  }
   cld                  { D-jelzãbit tîrlÇse a REP utas°t†shoz    }
   les    di,workarea   { ES:[DI] mutat a munkaterÅletre          }
   lds    si,background { DS:[SI] pedig a h†ttÇrre                }
   rep    movsw         { H†ttÇr m†sol†sa a munkaterÅletre        }
   mov    ds,bp         { DS £jra az eredeti adatszegmens         }

 { 2. BOB-ok rajzol†sa a munkaterÅletre }

   mov    cx,bnum       { BNUM BOB kirak†s†r¢l kell gondoskodni   }
@putbob:                { Egy BOB kirak†sa ciklus kezdete         }
   push   cx            { CX-et majd m†sra haszn†ljuk (oszlopsz†m-}
                        { l†l¢ lesz a sorok megrajzol†s†n†l)      }
   lea    bx,B          { BX:= B tîmb ofszetc°me                  }
   mov    ax,blen
   mul    cx            { BX-hez hozz†adunk annyit, hogy az Çppen }
   add    bx,ax         { aktu†lis (CX.) BOB-ra mutasson          }

 { 2.1. EllenãrizzÅk, hogy a BOB, koordin†t†i alapj†n l†that¢-e }

   cmp    word [bx],0   { Az aktivit†st jelzã sz¢ ellenãrzÇse     }
   jz     @nextbob      { Ha hamis, akkor nem szabad kirajzolni   }
   cmp    word [bx+2],320 { Ha X>=320, akkor nem l†that¢, ugr†s a }
   jge    @nextbob      { kîvetkezã BOB-ra                        }
   cmp    word [bx+4],200 { Ha Y>=200, akkor a kÇpernyã alja a-   }
   jge    @nextbob      { latt van, ezÇrt nem kell megjelenteni   }
   mov    ax,[bx+6]     { Amikor balra helyezkedik el a kÇpernyã- }
   add    ax,[bx+2]     { tãl, LX+X<=0                            }
   jnge   @nextbob      { Ekkor se kell †br†zolni                 }
   mov    u,ax          { LX+X-et t†roljuk, mert kÇsãbb mÇg szÅk- }
   mov    ax,[bx+8]     { sÇg lesz r†, nem kell £jra kisz†molni   }
   add    ax,[bx+4]
   jnge   @nextbob      { Ha LY+Y<=0, akkor ugr†s a kîvetkezãre   }
   mov    v,ax          { LY+Y-t is megjegyezzÅk                  }
   neg    u
   add    u,319         { U=320-X-W                               }
   neg    v
   add    v,199         { V=200-Y-H                               }

 { 2.2. Meghat†rozzuk a BOB l†that¢ rÇszÇt }

   les    si,[bx+12]    { ES:[SI] mutat most a grafikus adatokra  }
   mov    ax,[bx+16]    { [BX+16] = egy f†zis hossza (PL)         }
   mul    word [bx+10]  { [BX+10] az aktu†lis f†zis (P)           }
   add    si,ax         { SI a Shape aktu†lis f†zis†ra mutat      }
   push   es            { ES-t t†roljuk, kÇsãbb ez lesz a DS      }
   les    di,workarea   { ES:[DI] a munkaterÅlet mutat¢ja         }
   mov    ax,320        { Kisz†moljuk a kÇpc°met, mintha norm†li- }
   mul    word [bx+4]   { san †br†zoln†nk (CIM=320ûY+X)           }
   add    ax,[bx+2]     { KÇsãbb majd ezt fogjuk m¢dostani        }
   add    di,ax         { DI=320ûY+X                              }

 { 2.2.1. Ha a kÇp felsã szÇlÇn helyezkedik el }
   mov    dx,[bx+20]    { DX a sorsz†ml†l¢ az †br†zol†sn†l        }
   mov    ax,320        { Egy sor kirajzol†sa ut†n DI-t @DIPLUS-  }
   sub    ax,[bx+18]    { szal kell nîvelni, amelynek ÇrtÇke      }
   mov    word [@diplus],ax { eleinte: 320-W                      }
   mov    word [@siplus],0 { @SIPLUS: amit SI-hez kell adni egy   }
                        { sor kirak†sa ut†n. Eleinte ez nulla     }
   cmp    word [bx+4],0 { [BX+4] a BOB ordin†t†ja (Y)             }
   jge    @left         { Ha ez nem negat°v, lÇpÅnk tov†bb        }
   add    dx,[bx+4]     { ôsszesen H+Y sort kell kirakni          }
   mov    di,[bx+2]     { DI ÇrtÇke X, kîzvetlenÅl a kÇpernyã     }
                        { tetejÇtãl kezdve rajzoljuk a pontokat   }
   add    di,word [workarea] { DI-hez mÇg hozz†adjuk a munkaterÅ- }
   mov    ax,[bx+4]     { let ofszetc°mÇt }
   neg    ax
   push   dx
   mul    word [bx+18]  { Csak a -Y. sort¢l kezdve kell megjele-  }
   pop    dx
   add    si,ax         { n°teni, ezÇrt SI-hez hozz†adunl -YûW-t  }

 { 2.2.2. Bal oldal }
@left:
   mov    cx,[bx+18]    { CX: h†ny pontot kell egy sorban kirakni }
   cmp    word [bx+2],0 { [BX+2] a BOB abszcissz†ja (X)           }
   jge    @right        { Ha nem negat°v, a jobb oldalt vizsg†lja }
   sub    di,[bx+2]     { KîzvetlenÅl a bal szÇlÇn kezdÅnk        }
   mov    ax,[bx+2]     { @DIPLUS ÇrtÇkÇt X-szel csîkkentjÅk,     }
   sub    word [@diplus],ax { vagyis @DIPLUS nã                   }
   neg    ax
   add    word [@siplus],ax { @SIPLUS nã (-X-szel)                }
   add    si,ax         { A -X. oszlopt¢l kezdjÅk a sorokat       }
   sub    cx,ax         { Oszlopsz†ml†l¢ csîkkentÇse              }

 { 2.2.3. Jobb oldal }
@right:
   cmp    u,0           { U=320-X-W, ha nem negat°v, nincs rajta  }
   jge    @down         { a kÇpernyã jobb szÇlÇn, teh†t ugr†s     }
   add    cx,u          { CX csîkken, kevesebb oszlop             }
   mov    ax,u
   sub    word [@siplus],ax { @SIPLUS nã, egy sor kirak†sa ut†n   }
                        { SI-hez -U-val tîbbet kell adni          }
   sub    word [@diplus],ax { @DIPLUS is nã                       }

 { 2.2.4. Vizsg†ljuk, hogy a BOB az als¢ szÇlen van-e }
@down:
   cmp    v,0           { V=200-Y-H, ha nulla, vagy pozit°v, nem  }
   jge    @put          { ny£lik t£l a kÇpernyãn lefele           }
   add    dx,v          { Csak a sorsz†ml†l¢t kell csîkkenteni    }

 { 2.3. A BOB kirajzol†sa a munkaterÅletre }

@put:
   mov    word [@cxsave],cx { CX-et elmentjÅk, ne kelljen minden  }
                        { sor kirak†s†hoz £jra kisz†molni         }
   pop    ds            { A veremben legfelÅl a Shape szegmense   }
                        { volt, °gy DS:[SI] a forr†sc°m           }
@putlines:              { Sorok rajzol†sa ciklus kezdete          }
   mov    cx,word [@cxsave] { CX a kirakand¢ oszlopok sz†ma       }
@putline:               { Egy sor kirak†sa ciklus kezdete         }
   lodsb                { AL:=byte ptr DS:[SI], SI:= SI+1         }
   cmp    al,0          { Csak akkor kell kirajzolni ezt a pontot,}
   jz     @NotPut       { ha nem nulla                            }
   mov    es:[di],al
@NotPut:
   inc    di
   loop   @putline      { Egy sor kirak†sa ciklus vÇge, ha CX=0   }
   add    di,word [@diplus]
   add    si,word [@siplus]
   dec    dx            { Sorsz†ml†l¢ csîkkentÇse                 }
   jnz    @putlines     { Sorok rajzol†sa ciklus vÇge, ha DX=0    }
   mov    ds,bp         { DS £jra az eredeti adatszegmens         }
@nextbob:               { Ide ugrik, ha a BOB nem l†tszik         }
   pop    cx            { CX megint a BOB-okat sz†molja           }
   dec    cx            { Egyet m†r kiraktunk                     }
   cmp    cx,-1
   jnz    @putbob       { De mÇg a tîbbit is †br†zolni kell       }

 { 3. MunkaterÅlet bem†sol†sa a grafikus t†rba (megjelen°tÇs) }

 { 3.1. V†rakoz†s egy vertik†lis visszafut†sra }
   cmp   retrace,0      { Ha a RETRACE ÇrtÇke FALSE,              }
   jz    @show          { egybãl a megjelen°tÇs jîn, nem v†runk   }
   mov   dx,3dah        { A $3DA porton keresztÅl figyeljÅk a     }
@wait:                  { vertik†lis visszafut†s bekîvetkeztÇt    }
   in    al,dx
   test  al,8           { 3. bit jelzi a visszatÇrÇst             }
   jz    @wait          { Ha nulla, mÇg v†rni kell                }

 { 3.2. MunkaterÅlet m†sol†sa }
@show:
   mov   es,sega000     { $A000 a grafikus t†r kezdãc°me          }
   xor   di,di
   mov   cx,32000       { Ugyancsak 32000 sz¢t m†solunk           }
   lds   si,workarea    { A munkaterÅletrãl m†solunk              }
   rep   movsw          { Megjelen°tÇs                            }
   mov   ds,bp
   pop   bp
   jmp   @exit

@diplus: dw 0           { Ez a h†rom v†ltoz¢ a k¢dszegmensben van,}
@siplus: dw 0           { azÇrt nem az adatszegmensben, mert arra }
@cxsave: dw 0           { szÅksÇg van a BOB rajzol†s†n†l          }

@exit:
   end;

procedure NewIRQ; assembler; asm
   push   ds            { Azokat a regisztereket, amelyek a meg-  }
   push   ax            { szak°t†s vÇgrehajt†sa kîzben m¢dosulnak,}
   push   bx            { a veremben t†roljuk                     }
   push   cx
   xor    cl,cl         { NÇh†ny regiszter kezdeti ÇrtÇke         }
   mov    bh,cl
   mov    ax,seg key    { DS a KEY tîmb szegmense                 }
   mov    ds,ax
   in     al,60h        { AL-be beolvassuk a billenty˚ SCAN-k¢dot }
   cmp    al,0e0h       { Ha bãv°tett, elãtte E0-t olvashatunk be }
   jnz    @1            { Ha nem az, azt tesszÅk, amit kor†bban   }
   mov    byte [offset key],1 { JelezzÅk, hogy a kîvetkezã bil-   }
                        { lenty˚ k¢dj†hoz 128-at kell majd adni   }
   jmp    @end          { Most nincs tîbb dolgunk                 }
@1:                     { Ha nem $E0 k¢dot kaptunk                }
   cmp    byte [offset key],1 { Megvizsg†ljuk, hogy elãzãleg nem  }
   jnz    @2            { $E0 k¢dot kaptunk-e                     }
   mov    cl,128        { Ha igen, 128-cal nîveljÅk a SCAN-k¢dot  }
   mov    byte [offset key],0 { Null†zzuk a jelzã-v†ltoz¢t        }
@2:
   mov    bl,al         { BL-be is bevisszÅk a k¢dot              }
   and    bl,127        { Az als¢ 7 bit adja a val¢di SCAN-k¢dot  }
   add    bl,cl         { Ha bãv°tett a billenty˚, BL:= BL+128    }
   xor    cl,cl         { CL regiszter null†z†sa                  }
   shl    al,1          { C jelzãbit (FLAG) = 7. bit              }
   cmc                  { Ezt neg†ljuk, °gy ha 0, felengedtÅk az  }
                        { adott billenty˚t, ha 1, akkor lenyomtuk }
   adc    cl,00         { CL most 0 vagy 1 lehet (FALSE, TRUE)    }
   mov    [offset key+bx],cl { A megszakt†st kiv†lt¢ billenty˚hîz }
                        { tartoz¢ logikai v†ltoz¢ be†llt†sa       }

 { A most kîvetkezã utast†sok vissza†lltj†k a megszakt†si csator- }
 { n†t, rÇszletesebben nem Çrdemes foglalkozni velÅk.             }
@end:
 in al,61h; mov ah,al; or al,80h; out 61h,al; mov al,ah; nop; nop;
 nop; out 61h,al; cli; mov al,20h; out 20h,al; sti

   pop    cx            { Regiszterek visszaolvas†sa a verembãl   }
   pop    bx
   pop    ax
   pop    ds
   iret                 { VÇge a megszakt†snak                    }
   end;

procedure LoadLBM( FileName: string; p: pointer);
                        { FILENAME: forr†s, P: cÇl (ide °rjuk)    }
 var f: file;           { V†ltoz¢ a f†jl-m˚veletekhez             }
     p1, p2: pointer;   { Mutat¢k a mem¢riafoglal¢ elj†r†sokhoz   }
     i,j:  byte;        { Sz†ml†l¢k a FOR... ciklusokhoz          }
     Error: boolean;    { Hib†t jelzã logikai v†ltoz¢             }
     fs: word;          { A f†jl mÇretÇt fogja t†rolni            }
 const
     lab: array[0..3] of char = 'BODY';
                        { Ezt a c°mkÇt kell majd megkeresni: BODY }
 begin
  mark( p1);
  assign( f, FileName);
  reset( f, 1);
  fs:= filesize( f);
  if fs>65520 then halt;{ EnnÇl nagyobb f†jlt nem tudunk †br†zolni}
  getmem( p2, fs);      { Helyfoglal†s, itt l†tszik, hogy a f†jl  }
                        { mÇrete nem haladhatja meg a 64 kB-ot    }
  blockread( f, p2^, fs); { F†jl beolvas†sa a mem¢ri†ba           }
  close( f);

  for  i:= 0 to 255 do begin
   port[$3c8]:=i;
   for j:= 0 to 2 do
    port[$3c9]:=mem[seg(p2^):ofs(p2^)+$30+3*i+j] shr 2;
   end;                 { Paletta be†ll°t†sa                      }

  asm
   mov    error,0       { A hib†t jelzã v†ltoz¢ null†z†sa         }
   mov    al,byte [lab] { AL-be 'B'(66) kerÅl (a c°mke 1. b†jtja) }
   les    di,p2         { A P2 †ltal meghat†rozott terÅleten ke-  }
   mov    bx,di         { ressÅk a 'BODY' c°mkÇt.                 }
   mov    cx,fs         { A sz†ml†l¢ kezdeti ÇrtÇke a f†jl mÇrete }
@1:repnz  scasb         { Az elsã b†jt keresÇse                   }
   jnz    @err          { Ha nem tal†lt, hib†s a f†jl             }
   mov    si,offset lab { Ha tal†lt egy 'B' karaktert, az mÇg nem }
   push   di            { biztos, hogy a 'BODY' elsã karaktere,   }
   push   cx            { ezÇrt ellenãrizni kell a m†sik h†rmat is}
   dec    di            { DI most a tal†lt 'B'-re mutat           }
   mov    cx,4          { ôsszesen 4 karaktert vizsg†lunk, ennyi  }
   repz   cmpsb         { a c°mke hossza (4 b†jt)                 }
   pop    cx            { A vizsg†lathoz szÅksÇges, elãzãleg el-  }
   pop    di            { mentett regiszterek vissza†llit†sa      }
   jnz    @1            { Ha valahol eltÇrÇs volt, folytatjuk     }
   mov    dx,es:[di+5]  { A 'BODY'-t kîvetã duplasz¢ a tîmîr°tett }
   xchg   dl,dh         { mÇret, nekÅnk csak az utols¢ 2 b†jt kell}
                        { A m†sik kettã nulla, mert a f†jl nem le-}
                        { het 65520 b†jtn†l nagyobb               }
   add    di,7          { Az elsã adat a 'BODY' ut†ni 5. b†jt     }
   push   ds            { DS kell a MOVSB utast†shoz              }
   mov    ax,di         { DI-t †tmenetileg t†roljuk               }
   les    di,p          { ES:[DI]-be a cÇlcim kerÅl (P)           }
   lds    si,p2         { DS:[SI]-be pedig a forr†scim            }
   sub    ax,bx         { AX-bãl levonjuk a P2^ ofszetjÇt         }
   add    si,ax         { ês ezt adjuk SI-hez, igy DS:[SI] az elsã}
   xor    ch,ch         { grafikus adat helyÇt hat†rozza meg      }
@2:cmp    dx,0          { Ha a sz†ml†l¢ elÇrte a null†t - vÇge    }
   jz     @vege
   mov    cl,[si]       { CL az egysÇg elsã b†jtja (B)            }
   inc    si            { Ezut†n a kîvetkezã b†jttal lesz dolgunk }
   dec    dx            { Sz†ml†l¢ csîkkentÇse                    }
   test   cl,128        { EllenãrizzÅk CL legfelsã bitjÇt         }
   jz     @normal       { Ha 0, CL+1 tîmîritetlen b†jt kîvetkezik }
   neg    cl            { EgyÇbkÇnt neg†lni kell,                 }
   inc    cl            { Çs hozz† kell adni egyet.               }
   mov    al,[si]       { ês ennyiszer kell kirakni a kîvetkezã   }
   inc    si            { b†jtot                                  }
   dec    dx
   rep    stosb
   jmp    @2
@normal:
   inc    cl
   sub    dx,cx         { A sz†ml†l¢ csîkkentÇse (ezÇrt CH=0)     }
   rep    movsb         { CL+1 b†jt egyszer˚ kim†sol†sa           }
   jmp    @2
@err:
   mov    error,1
@vege:
   pop    ds
  end;
 if Error then begin    { Ha hiba volt...                         }
  asm mov ax,3; int 10h end;
  WriteLn('Olvas†si hiba: '''+FileName+''''+#7);
  halt
  end;
 release( p1);          { Lefoglalt mem¢ria felszabadit†sa        }
 end;




begin

 asm mov ax,13h; int 10h end; { MCGA Åzemm¢d be†ll°t†sa           }
 getintvec( $09, @OLD); { A rÇgi megszakit†svektort t†roljuk      }
 setintvec( $09, @NewIRQ); { A $09 megszakt†s ezent£l a NEWIRQ    }
                        { elj†r†st h°vja meg                      }

 getmem( background, 64000); { Helyfoglal†s a h†ttÇrnek Çs a      }
 getmem( workarea,   64000); { munkaterÅletnek                    }
 loadlbm( 'Coll.lbm', background);

 with b[0] do begin
  load('flower.bob');
  x:= 152; y:= 84;

 repeat
  ShowBOB;
  if key[$cd] then inc(x);
  if key[$d0] then inc(y);
  if key[$cb] then dec(x);
  if key[$c8] then dec(y);
  if collcolors then sound(100) else nosound;
  until key[1];
  nosound;

 setintvec( $09, @OLD);
 asm mov ax,3; int 10h end; { IsmÇt szîveges Åzemm¢d (80û25)      }
 end end.

