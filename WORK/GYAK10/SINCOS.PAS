uses crt,graph;      {K‚szutette:Kasty k J nos  Li10 }
var gd,gm:integer;
    x:word;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 setcolor(lightblue);
 line(50,100,50,400);
 line(50,100,45,105);
 line(50,100,55,105);
 line(50,250,500,250);
 line(500,250,495,245);
 line(500,250,495,255);
 setlinestyle(2,1,1);
 line(410,150,410,350);
 line(50,150,410,150);
 line(50,350,410,350);
 line(140,150,140,350);
 line(230,150,230,350);
 line(320,150,320,350);
 outtextxy(40,147,'1');
 outtextxy(40,247,'0');
 outtextxy(35,347,'-1');
 outtextxy(225,355,'PI');
 outtextxy(125,355,'PI/2');
 outtextxy(300,355,'3/2*PI');
 outtextxy(398,355,'2*PI');
 setcolor(2);
 settextstyle(1,0,2);
 outtextxy(120,100,'Sinus');
 setcolor(14);
 outtextxy(280,100,'Cosinus');
  for x:=1 to 360 do
     begin
          putpixel(49+x,250-round(sin(x/180*pi)*100),2);
          delay(5);
      end;
 for x:=1 to 360 do
     begin
          putpixel(49+x,250-round(cos(x/180*pi)*100),14);
          delay(5);
      end;
settextstyle(0,0,1);
repeat
  setcolor(lightblue);
  outtextxy(230,450,'PRESS ANY KEY TO EXIT');
  delay(500);
  setcolor(black);
  outtextxy(230,450,'PRESS ANY KEY TO EXIT');
  delay(500);
until keypressed;
 closegraph;
end.
