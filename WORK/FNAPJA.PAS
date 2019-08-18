uses crt,graph;
var gd,gm:integer;
    ufo1,ufo2,ufo1l,ufo2l,i,y,ul,stop:integer;
    ufo1lf,ufo2lf:integer;
    cs,h:integer;
    lov,ranlov,mel,mel2,z,ujufo:byte;
    elet:byte;
    ch:char;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
     setcolor(3);
     line(0,429,638,429);
     line(1,429,1,479);
     line(638,429,638,479);
     line(1,479,638,479);
     outtextxy(590,469,' 3.00');
     outtextxy(3,432,'Barcza Bal†zs');
     outtextxy(4,441,'Djvmn2');
     outtextxy(535,432,'West Graphic');
     outtextxy(150,432,'V: KilÇpÇs');
     outtextxy(150,441,'W: Radar UFO bemÇrÇse');
     outtextxy(400,432,'êlet:');
     setfillstyle(1,yellow);
     bar(440,432,448,442);
     bar(450,432,458,442);
     bar(460,432,468,442);
  {v†ros}
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(2,428,19,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(22,428,50,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(52,428,60,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(62,428,78,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(81,428,95,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(100,428,106,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(107,428,150,405);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(156,428,200,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(203,428,230,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(240,428,250,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(252,428,280,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(284,428,300,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(306,428,370,406);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(372,428,392,380);
        setfillstyle(1 ,red);
        circle(380,370,10);
        floodfill(380,370,3);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(398,428,405,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(408,428,432,409);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(434,428,445,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(447,428,460,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(462,428,500,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(505,428,524,385);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(530,428,560,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(562,428,584,385);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(590,428,600,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(610,428,638,380);
 for i:=1 to 35 do
                begin
                  cs:=random(635)+2;
                  h:=random(410);
                  putpixel(cs,h,white);
                end;
   repeat
  ufo1:=random(620)+300; ufo2:=random(239)+15;
  until (ufo1<620) and (ufo2<239) ;
  ellipse(ufo1,ufo2,0,360,20,10);
  putpixel(ufo1+2,ufo2,yellow); line(ufo1,ufo2-5,ufo1,ufo2+5);
  setcolor(3); outtextxy(ufo1+35,ufo2-36,'1');
  for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
  setcolor(red);outtextxy(ufo1+35,ufo2-3,'2');
  for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
  setcolor(3); outtextxy(ufo1+35,ufo2+30,'3');
  for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
  readkey;
       setcolor(0); outtextxy(ufo1+35,ufo2-36,'1');
       setcolor(0);outtextxy(ufo1+35,ufo2-3,'2');
       setcolor(0); outtextxy(ufo1+35,ufo2+30,'3');
       for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
       for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
       for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
 {repeat
    while (ch='l') or (s=55) do begin putpixel(ufo1+33,(ufo2-36)+(i),yellow); delay(90);
    putpixel(ufo1+33,(ufo2-36)+(i),black); s:=s+2; i:=i+3; end;
    {while (ch='l') or (s=0) do begin putpixel(ufo1+40,(ufo2)+(i+3),yellow); delay(20);
    putpixel(ufo1+40,(ufo2)+(i+3),black); s:=s-2;end;  }
 {   readkey;
  until (ch='l');}
  nosound;
  putpixel(10,100,red);
  putpixel(10,380,red);
  y:=240; elet:=0;
repeat
  repeat
  setcolor(3);circle(10,y,10); {A fîldi repîlîgÇp kinÇzete}
  setfillstyle(1,7);fillellipse(10,y,30,4);floodfill(10,y,3);
  setcolor(0);circle(10,y,10);
  setfillstyle(1,0);fillellipse(10,y,30,4);floodfill(10,y,0);
  ujufo:=0; {£j UFO lÇtrehoz†s†nak az adata}
  if keypressed then
                 Begin
                   stop:=0;
                   ch:=readkey;
                   setfillstyle(1,0);bar(2,1,200,30);
                   setlinestyle(0,0,0);
                   if (ch= #72) and (y > 100) then begin  y:=y-140; end;
                   if (ch= #80) and (y < 380) then begin  y:=y+140; end;
                   if ch='w' then begin ul:=random(4)+1; ufo1l:=ufo1;ufo2l:=ufo2; z:=random(3);
                                                         ufo1lf:=ufo1;ufo2lf:=ufo2;
                                    setcolor(3);circle(10,y,10); {A fîldi repîlîgÇp kinÇzete}
                                    setfillstyle(1,7);fillellipse(10,y,30,4);floodfill(10,y,3);
                                                    setcolor(3);
                                                    for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
                                                    setcolor(red);
                                                    for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
                                                    setcolor(3);
                                                    for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
                                  setfillstyle(1,0);bar(2,1,200,30);
                                  repeat             {Melyik pozici¢ra cÇlzol}
                                    setcolor(3);outtextxy(10,10,'kÇrem a sz†mot(1/2/3)');read(lov);
                                  until (lov=1)or(lov=2)or(lov=3);
                                  ranlov:=random(4)+1;  {ranlov kital†lom nyertem}
                                  mel2:=random(3)+1;    {mellÇ lîvÇs ir†nya randommal}
                                          repeat        {UFO Bolyg¢ felsz°nt bomb†zza}
                                            sound(500);
                                            nosound;
                                            setcolor(red);
                                            circle(ufo1lf,ufo2lf,3);
                                            setcolor(white);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                            delay(10);
                                            setcolor(0);
                                            circle(ufo1lf,ufo2lf,3);
                                            ufo2lf:=ufo2lf+2;
                                            ufo1lf:=ufo1lf-z;
                                            if  (ufo1lf>=368) and (ufo1lf<=392) and
                                            ((ufo2lf=369)or(ufo2lf=373)or(ufo2lf=370)or(ufo2lf=371) )
                                            then stop:=1;
                                          until  ufo2lf>=410;
                                          i:=1;
                                            repeat {Ufo bomb†j†nak a pusz°t†sa}
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+3+i,red);
                                              putpixel((((ufo1lf+5)+i)), ufo2lf+4+i,random(yellow)+red);
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+4+i,red);
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+4+i,random(yellow)+red);
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+6+i,yellow);
                                              putpixel((((ufo1lf+5)+i)), ufo2lf+7+i,yellow);
                                              i:=i+1;
                                              ufo1lf:=ufo1lf+1;
                                            until i=10;
                                  if lov=ranlov then begin setcolor(red);setlinestyle(0,0,3);line(10,y,ufo1,ufo2);
                                                      sound(500);delay(30);nosound;   {LîvÇs tal†lt}
                                                      setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2);
                                                      setfillstyle(1,red);fillellipse(ufo1,ufo2,20,10);
                                                      sound(200);delay(60);nosound;
                                                      setfillstyle(1,0);fillellipse(ufo1,ufo2,60,50);
                                                      repeat                      {UFO lezuhan†s†nak szimul†l†sa}
                                                        setcolor(white);
                                                        setlinestyle(0,0,0);
                                                        ellipse(ufo1,ufo2,0,360,20,10);
                                                        circle(ufo1,ufo2,3);
                                                        delay(20);
                                                        setcolor(0);
                                                        ellipse(ufo1,ufo2,0,360,20,10);
                                                        circle(ufo1,ufo2,3);
                                                        ufo1:=ufo1-1;
                                                        ufo2:=ufo2+4;
                                                        setcolor(0);
                                                        ellipse(ufo1,ufo2,0,360,20,10);
                                                        circle(ufo1,ufo2,3);
                                                     until (ufo2>=410);
                                                     ujufo:=1; {UFo-t kilîte a repÅlãgÇp}
                                                     end
                                                else case mel2 of
                                                    1: begin         {LîvÇs nem tal†lt mellÇ hordott -y ir†nyba}
                                                         mel:=(random(20)+10);
                                                         setcolor(3);setlinestyle(0,0,3);line(10,y,ufo1,ufo2+mel);
                                                         sound(500);delay(20);nosound;
                                                        setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2+mel);
                                                       end;
                                                    2: begin         {LîvÇs nem tal†lt mellÇ hordott +y ir†nyba}
                                                         mel:=(random(20)+10);
                                                         setcolor(3);setlinestyle(0,0,3);line(10,y,ufo1,ufo2-mel);
                                                         sound(500);delay(20);nosound;
                                                        setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2-mel);
                                                       end;
                                                     end;
                                  setlinestyle(0,0,0);
                                                if ujufo=1 then
                                                             begin

                                                               repeat
                                                 ufo1:=random(620)+300; ufo2:=random(239)+15;
                                                               until (ufo1<620) and (ufo2<239);
                                                               i:=3;
                                                               repeat     {radar aktiv†lodik}
                                                                 setcolor(yellow);
                                                                 sound(500);
                                                                 delay(1);
                                                                 nosound;
                                                                 setcolor(red);
                                                                 arc(380,350,0,180,i);
                                                                 arc(380,355,0,180,i);
                                                                 arc(380,345,0,180,i);
                                                                 delay(4);
                                                                 setcolor(0);
                                                                 arc(380,350,0,180,i);
                                                                 arc(380,355,0,180,i);
                                                                 arc(380,345,0,180,i);
                                                                 i:=i+1;
                                                               until  i=150;
                                                 setcolor(white);
                                                 ellipse(ufo1,ufo2,0,360,20,10);
                                                 putpixel(ufo1+2,ufo2,yellow); line(ufo1,ufo2-5,ufo1,ufo2+5);
                                                 setcolor(3); outtextxy(ufo1+35,ufo2-36,'1');
                                                 for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
                                                 setcolor(red);outtextxy(ufo1+35,ufo2-3,'2');
                                                 for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
                                                 setcolor(3); outtextxy(ufo1+35,ufo2+30,'3');
                                                 for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
                                                             end
                                                           else
                                                    if (ufo2<410) then   case ul of {UFO lîvÇsei}
                                                               1: begin if ufo2>100 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l-1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=100
                                                                                    else
                                                                         repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l+1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=100;
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,100,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,100,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=100 then stop:=1; end;
                                                               2: begin if ufo2>240 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l-1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=240
                                                                                    else
                                                                         repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l+1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=240;
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,240,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,240,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=240 then stop:=1; end;
                                                               3: begin if ufo2>380 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l-1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=380
                                                                                    else
                                                                         repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l+1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=380;
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,380,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,380,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=380 then stop:=1; end;end;

                                  end;
                 end;
  until (ch='v') or (stop=1);
   stop:=0;
  setfillstyle(1,0);bar(460-(elet*10),432,468,442);
   elet:=elet+1;
until elet=3;
  setcolor(red);
  settextjustify(1,0);
  settextstyle(0,0,4);
  outtextxy(319,239,'Game Over');
  readkey;
  closegraph;
end.
