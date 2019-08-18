program ablak2;                                                    
uses crt;
begin
   textbackground(green);
   clrscr;
   gotoxy(45,18);
   writeln('ez a negyedik');
   window(1,1,40,12);
    textbackground(blue);
    clrscr;
    gotoxy(5,5);
    writeln('ez az els“ negyed');
    window(1,13,40,25);
    textbackground(yellow);
    clrscr;
     gotoxy(5,5);
    writeln('ez a m sodik negyed');
    textbackground(magenta);
    window(41,1,80,12);
    clrscr;
     gotoxy(5,5);
    writeln('ez a harmadik negyed');
    readln;
end.


