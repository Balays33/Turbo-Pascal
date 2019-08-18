{menudemo.pas}

uses Menu, Mouse, MCGA; { Ezeket a unitokat m r ismertettk       }

begin
 SetMode($13);          { MCGA zemm¢d bekapcsol sa               }
 if not InitMouse then begin
  SetMode( 3);
  writeln('Az eg‚r nincs install lva.'+#7 { Hangjelz‚s } );
  halt
  end;
 MainMenu('Z”lds‚g Gym”lcs');     { A mensor k‚t egys‚gb‹l  ll  }
 SubMenu( 1, 'R‚pa;Retek;Dinnye'); { A 'Z”lds‚g' men funkci¢i    }
 SubMenu( 2, 'Alma;K”rte;Meggy');  { A 'Gym”lcs' men funkci¢i   }
 MFColor:= 01;                     { El‹t‚rsz¡n: k‚k              }
 SBColor:= 12;                     { V lasztott elem h tt‚rsz¡ne  }
 Refresh( true);                   { Mensor megjelen¡t‚se        }
 ShowMouse;                        { Eg‚rkurzor megjelen¡t‚se     }
 PointColor:= 12;
 TextBackColor:= 0;

 repeat
  repeat until ButtonPressed;   { Gombnyom sra v rakoz s          }
  GetMenu;                      { Kiv lasztott elem lek‚rdez‚se   }
  PointColor:= 15;              { Ezt a k‚t v ltoz¢t a GetMenu    }
  TextBackColor:= 0;            { elj r s megv ltoztatja          }
  if MenuRes>0 then
  OutText( 0, 100,              { Eredm‚ny ki¡r sa                }
    SubStr[MainRes,MenuRes]+' '+MainStr[MainRes]+'      ');
  until MainRes=0;              { Kil‚p‚s, ha m shol kattintunk   }

 SetMode( 3);           { Sz”veges m¢d                            }
 end.