uses crt,graph;
var gd,gm:integer;
    i,j:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 {line(70);}
 for i:=1 to 4 do
     for j:=1 to 4 do
     begin
       if (i+j) mod 2=0 then setfillstyle(1,15)
                         else setfillstyle(1,0);
     bar(70+30*i,70+30*j,100+i*30,100+30*j);
     end;
 for i:=1 to 4 do
     for j:=1 to 4 do
     begin
        setfillstyle(random(11)+1,random(15)+1);
        bar(350+30*i,70+30*j,380+i*30,100+30*j);
     end;
 outtextxy(70,50,'Barcza Bal zs');
 settextjustify(0,1);
 settextstyle(2,0,5);
 outtextxy(300,50,'Barcza Bal zs');
  settextjustify(0,2);
 settextstyle(2,0,6);
 outtextxy(500,50,'Barcza Bal zs');
 settextstyle(1,1,3);
 outtextxy(60,140,'SaKK');

 readkey;
 closegraph;
end.
