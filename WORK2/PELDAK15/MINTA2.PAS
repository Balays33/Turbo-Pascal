(* minta2.pas *)
program rajz_minta2;
uses Graph;
var
  gvezerlo, gmod, hibakod: integer;
begin
  DetectGraph(gvezerlo,gmod);
  case gvezerlo of
     CGA      :  gmod := CGAC1;
     EGA      :  gmod := EGAHi;
     HercMono :  gmod := HercMonoHi;
     VGA      :  gmod := VGAHI;
  end;

  InitGraph(gvezerlo, gmod,'');
  hibakod := GraphResult;
  if hibakod <> grOk then
     begin
       writeln('Grafikus hiba: ',GraphErrorMsg(hibakod));
       writeln('Kil‚p‚s  a programb¢l!'#9);
       halt(1);
     end;
  SetBkColor(White);
  SetColor(2);
  Rectangle(0, 0, GetMaxX, GetMaxY);
  SetTextJustify(CenterText, CenterText);
  SetTextStyle(DefaultFont, HorizDir,3);
  SetColor(1);
  OutTextXY(GetMaxX div 2, GetMaxY div 2, 'Grafika');
  readln;
  CloseGraph;
end.