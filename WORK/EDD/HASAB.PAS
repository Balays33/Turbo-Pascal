Program hasab;
   Uses Crt;
   Var t,p,a:Integer;
   Begin
     Clrscr;
     Writeln;
     Writeln('       HASµB FELSZÖNE!');
     Writeln;
     Write('       K‚rem a has b alapj nak a terlet‚t! (eg‚sz sz m!) ');
     Read(t);
     Writeln;
     Write('       K‚rem a has b pal stj nak terlet‚t! (eg‚sz sz m!) ');
     Read(p);
     a:=2*t+p;
     Writeln;
     Writeln;
     Writeln('A ',t,' ‚s ',p,' oldal£ has b felsz¡ne: ',a);readln;
     Writeln;
     Writeln('          A folytat shoz nyomd meg az ENTER billentyût!');
     Readln;
    End.
