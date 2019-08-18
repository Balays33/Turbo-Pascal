        { bubor‚k rendez‚s grafikusan!!   }

uses crt,graph;      {”tlet ‚s megval¢sit s: Bojtos Viktor }
const max=240;
var t:array [1..max] of integer;
    i,j:integer;
    a,b,temp:byte;
    mut:boolean;
    gd,gm:integer;
procedure kiiras;
var i:integer;
begin
    for i:=1 to max do
      begin
          putpixel(t[i],i,15);
      end;
end;

begin
    gd:=vga;
    gm:=vgahi;
    filemode:=0;
    initgraph(gd,gm,'e:\tp\bgi');
    cleardevice;

    for i:=1 to max do t[i]:=i;

    for j:=1 to 1000 do
        begin
            a:=random(max)+1;
            b:=random(max)+1;
            temp:=t[a];
            t[a]:=t[b];
            t[b]:=temp;
        end;

    kiiras;
    repeat
         mut:=false;
         for i:=1 to max-1 do
            if t[i]>t[i+1] then
             begin
                 putpixel(t[i],i,0);
                 putpixel(t[i+1],i+1,0);
                 temp:=t[i];
                 t[i]:=t[i+1];
                 t[i+1]:=temp;
                 mut:=true;
                 putpixel(t[i],i,15);
                 putpixel(t[i+1],i+1,15);
                 delay(2);
             end;
    until not(mut) or keypressed;

    readkey;
    closegraph;
end.
