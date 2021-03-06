{keyb3.pas}

uses DOS;

var  KEY: array [0..255] of boolean;
                        { Most 2�128 elem� a t�mb                 }
     OLD: procedure;    { A r�gi megszakt�svektor                 }
     i  : byte;         { A FOR ... TO ... DO ... ciklushoz       }

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
   in     al,61H        { A megszak�t�s csatorna vissza�ll�t�sa   }
   mov    ah,al
   or     al,80H
   out    61H,al        { Jelz�s a billenty�zetnek                }
   mov    al,ah
   nop                  { Kev�s v�rakoz�s                         }
   nop                  { (soros adatkik�ld�s sebess�ge miatt)    }
   nop
   out    61H,al
   cli
   mov    al,20H        { "Megszak�t�s v�ge" jelz�s               }
   out    20H,al
   sti
   pop    cx            { Regiszterek visszaolvas�sa a veremb�l   }
   pop    bx
   pop    ax
   pop    ds
   iret                 { V�ge a megszakt�snak                    }
   end;

begin
 getintvec( $09, @OLD); { A r�gi megszakit�svektort t�roljuk      }
 setintvec( $09, @NewIRQ); { A $09 megszakt�s ezent�l a NEWIRQ    }
                        { elj�r�st h�vja meg                      }
 fillchar(key,sizeof(key),0); { KEY t�mb null�z�sa (FALSE)        }
 repeat
  for i:=   1 to 127 do if key[i] then writeln(i:3);
                        { A lenyomott billenty� k�dja a k�perny�re}
  for i:= 128 to 255 do if key[i] then { Ha a b�vtett a billen-   }
   writeln(i-128:3,'+');{ ty�, egy pluszjelet is ki�runk ut�na    }
  until key[1];         { ESC megnyom�s�ig                        }
 setintvec( $09, @OLD);
 end.
