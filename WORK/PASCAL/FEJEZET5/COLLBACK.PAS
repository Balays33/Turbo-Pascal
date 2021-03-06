{collback.pas }

uses Crt, DOS;

type BOB = object
       A : wordbool;    { Aktivit�s-jelz�. Ha TRUE akkor l�that�  }
       X : integer;     { X koordin�ta (abszcissza)               }
       Y : integer;     { Y koordin�ta (ordin�ta)                 }
       LX: word;        { Sz�less�g (lx=0-n�l ez 1 k�ppont)       }
       LY: word;        { Magass�g  (ly=0-n�l ez 1 k�ppont)       }
       P : word;        { F�zissz�ml�l� (p=0 : els� f�zis)        }
       DT: pointer;     { Shape helye a mem�ri�ban                }
       PL: word;        { Egy f�zis helyfoglal�sa                 }
       W : word;        { Val�s�gos sz�less�g (width )            }
       H : word;        { Val�s�gos magass�g  (height)            }
       LN: word;        { Shape helyfoglal�sa b�jtban             }
       PN: word;        { F�zissz�m (f�zisok 0-val kezd�dnek)     }
       procedure Load( FileName: string);
                        { Shape bet�lt�se lemezr�l                }
       function CollColors: boolean;
                        { H�tt�rrel �tk�z�s vizsg�lata            }
       end;


const Bnum = 0;         { Egy BOB megjelen�t�se                   }
      Blen = sizeof(BOB); { BOB t�pus hossza }
      Retrace: boolean = true; { Vertik�lis visszafut�s-jelz�     }
 CFirst:     byte    = 0;
 CLast:      byte    = 0;


var B: array[0..Bnum] of BOB; { BOB-ok nem-grafikus adatai        }
    BackGround:pointer; { H�tt�r mutat�ja                         }
    WorkArea:  pointer; { Munkater�let mutat�ja                   }
    u,v: integer;       { A SHOWBOB elj�r�s haszn�lja �ket        }
    x1, y1, x2, y2, dxx, pnt, bobseg, daa,
    xa,xb,ya,yb,
    ax1,ax2,ay1,ay2,
    bx1,bx2,by1,by2: word;  { V�ltoz�k az �tk�z�svizsg�lathoz     }
    i: word;            { �ltal�nos c�l� v�ltoz� (FOR ciklushoz)  }

     KEY: array [0..255] of boolean;
                        { Most 2�128 elem� a t�mb                 }
     OLD: procedure;    { A r�gi megszakt�svektor                 }

function BOB.CollColors; assembler; asm
   push   bp               { BP regisztert adatt�rol�sra haszn�ljuk }
   cld
   mov    bx,word ptr (self) { [BX]: offset BOB }

   mov    al,[bx]
   cmp    al,0
   jz     @noColl         { Ha nem aktiv: k�vetkez� }
   mov    ax,[bx+2]        { AX = X koordin�ta }
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
   add    si,ax            { ES:[SI]^ = k�vetkez� f�zis }

   cmp    x1,0
   jnge   @halfout
   cmp    y1,0
   jnge   @halfout
   cmp    x2,319
   jg     @halfout
   mov    ax,200
   cmp    y2,ax
   jge    @halfout         { Ha kil�g valamerre a @HALFOUT-ra ugrik }

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az els� kirakand� pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, k�t sor k�zti ugr�s }
   mov    dxx,dx
   mov    dl,cfirst
   mov    dh,clast
   mov    bp,ds            { DS elment�se }
   pop    bobseg           { Az el�z�leg elmentett ES->BOBSeg }

   mov    cx,[bx+20]       { CX = kirakand� sorok sz�ma }
@NextLine:
   push   cx
   mov    cx,[bx+18]       { CX = 1 sorban l�v� pontok }
   mov    ds,BOBSeg        { DS:[SI]^ = shape (aktu�lis f�zis) }
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
   mov    ds,bp            { Vissza az eredeti DS a BP-b�l }
   add    di,dxx           { DI = k�v. sor }
   pop    cx
   loop   @NextLine        { k�v. sor }

@NoColl:
   mov    al,0
   jmp    @exit

