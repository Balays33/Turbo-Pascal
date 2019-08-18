{Csat ri Norbert munk ja}
uses crt;
var m:array[1..10,1..10] of integer;
    i,j,cs:integer;
begin
  randomize;
  clrscr;
  for i:=1 to 10 do
    for j:=1 to 10 do
      begin
        m[i,j]:=random(1000);
        gotoxy(j*5,i);
        write(m[i,j]);
      end;
  for j:=1 to 99 do
    for i:=2 to 100 do
    if m[((i-1) div 10)+1,((i-1) mod 10)+1]<m[((i-2) div 10)+1,((i-2) mod 10)+1] then
      begin
        cs:=m[((i-1) div 10)+1,((i-1) mod 10)+1];
        m[((i-1) div 10)+1,((i-1) mod 10)+1]:=m[((i-2) div 10)+1,((i-2) mod 10)+1];
        m[((i-2) div 10)+1,((i-2) mod 10)+1]:=cs;
      end;
  for i:=1 to 10 do
    for j:=1 to 10 do
      begin
        gotoxy(j*5,i+11);
        write(m[i,j]);
      end;
  readln;
end.
