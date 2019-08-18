Program WestG;
   uses crt;
   var i,x:integer;
Begin
clrscr;
randomize;
textcolor(green);
clrscr;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln('    Ы       Ы  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫЫ   ЫЫЫЫ   ЫЫ     Ы     ЫЫ   Ы  Ы  ЫЫЫ   ЫЫЫ     ');
writeln('     Ы     Ы   Ы     Ы       Ы    Ы      Ы  Ы   Ы Ы   Ы  Ы  Ы  Ы   Ы   Ы        ');
writeln('     Ы  Ы  Ы   ЫЫЫ    ЫЫ     Ы    Ы ЫЫЫ  ЫЫЫ   Ы   Ы  ЫЫЫ   ЫЫЫЫ   Ы   Ы        ');
writeln('     Ы Ы Ы Ы   Ы        Ы    Ы    Ы   Ы  Ы Ы    ЫЫЫ   Ы     Ы  Ы   Ы   Ы        ');
writeln('      Ы   Ы    ЫЫЫЫ  ЫЫЫЫ    Ы     ЫЫЫ   Ы  Ы  Ы   Ы  Ы     Ы  Ы  ЫЫЫ   ЫЫЫ     ');
gotoxy(1,3);
textcolor(red);
writeln(' Barcza Bal zs');
writeln(' DJVMN2');
writeln(' MЃszaki Informatika');
gotoxy(65,23);
textcolor(green);
writeln('Please  <ENTER> ');
readln;
  repeat
    x:=random(10);
    write(x:4);
    i:=i+1;
  until i > 460;
readln;
end.

