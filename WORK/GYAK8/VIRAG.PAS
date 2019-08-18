program virag;
uses crt, graph;
var g_driver, g_mode: integer;
    xw,yw: integer;
    i,j,x1,y1:integer;
    ch: char;
    alfa:real;
begin
    g_driver:=vga;
    g_mode:=vgahi;
    filemode:=0;
    initgraph(g_driver,g_mode,'e:\tp\bgi');
    setcolor(lightmagenta);
    for i:=1 to 12 do
        begin
          alfa:=i*(30*pi/180);
          x1:=round(320+100*cos(alfa));
          y1:=round(240+100*sin(alfa));
          circle(x1,y1,60);
        end;
    circle(320,240,55);
    setfillstyle(1,yellow);
    floodfill(320,240,lightmagenta);
    if ch=#0 then ch:=readkey;
    closegraph;
end.
