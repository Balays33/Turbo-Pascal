uses crt,graph;
var gd,gm    :integer;
    ch       :char;
label ide1,ide2,ide3,ide4,ide5,ide6;

procedure kezdes1;
var
 x,y    :integer;
begin
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 settextstyle(0,0,3);
 settextjustify(1,2);
 x:=getmaxx div 2;
 y:=getmaxy;
repeat
 setcolor(0);
 outtextxy(x,y,'K‚sz¡tette:');
 delay(20);
 setcolor(12);
 inc(y,-15);
 outtextxy(x,y,'K‚sz¡tette:');
 delay(20);
until y<=50;
end;

procedure kezdes2;
var
 x,y    :integer;
begin
 x:=getmaxx div 2;
 y:=getmaxy;
 settextstyle(0,0,5);
repeat
 setcolor(0);
 outtextxy(x,y,'Szolnoki Zsolt');
 delay(20);
 setcolor(10);
 inc(y,-20);
 outtextxy(x,y,'Szolnoki Zsolt');
 delay(20);
until y<=180;
end;

procedure kezdes3;
var
 x,y    :integer;
begin
 x:=getmaxx div 2;
 y:=getmaxy;
 settextstyle(0,0,5);
repeat
 setcolor(0);
 outtextxy(x,y,'I - 15');
 delay(20);
 setcolor(10);
 inc(y,-20);
 outtextxy(x,y,'I - 15');
 delay(20);
until y<=330;
repeat
 setcolor(0);
 settextstyle(0,0,2);
 settextjustify(0,0);
 outtextxy(255,470,'Tov bbl‚p‚s `t` - vel! >');
 delay(200);
 setcolor(14);
 outtextxy(255,470,'Tov bbl‚p‚s `t` - vel! >');
 delay(200);
until keypressed;
end;

procedure kezdes4;
var
 z,x    :integer;
begin
 setcolor(12);
 z:=getmaxx div 2;
 x:=getmaxy div 2;
 settextstyle(0,0,2);
 settextjustify(1,2);
 outtextxy(z,40,'Feladat meghat roz sa:');
 setcolor(10);
 outtextxy(z,120,'Grafikai lehet“s‚gek bemutat sa.');
 setcolor(11);
 outtextxy(z,200,'A feladat elk‚sz¡t‚se sor n a');
 outtextxy(z,300,'Programozzunk TurboPascal nyelven');
 outtextxy(z,400,'c¡m– k”nyvet haszn ltam.');
repeat
 setcolor(10);
 settextstyle(0,0,2);
 settextjustify(0,0);
 outtextxy(255,470,'Tov bbl‚p‚s `t` - vel! >');
 delay(200);
 setcolor(10);
 outtextxy(255,470,'Tov bbl‚p‚s `t` - vel! >');
 delay(200);
until keypressed;
end;

procedure kezdes5;
begin
 setcolor(1);
 rectangle(0,0,getmaxx,400);
 setcolor(12);
 settextstyle(0,0,2);
 outtextxy(5,5,'Sz¡nek megad sa:');
 setcolor(11);
 settextstyle(0,0,1);
 outtextxy(10,30,'- Setcolor(sz¡n)');
 outtextxy(10,45,'- Setbkcolor(sz¡n)');
 setcolor(12);
 settextstyle(0,0,2);
 outtextxy(5,80,'Vonalt¡pusok megad sa:');
 setcolor(11);
 settextstyle(0,0,1);
 outtextxy(10,105,'- Setlinestyle(t¡pus,0,1)');
 setcolor(12);
 settextstyle(0,0,2);
 outtextxy(5,150,'Vonalsz‚less‚g megad sa:');
 setcolor(11);
 settextstyle(0,0,1);
 outtextxy(10,175,'- Setlinestyle(t¡pus,0,sz‚less‚g)');
 setcolor(12);
 settextstyle(0,0,2);
 outtextxy(5,220,'Bett¡pus megad sa:');
 setcolor(11);
 settextstyle(0,0,1);
 outtextxy(10,245,'- Settextstyle(t¡pus,ki¡r s ir nya,nagy¡t s)');
 setcolor(12);
 settextstyle(0,0,2);
 outtextxy(5,290,'Sz”vegigaz¡t s megad sa:');
 setcolor(11);
 settextstyle(0,0,1);
 outtextxy(10,315,'- Settextjustify(v¡zszintes,fgg“leges)');
 setcolor(12);
 settextstyle(0,0,2);
 outtextxy(5,360,'Kit”lt‚si mint k megad sa:');
 setcolor(11);
 settextstyle(0,0,1);
 outtextxy(10,385,'- Setfillstyle(minta,sz¡n)');