@HalfOut:
   mov    cx,[bx+20]      { CX-be a BOB magass�ga }
   cmp    y1,0
   jge    @notup           { Ha nem fel�l l�g ki a @NOTUP-ra ugrik }
   mov    ax,y1
   neg    ax               { AX=-AX }
   sub    cx,ax            { A kirakand� sorok cs�kkennek }
   mov    dx,[bx+18]       { DX-be a sz�less�g }
   mul    dx
   add    si,ax            { SI most a shape kezd� sor�ra mutat }
   mov    y1,0             { Y koordin�ta null�z�sa }
@NotUp:
   mov    dxx,0            { A shape-en bel�li l�p�sk�z null�z�sa }
   mov    ax,[bx+18]
   mov    pnt,ax           { PNT = 1 sorban kirakand� pontok sz�ma }
   cmp    x1,0
   jge    @notleft         { Ha nem baloldalt l�g ki a @NOTLEFT-re ugrik }
   mov    ax,x1
   neg    ax
   add    si,ax
   mov    dxx,ax           { A l�p�sk�z AX-szel n� }
   sub    pnt,ax           { A kirakand� pontok sz�ma -X1-gyel cs�kken }
   mov    x1,0             { X koordin�ta null�z�sa }
@NotLeft:
   cmp    x2,319
   jng    @NotRight
   mov    ax,x2
   sub    ax,319
   add    dxx,ax          { A l�p�sk�z X2-319-cel n� }
   sub    pnt,ax          { A kirakand� pontok sz�ma X2-319-cel cs�kken }
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
   add    di,ax            { DI most az els� pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, k�t sor k�zti ugr�s }
   mov    daa,dx
   mov    dl,cfirst
   mov    dh,clast
   pop    ax               { Az el�z�leg elmentett ES->AX }

@2NextLine:
   push   cx
   mov    cx,pnt           { CX = 1 sorban l�v� kirakand� pontok }
   push   ds
   push   ax
   mov    ds,ax            { DS:[SI]^ = shape (aktu�lis f�zis) }
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
   add    di,daa           { DI = k�v. sor }
   add    si,dxx           { SI = k�v. shape sor }
   loop   @2NextLine       { k�v. sor }

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
  seek( f, 1);          { A f�jl els� b�jtja nem haszn�latos      }
  blockread( f, LX, 2); { A 2-3. b�jt a Shape sz�less�g�t adja    }
  blockread( f, LY, 2); { A 4-5. pedig a magass�g�t               }
  blockread( f, PN, 2); { Ezt k�vet� sz� a f�zisok sz�ma          }
  W:= LX+1; H:= LY+1;   { Az igazi m�retek eggyel nagyobbak       }
  PL:= W*H;             { Egy f�zis hossza = sz�less�g � magass�g }
  LN:= PL*(PN+1);       { Shape hossza = f�zishossz � f�zissz�m   }
  getmem( DT, LN);      { Helyfoglal�s a Shape-nek                }
  blockread( f,DT^,LN); { Grafikus adatok bet�lt�se               }
  close( f);
  A:= true;             { Bekapcsoljuk, hogy l�that� legyen       }
  P:= 0;                { A f�zismutat�t az els�re �ll�tjuk       }
  end;

procedure ShowBOB; assembler; asm
                        { Ez a f� elj�r�s, a megjelen�t�st v�gzi  }
 { 1. H�tt�r m�sol�sa a munkater�letre }

   push   bp            { BP regisztert m�sra haszn�ljuk,         }
   mov    bp,ds         { az adatszegmenset t�roljuk benne        }
   mov    cx,32000      { A h�tt�r hossza 32000 sz� (64000 b�jt)  }
   cld                  { D-jelz�bit t�rl�se a REP utas�t�shoz    }
   les    di,workarea   { ES:[DI] mutat a munkater�letre          }
   lds    si,background { DS:[SI] pedig a h�tt�rre                }
   rep    movsw         { H�tt�r m�sol�sa a munkater�letre        }
   mov    ds,bp         { DS �jra az eredeti adatszegmens         }

 { 2. BOB-ok rajzol�sa a munkater�letre }

   mov    cx,bnum       { BNUM BOB kirak�s�r�l kell gondoskodni   }
