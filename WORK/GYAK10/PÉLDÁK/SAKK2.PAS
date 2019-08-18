uses crt,graph;

var gd,gm,i,j:integer;

begin
    gd:=vga;
    gm:=vgahi;
    filemode:=0;
    initgraph(gd,gm,'e:\tp\bgi');

    for i:=0 to 7 do
      for j:=0 to 7 do
        begin
            if ((i+j) mod 2)=0 then setfillstyle(1,0)
            else setfillstyle(1,15);
            bar(j*50,i*50,j*50+49,i*50+49);
        end;
    setcolor(15);
    rectangle(0,0,400,400);
    readln;
    randomize;
    rectangle(0,0,400,400);
    for i:=0 to 7 do
      for j:=0 to 7 do
        begin
            if ((i+j) mod 2)=0 then setfillstyle(1,0)
            else setfillstyle(1,random(15)+1);
            bar(j*50,i*50,j*50+49,i*50+49);
        end;
    setcolor(15);
    rectangle(0,0,400,400);
    readln;
     for i:=0 to 7 do
      for j:=0 to 7 do
        begin
            if ((i+j) mod 2)=0 then setfillstyle(1,0)
            else setfillstyle(random(12),random(15)+1);
            bar(j*50,i*50,j*50+49,i*50+49);
        end;
    setcolor(15);
    rectangle(0,0,400,400);
    readln;

    closegraph;
end.