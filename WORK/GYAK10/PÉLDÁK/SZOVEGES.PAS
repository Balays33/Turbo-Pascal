program grafix;
uses crt,graph;
var a,b,mx,my:integer;
begin
     a:=detect;b:=detect;
     filemode:=0;
     initgraph(a,b,'e:\tp\bgi');
     setbkcolor(0);
     setviewport(0,0,getmaxx ,getmaxy ,true);
     cleardevice;
     READLN;
     setbkcolor(6);
     mx:=getmaxx div 2;
     my:=getmaxy div 2;
     setviewport(0,0,mx,my,true);
     cleardevice;
     READLN;
     setcolor(red);              { igy se }
     line(0,0,mx,0);
     line(mx,0,mx,my);
     line(mx,my,0,my);
     line(0,my,0,0);
     setfillstyle(0,3);
     floodfill(1,1,red);        { igy se }
     readln;
     setcolor(green);
     rectangle(1,1,mx-1,my-1);
     floodfill(2,2,green);
     readln;
     setcolor(magenta);
     settextjustify(0,0); {ha ez nincs, akkor a m sik ir nyba l¢g ki}
     settextstyle(3,horizdir,1);
     outtextxy(10,10,'A b r a k a d a b r a');   {ez mi‚rt nem l tszik?}
     settextstyle(sansseriffont,vertdir,2);
     outtextxy(1,110,'A b r a k a d a b r a');
     settextstyle(1,horizdir,1);
     outtextxy(110,200,'Abrakadabra');
     settextstyle(4,vertdir,2);
     outtextxy(250,130,'Abrakadabra');
     readln;
     closegraph;
     end.

