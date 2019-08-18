program veletlen_szakasz_kor;
uses crt, graph;
var gd,gm,x1,x2,y1,y2,r,sz:integer;
    maxx,maxy:integer;
    c:char;
begin
gd:=detect;
filemode:=0;
initgraph(gd,gm,'e:\tp\bgi');
cleardevice;
randomize;
maxx:= getmaxx;
maxy:= getmaxy;

repeat
   x1:=random(maxx); y1:=random(maxy);
   x2:=random(maxx); y2:=random(maxy);
   sz:=random(16);
   setcolor(sz);
   line(x1,y1,x2,y2);
   delay(50);
until keypressed;
c:=readkey; if c=#0 then readkey;

cleardevice;
repeat
    repeat
       x1:=random(maxx);
       y1:=random(maxy);
       r :=random(80);
    until ((x1-r)>=0) and ((x1+r)<=maxx) and
	  ((y1-r)>=0) and ((y1+r)<=maxy);
    sz:=random(16);
    setcolor(sz);
    circle(x1,y1,r);
    delay(50);
until keypressed;
closegraph;
end.
