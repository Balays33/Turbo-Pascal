uses crt,graph;
var gd,gm:integer;
    x,y,x1,y1,l,l1,k,cs,h,s,r,v:integer;
    ch:char;
    i,j:byte;
    ufo1,ufo2,ufo1l,ufo2l,o,o1:integer;
    z:byte;
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 randomize;
 setcolor(3);
 line(0,0,639,0);
 line(0,429,638,429);
 line(1,0,1,479);
 line(638,0,638,479);
 line(1,479,638,479);
 outtextxy(590,469,' 1.00');
 outtextxy(3,432,'Barcza Bal†zs');
 outtextxy(4,441,'Djvmn2');
 outtextxy(535,432,'West Graphic');
 outtextxy(150,432,'V: KilÇpÇs');
 outtextxy(150,441,'K: Radar');
 outtextxy(150,450,'L: LîvÇs');
 {v†ros}
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(2,428,19,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(22,428,50,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(52,428,60,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(62,428,78,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(81,428,95,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(100,428,106,380);
        setfillstyle(1 ,red);
        circle(103,370,10);
        floodfill(103,370,3);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(107,428,150,405);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(156,428,200,400);         {lÇgvÇdelem} circle(180,397,3); line(180,397,183,390); line(180,397,183,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(203,428,230,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(240,428,250,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(252,428,280,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(284,428,300,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(306,428,370,406);         {lÇgvÇdelem} circle(350,403,3); line(350,403,353,393); line(350,403,353,393);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(372,428,392,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(398,428,405,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(408,428,432,409);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(434,428,445,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(447,428,460,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(462,428,500,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(505,428,524,385);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(530,428,560,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(562,428,584,385);         {lÇgvÇdelem} circle(570,382,3); line(570,382,567,377); line(570,382,567,377);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(590,428,600,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(610,428,638,380);
 for i:=1 to 35 do
                begin
                  cs:=random(635)+2;
                  h:=random(410);
                  putpixel(cs,h,white);
                end;
 x:=119; y:=10;
 x1:=139; y1:=30;
 repeat
   setcolor(3);
   {setfillstyle(1,red);}
   circle(x,y,7);
   {floodfill(x,y,red);}
   line(x1,y1,x,y);
   setcolor(0);
   {setfillstyle(0,0);}
   circle(x,y,7);
   {floodfill(x,y,0);}
    line(x1,y1,x,y);
   if keypressed then
                 Begin
                   ch:=readkey;
                    k:=y; r:=7;  v:=0;
                    l:=y; l1:=x; o1:=x; o:=y;
                   if (ch= 'k') then Begin
                                     repeat
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(yellow);
                                       line(103,359,103,350);
                                       line(104,359,104,350);
                                       line(102,359,102,350);
                                       circle(103,350,7);
                                       setcolor(red);
                                       arc(x,y,180,0,r);
                                       setcolor(3);
                                       circle(x,y,7);
                                       delay(5);
                                       setcolor(0);
                                       arc(x,y,180,0,r);
                                       line(103,359,103,350);
                                       line(104,359,104,350);
                                       line(102,359,102,350);
                                       circle(103,350,7);
                                       r:=r+2;
                                     until r>=300;
                                       setcolor(3);                    {a kÇt szÇlsã vonal vissza rajzol†sa}
                                       line(1,0,1,479);
                                       line(638,0,638,479);
                                       for i:=1 to 2 do               {csillagok lÇtrehoz†sa}
                                           begin
                                             cs:=random(635)+2;
                                             h:=random(410);
                                             putpixel(cs,h,white);
                                           end;
                                          repeat                      {UFO halyÇnek vÇletlen szerÅ lÇtrehoz†sa}
                                            ufo1:=random(890)+300; ufo2:=random(239)+15; z:=random(3)+1;
                                            until (ufo1<620) and (ufo2<239) ;
                                            ufo2l:=ufo2; ufo1l:=ufo1;
                                          repeat
                                            sound(500);
                                            nosound;
                                            setcolor(red);
                                            circle(ufo1l,ufo2l,3);
                                            setcolor(2);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                            delay(15);
                                            setcolor(0);
                                            circle(ufo1l,ufo2l,3);
                                            ufo2l:=ufo2l+2;
                                            ufo1l:=ufo1l-z;
                                            if  (ufo1l>=95) and (ufo1l<=108) and
                                            ((ufo2l=369)or(ufo2l=373)or(ufo2l=370)or(ufo2l=371) )
                                            then v:=1;
                                          until  ufo2l>=410;
                                            setfillstyle(1,0);
                                            fillellipse(ufo1l,ufo2l,10,6);      {LÇgvÇdelmi agyuk lîvÇse}
                                            for j:=1 to 255 do begin putpixel(183+j,390-j,yellow);
                                                                     putpixel(353+j,393-j,yellow);
                                                                     putpixel(567-j,377-j,yellow);
                                                                     delay(2);
                                                                     putpixel(183+j,390-j,0);
                                                                     putpixel(353+j,393-j,0);
                                                                     putpixel(567-j,377-j,0);
                                                               end;
                                          repeat {Ufo bomb†j†nak a pusz°t†sa}
                                            putpixel((((ufo1l-5)+i)), ufo2l+3+i,red);
                                            putpixel((((ufo1l+5)+i)), ufo2l+4+i,random(yellow)+red);
                                            putpixel((((ufo1l-5)+i)), ufo2l+4+i,red);
                                            putpixel((((ufo1l-5)+i)), ufo2l+4+i,random(yellow)+red);
                                            putpixel((((ufo1l-5)+i)), ufo2l+6+i,yellow);
                                            putpixel((((ufo1l+5)+i)), ufo2l+7+i,yellow);
                                            i:=i+1;
                                            ufo1l:=ufo1l+1;
                                          until i=10;
                                          repeat                      {UFO lezuhan†s†nak sz°mul†sa}
                                            setcolor(2);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                            delay(20);
                                            setcolor(0);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                            ufo1:=ufo1-1;
                                            ufo2:=ufo2+4;
                                            setcolor(0);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                          until (ufo2>=410);
                                     end;
                   if (ch= 'l') then begin
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);
                                       line(x1,y1,ufo2,round((y1/x1)*ufo2));
                                       delay(200);
                                       setcolor(0);
                                       line(x1,y1,ufo2,round((y1/x1)*ufo2));
                                      end;
                   if (ch= 'o') then repeat
                                       sound(500);
                                       delay(1);
                                       nosound;
                                       setcolor(red);
                                       circle(o1,o,3);
                                       setcolor(3);
                                       circle(x,y,7);
                                       delay(5);
                                       setcolor(0);
                                       circle(o1,o,3);
                                       o:=o+1;
                                       o1:=o1+1;
                                     until o=319;
                   if (ch= #72) then if y1 > 10 then begin                    {fel}
                                          setcolor(0);
                                          line(x1,y1,x,y);
                                          y1:=y1-1;
                                        end;
                   if (ch= #80) then if y1 <30 then begin                    {le}
                                           setcolor(0);
                                           line(x1,y1,x,y);
                                           y1:=y1+1;
                                         end;
                   if (ch= #77) and (x < 319) then begin y:=10; x:=x+6; y1:=10; x1:=x1+6; end;
                   if (ch= #75) and (x > 15 ) then begin y:=10; x:=x-6; y1:=10; x1:=x1-6; end;

                 end;
 until (ch='v') or (v=1);
 setcolor(3);
 settextstyle(7,0,6);
 outtextxy(319,250,'Meteor');
 settextJUSTIFY(1,0);
 settextstyle(7,0,7);
 outtextxy(319,239,'Stargate');
 readkey;
 closegraph;
end.
