uses crt,graph;
var gd,i,x,y,r,gm:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 repeat
 x:=0;
 y:=0 ;
 r:=0  ;
 for i:=1 to 200 do
 begin
 y:=y+2;
 x:=x+2 ;
 r:=r+1;
{ delay(10);}
 setcolor(black);
 circle(x-2,y-2,r-1);
 setcolor(lightblue);
 circle(x,y,r);
 setcolor(black);
 circle(640-(x-2),480-(y-2),r-1);
 setcolor(lightblue);
 circle(640-x,480-y,r);
 setcolor(black);
 circle(x-2,480-(y-2),r-1);
 setcolor(lightblue);
 circle(x,480-y,r);
 setcolor(black);
 circle(640-(x-2),y-2,r-1);
 setcolor(lightblue);
 circle(640-x,y,r);
 end;
 i:=1;
 for i:=1 to 200 do
 begin
 y:=y-2;
 x:=x-2 ;
 r:=r-1;
{ delay(10);  }
 setcolor(black);
 circle(x-2,y-2,r-1);
 setcolor(lightblue);
 circle(x,y,r);

setcolor(black);
 circle(640-(x-2),480-(y-2),r-1);
 setcolor(lightblue);
 circle(640-x,480-y,r);

 setcolor(black);
 circle(x-2,480-(y-2),r-1);
 setcolor(lightblue);
 circle(x,480-y,r);


 setcolor(black);
 circle(640-(x-2),y-2,r-1);
 setcolor(lightblue);
 circle(640-x,y,r);



 end;
 until keyPressed;
 readkey;
 closegraph;
end.
