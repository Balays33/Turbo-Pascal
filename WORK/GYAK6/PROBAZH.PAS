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
begin

end {feladat1};

procedure feladat2;
{Egy  5 x 10 -es M m†trix elemeit hat†rozza meg vÇletlensz†m gener†l†ssal
 -20 Çs +20 kîzti elemekkel, majd °rassa ki m†trix alakban! A m†trix bekÇrt
 sor†t cserÇlje ki a 3.-dik sor†val, majd £jb¢l °rassa ki a m†trixot!.}
begin

end {feladat2};

procedure feladat3;
{Egy szines ablakba kÇrjen be egy max. 10 hossz£ stringet, majd kîzÇpre igaz°tva
 °rassa ki egy m†sik ablakba!}
begin

end {feladat3};

{ fìprogram }
begin
repeat
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
