program sakk_korok;
uses crt,graph;
var gd,gm:integer;
    x,y,i,j:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 line(319,0,319,479);
 line(0,0,319,479);
 randomize;
 for x:=1 to 32 do
    begin
      y:=round(x*479/319);
      setcolor(random(16));
      circle(x*5,y*5,x*5);
    end;
 for x:=32 downto 1 do
    begin
      y:=round(x*479/319);
      setcolor(random(16));
      circle(319-x*5,479-y*5,x*5);
    end;
 x:=330; y:=90;
 setcolor(white);
 rectangle(360,120,600,360);
 for i:=1 to 8 do
    for j:=1 to 8 do
      if (i+j) mod 2=1 then bar(x+j*30,y+i*30,x+30+j*30,y+30+i*30);
 readkey;
 closegraph;
end.
