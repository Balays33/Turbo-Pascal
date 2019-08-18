(* ferdehaj.pas *)
{$N+,E+}

{ 40 karakteres sz”veges m¢d haszn lata }
{ a ferdehaj¡t s grafikus megjelen¡t‚se hanghat ssal }

program FerdeHajitasVGA;

uses crt, dos, graph;
{$L EGAVGA.OBJ}              { az object formatum£ EGAVGA }

procedure EGAVGA; EXTERNAL;  { vez‚rl“ beszerkeszt‚se }
const
    g=9.81;
    ESC=#27;
var
  tav,tavadott,szogfok,szog,seb,szaz,h,d,x,yd:real;
  gd,gm,tavd,i,y,kod:integer;
  x1,y1,x2,y2:integer;
  s:string[10];
  sz:string;
  ch:char;

begin
 repeat
  DetectGraph(gd, gm);
  if not (Gd in [VGA, EGA]) then halt;
  gm:=EGAHI; {VGAMED}
  clrscr;
  textmode(CO40);
  textcolor(YELLOW);
  gotoxy(13,5);
  write('Ferde hajit s');
  gotoxy(13,6);
  write('-------------');
  textcolor(RED);
  repeat
    gotoxy(1,8);
    delline;
    write('T vols g   [m] : ');
    readln(sz);
    val(sz,tavadott,kod);
  until (tavadott>0) and (kod=0);
  textcolor(GREEN);
  repeat
    gotoxy(1,10);
    delline;
    write('Sz”g     [fok] : ');
    readln(sz);
    val(sz,szogfok,kod);
  until (szogfok>0) and (szogfok<90) and (kod=0);
  repeat
    gotoxy(1,11);
    delline;
    write('Sebess‚g [m/s] : ');
    readln(sz);
    val(sz,seb,kod);
  until seb>0;
  szog:=szogfok*pi/180;
  tav:=sqr(seb)*sin(2*szog)/g;
  szaz:=300*tav/tavadott-300;

 { grafikus m¢d megnyit sa }
 if RegisterBGIDriver(@EGAVGA) < 0 then     { EGAVGA vez‚rl“ }
  begin
   writeln('Nem sikerlt be‚p¡teni a EGAVGA.BGI file-t ');
   halt(1);
  end;

  y1:=300;
  initgraph(gd,gm,'');
  if graphresult <> grOk then
                         begin
                          writeln('Grafika nyit si hiba');
                          halt(1);
                         end;
  setbkcolor(BLACK);
  cleardevice;
  setcolor(RED);
  outtextxy(10,10,'Ferde haj¡t s');
  setcolor(GREEN);
  str(tavadott:10:2,s);
  outtextxy(10,30,'T vols g:'+s+' m');
  setcolor(YELLOW);
  str(tav:10:2,s);
  outtextxy(378,20,'Dob s t vols ga: ');
  outtextxy(500,20,s+' m');
  str(szogfok:10:2,s);
  outtextxy(378,40,'Sz”g: ');
  outtextxy(500,40,s+' fok');
  str(seb:10:2,s);
  outtextxy(378,60,'Sebess‚g: ');
  outtextxy(500,60,s+' m/s');
  str(szaz:10:2,s);
  outtextxy(378,80,'T vols g elt‚r‚s: ');
  outtextxy(500,80,s+' %');
  setcolor(MAGENTA);
  outtextxy(378,100,'Tov bb: ENTER');
  setcolor(LIGHTCYAN);
  outtextxy(378,120,'V‚ge  : ESC  ');
  if tavadott>tav then d:=tavadott/370
                  else d:=tav/370;
  h:=sqr(seb)*sqr(sin(szog))/(2*g);
  h:=h/370;
  if h>d then d:=h;
  tavd:=round(tav/d);
  setcolor(YELLOW);
  line(0,y1,tavd,y1);
  setcolor(GREEN);
  line(0,y1,round(tavadott/d),y1);
  for i:=0 to tavd do
    begin
      x:=i*d;
      yd:=sqr(x)*g/(2*sqr(seb)*sqr(cos(szog)));
      y:=round((x*sin(szog)/cos(szog)-yd)/d);
      putpixel(i,y1-y,RED);
      if i<(tavd/2) then begin sound(i*210); delay(5); end
                    else begin sound((tavd-i)*210); delay(5) end;
    end;
  nosound;
    ch:=ReadKey;
    if not (ch in [ESC]) then closegraph;
 until ch = ESC;
 closegraph;
 textmode(CO80);
end.