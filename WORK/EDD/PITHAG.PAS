Program pithagoras;
   Uses Crt;
   Var a,b,c:Real;
   Begin
     Clrscr;
     Writeln;
     Writeln('                          HµROMSZ™GEK VIZSGµLATA!');
     Writeln;
     Write('     K‚rem az egyik oldalt!   ');
     Read(a);
     Writeln;
     Write('     K‚rem a m sik oldalt!  ');
     Read(b);
     Writeln;
     Write('     K‚rem a harmadik oldalt!  ');
     Read(c);
     If (a*a+b*b=c*c) Then
             Begin
                Writeln;
                Writeln;
                Writeln('Az ',a:2,' ‚s ',b:2,' ‚s ',c:2,' oldal£ h romsz”g der‚ksz”gû!');
             End
                      Else
             Begin
                Writeln;
                Writeln('Az ',a:2,' ‚s ',b:2,' ‚s ',c:2,' sz mok nem alkotnak');
                Writeln('               Pithagoraszi sz mh rmast!');
             End;
     Writeln;Readln;
     Writeln('        A folytat shoz nyomd meg az ENTER billentyût!');
     Readln;
   End.