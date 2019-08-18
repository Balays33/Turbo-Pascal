(* minta1.pas *)
program rajz_minta1;
uses Graph;
var
  gvezerlo, gmod, hibakod: integer;
begin
  gvezerlo := Detect;
  InitGraph(gvezerlo, gmod,'');
  hibakod := GraphResult;
  if hibakod <> grOk then
     begin
       writeln('Grafikus hiba: ',GraphErrorMsg(hibakod));
       writeln('Kil‚p‚s  a programb¢l!');
       Halt(1);
     end;
  Rectangle(0, 0, GetMaxX, GetMaxY);
  SetTextJustify(CenterText, CenterText);
  SetTextStyle(DefaultFont, HorizDir,3);
  OutTextXY(GetMaxX div 2, GetMaxY div 2, 'Grafikus feladat');
  Readln;
  CloseGraph;
end.