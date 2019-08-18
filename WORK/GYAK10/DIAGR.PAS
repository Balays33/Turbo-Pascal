uses crt,graph;
var gd,gm:integer;
   v:array[1..10] of integer;
   max,i,n:integer;
   e,f:integer;
begin
 write('K‚rem az n :=');
 readln(n);
 for i:= 1 to n do
 begin
 write(i,'.‚rt‚ke ');
 readln(v[i]);
 end;
 max:=v[i];
 for i:=1 to n do
 if v[i]>max then max:=v[i];
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'g:\pusw\bp\bgi');
 cleardevice;
 line(20,20,20,470);
 line(10,460,620,460);
 e:=round(400/max); f:=round(580/n);
 for i:=1 to n do
    begin
      setfillstyle(1,i);
      bar(21+(i-1)*f,459-e*v[i],21+i*f,459);
    end;


 readkey;
 closegraph;
end.
