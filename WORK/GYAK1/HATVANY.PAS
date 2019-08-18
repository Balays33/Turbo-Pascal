program hatvany;
uses crt;
var x,y,w:real;
begin
  clrscr;
  writeln('K‚rem a hatv nyalapot!');
  write('x=');  readln(x);
  writeln('K‚rem a kitev‹t!');
  write('y=');  readln(y);
  w:=exp(y*ln(x));
  writeln('w=',w);
  writeln('w:3:2=',w:3:2);
  writeln('w:10:2=',w:10:2);
  readln;
end.