function GetPixel( X,Y: word): byte; assembler; asm
                        { Az (X;Y) koordin t j£ pont sz¡ne        }
   mov    es,sega000    { A vide¢mem¢ria szegmens‚t a SEGA000 sz¢ }
                        { tartalmazza, ‚rt‚ke $A000               }
   mov    ax,320        { A k‚p sz‚less‚ge 320 pixel              }
   mul    Y             { A pont sor nak kezd‹c¡me: 320Y         }
   add    ax,X          { A pont c¡me: 320Y+X                    }
   mov    di,ax         { ES:[DI] a leolvasand¢ pont c¡me         }
   mov    al,es:[di]    { A fggv‚ny visszat‚r‚si ‚rt‚ke AL-ben   }
   end;