repeat
 setcolor(10);
 settextstyle(0,0,2);
 settextjustify(0,0);
 outtextxy(255,470,'Tov bbl‚p‚s `t` - vel! >');
 delay(200);
 setcolor(10);
 outtextxy(255,470,'Tov bbl‚p‚s `t` - vel! >');
 delay(200);
until keypressed;
end;

procedure szinek;
var
   x1,y1,x2,y2,i,szin,j  :integer;
begin
 setcolor(1);
 rectangle(0,0,200,255);
 setcolor(12);
 outtextxy(0,5,'Sz¡nek:');
 setcolor(white);
 y1:=15;
 for i:=0 to 15 do
 rectangle(2,20+i*y1,32,30+i*y1);
 setcolor(11);
 outtextxy(40,22,'- 0 - Fekete');
 outtextxy(40,37,'- 1 - K‚k');
 outtextxy(40,52,'- 2 - Z”ld');
 outtextxy(40,67,'- 3 - Trkiz');
 outtextxy(40,82,'- 4 - Piros');
 outtextxy(40,97,'- 5 - Lila');
 outtextxy(40,112,'- 6 - Barna');
 outtextxy(40,127,'- 7 - Vil gosbarna');
 outtextxy(40,142,'- 8 - S”t‚tbarna');
 outtextxy(40,157,'- 9 - Vil gosk‚k');
 outtextxy(40,172,'- 10 - Vil gosz”ld');
 outtextxy(40,187,'- 11 - Vil gostrkiz');
 outtextxy(40,202,'- 12 - Vil gospiros');
 outtextxy(40,217,'- 13 - Vil goslila');
 outtextxy(40,232,'- 14 - S rga');
 outtextxy(40,247,'- 15 - Feh‚r');
 szin:=0;
 x2:=2;
 y2:=27;
repeat
 inc(szin,1);
 inc(y2,15);
 setfillstyle(1,szin);
 floodfill(5,y2,15);
until y2=252;
end;

procedure vonaltipusok;
var
 x,y,i,tipus    :integer;
begin
 setcolor(12);
 outtextxy(0,258,'Vonalt¡pusok:');
 setcolor(11);
 outtextxy(75,271,'- 0 - Norm l');
 outtextxy(75,285,'- 1 - Pontozott');
 outtextxy(75,300,'- 2 - K”z‚p');
 outtextxy(75,315,'- 3 - Szaggatott');
 setcolor(1);
 rectangle(0,255,200,325);
 setcolor(10);
 x:=5;
 y:=273;
 tipus:=0;
 line(5,273,70,273);
repeat
 inc(tipus,1);
 inc(y,15);
 setlinestyle(tipus,0,1);
 line(x,y,70,y);
until y=318;
end;

procedure vonalszelesseg;
var
 x,y    :integer;
begin
 setcolor(12);
 outtextxy(0,327,'Vonalsz‚less‚g:');
 setcolor(11);
 outtextxy(75,339,'- 1 - Norm l');
 outtextxy(75,354,'- 3 - Vastag');
 setcolor(1);
 setlinestyle(0,0,1);
 rectangle(0,325,200,365);
 setcolor(10);
 line(5,342,70,342);
 setlinestyle(0,0,3);
 line(5,357,70,357);
end;

procedure betutipusok;
var
 x,y,i,tipus    :integer;