@putbob:                { Egy BOB kirak�sa ciklus kezdete         }
   push   cx            { CX-et majd m�sra haszn�ljuk (oszlopsz�m-}
                        { l�l� lesz a sorok megrajzol�s�n�l)      }
   lea    bx,B          { BX:= B t�mb ofszetc�me                  }
   mov    ax,blen
   mul    cx            { BX-hez hozz�adunk annyit, hogy az �ppen }
   add    bx,ax         { aktu�lis (CX.) BOB-ra mutasson          }

 { 2.1. Ellen�rizz�k, hogy a BOB, koordin�t�i alapj�n l�that�-e }

   cmp    word [bx],0   { Az aktivit�st jelz� sz� ellen�rz�se     }
   jz     @nextbob      { Ha hamis, akkor nem szabad kirajzolni   }
   cmp    word [bx+2],320 { Ha X>=320, akkor nem l�that�, ugr�s a }
   jge    @nextbob      { k�vetkez� BOB-ra                        }
   cmp    word [bx+4],200 { Ha Y>=200, akkor a k�perny� alja a-   }
   jge    @nextbob      { latt van, ez�rt nem kell megjelenteni   }
   mov    ax,[bx+6]     { Amikor balra helyezkedik el a k�perny�- }
   add    ax,[bx+2]     { t�l, LX+X<=0                            }
   jnge   @nextbob      { Ekkor se kell �br�zolni                 }
   mov    u,ax          { LX+X-et t�roljuk, mert k�s�bb m�g sz�k- }
   mov    ax,[bx+8]     { s�g lesz r�, nem kell �jra kisz�molni   }
   add    ax,[bx+4]
   jnge   @nextbob      { Ha LY+Y<=0, akkor ugr�s a k�vetkez�re   }
   mov    v,ax          { LY+Y-t is megjegyezz�k                  }
   neg    u
   add    u,319         { U=320-X-W                               }
   neg    v
   add    v,199         { V=200-Y-H                               }

 { 2.2. Meghat�rozzuk a BOB l�that� r�sz�t }

   les    si,[bx+12]    { ES:[SI] mutat most a grafikus adatokra  }
   mov    ax,[bx+16]    { [BX+16] = egy f�zis hossza (PL)         }
   mul    word [bx+10]  { [BX+10] az aktu�lis f�zis (P)           }
   add    si,ax         { SI a Shape aktu�lis f�zis�ra mutat      }
   push   es            { ES-t t�roljuk, k�s�bb ez lesz a DS      }
   les    di,workarea   { ES:[DI] a munkater�let mutat�ja         }
   mov    ax,320        { Kisz�moljuk a k�pc�met, mintha norm�li- }
   mul    word [bx+4]   { san �br�zoln�nk (CIM=320�Y+X)           }
   add    ax,[bx+2]     { K�s�bb majd ezt fogjuk m�dostani        }
   add    di,ax         { DI=320�Y+X                              }

 { 2.2.1. Ha a k�p fels� sz�l�n helyezkedik el }
   mov    dx,[bx+20]    { DX a sorsz�ml�l� az �br�zol�sn�l        }
   mov    ax,320        { Egy sor kirajzol�sa ut�n DI-t @DIPLUS-  }
   sub    ax,[bx+18]    { szal kell n�velni, amelynek �rt�ke      }
   mov    word [@diplus],ax { eleinte: 320-W                      }
   mov    word [@siplus],0 { @SIPLUS: amit SI-hez kell adni egy   }
                        { sor kirak�sa ut�n. Eleinte ez nulla     }
   cmp    word [bx+4],0 { [BX+4] a BOB ordin�t�ja (Y)             }
   jge    @left         { Ha ez nem negat�v, l�p�nk tov�bb        }
   add    dx,[bx+4]     { �sszesen H+Y sort kell kirakni          }
   mov    di,[bx+2]     { DI �rt�ke X, k�zvetlen�l a k�perny�     }
                        { tetej�t�l kezdve rajzoljuk a pontokat   }
   add    di,word [workarea] { DI-hez m�g hozz�adjuk a munkater�- }
   mov    ax,[bx+4]     { let ofszetc�m�t }
   neg    ax
   push   dx
   mul    word [bx+18]  { Csak a -Y. sort�l kezdve kell megjele-  }
   pop    dx
   add    si,ax         { n�teni, ez�rt SI-hez hozz�adunl -Y�W-t  }

 { 2.2.2. Bal oldal }
