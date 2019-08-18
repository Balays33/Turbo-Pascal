program megoldo;  
uses crt;
var d,x,y  :real;
    a,b,c:integer;
begin
clrscr;
  writeln('aX^2+bX+c');
  repeat
      write('Adja meg "a" ‚rt‚k‚t: ');
      readln(a);
      if a = 0 then writeln('"a" ‚rt‚ke nem lehet nulla!');
  until a<>0;

            write('Adja meg "b" ‚rt‚k‚t: '); readln(b);
            write('Adja meg "c" ‚rt‚k‚t: '); readln(c);
  writeln;

  writeln(a,'x^2+',b,'x+',c,'=0 egyenlet megold sa:');
  d:=b*b-4*a*c;
  if d < 0 then writeln('A gy”k alatt negat¡v sz m j”tt ki, nincs megold s!')
           else if d = 0 then begin
                               x:=-b/(2*a);
                                writeln('X=',x:9:2);
                                end
                         else begin
                                       x:=(-b+sqrt(b*b-4*a*c))/(2*a);
                                       y:=(-b-sqrt(b*b-4*a*c))/(2*a);
                                        writeln('X1=',x:9:2);
                                        writeln('X2=',y:9:2);
                                        end;
                                        readln;
end.