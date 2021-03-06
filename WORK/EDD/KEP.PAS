{$X+}

uses Crt;

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
  if IOResult<>0 then begin
   WriteLn(' Nincs ilyen f�jl.');
   halt;
   end;
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
 if ParamCount=0 then halt;
 asm mov ax,13h; int 10h end;
 LoadLBM( ParamStr( 1), PTR($A000,0));
 ReadKey;
 asm mov ax,03h; int 10h end;
 end.
