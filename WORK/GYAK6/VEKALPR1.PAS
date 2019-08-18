
{ Örj programot, ami v‚letlensz mokkal felt”lt k‚t t¡zelemû t”mb”t,
 egy harmadik t”mb”t pedig £gy t”lt fel, hogy annak az i. eleme
 az els‹ ‚s a m sodik t”mb i. elemei k”zl a nagyobbik legyen.

 Pl.
   1. t”mb :  4  7  8  1  ...
   2. t”mb :  2  9  8  4  ...

   3. t”mb :  4  9  8  4  ...

 A v‚letlensz mokkal val¢ felt”lt‚st egy elj r s csin lja meg, ami h rom
 param‚tert kapjon: egy t¡zelemû t”mb”t, valamint egy als¢ ‚s egy fels‹
 hat rt, amibe bele kell esni minden gener lt elemnek, amivel felt”lti
 a kapott t”mb”t:

  procedure Feltolt(var t : tizelemu; also, felso : integer)
  begin
    ...
  end;

 A 3. t”mb gener l s t is egy elj r s v‚gezze el, ami kapja meg a t”mb”t,
 amit fel kell t”lteni elemekkel, valamint a k‚t t”mb”t, ami alapj n elv‚gzi
 a felt”lt‚st:

  procedure General(var t3, t1, t2 : tizelemu )
  begin
    ...
  end;

 A t”mb”k ki¡r s t pedig egy harmadik elj r s v‚gezze el, ami kap egy stringet,
 hogy mit ¡rjon ki, ‚s a t”mb”t, amit ki kell ¡rnia:

  procedure Kiir( s:string; t : tizelemu )
  begin
    ...
  end;

  égy ¡rja ki, ahogy a fenti p‚ld ban l that¢, az '1. t”mb' sz”veget para-
  m‚terk‚nt kapja meg az s-ben.

}


uses crt;

type
   tizelemu = array[1..10] of integer ;


procedure Feltolt(var t : tizelemu; also, felso : integer);
begin
end;

procedure General(var t3, t1, t2 : tizelemu );
begin
end;

procedure Kiir( s:string; t : tizelemu );
begin
end;

var
 tomb1, tomb2, tomb3 : tizelemu ;


begin
  randomize;

  Feltolt(tomb1, 10, 30);
  Feltolt(tomb2, -30, 55);
  General(tomb3, tomb1, tomb2);
  clrscr;
  Kiir('1. t”mb', tomb1); writeln;
  Kiir('2. t”mb', tomb2); writeln;
  writeln;
  writeln('======================================================================');
  writeln;
  Kiir('3. t”mb', tomb3);

  readkey;

end.

