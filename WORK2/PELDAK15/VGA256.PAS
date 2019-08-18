(* VGA256.PAS *)

program VGA256_SCRIPT;
uses  Crt, Graph;
var
  gvezerlo , gmod, hibakod, c, gfont : integer;

{ Az automatikus felismer‚skor megh¡v¢d¢ far elj r s }
function DetectVGA256 : integer; far;
var
  gvezerlo : integer;
  gmod  : integer;
begin
  DetectGraph(gvezerlo, gmod);
  if (gvezerlo = VGA) then DetectVGA256 := 0   { 256 sz¡n– m¢d }
                      else DetectVGA256 := grError; { hiba }
end;

begin
    { a VGA256.BGI vez‚rl“ beilleszt‚se a vez‚rl“t bl ba}
    gvezerlo := InstallUserDriver('VGA256', @DetectVGA256);
    { a SCRI.CHR karakterk‚szlet telep¡t‚se}
    gfont := InstallUserFont('SCRI');

    { A  320x200, 256 sz¡n– grafika inicializ l sa}
    gvezerlo := Detect;
    InitGraph(gvezerlo, gmod, '');
    hibakod := GraphResult;
    if hibakod <> grOK then
    begin
      Writeln('Grafika hiba: ', GraphErrorMsg(hibakod));
      halt(1);
    end;

  { a telep¡tett karakterk‚szlet felhaszn l sa }
  SetTextStyle(gfont, HorizDir, 7);
  SetTextJustify(CenterText, CenterText);

  for c:=0 to 255 do
   begin
      SetFillStyle(SolidFill, c);
      Bar(0+c*1,0,(c+1)*1, GetMaxy)
   end;
  SetColor(Black);
  Rectangle(60,60,240,140);
  SetColor(Blue);
  OutTextXY(150, 80, 'Pascal');
  readln;
  CloseGraph;
end.
