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
    outtextxy(40,70,'2150-et �runk, amikor a emberis�g l�tsz�ma m�r el�re 25 milli�rd f�t.');
    outtextxy(40,80,'Ekkora m�r a F�ld tartal�kai kimer�ltek �s nem lettek volna k�pesek ');
    outtextxy(40,90,'egy ekkora l�tsz�m� faj fenntart�s�ra.');
    outtextxy(40,100,'A hat�rainkat kit�ltuk, �s gyarmatos�tottuk a k�zeli plan�t�kat. ');
    outtextxy(40,110,'A Mars volt az els� c�lpont, amit m�r 2060-ban lakhat�v� tett�nk, ');
    outtextxy(40,120,'�s elkezd�d�tt a ben�pes�t�s.');
    outtextxy(40,130,'De ez m�g csak a kezdet volt egy hatalmas kiterjed�s� biradalom ');
    outtextxy(40,140,'megalakul�s�hoz. ');
    outtextxy(40,150,'Azonban t�rt�nt valami, valami, amire senki sem sz�m�tott, �s mindenkit ');
    outtextxy(40,160,'a retteg�s ker�tett hatalm�ba. ');
    outtextxy(40,170,'Terjeszked�s�nk �tj�ba egy m�sik nagyhatalom �llt, akik er�sebbek, ');
    outtextxy(40,180,'mint amit mi valaha gondoltunk volna.  ');
    outtextxy(40,190,'Technik�juk, fejletts�g�k, l�tsz�muk, �s sz�v�ss�guk m�g minket is ');
    outtextxy(40,200,'megt�ntor�tott.  ');
    outtextxy(40,210,'Elkezd�d�tt a h�bor�, amibe el�sz�r bizakodva v�gtunk, de r� kellett');
    outtextxy(40,220,'j�nn�nk, hogy �k az emberis�g j�v�j�t is fenyegethetik.');
    outtextxy(40,230,'�s �gy is lett. 2140-re m�r csak a F�ld bolyg� tartotta mag�t.');
    outtextxy(40,240,'A h�rom nagy hatalom -Eur�pai Unio, USA, Jap�n- �sszefogott,    ');
    outtextxy(40,250,',hogy megv�dj�k az emberis�get, �s ezzel megkezd�d�tt a ');
    outtextxy(390,270,'F�GGETLENS�G NAPJA!   ');
    outtextxy(450,450,'Please ENTER');
 readkey;
 cleardevice;
 setcolor(white);
 t:=0; {Itt �ll�thatod be a sebess�get }
 for i:=1 to 35 do         {Csillag H�tt�r}
                begin
                  cs:=random(619);
                  h:=random(479);
                  putpixel(cs,h,white);
                end;
 x:=10;  u:=0;
 delay(100);
 outtextxy(30,450,'F�ld 2150-ben');
 repeat                    {F�ld k�zeled�se}
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
 outtextxy(30,450,'Naprendszer az idegen �rhaly� k�zel�ti meg');
 repeat                         {Idegen �rhaly�}
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
 outtextxy(30,450,'Kisebb UFO-k v�ltak le');
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
 outtextxy(14,450,'UFO-k kil�vik a v�delmi m�holdakat');
 delay(2000+t);
 cleardevice;
 setfillstyle(0,0);
 bar(25,440,450,460);
  for i:=1 to 15 do         {Csillag H�t�r}
                begin
                  cs:=random(200);
                  h:=random(479);
                  putpixel(cs,h,white);
                end;
  for i:=1 to 5 do         {Csillag H�t�r}
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
  outtextxy(14,450,'UFO-k a nagy v�rosok fel� tartanak');
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
