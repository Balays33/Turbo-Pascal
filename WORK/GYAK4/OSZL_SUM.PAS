program oszl_sum;
uses crt;     {m trix felt”lt‚s ‚s ki¡rat s kezd“knek}
              {v laszthat¢, hogy billenty–zetr“l vagy automatikusan}
              {az oszlopok alatt az oszlop”sszegek ki¡rva}
var
 i,j,n,m,osz:integer;
 v:array [1..10] of integer;
 a:array [1..10,1..10] of integer;
 c:char;
begin
  clrscr;
  randomize;
  writeln('K‚rem az n ‚rt‚k‚t:');readln(n);
  writeln('K‚rem az m ‚rt‚k‚t:');readln(m);
  for i:=1 to n do    {felt”lt‚s}
     for j:=1 to m do a[i,j]:=random(21)-10;
  writeln;
  for j:=1 to m do v[j]:=0;                 {”sszes v elem lenull z sa}
  for i:=1 to n do
     begin
        for j:=1 to m do
           begin
              v[j]:=v[j]+a[i,j];
              if i = j then textcolor(4)
                       else if i>j then textcolor(5)
                                   else textcolor(6);
              write(a[i,j]:5);
           end;
         writeln;
         textbackground(0);
     end;
  writeln;
  textcolor(3);
  for j:=1 to m do write(v[j]:5);
  readln;
end.