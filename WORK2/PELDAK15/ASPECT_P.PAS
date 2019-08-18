(* aspect_p.pas *)
program aspect_p;

uses graph,crt;

const aspect:real=1.0;
                r=50;

var gd,gm:integer;
    x,y:word;

function ar(y:word):word;
begin
    ar:=round(aspect*y);
end;

procedure setaspect;
var
    d,m:word;
begin
    getaspectratio(d,m);
    aspect:=1.0*d/m;
end;

begin
    detectgraph(gd,gm);
    if (gd<>EGA) and (gd<>VGA) then
      begin
        writeln('A program csak EGA vagy VGA k rty val m–k”dik!');
        halt(1);
      end;
    initgraph(gd,gm,'');

    setaspect;

    x:=getmaxx div 2;
    y:=getmaxy div 2;
    setcolor(yellow);
    circle (x,ar(y),r);
    rectangle(x-r,ar(y-r),x+r,ar(y+r));

    setfillstyle(solidfill, white);
    floodfill(x,ar(y),yellow);

    setfillstyle(solidfill, red);
    floodfill(x-r+1,ar(y-r+1),yellow);

    setfillstyle(solidfill, blue);
    floodfill(x+r-1,ar(y-r+1),yellow);

    setfillstyle(solidfill, green);
    floodfill(x-r+1,ar(y+r-1),yellow);

    setfillstyle(solidfill, magenta);
    floodfill(x+r-1,ar(y+r-1),yellow);

    repeat until keypressed;
    closegraph;
    restorecrtmode;
end.
