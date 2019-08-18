Program rex;
Uses Graph,crt;
const ngolyo=5;
      nlyuk=8;
      vmin=5;
      playermax=6;
type gtip=record
          x,y,v,arcv,a,arca:real;
          van:boolean;
          end;
     ltip=record
          x,y:integer;
          ertek:byte;
          end;
var i,j,k,l,gd,gm          : integer;
    x0,y0,xmax,ymax,r,rl   : integer;
    size                   : integer;
    pasztal,pgolyo         : array [1..ngolyo] of pointer;
    asztx,aszty            : array [1..ngolyo] of integer;
    golyo                  : array [1..ngolyo] of gtip;
    lyuk                   : array [1..nlyuk] of ltip;
    gombakord              : array [1..2] of integer;
    dt                     : real;
    ures                   : gtip;
    vangolyo,vege,mozog,erv1,erv2 : boolean;
    pont                   : array [1..playermax] of integer;
    szumma,pontszam        : integer;
    player,playernum       : byte;
    zold,piros,sarga,feher,hatter : byte;
    utk                    : array [1..ngolyo,1..ngolyo] of boolean;
    ch                     : char;


Procedure Szinek;             {Szinek beallitasa}
begin
    hatter:=0;
    case gd of
            7: begin           {Hercules}
               zold:=white;
               piros:=black;
               sarga:=white;
               feher:=white;
               end;
          3,9: begin           {EGA,VGA}
               zold:=green;
               piros:=red;
               sarga:=yellow;
               feher:=white;
               end;
            1: begin           {CGA}
               zold:=1;
               piros:=2;
               sarga:=3;
               feher:=3;
               end;
    end;
end;


Procedure GrafInit;            {Grafikus kepernyo inicializalasa}
begin
    DetectGraph(gd,gm);
    if gd=1 then gm:=0;
    InitGraph(gd,gm,'e:\tp\bgi');
            {A .BGI file-nak abban az alkonyvtarban kell lenni,}
            {ahonnan a programot elinditjuk}

    ClearDevice;
    Szinek;
end;


Function strg(x:integer):string;          {Seged eljarasok}
var s:string;
begin
    str(x,s);
    strg:=s;
end;

Function sinus(x:real):real;
begin
    sinus:=sin(pi*x/180);
end;

Function Cosinus(x:real):real;
begin
    cosinus:=cos(pi*x/180);
end;

Function Arcus(x,y:real):real;       {Irany meghatarozasa}
var szog:real;
begin
    if (x=0) and (y=0) then Arcus:=0 else begin
       if abs(x)<=abs(y) then szog:=ArcTan( abs(x)/( sqrt( sqr(x) +sqr(y) ) ) )
                         else szog:=90-ArcTan(abs(y)/(sqrt(sqr(x)+sqr(y))));
       if (x>=0) and (y>=0) then arcus:=180/pi*szog;
       if (x>=0) and (y<0) then arcus:=180/pi*(pi-szog);
       if (x<0) and (y>=0) then arcus:=180/pi*(-szog);
       if (x<0) and (y<0) then arcus:=180/pi*(szog-pi);
    end;
end;


Procedure Asztalrajz;                   {Az asztal kirajzolasa}
var x1,x2,y1,y2,d:integer;

procedure LukRajz(i,x,y,ert:integer);   {Belso eljaras a lyuk felrajzolasara}
begin
    SetColor(Hatter);
    PieSlice(x,y,0,360,y1 div 3);
    SetColor(Feher);
    Circle(x,y,y1 div 3);
    Lyuk[i].x:=x-x0;
    Lyuk[i].y:=y-y0;
    Lyuk[i].ertek:=ert;
    SetTextStyle(0,0,1);
    SetTextJustify(1,0);
    OutTextXY(x,y-r-3,strg(ert));

end;

