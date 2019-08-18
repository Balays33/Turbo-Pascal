program memory;
uses Crt,Dos;
const xnr=7;
      ynr=8;
      playernum=2;
type kartya=record
           szov :string;
           mut  :integer;
           end;
     param=array [1..3,1..2] of byte;
var i,j          : byte;
    villog,sarga : integer;
    par          : param;
    ch           : char;
    szabad       : array [1..xnr*ynr,1..2] of byte;
    szabnr       : integer;
    tabla        : array [1..xnr,1..ynr] of kartya;
    pont         : array [1..playernum] of word;
    player       : byte;
    vege         : boolean;
procedure vonal(c:char;x0,y0,size:word;vizszintes:boolean);   {Adott karakterekbol allo}
var i,j:word;                                                 {adott kezdopontu es hosszusagu vonal}
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


procedure keret(x0,y0,xsize,ysize,xnum,ynum:word);  {Adott kezdopontu, mezomeretu es mezoszamu keret}
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

function irany:byte;     {Klaviatura figyelese}
var ir : byte;
begin
     ir:=255;
     Repeat
          repeat until KeyPressed;
          ch:=readKey;
          if ch=#0 then begin      {Funkciobillentyu}
                         ch:=ReadKey;
                         case ch of
                              #80: ir:=1;
                              #72: ir:=2;
                              #77: ir:=3;
                              #75: ir:=4;
                         end;
                        end
                   else case ch of
                             #27 : halt(0);    {Esc}
                             #13 : ir:=0;      {Enter}
                        end;
     Until ir in [0..4];
     irany:=ir;
end;

procedure kijelol(var par:param);  {Kartyak kijelolese}
var elso,masodik  : boolean;
    i,j,k           : byte;
begin
    Window(1,1,80,25);
    i:=1;j:=1;
    Repeat
    elso:=false;masodik:=false;
      Repeat
         GoToXY(17+5*i,4+2*j);
         TextColor(villog);
         Write('*');
         k:=irany;
         GoToXY(17+5*i,4+2*j);
         Write(' ');
         case k of
              0 : elso:=true;                  {Kivalasztas nyugtazasa}
              1 : if j<ynr then inc(j);
              2 : if j>1 then dec(j);          {Elso kartya kijelolese}
              3 : if i<xnr then inc(i);
              4 : if i>1 then dec(i);
         end;
         GoToXY(17+5*i,4+2*j);
         Write('*');
      Until elso;                             {Elso kartya megvan}
      GoToXY(17+5*i,4+2*j);
      TextColor(sarga);
      Write('*');
      par[1,1]:=i;par[1,2]:=j;                {Elso kartya koordinatainak tarolasa}
      i:=xnr;j:=ynr;
      Repeat
         GoToXY(17+5*i,4+2*j);
         TextColor(villog);
         Write('*');
         k:=irany;
         GoToXY(17+5*i,4+2*j);
         TextColor(sarga);
         if (i=par[1,1]) and (j=par[1,2]) then Write('*') else Write(' ');
         TextColor(villog);
         case k of
              0 : if (par[1,1]=i) and (par[1,2]=j) then elso:=false    {Elso kartya kijelolesenek torlese}
                                                   else masodik:=true; {Masodik kartya kijeloles nyugtazasa}
              1 : if j<ynr then inc(j);
              2 : if j>1 then dec(j);           {Masodik kartya kijelolese}
              3 : if i<xnr then inc(i);
              4 : if i>1 then dec(i);
         end;
         GoToXY(17+5*i,4+2*j);
         Write('*');
      Until masodik or not elso;
      GoToXY(17+5*i,4+2*j);
      TextColor(sarga);
      if masodik then Write('*') else Write(' ');
    until masodik;                            {Masodik kartya megvan}
    par[2,1]:=i;par[2,2]:=j;
    if par[1,1]>par[2,1] then begin
                               par[3]:=par[2];
                               par[2]:=par[1];
                               par[1]:=par[3];
                              end;
end;


procedure visz(par:param);    {A kijelolt kartyak megmutatasa}
var i,j,sgn : integer;
    sx,sy   : array [1..2,1..2] of integer;

