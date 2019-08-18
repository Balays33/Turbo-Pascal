uses crt,graph;
var gd,gm:integer;
    x,y,o:integer;
    c,l:char;
    ufo1,ufo2,ufo1l,ufo2l,m:integer;
    z:byte;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
   repeat
  ufo1:=random(890)+300; ufo2:=random(239)+15; z:=random(3)+1;
  until (ufo1<620) and (ufo2<239) ;
  ufo2l:=ufo2; ufo1l:=ufo1;
  ellipse(ufo1,ufo2,0,360,20,10);
  line(ufo1,ufo2-5,ufo1,ufo2+5);
 x:=20; y:=20;
   repeat
     setcolor(3);
     line(x,y,0,0);
           c:=readkey;
           if c = #0 then c:=readkey;
           case c of #72: if y > 0 then begin                    {fel}
                                          setcolor(0);
                                          line(x,y,0,0);
                                          y:=y-1;
                                        end;
                     #80: if y <30 then begin                    {le}
                                           setcolor(0);
                                           line(x,y,0,0);
                                           y:=y+1;
                                         end;
                     'l': begin
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);
                                       m:=round((y/x)*ufo1);
                                       line(x,y,ufo1,m);
                                       if (m<=ufo2-5) and (m>=ufo2+5) then halt;
                           end;

           end;
   until (c='v');
 readkey;
 closegraph;
end.
