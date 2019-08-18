program szamkirako;
uses  Crt,Dos;

const xnr=4;
      ynr=4;
type kocka=record
           ertek,szin:byte;
     end;
var tabla       : array [1..xnr,1..ynr] of kocka;
    i           : byte;
    sarga,piros : byte;
    t0,jido     : longint;
    ures        : array [1..2] of byte;
    lepes       : word;
    ch          : char;


Function KezdoIdo:longint;         {A kezdeti idopont}
var h,min,sec,msec :word;
begin
    GetTime(h,min,sec,msec);
    KezdoIdo:=h*3600+min*60+sec;
end;


Procedure idoablak(x0,y0:byte);    {A kezdeti ido ota eltelt ido kiirasa}
var h,min,sec,msec:word;
    ido:longint;
begin
    GetTime(h,min,sec,msec);
    ido:=3600*h+60*min+sec-t0;
    if ido<0 then ido:=ido+86400;   {A 24 ora - 0 ora valtas figyelese}
    if ido>jido then begin
       window(x0,y0,x0+10,y0);
       ClrScr;
       GoToXY(1,1);
       h:=ido div 3600;
       min:=(ido mod 3600) div 60;
       sec:=ido mod 60;
       Write(h:2,':',min:2,':',sec:2);
    end;
    jido:=ido;
end;


procedure vonal(c:char;x0,y0,size:word;vizszintes:boolean);    {Adott karakterekbol allo}
var i,j:word;                                                  {adott kezdopontu es hosszusagu vonal}
begin
     case vizszintes of
          true : begin
                 GoToXY(x0,y0);
                 for i:=0 to size do
                     Write(c);
                 end;
          false: begin
                 for i:=0 to size do begin
                     GoToXY(x0,y0+i);
                     Write(c);
                 end;
                 end;
     end;
end;


procedure keret(x0,y0,xsize,ysize,xnum,ynum:word);  {Adott kezdopontu, mezoszamu es meretu keret}
var i,j:integer;
begin
    Window(x0-1,y0-1,x0+xsize*xnum+1,y0+ysize*ynum+1);
    ClrScr;
    vonal('Í',2,2,xnum*xsize,true);
    vonal('Í',2,2+ynum*ysize,xnum*xsize,true);
    vonal('º',2,2,ynum*ysize,false);
    vonal('º',2+xnum*xsize,2,ynum*ysize,false);
    for i:=1 to ynum-1 do begin
        vonal('Ä',2,2+i*ysize,xnum*xsize,true);
        GoToXY(2,2+i*ysize);
        Write('Ç');
        GoToXY(2+xnum*xsize,2+i*ysize);
        Write('¶');
    end;
    for i:=1 to xnum-1 do begin
        vonal('³',2+i*xsize,2,ynum*ysize,false);
        for j:=1 to ynum-1 do begin
            GoToXY(2+i*xsize,2+j*ysize);
            Write('Å');
        end;
        GoToXY(2+i*xsize,2);
        Write('Ñ');
        GoToXY(2+i*xsize,2+ynum*ysize);
        Write('Ï');
   end;
   GoToXY(2,2);
   Write('É');
   GoToXY(2,2+ynum*ysize);
   Write('È');
   GoToXY(2+xnum*xsize,2);
   Write('»');
   GoToXY(2+xnum*xsize,2+ynum*ysize);
   Write('¼');
   Window(0,0,80,25);
end;


Procedure kitolt;           {A tabla kitoltese}
var i,j: word;
begin
    for j:=1 to ynr do
        for i:=1 to xnr do
            with tabla[i,j] do begin
            ertek:=(j-1)*xnr+i;
            if (i mod 2) = (j mod 2) then szin:=7 else szin:=red;
        end;
    tabla[xnr,ynr].szin:=blue;
    TextColor(sarga);
    for j:=1 to ynr do
        for i:=1 to xnr do begin
            Window(21+(i-1)*5,6+(j-1)*4,19+i*5,4+j*4);
            TextBackGround(tabla[i,j].szin);
            ClrScr;
            GoToXY(2,2);
            if tabla[i,j].ertek<16 then Write(tabla[i,j].ertek) else write('  ');
        end;
        ures[1]:=xnr;ures[2]:=ynr;
end;


