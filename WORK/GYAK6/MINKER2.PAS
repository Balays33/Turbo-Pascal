{
 �rj ugyanolyan programot, mint az el�z� (a v�letlensz�mok 0 �s 3 k�z� essenek)
 de ez azt �rja ki, hogy h�nyszor fordul el� a legkisebb elem,
 �s az el�fordul�sok indexeit.
}

uses crt;

type tomb=array[1..10] of integer;


procedure feltolt(var x:tomb);
  begin

  end;

procedure kiir(var x:tomb);
  begin

  end;


{ Megkeresi a legkisebb elemet }

function minelem(var x:tomb):integer;
  begin

  end;

{ H�nyszor fordul el� a legkisebb elem }
function eloford(var x:tomb):integer;
  begin

  end;

{ ki�rja a legkisebb elem el�fordul�sainak indexeit }
procedure indexek(var x:tomb);
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
  writeln(eloford(t),'-szor fordul el�');
  indexek(t);

  readkey;
end.