begin
    for i:= 1 to 12 do begin      {A sarokpontok kijelolese ugy,}
        sx[1,1]:=13+par[1,1]*5-i; {hogy ne csusszanak egymasra a kartyak}
        sx[1,2]:=18+par[1,1]*5;
        sx[2,1]:=17+par[2,1]*5;
        sx[2,2]:=22+par[2,1]*5+i;
        if  par[2,2]>=par[1,2] then begin
                                     sy[1,1]:=2+par[1,2]*2-i div 4;
                                     sy[1,2]:=4+par[1,2]*2;
                                     sy[2,1]:=4+par[2,2]*2;
                                     sy[2,2]:=6+par[2,2]*2+i div 4;
                                    end
                               else begin
                                     sy[2,1]:=2+par[2,2]*2-i div 4;
                                     sy[2,2]:=4+par[2,2]*2;
                                     sy[1,1]:=4+par[1,2]*2;
                                     sy[1,2]:=6+par[1,2]*2+i div 4;
                                    end;
        window(sx[1,1],sy[1,1],sx[1,2],sy[1,2]);  {A kiemeles vegrehajtasa}
        TextBackGround(white);
        ClrScr;
        GoToXY(2+i div 3,2+i div 6);
        Write(Copy(tabla[par[1,1],par[1,2]].szov,1,i));
        Window(sx[2,1],sy[2,1],sx[2,2],sy[2,2]);
        TextBackGround(white);
        ClrScr;
        GoToXY(2+i div 3,2+i div 6);
        Write(Copy(tabla[par[2,1],par[2,2]].szov,1,i));
        Delay(10);
       end;
end;


procedure csere1(i,j:integer);   {A kartyak koordinatainak felcserelese}
var id : array [1..2] of byte;   {a szabad nevu tommbben}
begin
    id[1]:=szabad[i,1];id[2]:=szabad[i,2];
    szabad[i]:=szabad[j];
    szabad[j,1]:=id[1];szabad[j,2]:=id[2];
end;


procedure kitolt;          {A tabla kezdeti kitoltese}
var i,j,mut: integer;
    st         : string;
    id         : array [1..2] of integer;
    fil        : text;
begin
    Assign(fil,'memo.txt');  {A kartyafeliratokat tartalmazo file megnyitasa}
    {$i-}Reset(fil);{$i+}
    If IoResult <>0 then begin
                          ClrScr;
                          WriteLn(' Hiba a "MEMO.TXT"  llom ny olvas s n l');
                          Halt(0);
                         end;
    for i:=1 to xnr do
        for j:=1 to ynr do begin                      {A "szabad" nevu tomb}
                            szabad[(i-1)*ynr+j,1]:=i; {kezdeti feltoltese}
                            szabad[(i-1)*ynr+j,2]:=j;
                           end;
    szabnr:=xnr*ynr;
    for i:=1 to xnr*ynr div 2 do   begin
                                     ReadLn(fil,st);   {A kartyafelirat beolvasas}
                                     mut:=random(szabnr)+1;   {A "szabad" nevu tomb valamelyik szabad}
                                                              {elemenek kijelolese}
                                     tabla[szabad[mut,1],szabad[mut,2]].szov:=st;
                                                              {A kartyaszoveg felirasa a mutatott kartyara}
                                     tabla[szabad[mut,1],szabad[mut,2]].mut:=szabnr;
                                                              {A kartyahoz tartozo mutato beallitasa}
                                     csere1(mut,szabnr);
                                                              {A "szabad" tomb ket elemenek felcserelese}
                                     mut:=random(szabnr-1)+1; {Az elozo lepesek megismetlese}
                                     tabla[szabad[mut,1],szabad[mut,2]].szov:=st;
                                     tabla[szabad[mut,1],szabad[mut,2]].mut:=szabnr-1;
                                     csere1(mut,szabnr-1);
                                     szabnr:=szabnr-2; {A "szabad" nevu tomb mutatojanak csokkentese}
                                    end;
    szabnr:=ynr*xnr;
    Close(fil);
end;


procedure kever;          {A megkeverheto kartyak osszekeverese}
var st        : string;
    i,j,k,l,m : integer;