@left:
   mov    cx,[bx+18]    { CX: h�ny pontot kell egy sorban kirakni }
   cmp    word [bx+2],0 { [BX+2] a BOB abszcissz�ja (X)           }
   jge    @right        { Ha nem negat�v, a jobb oldalt vizsg�lja }
   sub    di,[bx+2]     { K�zvetlen�l a bal sz�l�n kezd�nk        }
   mov    ax,[bx+2]     { @DIPLUS �rt�k�t X-szel cs�kkentj�k,     }
   sub    word [@diplus],ax { vagyis @DIPLUS n�                   }
   neg    ax
   add    word [@siplus],ax { @SIPLUS n� (-X-szel)                }
   add    si,ax         { A -X. oszlopt�l kezdj�k a sorokat       }
   sub    cx,ax         { Oszlopsz�ml�l� cs�kkent�se              }

 { 2.2.3. Jobb oldal }
@right:
   cmp    u,0           { U=320-X-W, ha nem negat�v, nincs rajta  }
   jge    @down         { a k�perny� jobb sz�l�n, teh�t ugr�s     }
   add    cx,u          { CX cs�kken, kevesebb oszlop             }
   mov    ax,u
   sub    word [@siplus],ax { @SIPLUS n�, egy sor kirak�sa ut�n   }
                        { SI-hez -U-val t�bbet kell adni          }
   sub    word [@diplus],ax { @DIPLUS is n�                       }

 { 2.2.4. Vizsg�ljuk, hogy a BOB az als� sz�len van-e }
@down:
   cmp    v,0           { V=200-Y-H, ha nulla, vagy pozit�v, nem  }
   jge    @put          { ny�lik t�l a k�perny�n lefele           }
   add    dx,v          { Csak a sorsz�ml�l�t kell cs�kkenteni    }

 { 2.3. A BOB kirajzol�sa a munkater�letre }

@put:
   mov    word [@cxsave],cx { CX-et elmentj�k, ne kelljen minden  }
                        { sor kirak�s�hoz �jra kisz�molni         }
   pop    ds            { A veremben legfel�l a Shape szegmense   }
                        { volt, �gy DS:[SI] a forr�sc�m           }
@putlines:              { Sorok rajzol�sa ciklus kezdete          }
   mov    cx,word [@cxsave] { CX a kirakand� oszlopok sz�ma       }
@putline:               { Egy sor kirak�sa ciklus kezdete         }
   lodsb                { AL:=byte ptr DS:[SI], SI:= SI+1         }
   cmp    al,0          { Csak akkor kell kirajzolni ezt a pontot,}
   jz     @NotPut       { ha nem nulla                            }
   mov    es:[di],al
@NotPut:
   inc    di
   loop   @putline      { Egy sor kirak�sa ciklus v�ge, ha CX=0   }
   add    di,word [@diplus]
   add    si,word [@siplus]
   dec    dx            { Sorsz�ml�l� cs�kkent�se                 }
   jnz    @putlines     { Sorok rajzol�sa ciklus v�ge, ha DX=0    }
   mov    ds,bp         { DS �jra az eredeti adatszegmens         }
@nextbob:               { Ide ugrik, ha a BOB nem l�tszik         }
   pop    cx            { CX megint a BOB-okat sz�molja           }
   dec    cx            { Egyet m�r kiraktunk                     }
   cmp    cx,-1
   jnz    @putbob       { De m�g a t�bbit is �br�zolni kell       }

 { 3. Munkater�let bem�sol�sa a grafikus t�rba (megjelen�t�s) }

 { 3.1. V�rakoz�s egy vertik�lis visszafut�sra }
   cmp   retrace,0      { Ha a RETRACE �rt�ke FALSE,              }
   jz    @show          { egyb�l a megjelen�t�s j�n, nem v�runk   }
   mov   dx,3dah        { A $3DA porton kereszt�l figyelj�k a     }
@wait:                  { vertik�lis visszafut�s bek�vetkezt�t    }
   in    al,dx
   test  al,8           { 3. bit jelzi a visszat�r�st             }
   jz    @wait          { Ha nulla, m�g v�rni kell                }

 { 3.2. Munkater�let m�sol�sa }
@show:
   mov   es,sega000     { $A000 a grafikus t�r kezd�c�me          }
   xor   di,di
   mov   cx,32000       { Ugyancsak 32000 sz�t m�solunk           }
   lds   si,workarea    { A munkater�letr�l m�solunk              }
   rep   movsw          { Megjelen�t�s                            }
   mov   ds,bp
   pop   bp
   jmp   @exit

@diplus: dw 0           { Ez a h�rom v�ltoz� a k�dszegmensben van,}
@siplus: dw 0           { az�rt nem az adatszegmensben, mert arra }
@cxsave: dw 0           { sz�ks�g van a BOB rajzol�s�n�l          }

@exit:
   end;