begin
 setcolor(1);
 setlinestyle(0,0,1);
 rectangle(200,0,615,338);
 setcolor(12);
 settextstyle(0,0,1);
 outtextxy(200,5,'Bett¡pusok:');
 setcolor(11);
 outtextxy(285,20,'- 0 - Alap‚rtelmezett');
 outtextxy(285,42,'- 1 - H romvonalas');
 outtextxy(285,60,'- 2 - Kism‚ret–');
 outtextxy(285,102,'- 3 - Egyszer–');
 outtextxy(285,132,'- 4 - G¢t');
 outtextxy(285,165,'- 5 - rott');
 outtextxy(285,192,'- 6 - K”z‚pm‚ret– norm l');
 outtextxy(285,222,'- 7 - K”z‚pm‚ret– d“lt f‚lk”v‚r');
 outtextxy(290,252,'- 8 - K”z‚pm‚ret– norm l f‚lk”v‚r');
 outtextxy(335,290,'- 9 - Nagym‚ret– norm l');
 outtextxy(335,325,'- 10 - Nagym‚ret– norm l k‚tvonalas');
 y:=0;
 tipus:=0;
 setcolor(10);
 outtextxy(205,20,'ABC abc');
repeat
 inc(y,30);
 inc(tipus,1);
 settextstyle(tipus,0,1);
 outtextxy(205,y,'ABC abc');
until y=300;
end;
procedure kiirasiranya;
begin
 setcolor(1);
 rectangle(0,365,200,425);
 setcolor(12);
 settextstyle(0,0,1);
 outtextxy(0,368,'Ki¡r s ir nya:');
 setcolor(10);
 outtextxy(5,383,'Hor');
 settextstyle(0,1,1);
 outtextxy(12,400,'Ver');
 settextstyle(0,0,1);
 setcolor(11);
 outtextxy(35,383,'- 0 - V¡zszintes');
 outtextxy(22,408,'- 1 - Fgg“leges');
end;

procedure szovegigazitas;
var
 x1,y1,x2,y2,i,j    :integer;
 ch                 :char;
begin
 setcolor(1);
 rectangle(200,338,615,425);
 setcolor(12);
 outtextxy(200,342,'Sz”vegigaz¡t s:');
 setcolor(10);
 x1:=205;
 y1:=360;
 setlinestyle(0,0,3);
 for i:=0 to 2 do
 line(x1+i*180,y1,x1+i*180,370);
 setcolor(11);
 settextjustify(0,2);
 outtextxy(208,362,'- 0 - Balra');
 settextjustify(1,2);
 outtextxy(385,362,'- 1 - K”z‚pre');
 settextjustify(2,2);
 outtextxy(565,362,'- 2 - Jobbra');
 setcolor(10);
 setlinestyle(0,0,1);
 line(205,400,305,400);
 line(335,400,450,400);
 line(490,400,600,400);
 setcolor(11);
 settextjustify(0,0);
 outtextxy(205,400,'- 0 - Alj ra');
 settextjustify(0,1);
 outtextxy(335,400,'- 1 - K”zep‚re');
 settextjustify(0,2);
 outtextxy(490,400,'- 2 - Tetej‚re');
repeat
 setcolor(10);
 settextjustify(0,0);
 outtextxy(445,470,'Tov bbl‚p‚s `t` - vel! >');
 outtextxy(5,470,'< Visszal‚p‚s `v` - vel!');
 delay(200);
 setcolor(10);
 outtextxy(445,470,'Tov bbl‚p‚s `t` - vel! >');
 outtextxy(5,470,'< Visszal‚p‚s `v` - vel!');
 delay(200);
until keypressed;
end;

procedure kitoltesimintak;
var
 x1,y1,x2,y2,i,minta        :integer;
begin
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 rectangle(0,0,360,480);
 setcolor(12);
 settextstyle(0,0,1);
 outtextxy(0,5,'Kit”lt‚si mint k:');
 setcolor(white);
 y1:=35;
 for i:=0 to 12 do
 rectangle(2,20+i*y1,32,35+i*y1);
 minta:=0;
 x2:=17;
 y2:=27;
repeat
 inc(minta,1);
 inc(y2,35);
 setfillstyle(minta,10);
 floodfill(x2,y2,15);
