program p4_del;
uses crt;
var
 s:string;
 d,k:integer;
begin
 clrscr;
 s:='�ljen a sz�m�t�stechnika! ';
  writeln(s);
  writeln;
 write('H�nyadik bet�t�l t�r�ljem? d= ');
 readln(d);
 write('H�ny bet�t t�r�ljek? k= ');
 readln(k);
 writeln;
 delete(s,d,k);
 writeln(s);
 readln;
end.
