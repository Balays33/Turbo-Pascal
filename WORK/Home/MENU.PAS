Program menu;
   uses crt;
   var a:char;
Procedure F2;
      begin
        clrscr;
        window(15,1,65,22);
        textbackground(9);
        textcolor(4);
        clrscr;
        writeln('Ez a t”rt‚net');
        readln;
        textbackground(0);
        clrscr;
      end;

Begin
  clrscr;
  writeln('M M trix,Sz m¡t sok');
  writeln('S Seg¡ts‚g');
  writeln('ESc Kil‚p‚s');
  writeln;
  write('K‚rem a men sz m t:');
  readln(a);
  case a of
   M: Write('New Game');
   S: F2;
   Esc: write('Quit');
  end;
readln;
end.