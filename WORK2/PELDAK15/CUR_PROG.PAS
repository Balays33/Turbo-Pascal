(*  cur_prog.pas   *)
program cur_p;

uses Crt,Graph,Dos,cursor;
const
      napok:array[0..6] of string[9]=('Vas†rnap','HÇtfì',
           'Kedd','Szerda','CsÅtîrtîk','PÇntek','Szombat');
      honap:array[1..12] of string[9]=('janu†r','febru†r',
            'm†rcius','†prilis','m†jus','j£nius','j£lius',
            'augusztus','szeptember','okt†ber','november',
            'december');
type
      tc   = array[1..5] of integer;
var
      ora,perc,mp,szmp,ev,hons,nap,szam:word;
      oras,percs,evs,naps:string[4];

      g_color     : tc;      { grafikus kÇpernyì sz°nei }

      x1,y1,x2,y2 : integer;
      mx,my       : integer;
      yy          : array[1..650] of integer;
      mm          : integer;
      cursor_dx   : integer;

procedure EGA_color;
begin
    g_color[1]:=WHITE;       { inform†ci¢ }
    g_color[2]:=BROWN;       { keret, csatornasz†m }
    g_color[3]:=LIGHTGREEN;  { gîrbe, csatorna }
    g_color[4]:=YELLOW;      { csatorna, egyÇb }
    g_color[5]:=LIGHTRED;
end;

procedure CGA_color;
begin
    g_color[1]:= 1;
    g_color[2]:= 1;
    g_color[3]:= 1;
    g_color[4]:= 1;
    g_color[5]:= 1;
end;

procedure graph_ini(var maxx,maxy:integer);
var GraphCode,GraphMode: integer;
begin
    detectgraph(GraphCode,GraphMode);
    Initgraph(GraphCode,GraphMode,'');
     if GraphResult <> grOk  then begin
                                   writeln('Hibas grafikus megnyitas');
                                   halt(1);
                                  end;
    maxx:=GetMaxX;
    maxy:=GetMaxY;
    case GraphCode of
     1   : begin
             CGA_color;
             GraphMode:=1;
           end;
     3   : begin
             EGA_color;
             GraphMode:=1;
           end;
     9   : begin
             EGA_color;
             GraphMode:=1;
           end;
     end;
end;

procedure frame_ini(var x1,y1,x2,y2,dx: integer; maxx,maxy:integer);
var   fx1,fx2,fy1,fy2,i : integer;
begin
   fx1:=60;      {  x koordin†ta kezdìpontja }
   fx2:=50;
   fy1:=40;      {  y koordin†ta kezdìpontja }
   fy2:=30;      {  az als¢ szîveg hossza    }
   {  x1,y1,x2,y2  a kÇpernyìablak a rajzol†s sz†m†ra  }
   x1:=fx1;
   y1:=fy1;
   x2:=maxx-fx2;
   y2:=maxy-fy2;
   dx:=20;       { a kurzor x ir†ny£ mozg†s†nak ÇrtÇke }

end;

procedure rajzol(xk,xv,dx,color: integer);
var ys1,ys2: integer;
    i,x     : integer;
begin
    setcolor(color);
    x:=xk+1;
    i:=1;
    yy[1]:=random(y2-y1-5);
    while (x<xv-dx) do
    begin
        yy[i+1]:=random(y2-y1-5);
        ys1:= y2 - yy[i];
        ys2:= y2 - yy[i+1];
        line(x,ys1,x+dx,ys2);
        x:=x+dx;
        i:=i+1;
    end;
end;

procedure frame(x1,y1,x2,y2,dx,maxx,maxy:integer);
begin
    setfillstyle(solidFill,BLACK);
    setcolor(g_color[5]);
    outtextxy(round((getmaxx-88)/2), 0, 'Cursor demo');
    setcolor(g_color[1]);
    outtextxy(60, maxy-10, ' -> jobbra   <- balra   Esc - kilÇpÇs');
    setviewport(0,0,maxx-1,maxy-1,true);
    setcolor(g_color[1]);
    getdate(ev,hons,nap,szam);
    str(ev,evs);str(nap,naps);
    outtextxy(x1,y1-10,'D†tum: '+evs+'. '+honap[hons]+' '+naps+'.');
    outtextxy(x1+200,y1-10,napok[szam]);
    gettime(ora,perc,mp,szmp);
    str(ora,oras);str(perc,percs);
    outtextxy(x1+280,y1-10,'Idì: '+oras+':'+percs);
    setcolor(g_color[2]);
    rectangle(x1, y1, x2, y2);
    rajzol(x1+1,x2,dx,g_color[3]);  { adatok †br†zol†sa }
end;

procedure adat_ki(w:word; x,y,maxx,maxy: integer);
var sz:string;
    k,i :integer;
begin
     setfillstyle(Emptyfill,Black);
     bar(x+2,y, x+12, y+80);
     if (maxy<300) then begin
        SetTextStyle(SmallFont,Horizdir,1);
        SetUserCharSize(14, 12, 14, 17);
        outtextxy(x+5,y-20,'Y');
        str(w:6,sz);
        k:=length(sz);
        for i:=1 to k do begin
          outtextxy(x+3,y+10+(i-1)*6,sz[i]);
        end;
        SetTextStyle(DefaultFont,Horizdir,1);
      end
      else
      begin
        outtextxy(x+3,y-10,'Y');
        str(w:6,sz);
        k:=length(sz);
        for i:=1 to k do begin
          outtextxy(x+3,y+2+(i-1)*8,sz[i]);
        end;
     end;
end;

procedure draw_cursor(x1,y1,x2,y2,dx,maxx,maxy:integer);
var
    h1  : integer;
    x,y :integer;
    j   : integer;
    key : char;
    cursor_color: integer;
begin
    cursor_color:=g_color[4]; { cursor szinÇnek be†ll°t†sa   }
    setviewport(0,0, maxx-1, maxy-1, clipon);
    j:=1;   { j adattîmb indexe, az elsì adat :  yy[1] }
    CurX := x1+1;
    CurY:=y1+(y2-y1-2) div 2;
    h1:=(y2-y1-2) div 2;

    putcursor(CursorP, CurX, CurY, h1,0,cursor_color);
    adat_ki(yy[j],x2,y1,maxx,maxy);

  repeat
    Key:=readkey;
    if ord(Key)=0 then Key:=readkey;
    case ord(Key) of
            75 : begin
                 if CurX>=x1+dx then begin
                     delcursor(CursorP, CurX, CurY,h1);
                     CurX := CurX - dx;
                     putcursor(CursorP, CurX, CurY,h1,1,cursor_color);
                     setcolor(g_color[4]);
                     j:=j-1;
                     adat_ki(yy[j],x2,y1,maxx,maxy);
                   end;
                 end;
            77 : begin
                   if CurX < x2-dx then begin
                     delcursor(CursorP, CurX, CurY,h1);
                     CurX := CurX + dx;
                     putcursor(CursorP, CurX, CurY,h1,0,cursor_color);
                     setcolor(g_color[1]);
                     j:=j+1;
                     adat_ki(yy[j],x2,y1,maxx,maxy);
                   end;
                 end;
    end;
  until Key=chr(27);  { Esc karaktert v†r }

  delcursor(CursorP, CurX, CurY,h1);
  setlinestyle(0,0,1);
  closegraph;
end;

begin
 graph_ini(mx,my);
 frame_ini(x1,y1,x2,y2,cursor_dx,mx,my);
 frame(x1,y1,x2,y2,cursor_dx,mx,my);
 draw_cursor(x1,y1,x2,y2,cursor_dx,mx,my);
end.
