uses crt,graph;
var gd,gm:integer;
    x,y,l,o:integer;
    c,k:char;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 x:=600; y:=460;
   repeat
     setcolor(3);
     line(x,y,639,479);
           c:=readkey;
           if c = #0 then c:=readkey;
           case c of #72: if y > 440 then begin                    {fel}
                                          setcolor(0);
                                          line(x,y,639,479);
                                          y:=y-1;
                                        end;
                     #80: if y <479 then begin                    {le}
                                           setcolor(0);
                                           line(x,y,639,479);
                                           y:=y+1;
                                         end;
                     'k': begin
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);

                                       line(x,y,50,round(((479-y)/(x))*50));
                                      { line(50,round((y/x)*50),x,y);}
                           end;

           end;
   until (c='v');
 readkey;
 closegraph;
end.
