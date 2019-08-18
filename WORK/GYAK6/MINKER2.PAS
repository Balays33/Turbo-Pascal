{
 çrj ugyanolyan programot, mint az elìzì (a vÇletlensz†mok 0 Çs 3 kîzÇ essenek)
 de ez azt °rja ki, hogy h†nyszor fordul elì a legkisebb elem,
 Çs az elìfordul†sok indexeit.
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

{ H†nyszor fordul elì a legkisebb elem }
function eloford(var x:tomb):integer;
  begin

  end;

{ ki°rja a legkisebb elem elìfordul†sainak indexeit }
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
  writeln(eloford(t),'-szor fordul elì');
  indexek(t);

  readkey;
end.
