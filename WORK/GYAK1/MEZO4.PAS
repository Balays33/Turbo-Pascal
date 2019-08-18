program mezo4;                                         
uses crt;
const
   k=12345.767;
var
   a,b,c:integer;
   x,y,z,w:real;
   szov:string;
begin
   clrscr;
   write('a=');readln(a);   write('b=');readln(b);
   write('c=');readln(c);   
   x:=126426.346;
   w:=(a*x+b*k)/(x*x*c/a/b);
   szov:='sz molta:Einstein';
   writeln('w=',w);
   writeln('w=',w:12:3);
   writeln('w=',w:1:3);
   writeln('w=',w:7:1);
   writeln('w=',w:10:3);
   writeln('a param‚terek: a=',a,'b=',b:12,' c=',c:1,' x=',x:1:3,' k=',k:10);
   writeln(szov);
   textcolor(cyan);
   writeln('¡rd  t a programot a saj t egy‚nis‚gedre.');
   textcolor(lightgray);
   readln;
end.