program korok;
uses crt,graph;
const k1=40;            {K�r sugara}
var  kpx,kpy,x,y,i,j:integer;
begin
    clrscr;
    randomize;
    kpx:=detect;
    kpy:=detect;
    detectgraph(kpx,kpy);
    filemode:=0;
    initgraph(kpx,kpy,'e:\tp\bgi');
    delay(500);
    for i:=1 to 165 do
    begin
    j:=i mod 15;
    setfillstyle(1,j);
    x:=random(670);
    y:=random(480);
    setcolor(j);
    circle(x,y,k1);
    floodfill(x,y,j);
    delay(20);
    end;
    readln;
    {mi�rt csin�l ures karik�t is?}
end.