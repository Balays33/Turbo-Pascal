uses crt,graph;
var gd,gm:integer;
x,y:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 line(0,239,639,239);
 line(319,239,319,479);
 x:=30;
 repeat
 setfillstyle(random(12)+1 ,random(15)+1);
 circle(x,119,30);
 floodfill(x,119,white);
 x:=x+60;
 until x>609;
 x:=240;
 y:=0;
 repeat
 setcolor(4);
 line(0,x,y,479);
 delay(5);
 x:=x+5;
 y:=y+4;
 until x>479;
 x:=319;
 y:=479;
 repeat
 setcolor(3);
 line(x,239,319,y);
 delay(5);
 x:=x-5;
 y:=y-4;
 until x<15;
 line(480,255,319,480);
 readkey;
 closegraph;
end.
