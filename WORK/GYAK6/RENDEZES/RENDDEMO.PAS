program sorbarendezes;
uses crt;
type
   tomb=array[1..5] of integer;
var
   otszam : tomb;
   i      : integer;
   c      : char;
procedure bevitel;
var
   i : integer;
begin
   clrscr;
   writeln('K‚rek 5 sz mot:');
   for i:=1 to 5 do
        read(otszam[i]);
writeln;
end;
procedure kiir(var uj:tomb);
begin
  for i:=1 to 5 do
    write(uj[i]:3);
end;
procedure rendez(elem:integer;var regi,uj:tomb);
var
   i,csere,temp : integer;
begin
   uj:=regi;
   repeat
      csere:=0;
      for i:=1 to elem-1 do
         if uj[i]>uj[i+1] then
            begin
               temp   :=uj[i];
               uj[i]  :=uj[i+1];
               uj[i+1]:=temp;
               csere:=csere+1;
               kiir(uj);
               c:=readkey;
               writeln;
            end;
       writeln;
   until csere=0
end;

begin       {f“program}
  bevitel;
  rendez(5,otszam,otszam);
  gotoxy(1,15);
end.