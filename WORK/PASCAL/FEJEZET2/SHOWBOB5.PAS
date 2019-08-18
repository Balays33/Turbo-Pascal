{showbob5.pas }
{$X+,R-}

uses Crt;

type BOB = object
       A : wordbool;    { Aktivit s-jelz‹. Ha TRUE akkor l that¢  }
       X : integer;     { X koordin ta (abszcissza)               }
       Y : integer;     { Y koordin ta (ordin ta)                 }
       LX: word;        { Sz‚less‚g (lx=0-n l ez 1 k‚ppont)       }
       LY: word;        { Magass g  (ly=0-n l ez 1 k‚ppont)       }
       P : word;        { F zissz ml l¢ (p=0 : els‹ f zis)        }
       DT: pointer;     { Shape helye a mem¢ri ban                }
       PL: word;        { Egy f zis helyfoglal sa                 }
       W : word;        { Val¢s gos sz‚less‚g (width )            }
       H : word;        { Val¢s gos magass g  (height)            }
       LN: word;        { Shape helyfoglal sa b jtban             }
       PN: word;        { F zissz m (f zisok 0-val kezd‹dnek)     }
       procedure Load( FileName: string);
                        { Shape bet”lt‚se lemezr‹l                }
       end;

const Bnum = 1;         { Most csak kett‹t jelen¡tnk meg         }
      Blen = sizeof(BOB); { BOB t¡pus hossza }
      Retrace: boolean = true; { Vertik lis visszafut s-jelz‹     }


var B: array[0..Bnum] of BOB; { BOB-ok nem-grafikus adatai        }
    BackGround:pointer; { H tt‚r mutat¢ja                         }
    WorkArea:  pointer; { Munkaterlet mutat¢ja                   }
    u,v: integer;       { A SHOWBOB elj r s haszn lja ‹ket        }
    i: word;            { µltal nos c‚l£ v ltoz¢ (FOR ciklushoz)  }

procedure BOB.Load;
 var f: file;
 begin
  assign( f, FileName);
  reset( f, 1);
  seek( f, 1);          { A f jl els‹ b jtja nem haszn latos      }
  blockread( f, LX, 2); { A 2-3. b jt a Shape sz‚less‚g‚t adja    }
  blockread( f, LY, 2); { A 4-5. pedig a magass g t               }
  blockread( f, PN, 2); { Ezt k”vet‹ sz¢ a f zisok sz ma          }
  W:= LX+1; H:= LY+1;   { Az igazi m‚retek eggyel nagyobbak       }
  PL:= W*H;             { Egy f zis hossza = sz‚less‚g ž magass g }
  LN:= PL*(PN+1);       { Shape hossza = f zishossz ž f zissz m   }
  getmem( DT, LN);      { Helyfoglal s a Shape-nek                }
  blockread( f,DT^,LN); { Grafikus adatok bet”lt‚se               }
  close( f);
  A:= true;             { Bekapcsoljuk, hogy l that¢ legyen       }
  P:= 0;                { A f zismutat¢t az els‹re  ll¡tjuk       }
  end;

procedure ShowBOB; assembler; asm
                        { Ez a f‹ elj r s, a megjelen¡t‚st v‚gzi  }
 { 1. H tt‚r m sol sa a munkaterletre }

   push   bp            { BP regisztert m sra haszn ljuk,         }
   mov    bp,ds         { az adatszegmenset t roljuk benne        }
   mov    cx,32000      { A h tt‚r hossza 32000 sz¢ (64000 b jt)  }
   cld                  { D-jelz‹bit t”rl‚se a REP utas¡t shoz    }
   les    di,workarea   { ES:[DI] mutat a munkaterletre          }
   lds    si,background { DS:[SI] pedig a h tt‚rre                }
   rep    movsw         { H tt‚r m sol sa a munkaterletre        }
   mov    ds,bp         { DS £jra az eredeti adatszegmens         }

 { 2. BOB-ok rajzol sa a munkaterletre }

   mov    cx,bnum       { BNUM BOB kirak s r¢l kell gondoskodni   }
