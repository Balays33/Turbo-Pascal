{putpixel.pas}

procedure PutPixel( X,Y: word; C: byte); assembler; asm
                        { (X;Y) helyzet˚ C sz°n˚ pont rajzol†sa   }
   mov    es,sega000    { A vide¢mem¢ria szegmensÇt a SEGA000 sz¢ }
                        { tartalmazza, ÇrtÇke $A000               }
   mov    ax,320        { A kÇp szÇlessÇge 320 pixel              }
   mul    Y             { A pont sor†nak kezdãc°me: 320ûY         }
   add    ax,X          { A pont c°me: 320ûY+X                    }
   mov    di,ax         { ES:[DI] a felgy£jtand¢ pont c°me        }
   mov    al,C          { C-t kell °rni ebbe a b†jtba             }
   mov    es:[di],al    { Pixel kigy£jt†sa                        }
   end;

procedure MCGA_On; assembler; asm
                        { MCGA Åzemm¢d bekapcsol†sa               }
   mov    ax,0013h      { 00h Åzemm¢d, 13h funkci¢                }
   int    10h           { 10h sorsz†m£ megszak°t†s                }
   end;

procedure MCGA_Off; assembler; asm
                        { VisszatÇrÇs a szîveges Åzemm¢dhoz       }
   mov    ax,0003h      { A 80û25-îs m¢d a 03h funkci¢            }
   int    10h           { Megint a 10h megszak°t†st haszn†ljuk    }
   end;

begin
 MCGA_On;
 PutPixel(   0,   0, 12); { A kÇpernyã nÇgy sark†ba nÇgy kÅlînbî- }
 PutPixel( 319,   0, 13); { zã sz°n˚ pont kirajzol†sa             }
 PutPixel(   0, 199, 14);
 PutPixel( 319, 199, 15);
 readln;                { Enter megnyom†s†ra kilÇp                }
 MCGA_Off;
 end.