uses crt,graph;
var gd,gm:integer;
    x,y,l,l1,j1,k,j,cs,h,s:integer;
    ch:char;
    i:byte;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 setcolor(3);
 line(0,0,639,0);
 line(0,50,638,50);
 line(1,0,1,479);
 line(638,0,638,479);
 line(1,479,638,479);
 outtextxy(590,40,' 1.00');
 outtextxy(3,3,'Barcza Bal zs');
 outtextxy(4,12,'Djvmn2');

 for i:=1 to 30 do
                begin
                  cs:=random(635)+2;
                  h:=random(420)+52;
                  putpixel(cs,h,white);
                end;
 x:=319; y:=460;
 repeat
   setcolor(3);
   {setfillstyle(1,red);}
   circle(x,y,7);
   {floodfill(x,y,red);}
   setcolor(0);
   {setfillstyle(0,0);}
   circle(x,y,7);
   {floodfill(x,y,0);}
   if keypressed then
                 Begin
                   ch:=readkey;
                    k:=y;
                    j:=y; j1:=x;
                    l:=y; l1:=x;
                   if (ch= 'k') then repeat
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);
                                       circle(x,k,3);
                                       setcolor(3);
                                       circle(x,y,7);
                                       delay(5);
                                       setcolor(0);
                                       circle(x,k,3);
                                       k:=k-2;
                                     until k=100;
                   if (ch= 'l') then repeat
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);
                                       circle(l1,l,3);
                                       setcolor(3);
                                       circle(x,y,7);
                                       delay(5);
                                       setcolor(0);
                                       circle(l1,l,3);
                                       l:=l-2;
                                       l1:=l1+1;
                                       if l1>=639 then l1:=l1-10;
                                     until l=100;
                   if (ch= 'j') then repeat
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);
                                       circle(j1,j,3);
                                       setcolor(3);
                                       circle(x,y,7);
                                       delay(5);
                                       setcolor(0);
                                       circle(j1,j,3);
                                       if j1<=3 then begin j1:=s; s:=s+3 end;
                                       j:=j-2;
                                       j1:=j1-1;
                                     until j=100;
                   if (ch= #77) and (x < 637) then begin y:=460; x:=x+6; end;
                   if (ch= #75) and (x > 1 )  then begin y:=460; x:=x-6; end;

                 end;

 until (ch='v');
 setcolor(3);
 settextstyle(7,0,6);
 outtextxy(319,250,'Meteor');
 settextJUSTIFY(1,0);
 settextstyle(7,0,7);
 outtextxy(319,239,'StarGate');
 readkey;
 closegraph;
end.
