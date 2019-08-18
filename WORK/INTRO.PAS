uses crt,graph;
var gd,gm:integer;
    x,y,cs,h,i,u,t:integer;
const    Afrika : array[1..5] of pointtype=
    ((x:350;y:250),(x:380;y:290),(x:405;y:200),(x:300;y:200),(x:280;y:230));
         Europa : array[1..5] of pointtype=
    ((x:310;y:200),(x:457;y:190),(x:405;y:150),(x:330;y:150),(x:300;y:170));
         Amerika : array[1..4] of pointtype=
    ((x:250;y:320),(x:250;y:260),(x:220;y:240),(x:226;y:280));
         Afrika2 : array[1..7] of pointtype=
    ((x:220;y:250),(x:280;y:350),(x:280;y:479),(x:450;y:479),(x:605;y:300),(x:500;y:200),(x:380;y:230));
         Europa2 : array[1..7] of pointtype=
    ((x:290;y:150),(x:270;y:220),(x:310;y:229),(x:380;y:179),(x:639;y:250),(x:639;y:70),(x:380;y:80));
begin
 gd:=detect;
 filemode:=0;
 initgraph(gd,gm,'e:\tp\bgi');
 cleardevice;
 setcolor(3);
    line(50,50,569,50);
    line(50,50,50,60);
    line(569,50,569,60);
    line(50,460,569,460);
    line(50,60,569,60);
    settextstyle(0,0,0);
    outtextxy(54,52,'X-Files                                             West Grapich');
    outtextxy(40,70,'2150-et °runk, amikor a emberisÇg lÇtsz†ma m†r elÇre 25 milli†rd fît.');
    outtextxy(40,80,'Ekkora m†r a Fîld tartalÇkai kimerÅltek Çs nem lettek volna kÇpesek ');
    outtextxy(40,90,'egy ekkora lÇtsz†m£ faj fenntart†s†ra.');
    outtextxy(40,100,'A hat†rainkat kit¢ltuk, Çs gyarmatos°tottuk a kîzeli planÇt†kat. ');
    outtextxy(40,110,'A Mars volt az elsî cÇlpont, amit m†r 2060-ban lakhat¢v† tettÅnk, ');
    outtextxy(40,120,'Çs elkezdîdîtt a benÇpes°tÇs.');
    outtextxy(40,130,'De ez mÇg csak a kezdet volt egy hatalmas kiterjedÇsÅ biradalom ');
    outtextxy(40,140,'megalakul†s†hoz. ');
    outtextxy(40,150,'Azonban tîrtÇnt valami, valami, amire senki sem sz†m°tott, Çs mindenkit ');
    outtextxy(40,160,'a rettegÇs ker°tett hatalm†ba. ');
    outtextxy(40,170,'TerjeszkedÇsÅnk £tj†ba egy m†sik nagyhatalom †llt, akik erîsebbek, ');
    outtextxy(40,180,'mint amit mi valaha gondoltunk volna.  ');
    outtextxy(40,190,'Technik†juk, fejlettsÇgÅk, lÇtsz†muk, Çs sz°v¢ss†guk mÇg minket is ');
    outtextxy(40,200,'megt†ntor°tott.  ');
    outtextxy(40,210,'Elkezdîdîtt a h†bor£, amibe elãszîr bizakodva v†gtunk, de r† kellett');
    outtextxy(40,220,'jînnÅnk, hogy îk az emberisÇg jîvîjÇt is fenyegethetik.');
    outtextxy(40,230,'ês °gy is lett. 2140-re m†r csak a Fîld bolyg¢ tartotta mag†t.');
    outtextxy(40,240,'A h†rom nagy hatalom -Eur¢pai Unio, USA, Jap†n- îsszefogott,    ');
    outtextxy(40,250,',hogy megvÇdjÇk az emberisÇget, Çs ezzel megkezdîdîtt a ');
    outtextxy(390,270,'FöGGETLENSêG NAPJA!   ');
    outtextxy(450,450,'Please ENTER');
 readkey;
 cleardevice;
 setcolor(white);
 t:=0; {Itt †ll°thatod be a sebessÇget }
 for i:=1 to 35 do         {Csillag H†ttÇr}
                begin
                  cs:=random(619);
                  h:=random(479);
                  putpixel(cs,h,white);
                end;
 x:=10;  u:=0;
 delay(100);
 outtextxy(30,450,'Fîld 2150-ben');
 repeat                    {Fîld kîzeledÇse}
 setfillstyle(1,1);
 fillellipse(350,250,30+x,10+x);
 floodfill(350,250,white);
 delay(70+t);
 setfillstyle(1,1);
 fillellipse(350,250,30+x,10+x);
 floodfill(350,250,white);
 x:=x+10;
 until x=110;
 setfillstyle(1,yellow);
 fillpoly(5,afrika);
 fillpoly(5,Europa);
 fillpoly(4,amerika);
 floodfill(390,230,white);
 setfillstyle(1,7);
 fillellipse(350,340,65,17);
 floodfill(350,340,white);
 setfillstyle(1,0);
 bar(25,440,300,460);
 delay(30+t);
 outtextxy(30,450,'Naprendszer az idegen Århaly¢ kîzel°ti meg');
 repeat                         {Idegen örhaly¢}
 setfillstyle(1,8);
 fillellipse(u,120,100,90);
 floodfill(u,120,white);
 delay(70);
 setfillstyle(0,0);
 fillellipse(u,120,100,90);
 floodfill(u,120,Black);
 u:=u+2;
 until u=100;
 setfillstyle(0,0);
 Bar(0,20,100,210);
 setfillstyle(1,8);
 fillellipse(100,120,100,90);
 floodfill(100,120,white);
 setfillstyle(0,0);
 bar(25,440,450,460);
 delay(30+t);
 outtextxy(30,450,'Kisebb UFO-k v†ltak le');
 setfillstyle(1,0);               {UFO1}
 fillellipse(200,150,20,10);
 floodfill(200,150,white);
 setfillstyle(1,0);               {UFO2}
 fillellipse(100,250,20,10);
 floodfill(100,250,white);
 setfillstyle(1,0);               {UFO3}
 fillellipse(200,50,20,10);
 floodfill(200,50,white);
 delay(600+t);
 setfillstyle(0,0);
 bar(25,440,450,460);
 setcolor(white);
 outtextxy(14,450,'UFO-k kilîvik a vÇdelmi mÅholdakat');
 delay(2000+t);
 cleardevice;
 setfillstyle(0,0);
 bar(25,440,450,460);
  for i:=1 to 15 do         {Csillag H†tÇr}
                begin
                  cs:=random(200);
                  h:=random(479);
                  putpixel(cs,h,white);
                end;
  for i:=1 to 5 do         {Csillag H†tÇr}
                begin
                  cs:=random(319);
                  h:=random(100);
                  putpixel(cs,h,white);
                end;
  setlinestyle(0,0,3);
  setcolor(white);
  arc(649,479,90,180,500);
  setlinestyle(0,0,0);
  setcolor(blue);
  for i:=1 to 250 do arc(649,479,90,180,500-(2*i));
  setfillstyle(1,yellow);
  fillpoly(7,afrika2);
  fillpoly(7,europa2);
  setfillstyle(1,2); fillellipse(104,122,30,20); floodfill(104,122,0);
  setcolor(0);i:=1;
  repeat
  setfillstyle(1,white);
  fillellipse(300-i,100+(2+i),10,4);
  floodfill(300-i,120+(2+i),0);
  delay(70+t);
  setfillstyle(0,0);
  fillellipse(300-i,100+(2+i),10,4);
  floodfill(300-i,100+(2+i),black);
  i:=i+1;
  until i=50;
  sound(500);setcolor(red);setlinestyle(0,0,3);line(104,122,220,150) ;
  delay(100+t);nosound;
  setcolor(0);setlinestyle(0,0,3);line(104,122,220,150) ;
  setcolor(white);
  outtextxy(14,450,'UFO-k a nagy v†rosok felÇ tartanak');
  setcolor(0);setlinestyle(0,0,0);
  i:=1;
  repeat
    setfillstyle(1,2);
    fillellipse(100+(2+i),120+i,30,20);
    floodfill(100+(2+i),120+i,0);
    delay(50+t);
    setfillstyle(0,0);
    fillellipse(100+(2+i),120+i,30,20);
    floodfill(100+(2+i),120+i,Black);
    i:=i+1;
  until i=110;
  setfillstyle(1,2);
    fillellipse(210,230,30,20);
    floodfill(210,230,0);
 readkey;
 closegraph;
end.
