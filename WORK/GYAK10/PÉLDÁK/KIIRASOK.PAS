program kiirasok;
uses crt,graph;
var gd,gm:integer;
    x1,y1:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 {***** k‚perny“n k”rbe sz”veg ********}
  x1:=10;
  y1:=20;
  repeat
    setcolor(14);
    outtextxy(x1,y1,'Kopp ny');
    delay(30);
    setcolor(black);
    outtextxy(x1,y1,'Kopp ny');
    x1:=x1+5;
  until x1>560;

  x1:=560; y1:=20;
  repeat
    setcolor(14);
    outtextxy(x1,y1,'Kopp ny');
    delay(30);
    setcolor(black);
    outtextxy(x1,y1,'Kopp ny');
    y1:=y1+5;
  until y1>430;

  repeat
    setcolor(14);
    outtextxy(x1,y1,'Kopp ny');
    delay(30);
    setcolor(black);
    outtextxy(x1,y1,'Kopp ny');
    x1:=x1-5;
  until x1<10;

  repeat
    setcolor(14);
    outtextxy(x1,y1,'Kopp ny');
    delay(30);
    setcolor(black);
    outtextxy(x1,y1,'Kopp ny');
    y1:=y1-5;
  until y1<20;
  setcolor(white);
  settextstyle(4,0,5);
  outtextxy(300,200,'Kopp ny');
  readln;
  {*******************************************}
  cleardevice;
  SetBkColor(green);
  SetColor(yellow);
  Rectangle(1,1,638,478);
  SetTextStyle(3,0,5);
  OutTextXY(20,5,'Szilvia');
  SetTextStyle(1,0,5);
  OutTextXY(150,5,'Szilvia');
  SetTextStyle(3,0,5);
  OutTextXY(280,5,'Szilvia');
  SetTextStyle(1,0,5);
  OutTextXY(410,5,'Szilvia');
  SetTextStyle(3,0,5);
  OutTextXY(540,5,'Szilvia');
  SetTextStyle(4,1,5);
  OutTextXY(20,60,'Szilvia');
  SetTextStyle(3,1,5);
  OutTextXY(20,210,'Szilvia');
  SetTextStyle(4,1,5);
  OutTextXY(20,360,'Szilvia');
  SetTextStyle(4,1,5);
  OutTextXY(620,60,'Szilvia');
  SetTextStyle(3,1,5);
  OutTextXY(620,210,'Szilvia');
  SetTextStyle(4,1,5);
  OutTextXY(620,360,'Szilvia');
  SetTextStyle(3,0,5);
  OutTextXY(20,460,'Szilvia');
  SetTextStyle(1,0,5);
  OutTextXY(150,460,'Szilvia');
  SetTextStyle(3,0,5);
  OutTextXY(280,460,'Szilvia');
  SetTextStyle(1,0,5);
  OutTextXY(410,460,'Szilvia');
  SetTextStyle(3,0,5);
  OutTextXY(530,460,'Szilvia');
  readln;
 closegraph;
end.
