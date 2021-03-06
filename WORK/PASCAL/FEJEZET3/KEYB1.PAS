{keyb1.pas}

uses DOS;

var  KEY: array [0..127] of boolean;
                        { Ez a t�mb t�rolja a billenty�k adatait  }
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
   mov    bl,al         { BL-be is bevissz�k a k�dot              }
   shl    al,1          { C jelz�bit (FLAG) = 7. bit              }
   cmc                  { Ezt neg�ljuk, �gy ha 0, felengedt�k az  }
                        { adott billenty�t, ha 1, akkor lenyomtuk }
   adc    cl,00         { CL most 0 vagy 1 lehet (FALSE, TRUE)    }
   and    bl,127        { Az als� 7 bit adja a val�di SCAN-k�dot  }
   mov    [offset key+bx],cl { A megszakt�st kiv�lt� billenty�h�z }
                        { tartoz� logikai v�ltoz� be�llt�sa       }
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
  for i:= 0 to 127 do if key[i] then writeln(i);
                        { A lenyomott billenty� k�dja a k�perny�re}
  until key[1];         { ESC megnyom�s�ig                        }
 setintvec( $09, @OLD);
 end.
