{
 rj programot, ami felt”lt egy t¡zelem– t”mb”t v‚letlensz mokkal (-100 ‚s +100)
 ki¡rja a t”mb”t ‚s azt, hogy melyik a legkisebb eleme  (az ‚rt‚k‚t ‚s
 az index‚t).
}


uses crt;

type tomb=array[1..10] of integer;


procedure feltolt(var x:tomb);
  begin

  end;

procedure kiir(var x:tomb);
  begin

  end;

function minelem(var x:tomb):integer;
  begin

  end;

function minindex(var x:tomb):integer;
  begin

  end;

var
   t : tomb ;

begin
  clrscr;

  feltolt(t);
  kiir(t);

  writeln;
  writeln('A legkisebb elem : ',minelem(t));
  writeln('‚s az indexe     : ',minindex(t));

  readkey;
end.
