program szivat;
uses crt;
var a,b:integer;
    c:real;
begin
clrscr;
randomize;
a:=random(21);
b:=random(20);
writeln(a);
writeln(b);
if (abs(a-b)<5)
   and
   ((a+b)>10)
   then  c:=(a+b)/(a-b)
   else  c:=sqrt(sqr(a)+sqr(b));
   write('az eredmeny: ',c:6:2);
   readln;
   end.
