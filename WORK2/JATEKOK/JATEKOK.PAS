Program jatekok;

{ A program futtat s hoz szks‚ges, hogy a j t‚kokb¢l
  .EXE file-t k‚sz¡tsnk !!!
}

Uses Crt,Dos;
const jnr=5;
var mut:integer;
    szov:array [1..jnr] of string;
    tszov:array [1..jnr] of string;
    ch:char;
    jatek:boolean;
    x1,x2,y1,y2:byte;
    i,j:integer;
    hlpfile:text;
    st:string;

procedure kilep(ch:char);      {"Esc" billentyu lekezelese}
begin
    if ch=#27 then begin
                    TextColor(Yellow+Blink);
                    TextBackGround(Blue);
                    Window(1,1,80,25);
                    ClrScr;
                    GotoXY(24,12); write('K”sz”njk, hogy velnk j tszott l.');
                    Delay(1500);
                    TextBackGround(Black);
                    TextColor(LightGray);
                    Window(1,1,80,25);
                    ClrScr;
                    Halt(0)
                   end;
end;
procedure szinez(jel:boolean);  {Alapszin es karakterszin beallitasa}
begin
    case jel of
         false: begin
                 TextBackGround(LightGray);
                 TextColor(Black);
                end;
         true : begin
                 TextBackGround(Black);
                 TextColor(LightGray);
                end;
    end;
end;
procedure szoveg(i:integer;jel:boolean);  {Menupont szineinek beallitasa}
begin
    szinez(jel);
    Window(23,y1+1+i,57,y1+1+i);
    ClrScr;
    GoToXY(2,1);
    Write(tszov[i]);
    if not jel then begin
                     TextColor(Red);
                     GoToXY(2,1);
                     Write(szov[i,1]);
                    end;
end;


procedure melyik(b:boolean);   {Jatek illetve leiras kivalasztasa}
begin
    szinez(b);
    Window(28,y1+jnr+4,35,y1+jnr+4);
    ClrScr;
    Write(' J t‚k');
    szinez(not b);
    Window(45,y1+jnr+4,52,y1+jnr+4);
    ClrScr;
    Write(' Le¡r s');
end;


function jelol(var i:integer):boolean;  {Menupont kijelolese}
var ch:char;
    j:byte;
begin
    Repeat Until KeyPressed;
    ch:=ReadKey;
    kilep(ch);
    jelol:=ch=#13;          {A kivalasztas megtortent}
    for j:=1 to jnr do
        if UpCase(ch)=szov[j,1] then begin              {Kijeloles a kezdobetu alapjan}
                                      szoveg(i,false);
                                      i:=j;
                                      szoveg(i,true);
                                     end;
    if ch=#0 then begin                                 {Kijeloles a cursormozgato billentyukkel}
                   ch:=ReadKey;
                   szoveg(i,false);
                   case ch of
                       #72 : if i>1 then dec(i) else i:=jnr;
                       #80 : if i<jnr then inc(i) else i:=1;
                   #75,#77 : begin
                              jatek:=not jatek;         {Jatek illetve leiras kivalasztasa}
                              melyik(jatek);
                             end;
                   end;
                   szoveg(i,true);
                  end;
    Window(1,1,80,25);
end;
begin
   {$M 10000,0,0}            {Memoriakiosztas kijelolese az "Exec" utasitas miatt}
   tszov[1]:='Kirak¢';        {Inicializalas}
   tszov[2]:='Mem¢ria';
   tszov[3]:='Tske';
   tszov[4]:='Rex';
   tszov[5]:='Befejez‚s';
   szov[1]:='Kirako';        {Inicializalas}
   szov[2]:='Memoria';
   szov[3]:='Tuske';
   szov[4]:='Rex';
   szov[5]:='Befejezes';
   jatek:=true;
   mut:=1;
   Repeat
    Window(1,1,80,25);        {A kepernyo kirajzolasa}
    TextBackGround(Cyan);
    ClrScr;
    TextColor(Cyan);
    GoToXY(2,2);
          for i:=2 to 24 do begin
                             for j:=2 to 79 do
                                            Write('°');
                             WriteLn;
                             Write(' ');
                            end;
    x1:=20;x2:=60;y1:=12-(jnr+6) div 2;y2:=y1+jnr+6;    {A menuablak kirajzolasa}
    TextBackGround(Blue);
    Window(x1+1,y1+1,x2+1,y2+1);
    ClrScr;
    TextBackGround(LightGray);
    TextColor(Black);
    Window(x1,y1,x2,y2);
    ClrScr;
    Window(x1,y1,x2+1,y2);
    GoToXY(1,1);
    Write('É');
    for i:=2 to 40 do
                   Write('Í');
    Write('»');
    for i:=2 to jnr+6 do begin
                          GoToXY(1,i);
                          Write('º');
                          GoToXY(41,i);
                          Write('º');
                         end;
    GoToXY(1,jnr+7);
    Write('È');
    for i:=2 to 40 do
                   Write('Í');
    Write('¼');
    for i:=1 to jnr do                   {A menupontok felirasa}
                    szoveg(i,i=mut);
    i:=1;
    melyik(jatek);
    repeat
    until jelol(mut);
    case mut of                          
   1,2,3,4 : st:=szov[mut];              {A jatek kijelolese}
         5 : begin                       {Kilepes}
              kilep(#27);
             end;
    end;
    if jatek then exec(st+'.exe','')    {A jatekprogram futtatasa}
             else begin
                   Assign(hlpfile,st+'.hlp');  {A jatekszabaly kiirasa}
                   Reset(hlpFile);
                   Window(1,1,80,25);
                   TextBackGround(LightGray);
                   TextColor(Black);
                   ClrScr;
                   Window(2,2,80,25);
                   j:=1;
                   While not eof(hlpfile) do begin
                                              ReadLn(hlpfile,st);
                                              if j=23 then begin
                                                            Writeln;
                                                            TextBackGround(Blue);
                                                            TextColor(Yellow);
                                                            Write('šss le egy tetsz“leges billenty–t a folytat shoz ...');
                                                            TextBackGround(LightGray);
                                                            TextColor(Black);
                                                            ch:=ReadKey;
                                                            ClrScr;
                                                           end;
                                              inc(j);
                                              Writeln(st);
                                             end;
                  ch:=ReadKey;
                  end;
   Until mut=5;
end.