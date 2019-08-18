uses crt,graph;                        {kedvenc zhpld!}
var gd,gm:integer;
    i,osz,szog1,szog2,szog3:integer;
    v:array[1..4] of integer;
    egys:real;
    kx,ky,r,rx,ry:integer;
begin
 { k“rdiagram! }
 osz:=0;
 writeln('K‚rem a n‚gy ‚rt‚ket:');
 for i:=1 to 4 do
       begin;
       writeln('v[',i,']=');readln(v[i]);
       osz:=osz+v[i];
       end;
    egys:=360/osz;
    szog1:=round(v[1]*egys);
    szog2:=round((v[1]+v[2])*egys);
    szog3:=round((v[1]+v[2]+v[3])*egys);
  gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 setfillstyle(1,2);
 pieslice(320,240,0,szog1,100);
 setfillstyle(1,3);
 pieslice(320,240,szog1,szog2,100);
 setfillstyle(1,4);
 pieslice(320,240,szog2,szog3,100);
 setfillstyle(1,5);
 pieslice(320,240,szog3,360,100);
 readln;
 cleardevice;

 {3.negyed}

 randomize;
 repeat
     kx:=random(320);
     ky:=random(240)+240;
     if 480-ky < ky-240 then ry:=random(480-ky)-2
                        else ry:=random(ky-240)-2;
      if 320-kx < kx    then rx:=random(320-kx)-2
                        else rx:=random(kx-0)-2;
      if rx < ry then r:=rx else r:=ry;
     setcolor(random(16));
     circle(kx,ky,r);
     delay(100);

 until keypressed;
 readln;





 closegraph;
end.
