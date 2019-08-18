(* minta3.pas *)
program rajz_minta3;
uses Graph;
var
   szin1,szin2,szin3: word;
   gvezerlo, gmode, hibakod: integer;
begin
  DetectGraph(gvezerlo,gmode);
  case gvezerlo of
     CGA : begin
             gmode := CGAC1;
             szin1:=1;
             szin2:=2;
             szin3:=3;
           end;
     EGA : begin
             gmode:= EGAHi;
             szin1:=Blue;
             szin2:=Cyan;
             szin3:=Magenta;
           end;
     HercMono :
           begin
             gmode := HercMonoHi;
             szin1:=1;
             szin2:=1;
             szin3:=1;
           end;
     VGA : begin
             gmode := VGAHi;
             szin1:=Blue;
             szin2:=Cyan;
             szin3:=Magenta;
           end;
  end;

  InitGraph(gvezerlo, gmode,'');
  hibakod := GraphResult;
  if hibakod <> grOk then
    begin
      writeln('Grafikus hiba: ',GraphErrorMsg(hibakod));
      writeln('Kil‚p‚s a programb¢l ...');
      Halt(1);
    end;
  SetBkColor(szin1);
  SetColor(szin2);
  Rectangle(0, 0, GetMaxX, GetMaxY);
  SetTextJustify(CenterText, CenterText);
  SetTextStyle(DefaultFont, HorizDir,3);
  SetColor(szin3);
  OutTextXY(GetMaxX div 2, GetMaxY div 2, 'Grafika');
  Readln;
  CloseGraph;
end.