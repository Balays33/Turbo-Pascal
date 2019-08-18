program oszthato;
uses crt;
var a: array[1..15,1..15] of integer;
    i,j: integer;
begin
  clrscr;
  randomize;
  for i:=1 to 15 do
    for j:=1 to 15 do a[i,j]:=random(50)+1;
  writeln('A h rommal oszthat¢ sz mok:');
  for i:=1 to 15 do
    begin
      for j:=1 to 15 do
         begin
           if (a[i,j] mod 3)=0 then textcolor(yellow+128)
                               else textcolor(white);
           write(a[i,j]:4);
         end;
      writeln;
    end;
  readln;
end.