procedure NewIRQ; assembler; asm
   push   ds            { Azokat a regisztereket, amelyek a meg-  }
   push   ax            { szak�t�s v�grehajt�sa k�zben m�dosulnak,}
   push   bx            { a veremben t�roljuk                     }
   push   cx
   xor    cl,cl         { N�h�ny regiszter kezdeti �rt�ke         }
   mov    bh,cl
   mov    ax,seg key    { DS a KEY t�mb szegmense                 }
   mov    ds,ax
   in     al,60h        { AL-be beolvassuk a billenty� SCAN-k�dot }
   cmp    al,0e0h       { Ha b�v�tett, el�tte E0-t olvashatunk be }
   jnz    @1            { Ha nem az, azt tessz�k, amit kor�bban   }
   mov    byte [offset key],1 { Jelezz�k, hogy a k�vetkez� bil-   }
                        { lenty� k�dj�hoz 128-at kell majd adni   }
   jmp    @end          { Most nincs t�bb dolgunk                 }
@1:                     { Ha nem $E0 k�dot kaptunk                }
   cmp    byte [offset key],1 { Megvizsg�ljuk, hogy el�z�leg nem  }
   jnz    @2            { $E0 k�dot kaptunk-e                     }
   mov    cl,128        { Ha igen, 128-cal n�velj�k a SCAN-k�dot  }
   mov    byte [offset key],0 { Null�zzuk a jelz�-v�ltoz�t        }
@2:
   mov    bl,al         { BL-be is bevissz�k a k�dot              }
   and    bl,127        { Az als� 7 bit adja a val�di SCAN-k�dot  }
   add    bl,cl         { Ha b�v�tett a billenty�, BL:= BL+128    }
   xor    cl,cl         { CL regiszter null�z�sa                  }
   shl    al,1          { C jelz�bit (FLAG) = 7. bit              }
   cmc                  { Ezt neg�ljuk, �gy ha 0, felengedt�k az  }
                        { adott billenty�t, ha 1, akkor lenyomtuk }
   adc    cl,00         { CL most 0 vagy 1 lehet (FALSE, TRUE)    }
   mov    [offset key+bx],cl { A megszakt�st kiv�lt� billenty�h�z }
                        { tartoz� logikai v�ltoz� be�llt�sa       }

 { A most k�vetkez� utast�sok vissza�lltj�k a megszakt�si csator- }
 { n�t, r�szletesebben nem �rdemes foglalkozni vel�k.             }
@end:
 in al,61h; mov ah,al; or al,80h; out 61h,al; mov al,ah; nop; nop;
 nop; out 61h,al; cli; mov al,20h; out 20h,al; sti

   pop    cx            { Regiszterek visszaolvas�sa a veremb�l   }
   pop    bx
   pop    ax
   pop    ds
   iret                 { V�ge a megszakt�snak                    }
   end;

procedure LoadLBM( FileName: string; p: pointer);
                        { FILENAME: forr�s, P: c�l (ide �rjuk)    }
 var f: file;           { V�ltoz� a f�jl-m�veletekhez             }
     p1, p2: pointer;   { Mutat�k a mem�riafoglal� elj�r�sokhoz   }
     i,j:  byte;        { Sz�ml�l�k a FOR... ciklusokhoz          }
     Error: boolean;    { Hib�t jelz� logikai v�ltoz�             }
     fs: word;          { A f�jl m�ret�t fogja t�rolni            }
 const
     lab: array[0..3] of char = 'BODY';
                        { Ezt a c�mk�t kell majd megkeresni: BODY }
 begin
  mark( p1);
  assign( f, FileName);
  reset( f, 1);
  fs:= filesize( f);
  if fs>65520 then halt;{ Enn�l nagyobb f�jlt nem tudunk �br�zolni}
  getmem( p2, fs);      { Helyfoglal�s, itt l�tszik, hogy a f�jl  }
                        { m�rete nem haladhatja meg a 64 kB-ot    }
  blockread( f, p2^, fs); { F�jl beolvas�sa a mem�ri�ba           }
  close( f);

  for  i:= 0 to 255 do begin
   port[$3c8]:=i;
   for j:= 0 to 2 do
    port[$3c9]:=mem[seg(p2^):ofs(p2^)+$30+3*i+j] shr 2;
   end;                 { Paletta be�ll�t�sa                      }

  asm
   mov    error,0       { A hib�t jelz� v�ltoz� null�z�sa         }
   mov    al,byte [lab] { AL-be 'B'(66) ker�l (a c�mke 1. b�jtja) }
   les    di,p2         { A P2 �ltal meghat�rozott ter�leten ke-  }
   mov    bx,di         { ress�k a 'BODY' c�mk�t.                 }
   mov    cx,fs         { A sz�ml�l� kezdeti �rt�ke a f�jl m�rete }
