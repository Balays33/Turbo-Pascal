uses crt,graph;
var gd,gm:integer;
    i,j:byte;
const
    csillag : array[1..5] of pointtype=
    ((x:80;y:90),(x:70;y:120),(x:95;y:100),(x:65;y:100),(x:90;y:120));
    cs2 :array[1..5] of pointtype=
    ((x:145;y:90),(x:135;y:120),(x:160;y:100),(x:130;y:100),(x:155;y:120));
    cs3 :array[1..5] of pointtype=
    ((x:112;y:105),(x:102;y:135),(x:127;y:115),(x:97;y:115),(x:122;y:135));
    cs4 :array[1..5] of pointtype=
    ((x:112;y:25),(x:102;y:55),(x:127;y:35),(x:97;y:35),(x:122;y:55));
    cs5 :array[1..5] of pointtype=
    ((x:145;y:50),(x:135;y:80),(x:160;y:60),(x:130;y:60),(x:155;y:80));
    cs6 :array[1..5] of pointtype=
    ((x:80;y:50),(x:70;y:80),(x:95;y:60),(x:65;y:60),(x:90;y:80));
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
  {Europa Unio}setfillstyle(1,1); bar(10,10,220,150); setfillstyle(1,yellow);
               fillpoly(5,csillag);fillpoly(5,cs2);fillpoly(5,cs3);fillpoly(5,cs4);fillpoly(5,cs5);fillpoly(5,cs6);
  {USA}setfillstyle(1,white); bar(10,160,220,310);
       setfillstyle(1,red); bar(110,160,220,175);
       setfillstyle(1,red); bar(110,190,220,205);
       setfillstyle(1,red); bar(110,220,220,235);
       setfillstyle(1,red); bar(10,250,220,265);
       setfillstyle(1,red); bar(10,275,220,290);
       setfillstyle(1,red); bar(10,300,220,310);
       setfillstyle(1,1); bar(10,160,110,235);
     setlinestyle(0,0,3); setcolor(white);
     for j:=1 to 7 do
      for i:=1 to 7 do
         begin
           line(12,160+(i*10),18,160+(i*10));
           line(15,155+(i*10),15,163+(i*10));
          line(12+(j*12),160+(i*10),18+(j*12),160+(i*10));
          line(15+(j*12),155+(i*10),15+(j*12),163+(i*10));
        end;
  {Japan}setfillstyle(1,white); bar(10,319,220,469);
         setlinestyle(0,0,0);setcolor(0); setfillstyle(1,red); circle(115,394,40); floodfill(115,394,0);
 readkey;
 closegraph;
end.