begin
    for k:=1 to 2 do begin
                      i:=par[k,1];j:=par[k,2];
                      if tabla[i,j].mut>szabnr then begin
                                                     tabla[szabad[szabnr+1,1],szabad[szabnr+1,2]].mut:=tabla[i,j].mut;
                                                     csere1(tabla[i,j].mut,szabnr+1);
                                                     tabla[i,j].mut:=szabnr+1;
                                                     inc(szabnr);
                                                    end;

                     end;
    for k:=szabnr downto 1 do begin
                               i:=random(k)+1;
                               st:=tabla[szabad[k,1],szabad[k,2]].szov;
                               tabla[szabad[k,1],szabad[k,2]].szov:=tabla[szabad[i,1],szabad[i,2]].szov;
                               tabla[szabad[i,1],szabad[i,2]].szov:=st;
                              end;
end;


procedure csere2(i,j:integer);
var id1,id2  : byte;
begin
    if tabla[i,j].mut<=szabnr then begin
                                    tabla[szabad[szabnr,1],szabad[szabnr,2]].mut:=tabla[i,j].mut;
                                    csere1(tabla[i,j].mut,szabnr);
                                    tabla[i,j].mut:=szabnr;
                                    dec(szabnr);
                                   end;
end;


function vizsgal(x1,y1,x2,y2:byte):boolean;   {A kartyaszovegek azonossaganak vizsgalata}
begin
    x1:=par[1,1];y1:=par[1,2];
    x2:=par[2,1];y2:=par[2,2];
    if tabla[x1,y1].szov=tabla[x2,y2].szov then begin
                                                 vizsgal:=true;
                                                 kever    {A keverheto kartyak keverese}
                                                end
                                           else begin
                                                 csere2(x1,y1); {A kartyak atirasa a nem}
                                                 csere2(x2,y2); {megkeverhetok koze}
                                                 vizsgal:=false;
                                                end;
end;






begin                                   {Foprogram}
     for i:=1 to playernum do              {Inicializalas}
                           pont[i]:=0;
     player:=1;
     vege:=false;
     if LastMode=7 then begin
                         villog:=0+blink;
                         sarga:=0;
                        end
                   else begin
                         villog:=yellow+blink;
                         sarga:=yellow;
                        end;
     TextBackGround(Cyan);
     TextColor(Cyan);
     ClrScr;
     GoToXY(2,2);
     for i:=2 to 24 do begin
                        for j:=2 to 79 do Write('±');
                        Write('  ');
                       end;
     kitolt;
     Repeat
          Window(1,1,80,25);                    {Jatek}
          TextBackGround(Cyan);
          TextColor(Cyan);
          ClrScr;
          GoToXY(2,2);
          for i:=2 to 24 do begin
                             for j:=2 to 79 do Write('±');
                             Write('  ');
                            end;
          TextBackGround(blue);
          keret(20,5,5,2,xnr,ynr);
          Window(1,1,80,25);
          GoToXY(1,25);
          Write('   1. pont:',pont[1]:4);
          GoToXY(30,25);
          Write(player,'.j t‚kos k”vetkezik');
          GoToXY(65,25);
          Write('2. pont:',pont[2]:4);

          kijelol(par);
          visz(par);
          if vizsgal(par[1,1],par[1,2],par[2,1],par[2,2]) then inc(pont[player])
                                                          else begin
                                                                inc(player);
                                                                if player>playernum then player:=1;
                                                               end;
          for i:=1 to playernum do begin
                                    if pont[i]>=20 then begin
                                                         vege:=true;
                                                         player:=i;
                                                        end;
                                   end;
          Window(1,1,80,25);
          GoToXY(1,25);
          Write('   1. pont:',pont[1]:4);
          if vege then begin
                        GoToXY(32,25);
                        Write(player,'.j t‚kos nyert');
                       end
                  else begin
                        GoToXY(30,25);
                        Write(player,'.j t‚kos k”vetkezik');
                       end;
          GoToXY(65,25);
          Write('2. pont:',pont[2]:4);
          Repeat until KeyPressed;
          ch:=ReadKey;
          if ch=#0 then ch:=readKey;
     until (ch=#27) or vege;
TextBackGround(Black);
TextColor(LightGray);
ClrScr;
end.