until y2=447;
 setcolor(11);
 outtextxy(40,27,'- 0 - Fest‚s a h tt‚rsz¡nnel');
 outtextxy(40,62,'- 1 - Egyenletes fest‚s a fest“sz¡nnel');
 outtextxy(40,97,'- 2 - V¡zszintes vonalas minta');
 outtextxy(40,132,'- 3 - D“lt vonalas minta');
 outtextxy(40,167,'- 4 - D“lt vastag vonalas minta');
 outtextxy(40,202,'- 5 - D“lt vastag vonalas minta');
 outtextxy(40,237,'- 6 - D“lt vonalas minta');
 outtextxy(40,272,'- 7 - Halv ny r csos minta');
 outtextxy(40,307,'- 8 - Er“s d“lt r csos minta');
 outtextxy(40,342,'- 9 - S–r–n pontozott minta');
 outtextxy(40,377,'- 10 - Ritk n pontozott minta');
 outtextxy(40,412,'- 11 - K”zepesen pontozott minta');
 outtextxy(40,447,'- 12 - Felhaszn l¢  ltal defini lt minta');
end;

procedure eljarasok;
var
 x    :integer;
begin
 setcolor(1);
 rectangle(0,0,getmaxx,460);
 setcolor(12);
 outtextxy(362,5,'Elj r sok:');
 setcolor(11);
 outtextxy(398,35,'- Arc(x,y,kezd“sz”g,v‚gsz”g,sug r)');
 outtextxy(388,68,'- Bar(x1,y1,x2,y2)');
 outtextxy(398,110,'- Bar3d(x1,y1,x2,y2,m‚lys‚g,teteje l that¢ e)');
 outtextxy(388,143,'- Circle(x,y,sug r)');
 outtextxy(390,168,'- Ellipse(x,y,kezd“sz”g,');
 outtextxy(463,178,'v‚gsz”g,X-tengely fe-');
 outtextxy(463,188,'le,Y-tengely fele)');
 outtextxy(390,208,'- Fillellipse(x,y,X-tengely fe-');
 outtextxy(493,218,'le,Y-tengely fele)');
 outtextxy(390,243,'- Floodfill(x,y,hat rol¢ sz¡n)');
 outtextxy(390,267,'- Line(x1,y1,x2,y2)');
 outtextxy(425,295,'- Outtext('')');
 outtextxy(425,320,'- outtextxy(x,y,'')');
 outtextxy(390,348,'- Pieslice(x,y,kezd“sz”g,v‚g-');
 outtextxy(550,360,'sz”g,sug r)');
 outtextxy(390,388,'- Rectangle(x1,y1,x2,y2)');
 outtextxy(390,428,'- Sector(x,y,kezd“sz”g,');
 outtextxy(463,438,'v‚gsz”g,X-tengely fe-');
 outtextxy(463,448,'le,Y-tengely fele)');
 setcolor(10);
 arc(373,45,0,130,20);
 setfillstyle(1,10);
 bar(363,60,383,80);
 bar3d(363,105,383,125,10,topon);
 circle(373,145,10);
 ellipse(373,170,0,360,10,5);
 fillellipse(373,210,10,5);
 rectangle(365,240,385,250);
 setfillstyle(1,12);
 floodfill(366,241,10);
 line(365,270,385,270);
 outtextxy(365,295,'ABC abc');
 outtextxy(365,320,'ABC abc');
 pieslice(385,350,160,200,20);
 rectangle(365,380,385,400);
 sector(373,430,0,360,10,5);
repeat
 setcolor(10);
 settextjustify(0,0);
 outtextxy(445,470,'Tov bbl‚p‚s `t` - vel! >');
 outtextxy(5,470,'< Visszal‚p‚s `v` - vel!');
 delay(200);
 setcolor(10);
 outtextxy(445,470,'Tov bbl‚p‚s `t` - vel! >');
 outtextxy(5,470,'< Visszal‚p‚s `v` - vel!');
 delay(200);
until keypressed;
end;

procedure zaras;
var
 a,s,d,f   :integer;
