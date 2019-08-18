
{Örj programot, ami a VEKALPR1.PAS -ban haszn lt Feltolt elj r ssal felt”lt
 egy t¡zelemû t”mb”t v‚letlensz mokkal, ki¡rja, ‚s rendezi azokat n”vekv‹
 sorrendbe, ‚s ki¡rja rendezetten is. A ki¡r shoz lehet haszn lni a Kiir
 elj r st.
 A rendez‚st egy Rendez nevû elj r s csin lja meg, ami egy param‚tert
 kapjon, a rendezend‹ t”mb”t (term‚szetesen c¡m szerinti param‚ter tad st
 haszn lva! Pr¢b ld ki an‚lkl is...).}


uses crt ;

type
   tizelemu = array[1..10] of integer ;


{ minimum-keres‚ses rendez‚s }
procedure Rendez( var t : tizelemu);
begin
 { }
end;



var
   tomb : tizelemu ;

begin
  randomize ;
  clrscr;
  Feltolt(tomb, 1, 100);
  Kiir('Rendez‚s el‹tt', tomb);
  Rendez(tomb);
  writeln; writeln;
  Kiir('Rendez‚s ut n ', tomb);

  readkey;
end.

