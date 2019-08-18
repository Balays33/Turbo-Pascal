uses crt,graph;
var gd,gm:integer;
x:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 x:=30;
 repeat
 setcolor(9);
 circle(x,30,20);
 delay(5);
 setcolor(0);
 circle(x,30,20);
 x:=x+1;
 until x>610;
 x:=30;
 repeat
 setcolor(9);
 circle(610,x,20);
 delay(5);
 setcolor(0);
 circle(610,x,20);
 x:=x+1;
 until x>450;
 x:=610;
 repeat
 setcolor(9);
 circle(x,450,20);
 delay(5);
 setcolor(0);
 circle(x,450,20);
 x:=x-1;
 until x<20;
 x:=460;
 repeat
 setcolor(9);
 circle(20,x,20);
 delay(5);
 setcolor(0);
 circle(20,x,20);
 x:=x-1;
 until x>20;

 readkey;
 closegraph;
end.
