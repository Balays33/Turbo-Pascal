
program p4_pos;
uses crt;
var
 s:string;
begin
 clrscr;
 s:='                 123.4';
 while pos(' ',s)>0 do
  begin
   s[pos(' ',s)]:='0';
   writeln(s);
  end;
 s:=readkey;
end.
