program henger;
uses crt;
var
  r,m,k    :real;
  v,f      :real;

 begin
    clrscr;
    writeln('Henger t‚rfogat nak ‚s felsz¡n‚nek sz m¡t sa');
    write('k‚rem a sug r ‚rt‚k‚t r= ');
    readln(r);
    write('k‚rem a magass g ‚rt‚k‚t m= ');
    readln(m);
    k:=r*r*pi;
    v:=k*m;
    f:=2*k+2*r*pi*m;
    writeln('t‚rfogat=',v:8:4);
    writeln('felsz¡n=',f:8:4);
    readln;
 end.