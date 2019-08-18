program WG;
   uses crt;
   var n:string[20];
Begin
  textbackground(black);
  clrscr;
  textcolor(green);
  writeln('  c:\>hello!!!');
  write('  c:\>Please your name:');     readln(n);
  clrscr;
  writeln('  Welcome:',n);
  clrscr;
  write('  Wake up ',n);      write('!');
  textcolor(white);
  gotoxy(63,24);
  write('West Graphic 1.00');
  readln;
End.