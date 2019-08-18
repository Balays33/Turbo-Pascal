program zh;    

uses crt;
const menu:array[1..4] of string[25]=
           ('1    elsì     feladat',
            '2    m†sodik  feladat',
            '3    harmadik feladat',
            'ESC  v Ç g e         ');

var i:integer;
    c:char;

procedure menuir;
begin
   textbackground(lightgray);
   clrscr;
   textcolor(blue);
   gotoxy(25,5);
   for i:=1 to 4 do begin
                      gotoxy(25,wherey);
                      writeln(menu[i]);
                    end;
   gotoxy(25,wherey+3);
   write('V † l a s z ?');
end { menuir };

procedure feladat1;
{ T†bl†zatos form†ban °rassa a kÇpernyìre a g£la tÇrfogat†t Çs felÅletÇt,
  ha  az alap nÇgyzet oldala v†ltozik 10 cm-tìl 5 -Çvel 30 cm -ig, a
  magass†g pedig 10 -Çvel v†ltozzon 10 tìl 40-ig. Minden 'a' Çs 'm' ÇrtÇket
  îsszep†ros°tva.
  A t†bl†zat a kîvetkezì form†j£ legyen:

             a        m     felÅlet     tÇrfogat
           =======================================
            10       10     xxxx.xxx    xxxx.xxx
            15       10     xxxx.xxx    xxxx.xxx
             .              .                 .
             .              .                 .
            30       40     xxxx.xxx    xxxx.xxx
           =======================================

KÇpletek:  V=(a^2*m)/3	A=a^2+2*SQRT(a^2/4+m^2)
 }
 var j:integer;
begin
  clrscr;
  gotoxy(20,8);
  write('a');
  gotoxy(30,8);
  write('m');
  gotoxy(40,8);
  write('FelÅlet');
  gotoxy(50,8);
  write('TÇrfogat');
  writeln;
  for i:=15 to 65 do begin gotoxy(i,9); write('='); end;
  gotoxy(20,10);
  for i:=1 to 5 do begin
                   gotoxy(20,10+i);
                   writeln(5+(i*5));
                   for j:=1 to 4 do
                   end;
  readln;
end {feladat1};

procedure feladat2;
{Egy  5 x 10 -es M m†trix elemeit hat†rozza meg vÇletlensz†m gener†l†ssal
 -20 Çs +20 kîzti elemekkel, majd °rassa ki m†trix alakban! A m†trix bekÇrt
 sor†t cserÇlje ki a 3.-dik sor†val, majd £jb¢l °rassa ki a m†trixot!.}
  var m:array[1..5,1..10] of integer;
                         i:byte;
                         j:byte;
                         s:integer;
                         w:integer;
begin
  clrscr;
  randomize;
  for i:=1 to 5 do
  for j:=1 to 10 do
                 begin
                   m[i,j]:=random(40)-20;
                 end;
  for i:=1 to 5 do
                begin
                  writeln;
  for j:=1 to 10 do
                 begin
                   write(m[i,j]:4);
                 end;
                 end;
  writeln;
  repeat
  write('KÇrem mivel szeretnÇ kicserÇlni 3 sort s:=');
  readln(s);
  until (s<=5) and (s<>3);
  for i:=1 to 5 do
  for j:=1 to 10 do
                 begin
                   w:=m[3,j];
                   m[3,j]:=m[s,j];
                   m[s,j]:=w;
                 end;
  for i:=1 to 5 do
                begin
                  writeln;
  for j:=1 to 10 do
                 begin
                   write(m[i,j]:4);
                 end;
                end;
  readln;
end {feladat2};

procedure feladat3;
{Egy szines ablakba kÇrjen be egy max. 10 hossz£ stringet, majd kîzÇpre igaz°tva
 °rassa ki egy m†sik ablakba!}
 var sz:string[10];
begin
  clrscr;
  window(3,3,50,10);
  textbackground(Green);
  clrscr;
  repeat
  write('KÇrem a szîveget (max 10 hossz£): ');
  readln(sz);
  until 10>=length(sz);
  window(20,10,60,20);
  textbackground(yellow);
  clrscr;
  gotoxy((41-length(sz)) div 2,5);
  write(sz);

  readln;
end {feladat3};

{ fìprogram }
begin
repeat
   window(1,1,80,25);
   menuir;
   repeat
     c:=readkey;
   until c in ['1','2','3',#27];
   case c of
      '1':feladat1;
      '2':feladat2;
      '3':feladat3;
   end;
until c=#27;
end.