@putbob:                { Egy BOB kirak sa ciklus kezdete         }
   push   cx            { CX-et majd m sra haszn ljuk (oszlopsz m-}
                        { l l¢ lesz a sorok megrajzol s n l)      }
   lea    bx,B          { BX:= B t”mb ofszetc¡me                  }
   mov    ax,blen
   mul    cx            { BX-hez hozz adunk annyit, hogy az ‚ppen }
   add    bx,ax         { aktu lis (CX.) BOB-ra mutasson          }

 { 2.1. Ellen‹rizzk, hogy a BOB, koordin t i alapj n l that¢-e }

   cmp    word [bx],0   { Az aktivit st jelz‹ sz¢ ellen‹rz‚se     }
   jz     @nextbob      { Ha hamis, akkor nem szabad kirajzolni   }
   cmp    word [bx+2],320 { Ha X>=320, akkor nem l that¢, ugr s a }
   jge    @nextbob      { k”vetkez‹ BOB-ra                        }
   cmp    word [bx+4],200 { Ha Y>=200, akkor a k‚perny‹ alja a-   }
   jge    @nextbob      { latt van, ez‚rt nem kell megjelenteni   }
   mov    ax,[bx+6]     { Amikor balra helyezkedik el a k‚perny‹- }
   add    ax,[bx+2]     { t‹l, LX+X<=0                            }
   jnge   @nextbob      { Ekkor se kell  br zolni                 }
   mov    u,ax          { LX+X-et t roljuk, mert k‚s‹bb m‚g szk- }
   mov    ax,[bx+8]     { s‚g lesz r , nem kell £jra kisz molni   }
   add    ax,[bx+4]
   jnge   @nextbob      { Ha LY+Y<=0, akkor ugr s a k”vetkez‹re   }
   mov    v,ax          { LY+Y-t is megjegyezzk                  }
   neg    u
   add    u,319         { U=320-X-W                               }
   neg    v
   add    v,199         { V=200-Y-H                               }

 { 2.2. Meghat rozzuk a BOB l that¢ r‚sz‚t }

   les    si,[bx+12]    { ES:[SI] mutat most a grafikus adatokra  }
   mov    ax,[bx+16]    { [BX+16] = egy f zis hossza (PL)         }
   mul    word [bx+10]  { [BX+10] az aktu lis f zis (P)           }
   add    si,ax         { SI a Shape aktu lis f zis ra mutat      }
   push   es            { ES-t t roljuk, k‚s‹bb ez lesz a DS      }
   les    di,workarea   { ES:[DI] a munkaterlet mutat¢ja         }
   mov    ax,320        { Kisz moljuk a k‚pc¡met, mintha norm li- }
   mul    word [bx+4]   { san  br zoln nk (CIM=320žY+X)           }
   add    ax,[bx+2]     { K‚s‹bb majd ezt fogjuk m¢dostani        }
   add    di,ax         { DI=320žY+X                              }

 { 2.2.1. Ha a k‚p fels‹ sz‚l‚n helyezkedik el }
   mov    dx,[bx+20]    { DX a sorsz ml l¢ az  br zol sn l        }
   mov    ax,320        { Egy sor kirajzol sa ut n DI-t @DIPLUS-  }
   sub    ax,[bx+18]    { szal kell n”velni, amelynek ‚rt‚ke      }
   mov    word [@diplus],ax { eleinte: 320-W                      }
   mov    word [@siplus],0 { @SIPLUS: amit SI-hez kell adni egy   }
                        { sor kirak sa ut n. Eleinte ez nulla     }
   cmp    word [bx+4],0 { [BX+4] a BOB ordin t ja (Y)             }
   jge    @left         { Ha ez nem negat¡v, l‚pnk tov bb        }
   add    dx,[bx+4]     { ™sszesen H+Y sort kell kirakni          }
   mov    di,[bx+2]     { DI ‚rt‚ke X, k”zvetlenl a k‚perny‹     }
                        { tetej‚t‹l kezdve rajzoljuk a pontokat   }
   add    di,word [workarea] { DI-hez m‚g hozz adjuk a munkater- }
   mov    ax,[bx+4]     { let ofszetc¡m‚t }
   neg    ax
   push   dx
   mul    word [bx+18]  { Csak a -Y. sort¢l kezdve kell megjele-  }
   pop    dx
   add    si,ax         { n¡teni, ez‚rt SI-hez hozz adunl -YžW-t  }

 { 2.2.2. Bal oldal }
