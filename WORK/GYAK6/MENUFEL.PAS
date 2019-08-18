{ Ez egy egyszerû menkezel‹ program, mely az egyes menpontokat elj r sok
  ill. fggv‚nyek megh¡v s val val¢s¡tja meg. Minden elj r s param‚teres,
  az aktu lis param‚tereket a f‹programban kell bek‚rni.

  Az 1. menponthoz tartoz¢ elj r s mintak‚nt k‚szen van,
  a 2. menpontban n fatori lis t kell kisz m¡tani fggv‚ny seg¡ts‚g‚vel
  itt a fggv‚nyt kell elk‚sz¡teni.

  A 3. menpontban egy henger t‚rfogat t kell kisz m¡tani, az input adatok
  a henger sugara ‚s magass ga. A megold st itt is egy fggv‚ny seg¡ts‚g‚vel
  kell kisz m¡tani ‚s a f‹program idev g¢ r‚sz‚t is meg kell ¡rni.

  A 4. menpont egy elj r st h¡v meg, a bemen‹ param‚terek: az intervallum
  k‚t v‚gpontja ‚s a l‚p‚sk”z, kisz m¡tand¢ak a szinusz fggv‚ny ‚rt‚kei
  ezen intervallumon.                                                      }


program menu;
uses crt;
var ch,varak:char;
    a:real;
    n,faktorialis:word;

procedure negyzet(oldal:real);       { elj r s a n‚gyzet adatainak sz m¡t s ra }
 var terulet, kerulet, atlo:real;
 begin
  terulet:=oldal*oldal;
  kerulet:=4*oldal;
  atlo:=sqrt(2)*oldal;
  writeln;
  writeln;
  writeln('A n‚gyzet terlete:  ',terulet:8:2);
  writeln('A n‚gyzet kerlete:  ',kerulet:8:2);
  writeln('A n‚gyzet  tl¢ja:    ',atlo:8:2);
  varak:=readkey;
 end;                                 { negyzet elj r s v‚ge }

function fakt(alap:word):word;      { fggv‚ny "alap" faktori lis nak kisz m¡t s ra }
 begin

 end;                               { fakt fggv‚ny v‚ge }


begin                                 { f‹program }

 repeat                               { ciklus a menu v‚grehajt s hoz }

  textbackground(lightgray);          { sz”veg ki¡rat sa }
  clrscr;
  window(20,5,60,20);
  textbackground(cyan);
  textcolor(magenta);
  clrscr;
  gotoxy(18,2);
  write('Men');
  gotoxy(3,5);
  write('1:    N‚gyzet adatainak sz mol sa');
  gotoxy(3,7);
  write('2:    Faktori lis sz m¡t sa');
  gotoxy(3,9);
  write('3:    Henger t‚rfogat nak sz m¡t sa');
  gotoxy(3,11);
  write('4:    Szinusz ‚rt‚kek sz m¡t sa');
  gotoxy(3,13);
  write('5:    V‚ge');
  gotoxy(3,15);


  readln(ch);
  window(1,1,80,25);
  case ch of                       { a menpotok v‚grehajt sa }
   '1': begin                      { az 1. menpont v‚grehajt sa }
         textbackground(lightgray);     { az adatok bek‚r‚se }
         clrscr;
         write('Add meg a n‚gyzet oldal nak hossz t! ');
         readln(a);
         negyzet(a);                    { a sz mol st v‚grehajt¢ elj r s megh¡v sa }
        end;
   '2': begin                      { az 2. menupont v‚grehajt sa }
         textbackground(lightgray);     { az adatok bek‚r‚se }
         clrscr;
         write('Add meg n ‚rt‚k‚t! ');
         readln(n);
         faktorialis:=fakt(n);          { a sz mol st v‚grehajt¢ fggv‚ny megh¡v sa }
         writeln;                       { az eredm‚ny ki¡rat sa }
         writeln;
         writeln('n faktori lis a k”vetkez“: ',faktorialis);
         varak:=readkey;
        end;
   '3': begin

        end;
   '4': begin

        end;
   '5': begin

        end;
   else begin
         textbackground(lightgray);          { sz”veg ki¡rat sa }
         clrscr;
         writeln('Rossz v laszt s, £jat k‚rek!');
         varak:=readkey;
        end;
  end;                                       { case v‚ge }




 until (ch='5');                             { ciklus v‚ge }
end.                                         { f‹program v‚ge }