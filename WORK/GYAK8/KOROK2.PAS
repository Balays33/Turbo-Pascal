program korok2;
uses crt,Graph;
var
    Gd, Gm: Integer;
    Radius,delta,delta2,xw,yw: Integer;
    i,x1,y1:integer;
    alfa:real;
begin
  Gd := Detect;
  filemode:=0;
  InitGraph(Gd, Gm, 'e:\tp\bgi');
  if GraphResult <> grOk then Halt(1);
  setcolor(14);
  xw:=getmaxx;
  yw:=getmaxy;
  delta2:=80;
  for delta:=0 to xw-80 do Circle(delta*40,delta2,20);
  delta2:=yw-80;
  for delta:=0 to xw-80 do Circle(delta*40,delta2,20);
  setcolor(4);
  arc(xw div 2,yw div 2,0,360,xw div 6);
  xw:=getmaxx div 2;
  yw:=getmaxy div 2;
  setcolor(4);
  circle(xw,yw,100);
  readln;
  setfillstyle(1,2);
  floodfill(xw,yw,4);
  setcolor(0);
  for i:=1 to 36 do
        begin
          alfa:=i*(-10*pi/180);
          x1:=round(xw+100*cos(alfa));
          y1:=round(yw+100*sin(alfa));
          line(xw,yw,x1,y1);
          delay(20);
          setcolor(4);
          circle(xw,yw,100);
          setfillstyle(1,2);
          floodfill(xw,yw,4);
          setcolor(0);
        end;
  ReadLn;
  CloseGraph;
end.
