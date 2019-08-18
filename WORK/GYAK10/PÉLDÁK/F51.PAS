program f51;

{ N‚h ny grafikus lehet“s‚g bemutat sa }
{ Kirchner Istv n el“ad s n            }

uses crt, graph;

const also_negyszog: array[1..4,1..2] of integer=
                     ((100,10),(285,100),(80,160),(150,100));
      felso_negyszog:array[1..4,1..2] of integer=
                     ((35,110),(190,15),(110,105),(175,170));
var g_driver, g_mode: integer;
    xw,yw,oldal,kezdo_oldal,betutipus,irany,meret,ox,oy,r: integer;
    ch: char;
    szoveg: string;

begin
    g_driver:=vga;
    g_mode:=vgahi;
    initgraph(g_driver,g_mode,'e:\tp\bgi');

    xw:=getmaxx div 2;
    yw:=getmaxy div 2;

    setcolor(yellow);
    line(xw,0,xw,getmaxy);
    line(0,yw,getmaxx,yw);

    setviewport(0,0,pred(xw),pred(yw),true);
    setcolor(white);
    if xw>yw then kezdo_oldal:=yw-10
	     else kezdo_oldal:=xw-10;
    moveto((xw-kezdo_oldal) div 2,(yw-kezdo_oldal) div 2);
    oldal:=kezdo_oldal;
    while oldal>=5 do
	begin
	linerel(oldal,0);
	linerel(0,oldal);
	linerel(-(oldal-3),0);
	linerel(0,-(oldal-3));
	oldal:=oldal-6;
	end;

    ch:=readkey; if ch=#0 then readkey;
{------------------------------------------------------------------------}
    setviewport(succ(xw),0,getmaxx,pred(yw),true);
    setcolor(lightgreen);
    szoveg:='saj t n‚v';
    betutipus:=4;
    irany:=0;
    meret:=0;
    repeat
       inc(meret);
       settextstyle(betutipus,irany,meret)
    until (textwidth(szoveg)>xw) or (textheight(szoveg)>yw) or (meret=11);
    settextstyle(betutipus,irany,pred(meret));
    settextjustify(1,1);
    outtextxy(xw div 2,yw div 2,szoveg);

    ch:=readkey;
    if ch=#0 then ch:=readkey;
{------------------------------------------------------------------------}

    setviewport(0,succ(yw),pred(xw),getmaxy,true);
    setcolor(red);
    setlinestyle(0,0,3);
    setfillstyle(11,blue);
    fillpoly(4,also_negyszog);

    setcolor(white);
    setlinestyle(1,0,0);
    setfillstyle(1,red);
    fillpoly(4,felso_negyszog);

    ch:=readkey;
    if ch=#0 then ch:=readkey;

{------------------------------------------------------------------------}
    setviewport(succ(xw),succ(yw),getmaxx,getmaxy,true);
    ox:=xw div 4;
    oy:=yw div 2;
    r:=xw div 4 -3;

    setcolor(lightmagenta);
    setlinestyle(0,0,0);
    setfillstyle(1,brown);
    pieslice(ox,oy,60,360,r);

    setfillstyle(1,blue);
    pieslice(ox,oy,0,60,r);

    setcolor(cyan);
    setfillstyle(8,green);
    bar3d(xw div 2 +5,15,xw-20,yw-5,15,true);

    setfillstyle(3,yellow);
    floodfill(xw div 2+10,13,cyan);
    floodfill(xw-13,yw-12,cyan);

    ch:=readkey;
    if ch=#0 then ch:=readkey;

    closegraph;

end.
