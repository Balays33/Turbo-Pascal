program p4_del;
uses crt;
var
 s:string;
 d,k:integer;
begin
 clrscr;
 s:='ljen a sz m¡t stechnika! ';
  writeln(s);
  writeln;
 write('H nyadik betût‹l t”r”ljem? d= ');
 readln(d);
 write('H ny betût t”r”ljek? k= ');
 readln(k);
 writeln;
 delete(s,d,k);
 writeln(s);
 readln;
end.
