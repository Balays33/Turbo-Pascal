uses crt; {Sz”veg szaladg ltat s a k‚perny“n}
var sz:string;
i,j,k:integer;
begin
clrscr;
writeln('K‚rem a sz”veget: ');
readln(sz);
randomize;
repeat
k:=random(23)+1;   {hogy 0 ne legyen!}
textcolor(random(14)+1);
for i :=1 to (80-length(sz)) do
 begin
  clrscr;
  gotoxy(i,k);
  writeln(sz);
  delay(50);
 end;
for i :=(80-length(sz)) downto 1 do
 begin
  clrscr;
  gotoxy(i,k);
  writeln(sz);
  delay(50);
 end;
 j:=j+1;
 until j = 10;
 readln;
end.