begin
 setcolor(10);
 settextstyle(0,0,8);
 settextjustify(1,1);
 outtextxy(getmaxx div 2,getmaxy div 2,'V‚ge!');
 delay(1000);
 a:=0;
 s:=0;
 d:=getmaxx;
 f:=getmaxy;
repeat
 setfillstyle(1,0);
 bar(a,s,d,f);
 delay(10);
 inc(a,10);
 inc(f,-10);
 inc(d,-10);
 inc(s,10);
 setfillstyle(1,random(getmaxcolor));
 bar(a,s,d,f);
 delay(10);
until a=240;
end;

begin
ide1:
 filemode:=0;
 gd:=detect;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 kezdes4;
ch:=readkey;
 if ch='t' then
 goto ide2
 else
  begin
   cleardevice;
   setcolor(1);
   rectangle(0,0,getmaxx,getmaxy);
   setcolor(10);
   settextstyle(0,0,4);
   settextjustify(1,1);
   outtextxy(getmaxx div 2,getmaxy div 2,'Hib s billenty–!');
   sound(880);
   delay(500);
   nosound;
   delay(1000);
  goto ide1;
  end;
ide2:
 filemode:=0;
 gd:=detect;
 initgraph(gd,gm,'c:\program files\tp\bgi');
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 kezdes1;
 kezdes2;
 kezdes3;
ch:=readkey;
 if ch='t' then
 goto ide3
 else
  begin
   cleardevice;
   setcolor(1);
   rectangle(0,0,getmaxx,getmaxy);
   setcolor(10);
   settextstyle(0,0,4);
   settextjustify(1,1);
   outtextxy(getmaxx div 2,getmaxy div 2,'Hib s billenty–!');
   sound(880);
   delay(500);
   nosound;
   delay(1000);
  goto ide2;
  end;
ide3:
 filemode:=0;
 gd:=detect;
 initgraph(gd,gm,'g:\pusw\bp\bgi');
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 kezdes5;
ch:=readkey;
 if ch='t' then
 goto ide4
 else
  begin
   cleardevice;
   setcolor(1);
   rectangle(0,0,getmaxx,getmaxy);
   setcolor(10);
   settextstyle(0,0,4);
   settextjustify(1,1);
   outtextxy(getmaxx div 2,getmaxy div 2,'Hib s billenty–!');
   sound(880);
   delay(500);
   nosound;
   delay(1000);
  goto ide3;
  end;
ide4:
 filemode:=0;
 gd:=detect;
 initgraph(gd,gm,'g:\pusw\bp\bgi');
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 szinek;
 vonaltipusok;
 vonalszelesseg;
 betutipusok;
 kiirasiranya;
 szovegigazitas;
ch:=readkey;
case ch of
 't'  : goto ide5;
 'v'  : goto ide3;
   else
 if (ch<>'t') or (ch<>'v') then
   cleardevice;
   setcolor(1);
   rectangle(0,0,getmaxx,getmaxy);
   setcolor(10);
   settextstyle(0,0,4);
   settextjustify(1,1);
   outtextxy(getmaxx div 2,getmaxy div 2,'Hib s billenty–!');
   sound(880);
   delay(500);
   nosound;
   delay(1000);
  goto ide4;
 end;
ide5:
 filemode:=0;
 gd:=detect;
 initgraph(gd,gm,'g:\pusw\bp\bgi');
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 kitoltesimintak;
 eljarasok;
ch:=readkey;
case ch of
 't'  : goto ide6;
 'v'  : goto ide4;
   else
 if (ch<>'t') or (ch<>'v') then
   cleardevice;
   setcolor(1);
   rectangle(0,0,getmaxx,getmaxy);
   setcolor(10);
   settextstyle(0,0,4);
   settextjustify(1,1);
   outtextxy(getmaxx div 2,getmaxy div 2,'Hib s billenty–!');
   sound(880);
   delay(500);
   nosound;
   delay(1000);
  goto ide5;
 end;
ide6:
 filemode:=0;
 gd:=detect;
 initgraph(gd,gm,'g:\pusw\bp\bgi');
 cleardevice;
 setcolor(1);
 rectangle(0,0,getmaxx,getmaxy);
 zaras;
 closegraph;
end.
