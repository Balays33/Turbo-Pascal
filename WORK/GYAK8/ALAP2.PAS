uses crt,graph;
var gd,gm:integer;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 readkey;
 closegraph;
end.