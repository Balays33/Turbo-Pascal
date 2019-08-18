Program vonal;
   uses crt;
   var a,i:integer;
Begin
randomize;
clrscr;
  for i:=1 to 70 do
      begin
        gotoxy(i,5);
        write('Û');
        gotoxy(3,i);
        write('Û');
      end;
readln;
end.