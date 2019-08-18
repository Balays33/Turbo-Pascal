program sor_sum;
uses crt;
var a: array[1..10,1..10] of integer;
    i,j,s: integer;
begin
  clrscr;
  randomize;
  for i:=1 to 10 do
    for j:=1 to 10 do a[i,j]:=random(5)+1;
  for i:=1 to 10 do
    begin
      s:=0;
      for j:=1 to 10 do
         begin
           write(a[i,j]:4);
           s:=s+a[i,j];
         end;
      writeln('       sor”sszeg:',s)
    end;
  readln;
end.