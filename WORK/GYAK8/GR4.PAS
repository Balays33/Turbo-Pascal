
program kor_negyzet;
uses
  Graph;
var
  Gd, Gm: Integer;
  Radius: Integer;
  i,delta,x1,x2,y1,y2:integer;
  j:word;
  begin
  Gd := Detect;
  filemode:=0;
  InitGraph(Gd, Gm, 'e:\tp\bgi');
  if GraphResult <> grOk then Halt(1);
  for Radius := 1 to 15 do
    begin
    setcolor(radius);
    Circle(100+radius*5, 100+radius*5, Radius*10);
    end;
  Line(450,100,550,100);
  Line(550,100,550,200);
  Line(550,200,450,200);
  Line(450,200,450,100);
  ReadLn;
   for i:=1 to 10 do
      begin
      delta:=i*8;
      rectangle(450+delta,100+delta,550+delta,200+delta);
   end;
   readln;
   x1:=450+delta;
   y1:=100+delta;
   x2:=550+delta;
   y2:=200+delta;
   for i:=1 to 15 do
      begin
      setcolor(i);
      delta:=i*8;
      rectangle(x1-delta,y1+delta,x2-delta,y2+delta);
   end;
   readln;
   for j:= 1 to 12 do
     begin
     setfillstyle(solidfill,j);
     delta:=j*8;
     bar(10+delta,300+delta,110+delta,400+delta);
     end;
   readln;
  CloseGraph;
end.