begin
    SetBkColor(Hatter);
    SetColor(Sarga);
    y1:=GetMaxY div 10;       {Meretek beallitasa}
    y2:=9*y1;
    x1:=(GetMaxX div 2)-4*y1;
    x2:=(GetMaxX div 2)+4*y1;
    x0:=x1;y0:=y1;
    xmax:=x2-x1;ymax:=y2-y1;
    r:=y1 div 3-2;rl:=y1 div 3;
    SetFillStyle(1,sarga);       {Asztal felrajzolasa,kiszinezese}
    Bar(x1-2,y1-2,x2+2,y2+2);
    if gd=7 then SetFillStyle(9,zold) else SetFillStyle(1,zold);
    Bar(x1,y1,x2,y2);
    SetFillStyle(1,hatter);
    d:=(x2-x1) div 11;
    For i:=-2 to 2 do            {Lyukak felrajzolasa}
        LukRajz(i+3,GetMaxX div 2+2*i*d,2*y1,30-10*abs(i));
    LukRajz(6,GetMaxX div 2,2*y1+trunc(2.5*d),100);
    LukRajz(7,GetMaxX div 2+4*d,2*y1+4*d,50);
    LukRajz(8,GetMaxX div 2-4*d,2*y1+4*d,50);
    SetColor(piros);             {Gomba kirajzolasa}
    SetFillStyle(1,feher);
    GombaKord[1]:=GetMaxX div 2-x0;
    GombaKord[2]:=2*y1+5*d-y0;
    PieSlice(GombaKord[1]+x0,GombaKord[2]+y0,0,360,y1 div 6);
    SetColor(piros);
    MoveTo(GombaKord[1]+x0,GombaKord[2]+y0);
    LineRel(0,y1 div 6);LineRel(0,-y1 div 3);LineRel(0,y1 div 6);
    Linerel(y1 div 6,0);LineRel(-y1 div 3,0);
    SetColor(feher);
end;


Procedure Golyorajz;       {Golyo kepenek elkeszitese es elhelyezese a Heap-ban}
var i:integer;
begin
    size:=ImageSize(0,0,2*r,2*r);  {Helyfoglalas a Heap-ben}
    for i:=1 to ngolyo do begin
        GetMem(pgolyo[i],size+4);
        GetMem(pasztal[i],size+4);
    end;
    if gd=7 then SetFillStyle(9,zold) else SetFillStyle(1,zold);
    Bar(2*r,2*r,6*r,6*r);          {Feher golyo}
    SetColor(feher);
    SetFillStyle(1,feher);
    PieSlice(4*r,4*r,0,360,r);
    Circle(4*r,4*r,r);
    Circle(4*r,4*r,r-1);
    for i:=2 to ngolyo do
        GetImage(3*r,3*r,5*r,5*r,pgolyo[i]^);  {Golyo elmentese a Heap-be}
    SetColor(Black);
    if gd=7 then SetFillStyle(1,hatter) else SetFillStyle(1,piros); {Piros golyo}
    PieSlice(4*r,4*r,0,360,r*3 div 4);
    GetImage(3*r,3*r,5*r,5*r,pgolyo[1]^);
    SetViewPort(0,0,x0-2,ymax+y0-2,ClipOff);
    ClearViewPort;
    SetViewPort(0,0,GetMaxX,GetMaxY,ClipOff);
end;


Procedure Kitesz(i:integer;xbe,ybe:real);    {Golyo kirajzolasa az asztalra}
var x,y:integer;
begin
    if (xbe>0) and (ybe>0) then begin
       golyo[i].x:=xbe;
       golyo[i].y:=ybe;
       x:=round(xbe);
       y:=Round(ybe);
       Asztx[i]:=x;      {Golyo alatti terulet visszamentesi}
       Aszty[i]:=y;      {koordinatainak elmentese}
       x:=x0+x;
       y:=y0+y;
       GetImage(x-r,y-r,x+r,y+r,pasztal[i]^);  {Golyo alatti terulet elmentese}
       putImage(x-r,y-r,pgolyo[i]^,normalput); {Golyo kepenek kirajzolasa a Heap-bol}
       Golyo[i].van:=true;
    end;
end;


Procedure Levesz(i:integer);   {Golyo levetele az asztalrol}
var x1,y1:integer;
begin
    x1:=x0+asztx[i];
    y1:=y0+aszty[i];
    PutImage(x1-r,y1-r,pasztal[i]^,normalput);  {Az asztal kepenek visszamentese}
    Golyo[i].van:=false;
end;


Procedure dako(i:integer;var v,s:real);     {Golyo kezdosebessegenek es a}
var d,szog      : integer;                  {sebesseg iranyanak beallitasa}
    x1,y1,x2,y2 : integer;
    xa,ya,xb,yb : integer;
    pd,p        : pointer;
    ch          : char;
