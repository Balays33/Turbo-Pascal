uses crt,graph;
var gd,gm:integer;
x,y,v,z:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 repeat
 setcolor(random(15)+1);
 x:=random(320);
 y:=random(480);
 v:=random(320);
 z:=random(480);
 line(x,y,v,z);
 delay(5);
 until keypressed;
 readln;
 repeat
 repeat
 x:=random(320)+320;
 y:=random(480);
 v:=random(50)+1;
 until (x+v<640) and (x-v>319) and (y-v>=0) and (y+v<480);
 setcolor(random(15));
 circle(x,y,v);
 delay(5);

 until keypressed;


 readkey;
 closegraph;
end.
