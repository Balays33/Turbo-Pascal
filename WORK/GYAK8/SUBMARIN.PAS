uses crt,graph; 
var gd,gm,x,y,szin,r:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 x:=0;
 y:=0;
 r:=1;
 randomize;
 delay(2500);
    repeat
          cleardevice;
          setcolor(red);
          circle(320,240,26);
          circle(320,240,51);
          circle(320,240,76);
          circle(320,240,101);
          szin:=random(15);
          x:=x+10;
          y:=x-10;
          setcolor(red);
          pieslice(320,240,y,x,100);
          setfillstyle(1,red);
          if x=280 then begin
                             setcolor(white);
                             circle(325,320,1);
                             circle(325,320,2);
                             circle(325,320,3);
                             circle(325,320,4);
                             sound(4000);
                             delay(20);
                             nosound;
                        end;
          if x=360 then x:=0;
          delay(100);
    until keypressed;
 readkey;
 closegraph;
end.