begin
    d:=r;
    szog:=-180;
    Repeat
         x1:=Round(golyo[i].x-sinus(szog)*d)+x0;  {A dako vegpontjainak meghatarozasa}
         y1:=Round(golyo[i].y-cosinus(szog)*d)+y0;
         x2:=Round(golyo[i].x-sinus(szog)*(d+5*r))+x0;
         y2:=Round(golyo[i].y-cosinus(szog)*(d+5*r))+y0;
         if x1<x2 then begin                      {A dako altal kijelolt negyszog}
                        xa:=x1;xb:=x2;            {bal felso es jobb also sarka}
                       end
                  else begin
                        xa:=x2;xb:=x1;
                       end;
         if y1<y2 then begin
                        ya:=y1;yb:=y2;
                       end
                  else begin
                        ya:=y2;yb:=y1;
                       end;
         Mark(p);                             {A HeapPtr megorzese}
         GetMem(pd,ImageSize(xa,ya,xb,yb)+4); {A dako altal kijelolt}
         GetImage(xa,ya,xb,yb,pd^);           {negyszog elmentese a Heap-be}
         SetColor(feher);                     {A dako kirajzolasa}
         MoveTo(x1,y1);
         LineTo(x2,y2);
         ch:=ReadKey;
         case ch of                           {A dako mozgatasa}
              #0 : begin
                    ch:=ReadKey;
                    case ch of
                         #77 : if szog<180 then szog:=szog+1 else szog:=-179;
                         #75 : if szog>-179 then szog:=szog-1 else szog:=180;
                         #80 : if {(y2<GetMaxY-1) and} (d<32+r) then d:=d+1;
                         #72 : if d>r then d:=d-1;
                    end;
                   end;
             #27 : begin
                    CloseGraph;
                    Halt(0);
                   end;
         end;
         PutImage(xa,ya,pd^,normalput);       {A dako alatti terulet visszamentese}
         Release(pd);                         {A Heap helyreallitasa}
    Until (ch=#13) and (d>r+1);
    v:=2.5*(d-r);
    s:=szog;
end;


procedure lok(i:integer);                     {A golyo ellokese}
var v,s : Real;
begin
    dako(i,v,s);
    Sound(520);
    Delay(2);
    Golyo[i].v:=v;
    Golyo[i].arcv:=s;
    NoSound;
end;


Procedure helyzet;            {A golyo helyzetenek meghatarozasa}
var i:integer;
    vx,vy:real;
begin
    mozog:=false;
    for i:=1 to ngolyo do
        with golyo[i] do begin
             x:=x+v*sinus(arcv)*dt+a*sinus(arca)/2*sqr(dt);      {Uj koordinatak}
             y:=y+v*cosinus(arcv)*dt+a*cosinus(arca)/2*sqr(dt);
             if a<>0 then begin
                vx:=v*sinus(arcv)+a*sinus(arca)*dt;              {Uj irany}
                vy:=v*cosinus(arcv)+a*cosinus(arca)*dt;
                v:=sqrt(sqr(vx)+sqr(vy));
                if v>0 then arcv:=arcus(vx,vy);
                a:=0;
                arca:=0;
             end;
             if (x<=r) and (v>0) then begin                      {Falnak utkozes}
                                       arcv:=-arcv;
                                       x:=r;
                                      end;
             if x>=(xmax-r) then begin
                                  arcv:=-arcv;
                                  x:=xmax-r;
                                 end;
             if (y<=r) and (v>0) then begin
                           if arcv>=0 then arcv:=180-arcv
                                      else arcv:=-180-arcv;
                           y:=r;
                          end;
             if y>=(ymax-r) then begin
                                  if arcv>=0 then arcv:=180-arcv
                                             else arcv:=-180-arcv;
                                  y:=ymax-r;
                                 end;
        v:=0.999*v-0.2;                {Lassulas figyelembevetele}
        if v<vmin then v:=0;
        if v<>0 then mozog:=true;
        end;
end;


Function utkozes1(i,j:integer):boolean;    {Ket golyo osszeutkozese}
var d,x1,x2,y1,y2 :real;
begin
  if (golyo[i].x>0) and (golyo[j].x>0) then begin
    d:=sqrt(sqr(golyo[i].x-golyo[j].x)+sqr(golyo[i].y-golyo[j].y));
    utkozes1:= d<=(2*r);
  end else utkozes1:=false;
end;


Function beesik(i,j:integer):boolean;    {Golyo lyukba esese}
var d:real;
Function utkozes2(i,j:integer):boolean;
begin
    utkozes2:=false;
    if d<=rl  then begin
              if (rl-d)<=r then begin    {A golyo a lyukba esik, vagy csak iranyt valtoztat}
                           golyo[i].a:=(rl-d)/r*9.81;
                           if d>0 then golyo[i].arca:=arcus(golyo[i].x-lyuk[j].x,golyo[i].y-lyuk[j].y);
              end;
              utkozes2:=true;
    end;
end;
begin
    d:=sqrt(sqr(golyo[i].x-lyuk[j].x)+sqr(golyo[i].y-lyuk[j].y));
    beesik:=false;
    if utkozes2(i,j) then begin
                     if d>0 then begin
                                 if sqr(golyo[i].v)/d >golyo[i].a then begin
                                                                       beesik:=true;
                                                                       golyo[i]:=ures;
                                                                  end;
                                 end
                            else begin
                                 beesik:=true;
                                 golyo[i]:=ures;
                            end;
    end;
end;


procedure sebesseg(i,j:integer);       {Golyok sebessege utkozes utan}
var sinbeta,cosbeta:real;
    dv,vx,vy:real;
begin
    sinbeta:=(golyo[j].x-golyo[i].x)/2/r;  {Sebessegvaltozas iranya}
    cosbeta:=(golyo[j].y-golyo[i].y)/2/r;
    with golyo[j] do
         dv:=v*(sinus(arcv)*sinbeta+cosinus(arcv)*cosbeta);  {Sebessegvaltozas nagysaga}
    with golyo[i] do
         dv:=v*(sinus(arcv)*sinbeta+cosinus(arcv)*cosbeta)-dv;
    if dv>0 then begin
       Sound(480);
       With golyo[i] do begin                   {Uj sebesseg}
            vx:=v*sinus(arcv)-dv*sinbeta;
            vy:=v*cosinus(arcv)-dv*cosbeta;
            v:=sqrt(sqr(vx)+sqr(vy));
            if v<vmin then v:=vmin;
            arcv:=arcus(vx,vy);
       NoSound;
       end;
       With golyo[j] do begin
            vx:=v*sinus(arcv)+dv*sinbeta;
            vy:=v*cosinus(arcv)+dv*cosbeta;
            v:=sqrt(sqr(vx)+sqr(vy));
            if v<vmin then v:=vmin;
            arcv:=arcus(vx,vy);
       end;
    end;
end;


Function Gomba:Boolean;        {Gombaval valo utkozes figyelese}
var i:integer;
    d:real;
begin
    Gomba:=False;
    for i:=1 to ngolyo do begin
                           With golyo[i] do
                                d:=sqr(x-gombakord[1])+sqr(y-gombakord[2]);
                           if d<sqr(r) then Gomba:=true;
                          end;
end;


Procedure Felirat(pl,sz : integer);   {Pontszam es jatekos kiirasa}
begin
      if gd=1 then SetTextStyle(0,0,1) else SetTextStyle(1,0,3);
      SetColor(feher);
      SetViewPort(0,0,GetMaxx,y0-2,ClipOff);
      ClearViewPort;
      SetTextJustify(1,2);
      OutTextXY(GetMaxX div 2,1,strg(pl)+'. j t‚kos');
      SetViewPort(0,y0+ymax+2,GetMaxx,GetMaxY,ClipOff);
      ClearViewPort;
      SetTextJustify(0,2);
      OutTextXY(1,1,strg(pont[1]));
      SetTextJustify(1,2);
      OutTextXY(GetMaxX div 2,1,strg(sz));
      SetTextJustify(2,2);
      OutTextXY(GetMaxX-1,1,strg(pont[2]));
      SetViewPort(0,0,GetMaxX,GetMaxY,ClipOff);
end;


Procedure Ujgolyo(var i:integer);     {Uj golyo kitetele}
var szabad:boolean;
    j,d   :integer;
begin
      i:=0;
      vangolyo:=false;
      for j:=ngolyo downto 1 do              {Van golyo az asztalon?}
          if golyo[j].x<0 then i:=j else vangolyo:=true;

      if i=0 then begin             {Az osszes golyo az asztalon van}
         i:=1;
         for j:=2 to ngolyo do
             if golyo[j].y>golyo[i].y then i:=j;     {A leghatso golyo kivalasztasa}
         levesz(i);
      end;
      if not vangolyo then begin   {Szukseg szerinti masodik golyo kirakasa}
                            kitesz(2,xmax div 2,ymax-6*r);
                            i:=1;
                           end;
      Golyo[i].x:=xmax div 2;      {Ures hely figyelese az uj golyo kirakasahoz}
      Golyo[i].y:=ymax-2*r;
      d:=1;
      Repeat
           Szabad:=True;
           for j:=1 to ngolyo do
               if j<>i then begin
                             if utkozes1(i,j) then Szabad:=false;
                            end;
           if not szabad then Golyo[i].y:=Golyo[i].y+d;
           if Golyo[i].y>=ymax-r then d:=-1;
      until szabad;
      kitesz(i,Golyo[i].x,Golyo[i].y);
end;


procedure eredmeny(i:integer);        {Eredmeny kiirasa a jatek befejezesekor}
begin
      if gd=1 then SetTextStyle(0,0,1) else SetTextStyle(1,0,3);
      SetColor(feher);
      SetViewPort(0,0,GetMaxx,y0-2,ClipOff);
      ClearViewPort;
      SetTextJustify(1,2);
      OutTextXY(GetMaxX div 2,1,'a '+strg(i)+'. j t‚kos nyert');
      SetViewPort(0,y0+ymax+2,GetMaxx,GetMaxY,ClipOff);
      ClearViewPort;
      SetTextJustify(0,2);
      OutTextXY(1,1,strg(pont[1]));
      SetTextJustify(1,2);
      OutTextXY(GetMaxX div 2,1,'£j j t‚k I/N');
      SetTextJustify(2,2);
      OutTextXY(GetMaxX-1,1,strg(pont[2]));
      SetViewPort(0,0,GetMaxX,GetMaxY,ClipOff);
      SetTextJustify(1,1);
      OutTextXY(GetMaxX div 2,GetMaxY div 2,'V‚ge');
end;


begin
Repeat
  vege:=false;          {Kezdoertekek beallitasa}
  szumma:=0;
  playernum:=2;
  dt:=0.1;
  szumma:=0;
  player:=1;
  for i:=1 to playernum do
      pont[i]:=0;
  with ures do begin
       x:=-10;y:=-10;v:=0;arcv:=0;a:=0;arca:=0;van:=false;
       end;
  for i:=1 to ngolyo do golyo[i]:=ures;
  GrafInit;
  Asztalrajz;                           {Kiindulo rajz};
  Golyorajz;
  Felirat(player,szumma);
  kitesz(1,xmax div 2,ymax-2*r);        {Kezdoallas}
  kitesz(2,xmax div 2,ymax-6*r);
  lok(1);
  Repeat
   Repeat
    erv1:=false;erv2:=false;            {Ervenyes lokes illetve lyukba eso golyot jelzo ertekek}
    Repeat
      for i:=1 to ngolyo do
          for j:=i+1 to ngolyo do
              if utkozes1(i,j) then begin    {Utkozes hatasa}
                          sebesseg(i,j);
                          erv1:=true;
                          end;
      for i:=1 to ngolyo do
          for j:=1 to nlyuk do
              if beesik(i,j) then begin        {Lyukba eso golyo lekezelese}
                                  Sound(440);
                                  if i=1 then szumma:=szumma+lyuk[j].ertek*2 else szumma:=szumma+lyuk[j].ertek;
                                  erv2:=true;
                                  levesz(i);
                                  NoSound;
                                  Felirat(player,szumma);
              end;
      helyzet;
      if Gomba then begin               {Gomba feldontes lekezelese}
                     szumma:=0;
                     for i:=1 to ngolyo do Golyo[i]:=ures;
                     erv1:=false;erv2:=false;mozog:=false;
                     pont[player]:=0;
                    end;
      for i:=ngolyo downto 1 do begin
          if golyo[i].v<>0 then           {Mozgo golyok kepenek torlese}
             levesz(i);
          for j:=i-1 downto 1 do
              if utkozes1(i,j) then
                 levesz(i);
      end;
      for i:=1 to ngolyo do
          if (golyo[i].x>0) and not golyo[i].van then   {Golyok visszarajzolasa}
             kitesz(i,golyo[i].x,golyo[i].y);
    until not mozog;

      AsztalRajz;               {Kepernyo felfrissitese}
      for i:=1 to ngolyo do
             kitesz(i,golyo[i].x,golyo[i].y);
      if not erv1 then szumma:=0;
      UjGolyo(i);
      if not erv1 or not erv2 then begin         {Pontszamok es jatekos atirasa}
                                   pont[player]:=pont[player]+szumma;
                                   if pont[player]>=1000 then vege:=true else begin
                                     inc(player);
                                     if player>playernum then player:=1;
                                   end;
                                   szumma:=0;
                                  end;
      Felirat(player,szumma);
      if not vege then lok(i);
   until not erv2 or not erv1;
  until vege;
 Eredmeny(player);
 Repeat
  ch:=ReadKey;                                  {Uj jatek felajanlasa}
 Until (UpCase(ch)='I') or (UpCase(ch)='N');
 CloseGraph;
Until UpCase(ch)='N';
end.