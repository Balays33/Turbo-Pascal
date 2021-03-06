{putpixel.pas}

procedure PutPixel( X,Y: word; C: byte); assembler; asm
                        { (X;Y) helyzet� C sz�n� pont rajzol�sa   }
   mov    es,sega000    { A vide�mem�ria szegmens�t a SEGA000 sz� }
                        { tartalmazza, �rt�ke $A000               }
   mov    ax,320        { A k�p sz�less�ge 320 pixel              }
   mul    Y             { A pont sor�nak kezd�c�me: 320�Y         }
   add    ax,X          { A pont c�me: 320�Y+X                    }
   mov    di,ax         { ES:[DI] a felgy�jtand� pont c�me        }
   mov    al,C          { C-t kell �rni ebbe a b�jtba             }
   mov    es:[di],al    { Pixel kigy�jt�sa                        }
   end;

procedure MCGA_On; assembler; asm
                        { MCGA �zemm�d bekapcsol�sa               }
   mov    ax,0013h      { 00h �zemm�d, 13h funkci�                }
   int    10h           { 10h sorsz�m� megszak�t�s                }
   end;

procedure MCGA_Off; assembler; asm
                        { Visszat�r�s a sz�veges �zemm�dhoz       }
   mov    ax,0003h      { A 80�25-�s m�d a 03h funkci�            }
   int    10h           { Megint a 10h megszak�t�st haszn�ljuk    }
   end;

begin
 MCGA_On;
 PutPixel(   0,   0, 12); { A k�perny� n�gy sark�ba n�gy k�l�nb�- }
 PutPixel( 319,   0, 13); { z� sz�n� pont kirajzol�sa             }
 PutPixel(   0, 199, 14);
 PutPixel( 319, 199, 15);
 readln;                { Enter megnyom�s�ra kil�p                }
 MCGA_Off;
 end.