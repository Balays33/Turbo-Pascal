uses crt,graph;
var gd,gm:integer;
     m,t,x1,r1,x2,r2:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 repeat
   x1:=random(638);
   r1:=random(46)+16;
   x2:=random(638);
   r2:=random(46)+16;
 until (x1-r1>2) and (x1+r1<637) and (x2-r2>2) and (x2+r2<639) and (x1+r1<>x2+r2);
 t:=-40;
 repeat
 setcolor(brown);
 circle(x1,m,r1);
 delay(7);
 setcolor(0);
 circle(x1,m,r1);
 setcolor(brown);
 circle(x2,t,r2);
 delay(7);
 setcolor(0);
 circle(x2,t,r2);
 m:=m+1;
 t:=t+1;
 until m=300;
 readkey;
 closegraph;
end.
