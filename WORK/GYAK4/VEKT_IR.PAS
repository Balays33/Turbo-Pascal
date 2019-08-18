program vekt_ir;
uses crt;
var a: array[1..10,1..10] of integer;
    v: array[1..10] of integer;
    i,j,k: integer;
    c:char;
begin
  clrscr;
  randomize;
  for i:=1 to 10 do
    for j:=1 to 10 do a[i,j]:=random(50)+1;
  repeat
  write('Melyik sort ¡rjam  t egy vektorba (max. 10):');
  readln(k);
  c:='+';
  if (k<1) or (k>10) then
                       begin
                         writeln('Hib s ‚rt‚k!');
                         c:='-';
                       end;
  until c='+';
  for i:=1 to 10 do v[i]:=a[k,i];
  for i:=1 to 10 do
    begin
      for j:=1 to 10 do
         begin
           write(a[i,j]:4);
         end;
      writeln;
    end;
  writeln;
  writeln('A vektor:');
  for i:=1 to 10 do write(v[i]:4);
  readln;
end.