@left:
   mov    cx,[bx+18]    { CX: h ny pontot kell egy sorban kirakni }
   cmp    word [bx+2],0 { [BX+2] a BOB abszcissz ja (X)           }
   jge    @right        { Ha nem negat¡v, a jobb oldalt vizsg lja }
   sub    di,[bx+2]     { K”zvetlenl a bal sz‚l‚n kezdnk        }
   mov    ax,[bx+2]     { @DIPLUS ‚rt‚k‚t X-szel cs”kkentjk,     }
   sub    word [@diplus],ax { vagyis @DIPLUS n‹                   }
   neg    ax
   add    word [@siplus],ax { @SIPLUS n‹ (-X-szel)                }
   add    si,ax         { A -X. oszlopt¢l kezdjk a sorokat       }
   sub    cx,ax         { Oszlopsz ml l¢ cs”kkent‚se              }

 { 2.2.3. Jobb oldal }
@right:
   cmp    u,0           { U=320-X-W, ha nem negat¡v, nincs rajta  }
   jge    @down         { a k‚perny‹ jobb sz‚l‚n, teh t ugr s     }
   add    cx,u          { CX cs”kken, kevesebb oszlop             }
   mov    ax,u
   sub    word [@siplus],ax { @SIPLUS n‹, egy sor kirak sa ut n   }
                        { SI-hez -U-val t”bbet kell adni          }
   sub    word [@diplus],ax { @DIPLUS is n‹                       }

 { 2.2.4. Vizsg ljuk, hogy a BOB az als¢ sz‚len van-e }
@down:
   cmp    v,0           { V=200-Y-H, ha nulla, vagy pozit¡v, nem  }
   jge    @put          { ny£lik t£l a k‚perny‹n lefele           }
   add    dx,v          { Csak a sorsz ml l¢t kell cs”kkenteni    }

 { 2.3. A BOB kirajzol sa a munkaterletre }

@put:
   mov    word [@cxsave],cx { CX-et elmentjk, ne kelljen minden  }
                        { sor kirak s hoz £jra kisz molni         }
   pop    ds            { A veremben legfell a Shape szegmense   }
                        { volt, ¡gy DS:[SI] a forr sc¡m           }
@putlines:              { Sorok rajzol sa ciklus kezdete          }
   mov    cx,word [@cxsave] { CX a kirakand¢ oszlopok sz ma       }
@putline:               { Egy sor kirak sa ciklus kezdete         }
   lodsb                { AL:=byte ptr DS:[SI], SI:= SI+1         }
   cmp    al,0          { Csak akkor kell kirajzolni ezt a pontot,}
   jz     @NotPut       { ha nem nulla                            }
   mov    es:[di],al
@NotPut:
   inc    di
   loop   @putline      { Egy sor kirak sa ciklus v‚ge, ha CX=0   }
   add    di,word [@diplus]
   add    si,word [@siplus]
   dec    dx            { Sorsz ml l¢ cs”kkent‚se                 }
   jnz    @putlines     { Sorok rajzol sa ciklus v‚ge, ha DX=0    }
   mov    ds,bp         { DS £jra az eredeti adatszegmens         }
