{keyb3.pas}

uses DOS;

var  KEY: array [0..255] of boolean;
                        { Most 2û128 elem˚ a tîmb                 }
     OLD: procedure;    { A rÇgi megszakt†svektor                 }
     i  : byte;         { A FOR ... TO ... DO ... ciklushoz       }

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
   in     al,61H        { A megszak°t†s csatorna vissza†ll°t†sa   }
   mov    ah,al
   or     al,80H
   out    61H,al        { JelzÇs a billenty˚zetnek                }
   mov    al,ah
   nop                  { KevÇs v†rakoz†s                         }
   nop                  { (soros adatkikÅldÇs sebessÇge miatt)    }
   nop
   out    61H,al
   cli
   mov    al,20H        { "Megszak°t†s vÇge" jelzÇs               }
   out    20H,al
   sti
   pop    cx            { Regiszterek visszaolvas†sa a verembãl   }
   pop    bx
   pop    ax
   pop    ds
   iret                 { VÇge a megszakt†snak                    }
   end;

begin
 getintvec( $09, @OLD); { A rÇgi megszakit†svektort t†roljuk      }
 setintvec( $09, @NewIRQ); { A $09 megszakt†s ezent£l a NEWIRQ    }
                        { elj†r†st h°vja meg                      }
 fillchar(key,sizeof(key),0); { KEY tîmb null†z†sa (FALSE)        }
 repeat
  for i:=   1 to 127 do if key[i] then writeln(i:3);
                        { A lenyomott billenty˚ k¢dja a kÇpernyãre}
  for i:= 128 to 255 do if key[i] then { Ha a bãvtett a billen-   }
   writeln(i-128:3,'+');{ ty˚, egy pluszjelet is ki°runk ut†na    }
  until key[1];         { ESC megnyom†s†ig                        }
 setintvec( $09, @OLD);
 end.
