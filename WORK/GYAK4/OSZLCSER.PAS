program oszlcser;
uses crt;
var i,j,x,y,z: integer;
    a: array[1..10,1..10] of integer;
begin
  clrscr;
  randomize;
  for i:=1 to 10 do
    for j:=1 to 10 do a[i,j]:=random(50)+1;
  writeln('Melyik oszlopokat cser‚ljem fel (max. 10)?');
  write('az els“:'); readln(x);
  write('a m sodik:'); readln(y);
  writeln('Az eredeti m trix:');
  for i:=1 to 10 do
    begin
      for j:=1 to 10 do write(a[i,j]:5);
      writeln;
    end;
  for i:=1 to 10 do
    begin
      z:=a[i,x]; a[i,x]:=a[i,y]; a[i,y]:=z;
    end;
  writeln('A oszlopcser‚s m trix:');
  for i:=1 to 10 do
    begin
      for j:=1 to 10 do write(a[i,j]:5);
      writeln;
    end;
  readln;
end.