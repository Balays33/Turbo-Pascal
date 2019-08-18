uses crt,graph;
var gd,gm:integer;
    ufo1,ufo2,ufo1l,ufo2l,i,y,ul,stop:integer;
    ufo1lf,ufo2lf:integer;
    lov,ranlov,mel,mel2,z:byte;
    ch:char;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
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
  y:=240;
  repeat
  setcolor(3);circle(10,y,10); {A f”ldi rep”l”g‚p kin‚zete}
  setcolor(0);circle(10,y,10);
  if keypressed then
                 Begin
                   stop:=0;
                   ch:=readkey;
                   setfillstyle(1,0);bar(0,0,200,80);
                   setlinestyle(0,0,0);
                   if (ch= #72) and (y > 100) then begin  y:=y-140; end;
                   if (ch= #80) and (y < 380) then begin  y:=y+140; end;
                   if ch='w' then begin ul:=random(4)+1; ufo1l:=ufo1;ufo2l:=ufo2; z:=random(3)+1;
                                                         ufo1lf:=ufo1;ufo2lf:=ufo2;
                                    setcolor(3);circle(10,y,10); {A f”ldi rep”l”g‚p kin‚zete}
                                                    setcolor(3);
                                                    for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
                                                    setcolor(red);
                                                    for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
                                                    setcolor(3);
                                                    for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
                                  setfillstyle(1,0);bar(0,0,200,80);
                                  setcolor(3);outtextxy(10,10,'k‚rem a sz mot');read(lov);
                                  ranlov:=random(4)+1;  {ranlov kital lom nyertem}
                                  mel2:=random(3)+1;    {mell‚ l”v‚s ir nya randommal}
                                          repeat        {UFO Bolyg¢ felsz¡nt bomb zza}
                                            sound(500);
                                            nosound;
                                            setcolor(red);
                                            circle(ufo1lf,ufo2lf,3);
                                            setcolor(white);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                            delay(15);
                                            setcolor(0);
                                            circle(ufo1lf,ufo2lf,3);
                                            ufo2lf:=ufo2lf+2;
                                            ufo1lf:=ufo1lf-z;
                                            if  (ufo1lf>=95) and (ufo1lf<=108) and
                                            ((ufo2lf=369)or(ufo2lf=373)or(ufo2lf=370)or(ufo2lf=371) )
                                            then stop:=1;
                                          until  ufo2lf>=410;
                                          i:=1;
                                            repeat {Ufo bomb j nak a pusz¡t sa}
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
                                                      sound(500);delay(30);nosound;   {L”v‚s tal lt}
                                                      setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2);
                                                      setfillstyle(1,red);fillellipse(ufo1,ufo2,20,10);
                                                      sound(200);delay(60);nosound;
                                                      setfillstyle(1,0);fillellipse(ufo1,ufo2,60,50);
                                                      repeat                      {UFO lezuhan s nak sz¡mul sa}
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
                                                     stop:=1;
                                                     end
                                                else case mel2 of
                                                    1: begin         {L”v‚s nem tal lt mell‚ hornott -y ¡r nyba}
                                                         mel:=(random(20)+10);
                                                         setcolor(3);setlinestyle(0,0,3);line(10,y,ufo1,ufo2+mel);
                                                         sound(500);delay(20);nosound;
                                                        setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2+mel);
                                                       end;
                                                    2: begin         {L”v‚s nem tal lt mell‚ hordott +y ¡r nyba}
                                                         mel:=(random(20)+10);
                                                         setcolor(3);setlinestyle(0,0,3);line(10,y,ufo1,ufo2-mel);
                                                         sound(500);delay(20);nosound;
                                                        setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2-mel);
                                                       end;
                                                     end;
                                  setlinestyle(0,0,0);
                                                    if (ufo2<410) then   case ul of {UFO l”v‚sei}
                                                               1: begin if ufo2>100 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
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
                                                                          delay(5);
                                                                          setcolor(0);
                                                                          circle(ufo1l,380,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=380 then stop:=1; end;end;

                                  end;
                 end;
 until (ch='v') or (stop=1);
 readkey;
 closegraph;
end.
