Program Fnapja;
uses crt,graph;      {Barcza Bal†zs 2004.5.5}
var gd,gm:integer;           {DJVMN2}
    i:integer;
    ch:char;
    p,x,y,v,z,t:integer;

  const  menu : array[1..5] of string[25] =
	   (' 1     -  1. feladat  ',
	    ' 2     -  2. feladat  ',
	    ' 3     -  3. feladat  ',
            ' 4     -  4. feladat  ',
	    'ESC    -  VêGE        ') ;

procedure menukiir ;
  begin
    cleardevice;
    setcolor(3);
    settextstyle(0,0,0);
    outtextxy(20,20,'West Grapich');
    line(20,28,120,28);
    outtextxy(40,40,'Barcza Bal†zs');
    outtextxy(40,60,'DJVMN2');
    setcolor(1);
    settextstyle(0,0,8);
    outtextxy(400,150,'Ufo');
    setcolor(3);
    settextstyle(8,0,2);
    outtextxy(400,200,'Rise of the Human');
    setcolor(white);
    settextstyle(8,0,3);
    outtextxy(100,100,'1: New Game');
    outtextxy(100,150,'2: Ered Lista');
    outtextxy(100,200,'3: Intro');
    outtextxy(100,250,'4: Help');
    outtextxy(100,300,'Esc: Quit');
    readkey;
  end ;

