uses crt,graph;
var gd,gm:integer;
p,x,y,v,z,t:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 repeat
 setcolor(white);
 x:=random(640);
 y:=random(480);
 v:=random(640);
 z:=random(480);
 line(x,y,v,z);
 p:=p+1;
 until p>1000;
 {readln;
 repeat
 repeat
 x:=random(320)+320;
 y:=random(480);
 v:=random(50)+1;
 until (x+v<640) and (x-v>319) and (y-v>=0) and (y+v<480);
 setcolor(random(15));
 circle(x,y,v);
 delay(5);
 until keypressed; }
 repeat
 setfillstyle(random(12)+1 ,0);
 bar(150+t,70,155+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(160+t,70,162+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(167+t,70,170+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(175+t,70,180+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(185+t,70,187+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(192+t,70,200+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(205+t,70,210+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(215+t,70,217+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(220+t,70,222+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(224+t,70,227+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(230+t,70,235+t,350);
 setfillstyle(random(12)+1 ,0);
 bar(240+t,70,246+t,350);
 t:=t+60;
 until t>250;
 setcolor(1);
 settextstyle(0,0,4);
 outtextxy(135,350,'West Grapich');
 readkey;
 closegraph;
end.
