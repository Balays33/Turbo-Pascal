(* gpld.pas *)
program Turbo_Pascal_grafika;
uses crt,graph;  { A GRAPH unit szÅksÇges a grafika haszn†lat†hoz! }
var GraphDriver, GraphMode,
    ErrorCode, x, y :integer;

begin
 { A grafika bekapcsol†sa automatikus hardver Çs m¢d detekt†l†ssal }
 detectgraph(GraphDriver,GraphMode);
 initgraph(GraphDriver,GraphMode,'');

 { Ha nem sikerÅlt bekapcsolni a grafik†t kilÇpÇs a programb¢l }
 ErrorCode := GraphResult;
 if ErrorCode <> grOK then
    begin
      WriteLn('Grafika hiba:');
      WriteLn(GraphErrorMsg(ErrorCode));
      Halt(1);
    end;

 { A rajzol†si lÇpÇsek }

 setbkcolor(white);

 setcolor(blue);
 x:=0;   y:=getmaxy;
 repeat
    line(0,0,x,y);
    inc(x,10);
 until x>getmaxx;

 setcolor(green);
 x:=getmaxx;  y:=0;
 repeat
   line(getmaxx,getmaxy,x,y);
   dec(x,10);
 until x<0;

 setcolor(red);
 rectangle(  getmaxx div 4,  getmaxy div 4,
           3*getmaxx div 4,3*getmaxy div 4);

 setfillstyle(solidfill,yellow);
 floodfill(getmaxx div 2, getmaxy div 2,red);

 settextstyle(triplexfont,horizdir,4);
 outtextxy(  getmaxx div 4, getmaxy div 4,'    Turbo Pascal');

 settextstyle(triplexfont,vertdir,3);
 outtextxy(getmaxx div 4, getmaxy div 4,'Grafika');

 circle(getmaxx div 2, getmaxy div 2,60);
 arc(getmaxx div 2 -30 ,getmaxy div 2,180,0,30);
 arc(getmaxx div 2 +30 ,getmaxy div 2,0,180,30);
 setfillstyle(solidfill,blue);
 floodfill(getmaxx div 2-30, getmaxy div 2,red);
 setfillstyle(solidfill,green);
 floodfill(getmaxx div 2+30, getmaxy div 2,red);

 delay(2500);

 { A grafika kikapcsol†sa Çs a szîveges Åzemm¢d vissza†ll°t†sa}
 closegraph;
 restorecrtmode;
end.