Procedure Intro1;
  begin
    randomize;
    repeat
      setcolor(white);
      x:=random(640);
      y:=random(480);
      v:=random(640);
      z:=random(480);
      line(x,y,v,z);
      p:=p+1;
    until p>1000;
    repeat
      setfillstyle(random(12)+1 ,0);
      bar(150+t,70,155+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(160+t,70,162+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(167+t,70,170+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(175+t,70,180+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(185+t,70,187+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(192+t,70,200+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(205+t,70,210+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(215+t,70,217+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(220+t,70,222+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(224+t,70,227+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(230+t,70,235+t,350);
      setfillstyle(random(12)+1 ,0);
      bar(240+t,70,246+t,350);
      t:=t+60;
    until t>250;
    setcolor(1);
    settextstyle(0,0,4);
    outtextxy(135,350,'West Grapich');
    setcolor(lightgreen);
    settextstyle(1,0,1);
    outtextxy(500,450,'Please ENTER');
    readkey;
  end;
Procedure F3;
var  x,y,cs,h,i,j,u,t:integer;
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
const
    csillag : array[1..5] of pointtype=
    ((x:80;y:90),(x:70;y:120),(x:95;y:100),(x:65;y:100),(x:90;y:120));
    cs2 :array[1..5] of pointtype=
    ((x:145;y:90),(x:135;y:120),(x:160;y:100),(x:130;y:100),(x:155;y:120));
    cs3 :array[1..5] of pointtype=
    ((x:112;y:105),(x:102;y:135),(x:127;y:115),(x:97;y:115),(x:122;y:135));
    cs4 :array[1..5] of pointtype=
    ((x:112;y:25),(x:102;y:55),(x:127;y:35),(x:97;y:35),(x:122;y:55));
    cs5 :array[1..5] of pointtype=
    ((x:145;y:50),(x:135;y:80),(x:160;y:60),(x:130;y:60),(x:155;y:80));
    cs6 :array[1..5] of pointtype=
    ((x:80;y:50),(x:70;y:80),(x:95;y:60),(x:65;y:60),(x:90;y:80));
Begin
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
  {Europa Unio}setfillstyle(1,1); bar(10,10,220,150); setfillstyle(1,yellow);
               fillpoly(5,csillag);fillpoly(5,cs2);fillpoly(5,cs3);fillpoly(5,cs4);fillpoly(5,cs5);fillpoly(5,cs6);
  {USA}setfillstyle(1,white); bar(10,160,220,310);
       setfillstyle(1,red); bar(110,160,220,175);
       setfillstyle(1,red); bar(110,190,220,205);
       setfillstyle(1,red); bar(110,220,220,235);
       setfillstyle(1,red); bar(10,250,220,265);
       setfillstyle(1,red); bar(10,275,220,290);
       setfillstyle(1,red); bar(10,300,220,310);
       setfillstyle(1,1); bar(10,160,110,235);
     setlinestyle(0,0,3); setcolor(white);
     for j:=1 to 7 do
      for i:=1 to 7 do
         begin
           line(12,160+(i*10),18,160+(i*10));
           line(15,155+(i*10),15,163+(i*10));
          line(12+(j*12),160+(i*10),18+(j*12),160+(i*10));
          line(15+(j*12),155+(i*10),15+(j*12),163+(i*10));
        end;
  {Japan}setfillstyle(1,white); bar(10,319,220,469);
         setlinestyle(0,0,0);setcolor(0); setfillstyle(1,red); circle(115,394,40); floodfill(115,394,0);
 setcolor(3);settextstyle(0,0,0);
 outtextxy(240,30,'Eur¢pai Unio Çs Oroszorsz†g Szuper Hatalm° pozi-');
 outtextxy(240,40,'ciot harcolt ki gyarmatos°t†sban megelîzte az USA-t.');
 outtextxy(240,170,'USA gazdas†ga hanyatlott meg nem erîs°tett h°rek');
 outtextxy(240,180,'szerint UFO-kal titkos szerzîdÇst kîtîttek');
 outtextxy(240,350,'Jap†n egyes°tette a †zsiai orsz†gokat.');
 outtextxy(240,360,'Hossz£ harcok ut†n megszerezte USA-val szemben');
 outtextxy(240,370,'az °r†nyit†st a Csendes-¢ce†n felett.');
 outtextxy(500,450,'Please ENTER');
 readln;
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
 outtextxy(30,450,'A Fîldet idegen Århaly¢ kîzel°ti meg');
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
end;
Procedure F1;
var gd,gm:integer;
    ufo1,ufo2,ufo1l,ufo2l,i,y,ul,stop:integer;
    ufo1lf,ufo2lf:integer;
    cs,h:integer;
    lov,ranlov,mel,mel2,z,ujufo:byte;
    elet:byte;
    ch:char;
  begin
    cleardevice;
    settextstyle(0,0,0);
 randomize;
     setcolor(3);
     line(0,429,638,429);
     line(1,429,1,479);
     line(638,429,638,479);
     line(1,479,638,479);
     outtextxy(590,469,' 3.00');
     outtextxy(3,432,'Barcza Bal†zs');
     outtextxy(4,441,'Djvmn2');
     outtextxy(535,432,'West Grapich');
     outtextxy(150,432,'V: KilÇpÇs');
     outtextxy(150,441,'W: Radar UFO bemÇrÇse');
     outtextxy(150,450,'Fel');
     outtextxy(150,459,'Le');
     outtextxy(400,432,'êlet:');
     setfillstyle(1,yellow);
     bar(440,432,448,442);
     bar(450,432,458,442);
     bar(460,432,468,442);
  {v†ros}
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(2,428,19,400);
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
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(107,428,150,405);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(156,428,200,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(203,428,230,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(240,428,250,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(252,428,280,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(284,428,300,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(306,428,370,406);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(372,428,392,380);
        setfillstyle(1 ,red);
        circle(380,370,10);
        floodfill(380,370,3);
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
        bar(562,428,584,385);
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
   repeat
  ufo1:=random(620)+300; ufo2:=random(239)+15;
  until (ufo1<620) and (ufo2<239) ;
  ellipse(ufo1,ufo2,0,360,20,10);
  putpixel(ufo1+2,ufo2,yellow); line(ufo1,ufo2-5,ufo1,ufo2+5);
  setcolor(3); outtextxy(ufo1+35,ufo2-36,'1');
  for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
  setcolor(red);outtextxy(ufo1+35,ufo2-3,'2');
  for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
  setcolor(3); outtextxy(ufo1+35,ufo2+30,'3');
  for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
  readkey;
       setcolor(0); outtextxy(ufo1+35,ufo2-36,'1');
       setcolor(0);outtextxy(ufo1+35,ufo2-3,'2');
       setcolor(0); outtextxy(ufo1+35,ufo2+30,'3');
       for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
       for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
       for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
 {repeat
    while (ch='l') or (s=55) do begin putpixel(ufo1+33,(ufo2-36)+(i),yellow); delay(90);
    putpixel(ufo1+33,(ufo2-36)+(i),black); s:=s+2; i:=i+3; end;
    {while (ch='l') or (s=0) do begin putpixel(ufo1+40,(ufo2)+(i+3),yellow); delay(20);
    putpixel(ufo1+40,(ufo2)+(i+3),black); s:=s-2;end;  }
 {   readkey;
  until (ch='l');}
  nosound;
  putpixel(10,100,red);
  putpixel(10,380,red);
  y:=240; elet:=0;
repeat
  repeat
  setcolor(3);circle(10,y,10); {A fîldi repîlîgÇp kinÇzete}
  setfillstyle(1,7);fillellipse(10,y,30,4);floodfill(10,y,3);
  setcolor(0);circle(10,y,10);
  setfillstyle(1,0);fillellipse(10,y,30,4);floodfill(10,y,0);
  ujufo:=0; {£j UFO lÇtrehoz†s†nak az adata}
  if keypressed then
                 Begin
                   stop:=0;
                   ch:=readkey;
                   setfillstyle(1,0);bar(2,1,200,30);
                   setlinestyle(0,0,0);
                   if (ch= #72) and (y > 100) then begin  y:=y-140; end;
                   if (ch= #80) and (y < 380) then begin  y:=y+140; end;
                   if ch='w' then begin ul:=random(4)+1; ufo1l:=ufo1;ufo2l:=ufo2; z:=random(3);
                                                         ufo1lf:=ufo1;ufo2lf:=ufo2;
                                    setcolor(3);circle(10,y,10); {A fîldi repîlîgÇp kinÇzete}
                                    setfillstyle(1,7);fillellipse(10,y,30,4);floodfill(10,y,3);
                                                    setcolor(3);
                                                    for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
                                                    setcolor(red);
                                                    for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
                                                    setcolor(3);
                                                    for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
                                  setfillstyle(1,0);bar(2,1,200,30);
                                  repeat             {Melyik pozici¢ra cÇlzol}
                                    setcolor(3);outtextxy(10,10,'kÇrem a sz†mot(1/2/3)');read(lov);
                                  until (lov=1)or(lov=2)or(lov=3);
                                  ranlov:=random(4)+1;  {ranlov kital†lom nyertem}
                                  mel2:=random(3)+1;    {mellÇ lîvÇs ir†nya randommal}
                                          repeat        {UFO Bolyg¢ felsz°nt bomb†zza}
                                            sound(500);
                                            nosound;
                                            setcolor(red);
                                            circle(ufo1lf,ufo2lf,3);
                                            setcolor(white);
                                            ellipse(ufo1,ufo2,0,360,20,10);
                                            circle(ufo1,ufo2,3);
                                            delay(10);
                                            setcolor(0);
                                            circle(ufo1lf,ufo2lf,3);
                                            ufo2lf:=ufo2lf+2;
                                            ufo1lf:=ufo1lf-z;
                                            if  (ufo1lf>=368) and (ufo1lf<=392) and
                                            ((ufo2lf=369)or(ufo2lf=373)or(ufo2lf=370)or(ufo2lf=371) )
                                            then stop:=1;
                                          until  ufo2lf>=410;
                                          i:=1;
                                            repeat {Ufo bomb†j†nak a pusz°t†sa}
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+3+i,red);
                                              putpixel((((ufo1lf+5)+i)), ufo2lf+4+i,random(yellow)+red);
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+4+i,red);
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+4+i,random(yellow)+red);
                                              putpixel((((ufo1lf-5)+i)), ufo2lf+6+i,yellow);
                                              putpixel((((ufo1lf+5)+i)), ufo2lf+7+i,yellow);
                                              i:=i+1;
                                              ufo1lf:=ufo1lf+1;
                                            until i=10;
                                  if lov=ranlov then begin setcolor(red);setlinestyle(0,0,3);line(10,y,ufo1,ufo2);
                                                      sound(500);delay(30);nosound;   {LîvÇs tal†lt}
                                                      setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2);
                                                      setfillstyle(1,red);fillellipse(ufo1,ufo2,20,10);
                                                      sound(200);delay(60);nosound;
                                                      setfillstyle(1,0);fillellipse(ufo1,ufo2,60,50);
                                                      repeat                      {UFO lezuhan†s†nak szimul†l†sa}
                                                        setcolor(white);
                                                        setlinestyle(0,0,0);
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
                                                     ujufo:=1; {UFo-t kilîte a repÅlãgÇp}
                                                     end
                                                else case mel2 of
                                                    1: begin         {LîvÇs nem tal†lt mellÇ hordott -y ir†nyba}
                                                         mel:=(random(20)+10);
                                                         setcolor(3);setlinestyle(0,0,3);line(10,y,ufo1,ufo2+mel);
                                                         sound(500);delay(20);nosound;
                                                        setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2+mel);
                                                       end;
                                                    2: begin         {LîvÇs nem tal†lt mellÇ hordott +y ir†nyba}
                                                         mel:=(random(20)+10);
                                                         setcolor(3);setlinestyle(0,0,3);line(10,y,ufo1,ufo2-mel);
                                                         sound(500);delay(20);nosound;
                                                        setcolor(0);setlinestyle(0,0,3);line(10,y,ufo1,ufo2-mel);
                                                       end;
                                                     end;
                                  setlinestyle(0,0,0);
                                                if ujufo=1 then
                                                             begin

                                                               repeat
                                                 ufo1:=random(620)+300; ufo2:=random(239)+15;
                                                               until (ufo1<620) and (ufo2<239);
                                                               i:=3;
                                                               repeat     {radar aktiv†lodik}
                                                                 setcolor(yellow);
                                                                 sound(500);
                                                                 delay(1);
                                                                 nosound;
                                                                 setcolor(red);
                                                                 arc(380,350,0,180,i);
                                                                 arc(380,355,0,180,i);
                                                                 arc(380,345,0,180,i);
                                                                 delay(4);
                                                                 setcolor(0);
                                                                 arc(380,350,0,180,i);
                                                                 arc(380,355,0,180,i);
                                                                 arc(380,345,0,180,i);
                                                                 i:=i+1;
                                                               until  i=150;
                                                 setcolor(white);
                                                 ellipse(ufo1,ufo2,0,360,20,10);
                                                 putpixel(ufo1+2,ufo2,yellow); line(ufo1,ufo2-5,ufo1,ufo2+5);
                                                 setcolor(3); outtextxy(ufo1+35,ufo2-36,'1');
                                                 for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
                                                 setcolor(red);outtextxy(ufo1+35,ufo2-3,'2');
                                                 for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
                                                 setcolor(3); outtextxy(ufo1+35,ufo2+30,'3');
                                                 for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
                                                             end
                                                           else
                                                    if (ufo2<410) then   case ul of {UFO lîvÇsei}
                                                               1: begin if ufo2>100 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l-1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=100
                                                                                    else
                                                                         repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l+1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=100;
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,100,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,100,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=100 then stop:=1; end;
                                                               2: begin if ufo2>240 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l-1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=240
                                                                                    else
                                                                         repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l+1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=240;
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,240,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,240,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=240 then stop:=1; end;
                                                               3: begin if ufo2>380 then
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l-1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=380
                                                                                    else
                                                                         repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,ufo2l,3);
                                                                          ufo2l:=ufo2l+1;ufo1l:=ufo1l-1;
                                                                        until ufo2l=380;
                                                                        repeat
                                                                          sound(500);
                                                                          delay(1);
                                                                          nosound;
                                                                          setcolor(red);
                                                                          circle(ufo1l,380,3);
                                                                          setcolor(3);circle(10,y,10);
                                                                          delay(3);
                                                                          setcolor(0);
                                                                          circle(ufo1l,380,3);
                                                                          ufo1l:=ufo1l-2;
                                                                        until ufo1l<=10; if y=380 then stop:=1; end;end;

                                  end;
                 end;
  until (ch='v') or (stop=1);
   stop:=0;
  setfillstyle(1,0);bar(460-(elet*10),432,468,442);
   elet:=elet+1;
until elet=3;
  setcolor(red);
  settextjustify(1,0);
  settextstyle(0,0,4);
  outtextxy(319,239,'Game Over');
  readkey;
  end;

Procedure F2;
type ered=record
            Nevek:   string[15];
            Eredmeny: integer;
           end;
var a:ered;
    f:file of ered;
    v:char;
  begin
    cleardevice;
    settextstyle(0,0,0);
    assign(f,'ered.dat');
    {$I-}
    reset(f);
    {$I+}
    if ioresult <> 0 then rewrite(f);
    {seek(f,filesize(f));
    outtext('EredmÇny mentÇse a list†ba(i/n)');
    readln(v);
    while (v='i') or (v='I') do
         begin
           outtext('nevek:');
           readln(a.nevek);
           outtext('eredmeny');
           readln(a.eredmeny);
           write(f,a);
           outtext('Èj adatot bevinni?(i/n)');
           readln(v);
         end;}
         cleardevice;
         seek(f,0);
    outtextxy(170,120,'          Nevek      Eredmeny           ');
    outtextxy(170,130,'========================================');
   while not eof(f) do
         begin
         read(f,a);
         outtextxy(170,140,'a.Nevek');
         outtextxy(370,140,'a.eredmeny');
         end;
   close(f);
  outtextxy(500,450,'Please ENTER');
  readln;
  end;
Procedure F4;
var ufo1,ufo2:integer;
  begin
    randomize;
    setcolor(3);settextstyle(0,0,0);
    cleardevice;
     outtextxy(350,410,'Ha elfogy az Çleted meghalsz');
    outtextxy(400,432,'êlet:');
     setfillstyle(1,yellow);
     bar(440,432,448,442);
     bar(450,432,458,442);
     bar(460,432,468,442);
    outtextxy(500,450,'Please ENTER');readln;
    cleardevice;
    {v†ros}
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(2,428,19,400);
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
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(107,428,150,405);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(156,428,200,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(203,428,230,390);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(240,428,250,380);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(252,428,280,410);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(284,428,300,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(306,428,370,406);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(372,428,392,380);
        setfillstyle(1 ,red);
        circle(380,370,10);
        floodfill(380,370,3);
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
        bar(562,428,584,385);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(590,428,600,400);
        setfillstyle(random(12)+1 ,random(15)+1);
        bar(610,428,638,380);
      outtextxy(100,350,'A v†ros');
      outtextxy(300,350,'A radar torony, ha kilîvik -1 Çlet');
    outtextxy(500,450,'Please ENTER');readln;
    cleardevice;
     setcolor(3);circle(10,300,10); {A fîldi repîlîgÇp kinÇzete}
     setfillstyle(1,7);fillellipse(10,300,30,4);floodfill(10,300,3);
     outtextxy(30,280,'Fîldi UFO vad†sz');
     readln;
        ufo1:=500; ufo2:=250;
      ellipse(ufo1,ufo2,0,360,20,10);
      putpixel(ufo1+2,ufo2,yellow); line(ufo1,ufo2-5,ufo1,ufo2+5);
      outtextxy(450,200,'UFO ');
      readln;
      outtextxy(480,200,'bemÇrve');
      setcolor(3); outtextxy(ufo1+35,ufo2-36,'1');
      for i:=1 to 15 do line(ufo1+23,(ufo2-36)+(i*2),ufo1+33,(ufo2-36)+(i*2));
      setcolor(red);outtextxy(ufo1+35,ufo2-3,'2');
      for i:=1 to 5 do  line(ufo1+20,(ufo2-6)+(i*2),ufo1+33,(ufo2-6)+(i*2));
      setcolor(3); outtextxy(ufo1+35,ufo2+30,'3');
      for i:=1 to 15 do line(ufo1+23,(ufo2+4)+(i*2),ufo1+33,(ufo2+4)+(i*2));
    outtextxy(500,450,'Please ENTER');readln;
    cleardevice;
  end;

begin
  gd:=detect;
  filemode:=0;
  initgraph(gd,gm,'e:\tp\bgi');
  cleardevice;
  randomize;
  intro1;
  {F3;}
  repeat
      cleardevice;
      menukiir ;
	  ch := readkey ;
	  case ch of
	    '1' : F1;
	    '2' : F2;
	    '3' : F3;
            '4' : F4;
	  end ;
  until ch = #27 ;
  closegraph;
end.
