
program szakasz_kor;
 uses crt, graph;
 var
   gd, gm : integer;
   x1,x2,y1,y2,r : integer;
 begin
   gd:=detect;
   filemode:=0;
   InitGraph(gd,gm,'e:\tp\bgi');
   cleardevice;
   line(0,240,639,240); line(320,0,320,479);

     {bal fels“  bra}
   x1:=320;  y1:=0;
   x2:=0;    y2:=240;
   randomize;
    repeat
     line(x1,y1,x2,y2); setcolor(random(11)+1);
     y1:=y1+10;  y2:=y2-10;
     delay(70);
    until y2=0;
    repeat
     line(x1,y1,x2,y2); setcolor(random(11)+1);
     x1:=x1-10;  x2:=x2+10;
     delay(70);
    until x1=0;

      {jobb als¢  bra}
    x2:=640; y2:=250;
    repeat
     line(320,240,x2,y2);  setcolor(random(11)+1);
     y2:=y2+10; delay(70);
    until y2=480;
    repeat
     x2:=x2-10;  delay(70);
     line(320,240,x2,y2); setcolor(random(11)+1);
   until x2=320;

     {jobb fels“  bra}
     x1:=330;  y1:=230;  r:=5;
     repeat
      circle(x1,y1,r); setcolor(random(11)+1);
      r:=r+5;
      x1:=x1+10;  y1:=y1-10;
      delay(200);
    until y1=40;

     {bal als¢  bra}
     repeat
     x1:=50; y1:=360;
     x2:=160; y2:=255;
      repeat
       setcolor(green);
       circle(x1,y1,20);
       setcolor(red);
       circle(x2,y2,20);
       if y1=y2 then
        begin
        sound(3000);
        setcolor(blue);
        circle(x1,y1,40);
        delay(50);
        setcolor(black);
        circle(x1,y1,40);
        end;
       delay(100);
       nosound;
       setcolor(black);
       circle(x1,y1,20);
       setcolor(black);
       circle(x2,y2,20);
       x1:=x1+5; y2:=y2+5;
      until (x1=270) or (keypressed);
    until keypressed;
 readkey;
 closegraph;
 end.

