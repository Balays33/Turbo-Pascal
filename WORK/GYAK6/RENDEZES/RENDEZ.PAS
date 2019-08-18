program sorbarendezes;     {rendez‚s elj r ssal}
uses crt;
type
   tomb=array[1..10] of integer;
var
   vektor : tomb;
   renvek:tomb;
   i      : integer;
   c      : char;
procedure bevitel;
var
   i : integer;
begin
   clrscr;
   writeln('K‚rek 10 sz mot:');
   for i:=1 to 10 do
        begin
        write('az ',i,'-elem=');
        read(vektor[i]);
        end;
writeln;
end;
procedure kiir(var uj:tomb);
begin
  for i:=1 to 10 do
    write(uj[i]:3);
end;
procedure rendez(elem:integer;var regi,uj:tomb);
var
   i,csere,w : integer;
begin
   uj:=regi;
   repeat
      csere:=0;
      for i:=1 to elem-1 do
         if uj[i]>uj[i+1] then
            begin
               w   :=uj[i];
               uj[i]  :=uj[i+1];
               uj[i+1]:=w;
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
  rendez(10,vektor,renvek);
  write('teh t a rendezett vektor:');
  kiir(renvek);
end.