@nextbob:               { Ide ugrik, ha a BOB nem l tszik         }
   pop    cx            { CX megint a BOB-okat sz molja           }
   dec    cx            { Egyet m r kiraktunk                     }
   cmp    cx,-1
   jnz    @putbob       { De m‚g a t”bbit is  br zolni kell       }

 { 3. Munkaterlet bem sol sa a grafikus t rba (megjelen¡t‚s) }

 { 3.1. V rakoz s egy vertik lis visszafut sra }
   cmp   retrace,0      { Ha a RETRACE ‚rt‚ke FALSE,              }
   jz    @show          { egyb‹l a megjelen¡t‚s j”n, nem v runk   }
   mov   dx,3dah        { A $3DA porton keresztl figyeljk a     }
@wait:                  { vertik lis visszafut s bek”vetkezt‚t    }
   in    al,dx
   test  al,8           { 3. bit jelzi a visszat‚r‚st             }
   jz    @wait          { Ha nulla, m‚g v rni kell                }

 { 3.2. Munkaterlet m sol sa }
@show:
   mov   es,sega000     { $A000 a grafikus t r kezd‹c¡me          }
   xor   di,di
   mov   cx,32000       { Ugyancsak 32000 sz¢t m solunk           }
   lds   si,workarea    { A munkaterletr‹l m solunk              }
   rep   movsw          { Megjelen¡t‚s                            }
   mov   ds,bp
   pop   bp
   jmp   @exit

@diplus: dw 0           { Ez a h rom v ltoz¢ a k¢dszegmensben van,}
@siplus: dw 0           { az‚rt nem az adatszegmensben, mert arra }
@cxsave: dw 0           { szks‚g van a BOB rajzol s n l          }

@exit:
   end;

begin

 asm mov ax,13h; int 10h end; { MCGA zemm¢d be ll¡t sa           }
 with B[0] do begin
  Load('plane.bob');    { Az egyik BOB egy repl‹                 }
  x:=-w;                { Balr¢l £szik be (‚ppen nem l that¢)     }
  y:= 100- h div 2;     { Pont k”z‚pen megy                       }
  end;
 with B[1] do begin
  Load('rocket.bob');   { A m sik meg egy rak‚ta                  }
  x:= 160- w div 2;
  y:= 200;              { Lentr‹l j”n felfele                     }
  end;
 getmem( background, 64000); { Helyfoglal s a h tt‚rnek ‚s a      }
 getmem( workarea,   64000); { munkaterletnek                    }
 for i:= 0 to 63999 do  { H tt‚r letakar¡t sa                     }
  mem[seg( background^):ofs( background^)+i]:= 0;
 randomize;
 for i:= 1 to 1000 do   { 1000 sz¡nes pixel rajzol sa a h tt‚rre  }
  mem[seg( background^):ofs( background^)+random( 64000)]:= i;

 repeat                 { F‹ ciklus, a megjelen¡t‚st v‚gzi        }
  ShowBOB;
  with B[0] do begin    { Az 1. BOB mozgat sa                     }
   inc( x, 4);          { Balr¢l jobbra, am¡g ki nem £szik a k‚p- }
   if x>=320 then begin { b‹l, majd az elej‚re ugrik, csak m sik  }
    x:=-w;   y:= random( 200+h)-h; { sorban                       }
    end;
   end;
  with B[1] do begin    { A 2. BOB mozgat sa, hasonl¢an, csak fel }
   dec( y, 3);
   if y<=-h  then begin
    y:= 200; x:= random( 320+w)-w;
    end;
   if random( 3)=0 then p:= random( 3); { Kb. minden 5.-re v lt s }
   end;
  until keypressed;     { Billentyûnyom sig megy az anim ci¢      }
 readkey;

 asm mov ax,3; int 10h end; { Ism‚t sz”veges zemm¢d (80ž25)      }
 end.

