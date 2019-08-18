(* EGALITT.PAS *)
program EGAVGA_LITT;
uses Graph;
{ elìkÇszÅletek:

   binobj egavga.bgi egavga.obj egavga

   binobj litt.chr litt.obj litt
}

var
  gvezerlo, gmod, hibakod : integer;

{$L EGAVGA.OBJ }
{$L LITT.OBJ }
procedure egavga; external;
procedure litt; external;

procedure kilep(uzenet : string);
begin
  writeln('Nem sekerÅlt beÇp°teni az  ', uzenet, ' †llom†nyt!');
  halt(1);
end;

begin

  if RegisterBGIdriver(@egavga) < 0 then  kilep('EGAVGA');
  if RegisterBGIfont(@litt) < 0 then  kilep('Litt');

  DetectGraph(gvezerlo, gmod);
  InitGraph(gvezerlo, gmod, '');
  hibakod:= GraphResult;
  if hibakod <> grOk then
  begin
    Writeln('Grafika hiba: ', GraphErrorMsg(hibakod));
    Halt(1);
  end;

  MoveTo(5, 5);
  SetTextStyle(SmallFont, HorizDir, 8);
  OutText('Hello ');
  Readln;

  CloseGraph;
end.