@1:repnz  scasb         { Az els� b�jt keres�se                   }
   jnz    @err          { Ha nem tal�lt, hib�s a f�jl             }
   mov    si,offset lab { Ha tal�lt egy 'B' karaktert, az m�g nem }
   push   di            { biztos, hogy a 'BODY' els� karaktere,   }
   push   cx            { ez�rt ellen�rizni kell a m�sik h�rmat is}
   dec    di            { DI most a tal�lt 'B'-re mutat           }
   mov    cx,4          { �sszesen 4 karaktert vizsg�lunk, ennyi  }
   repz   cmpsb         { a c�mke hossza (4 b�jt)                 }
   pop    cx            { A vizsg�lathoz sz�ks�ges, el�z�leg el-  }
   pop    di            { mentett regiszterek vissza�llit�sa      }
   jnz    @1            { Ha valahol elt�r�s volt, folytatjuk     }
   mov    dx,es:[di+5]  { A 'BODY'-t k�vet� duplasz� a t�m�r�tett }
   xchg   dl,dh         { m�ret, nek�nk csak az utols� 2 b�jt kell}
                        { A m�sik kett� nulla, mert a f�jl nem le-}
                        { het 65520 b�jtn�l nagyobb               }
   add    di,7          { Az els� adat a 'BODY' ut�ni 5. b�jt     }
   push   ds            { DS kell a MOVSB utast�shoz              }
   mov    ax,di         { DI-t �tmenetileg t�roljuk               }
   les    di,p          { ES:[DI]-be a c�lcim ker�l (P)           }
   lds    si,p2         { DS:[SI]-be pedig a forr�scim            }
   sub    ax,bx         { AX-b�l levonjuk a P2^ ofszetj�t         }
   add    si,ax         { �s ezt adjuk SI-hez, igy DS:[SI] az els�}
   xor    ch,ch         { grafikus adat hely�t hat�rozza meg      }
@2:cmp    dx,0          { Ha a sz�ml�l� el�rte a null�t - v�ge    }
   jz     @vege
   mov    cl,[si]       { CL az egys�g els� b�jtja (B)            }
   inc    si            { Ezut�n a k�vetkez� b�jttal lesz dolgunk }
   dec    dx            { Sz�ml�l� cs�kkent�se                    }
   test   cl,128        { Ellen�rizz�k CL legfels� bitj�t         }
   jz     @normal       { Ha 0, CL+1 t�m�ritetlen b�jt k�vetkezik }
   neg    cl            { Egy�bk�nt neg�lni kell,                 }
   inc    cl            { �s hozz� kell adni egyet.               }
   mov    al,[si]       { �s ennyiszer kell kirakni a k�vetkez�   }
   inc    si            { b�jtot                                  }
   dec    dx
   rep    stosb
   jmp    @2
@normal:
   inc    cl
   sub    dx,cx         { A sz�ml�l� cs�kkent�se (ez�rt CH=0)     }
   rep    movsb         { CL+1 b�jt egyszer� kim�sol�sa           }
   jmp    @2
@err:
   mov    error,1
@vege:
   pop    ds
  end;
 if Error then begin    { Ha hiba volt...                         }
  asm mov ax,3; int 10h end;
  WriteLn('Olvas�si hiba: '''+FileName+''''+#7);
  halt
  end;
 release( p1);          { Lefoglalt mem�ria felszabadit�sa        }
 end;




begin

 asm mov ax,13h; int 10h end; { MCGA �zemm�d be�ll�t�sa           }
 getintvec( $09, @OLD); { A r�gi megszakit�svektort t�roljuk      }
 setintvec( $09, @NewIRQ); { A $09 megszakt�s ezent�l a NEWIRQ    }
                        { elj�r�st h�vja meg                      }

 getmem( background, 64000); { Helyfoglal�s a h�tt�rnek �s a      }
 getmem( workarea,   64000); { munkater�letnek                    }
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
 asm mov ax,3; int 10h end; { Ism�t sz�veges �zemm�d (80�25)      }
 end end.