procedure felcserel(x1,y1,x2,y2:byte); {A tabla ket mezojenek felcserelese}
var tmp:kocka;
begin
     tmp:=tabla[x1,y1];
     tabla[x1,y1]:=tabla[x2,y2];
     tabla[x2,y2]:=tmp;
            TextColor(sarga);                 {A ket felcserelt mezo visszarajzolasa}
            Window(21+(x2-1)*5,6+(y2-1)*4,19+x2*5,4+y2*4);
            TextBackGround(tabla[x2,y2].szin);
            ClrScr;
            GoToXY(2,2);
            if tabla[x2,y2].ertek<16 then Write(tabla[x2,y2].ertek) else write('  ');
            Window(21+(x1-1)*5,6+(y1-1)*4,19+x1*5,4+y1*4);
            TextBackGround(tabla[x1,y1].szin);
            ClrScr;
            GoToXY(2,2);
            if tabla[x1,y1].ertek<16 then Write(tabla[x1,y1].ertek) else write('  ');
     ures[1]:=x2;
     ures[2]:=y2;
end;


Procedure Cserel(var irany:byte);   {A felcserelendo mezok kivalasztasa}
begin
    case irany of
         1: if ures[2]>1 then
               felcserel(ures[1],ures[2],ures[1],ures[2]-1);
         2: if ures[2]<ynr then
               felcserel(ures[1],ures[2],ures[1],ures[2]+1);
         3: if ures[1]>1 then
               felcserel(ures[1],ures[2],ures[1]-1,ures[2]);
         4: if ures[1]<xnr then
               felcserel(ures[1],ures[2],ures[1]+1,ures[2]);
    end;
end;


function irany:byte;     {A klaviatura figyelese}
begin
     repeat
     IdoAblak(50,24);
     until KeyPressed;
          ch:=readKey;
          if ch=#0 then begin
                  ch:=ReadKey;
                  case ch of
                          #80: irany:=1;
                          #72: irany:=2;
                          #77: irany:=3;
                          #75: irany:=4;
                  end;
          end else if ch=#27 then halt(0);
end;


Function vege:boolean;    {A tabla ellenorzese}
var i,j:byte;
begin
          vege:=true;
          for j:=1 to ynr do
              for i:=1 to xnr do
                  if tabla[i,j].ertek<>(j-1)*xnr+i then vege:=false;
end;


Function eredmeny(lepes:word;ido:longint):boolean;   {Az eredmeny kiirasa}
var ch:char;
begin
     ClrScr;
     TextBackGround(piros);
     keret(10,10,60,5,1,1);
     Window(10,10,70,15);
     GoToXY(19,2);
     Write('Gratul lok, a feladatot');
     GoToXY(18,3);
     Write(lepes-1:3,' l‚p‚sben ');
     Write(ido div 3600:2,':',(ido mod 3600) div 60:2,':',ido mod 60:2,' id“');
     GoToXY(21,4);
     Write('alatt oldottad meg');
     GoToXY(22,5);
     Write('J tszol m‚g (i/n)');      {Uj jatek felajanlasa}
     Repeat
           ch:=ReadKey;
     until (UpCase(ch)='I') or (UpCase(ch)='N');
     eredmeny:=UpCase(ch)='I';
end;



begin
     if LastMode=7 then begin            {Inicializalas}
                         sarga:=0;
                         piros:=7;
                        end
                   else begin
                         sarga:=yellow;
                         piros:=red;
                        end;
     Repeat
     Window(1,1,80,25);
     TextBackGround(lightgray);
     ClrScr;
     TextBackGround(blue);
     TextColor(sarga);
     keret(20,5,5,4,xnr,ynr);
     kitolt;
     Delay(1000);
     lepes:=50;               {A minimalis lepesek szama a keveresnel}
     Repeat                   {A szamok osszekeverese}
          Repeat
          i:=Random(4)+1;
          cserel(i);
          if lepes >0 then begin
                           Delay(lepes);
                           dec(lepes);
          end;
          until KeyPressed;
          ch:=ReadKey;
          if ch=#27 then begin
                          Window(1,1,80,25);
                          TextBackGround(Black);
                          TextColor(LightGray);
                          ClrScr;
                          Halt(0);
                         end;
     Until lepes<=0;
     lepes:=1;
     t0:=KezdoIdo;                       {Kezdoido megjegyzese}
     repeat
          i:=irany;                      {Jatek}
          cserel(i);
          Window(1,23,80,25);
          TextBackGround(lightGray);
          TextColor(sarga);
          ClrScr;
          GoToXY(35,2);
          Write(lepes,'. l‚p‚s');
          inc(lepes);
     until vege;
     Until not eredmeny(lepes,jido);
     Window(1,1,80,25);
     TextBackGround(black);
     TextColor(white);
     ClrScr;

end.
