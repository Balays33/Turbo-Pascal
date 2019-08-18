Program egyenes;
      Uses Crt;
      Var i,a,b,c,n,y:Integer;
          nev:string[15];
  Procedure kezdo;
    Begin
     Clrscr;
     Writeln;
     Writeln('                          EGYENESEK VIZSGµLATA!');
     Writeln;
     Writeln('Kedves ',nev,' !');
     Writeln;
     Writeln;
     Writeln('Az egyenes egyenlete: "y=a*x+b"');
     Writeln;
     Writeln;
     Write('     K‚rem az "a" ‚rt‚k‚t (eg‚sz sz mot k‚rek!)  ');
     Read(a);
     Writeln;
     Write('     K‚rem a "b" ‚rt‚k‚t (eg‚sz sz mot k‚rek!)  ');
     Read(b);
     Writeln;
     Write('     K‚rem az "x" ‚rt‚k‚t (eg‚sz sz mot k‚rek!)  ');
     Read(c);
     If (a=0) or (c=0) Then
             Begin
                Writeln;
                Writeln;
                Writeln('Az egyenes p rhuzamos az "x" tengellyel!');
                Writeln('y= ',b);
             End
                      Else
             Begin
                Writeln;
                Writeln; y:=a*c+b;
                Writeln('y=',a,'*',c,'+',b,'=',y);
             End;
     Writeln;Readln;
     Writeln('        A folytat shoz nyomd meg az ENTER billentyût!');
     Readln;
    End;
Begin
     Clrscr;
     Writeln;Writeln;Writeln;
     Writeln('                          EGYENESEK VIZSGµLATA!');
     Writeln;
     Write('     K‚rlek ¡rd be a keresztneved!  ');
     Read(nev);
     Writeln;
     Writeln;
     Writeln;
     Write('     H ny egyenest szeretn‚l vizsg lni? (eg‚sz sz mot k‚rek!)   ');
     Read(n);
     For i:=1 to n do kezdo;
     Clrscr;
     Writeln;Writeln;Writeln;
     Writeln('Kedves ',nev,' !');
     Writeln;
     Writeln('            J¢ volt Veled dolgozni!');
     Writeln;
     Writeln('                     A folytat shoz nyomd meg az ENTER billentyût!');
     Readln;
End.