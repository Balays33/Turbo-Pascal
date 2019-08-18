program kor_ellip_szakasz_teglalap;
uses crt,graph;
var mx,my,r,x,y,gd,gm,i:integer;
    x1,y1,x2,y2,c:integer;
begin
  randomize;
  gd:=detect;
  filemode:=0;
  initgraph(gd,gm,'e:\tp\bgi');

  setbkcolor(green);
  setcolor(white);
  mx:=getmaxx; my:=getmaxy;
  line(mx div 2,0,mx div 2,my);
  line(0,my div 2,mx,my div 2);

{ K”r”k }
  x:=60; y:=120; r:=10;
  setlinestyle(0,0,2);
  setcolor(red);
  repeat
    circle(x,y,r);
    r:=r+10; x:=50+r;
    delay(200);
  until r>=110;

{ T‚glalapok }
  x1:=mx div 2+10;  y1:=my div 2+10;
  x2:=mx-10;	    y2:=my-10;
  setcolor(yellow);
  repeat
    rectangle(x1,y1,x2,y2);
    x1:=x1+10; y1:=y1+10;
    x2:=x2-10; y2:=y2-10;
    delay(200);
  until y2<y1;

{Ellipszisek}
  x:=mx-mx div 4;
  y:=my-3*my div 4;
  r:=110; c:=5;
  repeat
    c:=c+1;
    setcolor(c);
    setfillstyle(1,c);
    fillellipse(x,y,r+30,r);
    r:=r-10;
    delay(200);
  until r=10;

{ Egyenesek }
  y:=my div 2;
  repeat
   setcolor(random(16)+1);
   line(0,y,mx div 2, my-y+my div 2);
   y:=y+10;
   delay(200);
  until y>my;

  repeat until keypressed;
end.
