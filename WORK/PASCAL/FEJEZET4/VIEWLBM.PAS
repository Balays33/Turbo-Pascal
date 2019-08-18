{$X+}

uses Crt;

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
  if IOResult<>0 then begin
   WriteLn(' Nincs ilyen f†jl.');
   halt;
   end;
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
 if ParamCount=0 then halt;
 asm mov ax,13h; int 10h end;
 LoadLBM( ParamStr( 1), PTR($A000,0));
 ReadKey;
 asm mov ax,03h; int 10h end;
 end.
