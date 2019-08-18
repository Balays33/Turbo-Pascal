{felez‚ses keres‚s - }
uses crt;
var
a:array[1..100] of byte;
ah,fh,k,z,n,i,j,szam:integer;
vane,megv:boolean;

begin
  randomize;
  { felt”lt‚s }
  for i:=1 to 100 do a[i]:=random(100)+1;
  {kiir s}
  clrscr;
  writeln('A vektor: ');
   for i:=1 to 100 do write(a[i]:3);
   readln;

  {rendez‚s}
  repeat
    vane:=false;
    for j:=1 to 99 do
      begin
        if a[j]>a[j+1] then
          begin
           z:=a[j+1];
           a[j+1]:=a[j];
           a[j]:=z;
           vane:=true;
          end;
      end;
    until not vane;
    writeln('A rendezett vektor: ');
   for i:=1 to 100 do write(a[i]:3);
   readln;

    {keres‚s}
   writeln;
   write('Melyik sz mot szeretn‚ kerestetni (max 100)?');
   readln(szam);

 ah:=1;fh:=100;megv:=false;
  repeat
   k:=(ah+fh) div 2;
   if a[k]=szam then
    begin
     writeln('Megtal ltam! A ',k,'. helyen van!');
     megv:=true;
     end
     else
       if szam<a[k] then fh:=k-1 else ah:=k+1;
  until (megv) or (ah>fh);
  if not megv then writeln('Nem tal ltam meg a keresett elemet!');
  repeat until keypressed;
  for i:=1 to 100 do write(a[i]:3);
  readln;
  readln;
end.