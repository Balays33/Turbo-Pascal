program ablak8;
uses crt;
var
  r,m,k    :real;
  v,a      :real;
 begin
    clrscr;
    write('k‚rem a sug r ‚rt‚k‚t r= ');
    readln(r);
    write('k‚rem a magass g ‚rt‚k‚t m= ');
    readln(m);
    k:=r*r*pi;
    v:=k*m;
    a:=2*k+2*r*pi*m;
    clrscr;
    gotoxy(25,4);
    writeln('Henger t‚rfogata, felsz¡ne.');
    window(8,8,32,22);
    textbackground(blue);
    clrscr;
    gotoxy(10,5);
    writeln('r=',r:5:2);
    gotoxy(10,10);
    writeln('m=',m:5:2);
    window(48,8,72,22);
    textbackground(red);
    clrscr;
    gotoxy(10,5);
    writeln('V=',v:5:2);
    gotoxy(10,10);
    writeln('A=',a:5:2);
    readln;
    window(1,1,80,25);
    textbackground(black);
    clrscr;
 end.