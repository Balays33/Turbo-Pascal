program kordiagram;
uses crt,graph;

var tomb       :        array[1..24] of integer;
    i,n        :        byte;
    ossz,gm,gd :        integer;
    egys       :        real;

begin
clrscr;
write('H ny adatot fogsz megadni (max. 20) ? ');
readln(n);
while n>20 do
  begin
    write('Nem j¢. Max. 20. —jra! ');
    readln(n);
  end;
ossz:=0;
for i:=2 to n+1 do
  begin
    write('K‚rem a(z) ',i-1,'-dik elemet! : ');
    readln(tomb[i]);
    ossz:=ossz+tomb[i];
  end;
egys:=360/ossz;
filemode:=0;
gm:=detect;
initgraph(gm,gd,'g:\pusw\bp\bgi');
cleardevice;
tomb[1]:=0;
ossz:=0;
setbkcolor(black);
setcolor(lightgreen);
for i:=1 to n do
 begin
   setfillstyle(i,i);
   ossz:=ossz+tomb[i];
   pieslice(320,240,round(ossz*egys),round(ossz*egys+egys*tomb[i+1]),200);
 end;
readkey;
closegraph;
end.